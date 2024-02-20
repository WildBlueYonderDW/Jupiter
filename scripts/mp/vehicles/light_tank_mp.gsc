// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\math.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\mp\vehicles\vehicle_oob_mp.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\flags.gsc;
#using script_27c2db69a21775a0;
#using scripts\mp\utility\lower_message.gsc;

#namespace namespace_9e287efca3724e4;

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d
// Size: 0xf4
function light_tank_mp_init() {
    registersharedfunc("light_tank", "activate", &light_tank_mp_activate);
    registersharedfunc("light_tank", "startCapture", &light_tank_mp_startcapture);
    registersharedfunc("light_tank", "endCapture", &light_tank_mp_endcapture);
    registersharedfunc("light_tank", "filterDropSpawns", &light_tank_mp_filterdropspawns);
    registersharedfunc("light_tank", "getDropSpawnIgnoreList", &light_tank_mp_getdropspawnignorelist);
    registersharedfunc("light_tank", "spawn", &light_tank_mp_spawncallback);
    registersharedfunc("light_tank", "initLate", &light_tank_mp_initlate);
    registersharedfunc("light_tank", "onDeathRespawn", &light_tank_mp_ondeathrespawncallback);
    vehicle_tracking_limitgameinstances("light_tank", 6);
    vehicle_tracking_limitteaminstances("light_tank", 3);
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(getsharedfunc("light_tank", "updateHeadIconForPlayerOnJoinTeam"));
    light_tank_mp_initspawning();
    light_tank_mp_initcapture();
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438
// Size: 0x3
function light_tank_mp_initlate() {
    
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442
// Size: 0x88
function light_tank_mp_initspawning() {
    var_e2818ad39a3341b4 = vehicle_spawn_getleveldataforvehicle("light_tank");
    var_e2818ad39a3341b4.abandonedtimeoutcallback = getsharedfunc("light_tank", "timeOut");
    if (getgametype() == "arm" || getgametype() == "risk") {
        var_e2818ad39a3341b4.abandonedtimeoutdelay = 105;
        var_e2818ad39a3341b4.respawndelay = level.tankrespawntime;
    } else {
        var_e2818ad39a3341b4.abandonedtimeoutdelay = 40;
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1
// Size: 0x34
function light_tank_mp_initcapture() {
    val::function_2d6e7e0b80767910("vehicleCapture", [0:"offhand_weapons", 1:"weapon", 2:"killstreaks", 3:"supers"]);
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c
// Size: 0x22
function light_tank_mp_activate(vehicle) {
    vehicle thread bctracking();
    namespace_d9c77dc2a6fe29c6::registerentforoob(vehicle, "vehicle");
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x535
// Size: 0x3e
function light_tank_mp_startcapture(vehicle, owner, team) {
    if (isdefined(owner)) {
        light_tank_mp_createownercaptureobject(vehicle, owner);
    }
    if (level.teambased) {
        light_tank_mp_createothercaptureobject(vehicle);
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0x14
function light_tank_mp_endcapture(vehicle) {
    vehicle light_tank_mp_deletecaptureobjects();
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595
// Size: 0x79
function light_tank_mp_createownercaptureobject(vehicle, owner) {
    var_d18e18e423fc0c22 = spawn("script_model", vehicle gettagorigin("TAG_PLAYER"));
    var_d18e18e423fc0c22 linkto(vehicle);
    var_d18e18e423fc0c22 light_tank_mp_setupcaptureobject(0.5);
    var_d18e18e423fc0c22.vehicle = vehicle;
    vehicle.ownercaptureobject = var_d18e18e423fc0c22;
    var_d18e18e423fc0c22 thread light_tank_mp_monitorownercapture(owner, vehicle);
    var_d18e18e423fc0c22 thread light_tank_mp_monitorownercapturevisibility(owner);
    return var_d18e18e423fc0c22;
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x616
// Size: 0x6c
function light_tank_mp_createothercaptureobject(vehicle) {
    var_d18e18e423fc0c22 = spawn("script_model", vehicle gettagorigin("TAG_PLAYER"));
    var_d18e18e423fc0c22 linkto(vehicle);
    var_d18e18e423fc0c22 light_tank_mp_setupcaptureobject(3);
    var_d18e18e423fc0c22.vehicle = vehicle;
    vehicle.othercaptureobject = var_d18e18e423fc0c22;
    var_d18e18e423fc0c22 thread light_tank_mp_monitorothercapture(vehicle);
    var_d18e18e423fc0c22 thread light_tank_mp_monitorothercapturevisibility();
    return var_d18e18e423fc0c22;
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68a
// Size: 0xc8
function light_tank_mp_setupcaptureobject(usetime) {
    self makeusable();
    self setcursorhint("HINT_BUTTON");
    if (!namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        self sethintstring("KILLSTREAKS_HINTS/BRADLEY_CAPTURE");
    }
    self sethinttag("none");
    self sethintdisplayrange(200);
    self sethintdisplayfov(360);
    self setuserange(200);
    self setusefov(360);
    self sethintonobstruction("show");
    self setuseholdduration("duration_none");
    self setusehideprogressbar(1);
    self.userate = 1;
    self.curprogress = 0;
    self.usetime = usetime;
    self.inuse = 0;
    self.playerusing = undefined;
    self.id = "care_package";
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x759
// Size: 0x27
function light_tank_mp_deletecaptureobject() {
    if (isdefined(self.playerusing)) {
        light_tank_mp_playerstopcapture(self.playerusing);
    }
    self delete();
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x787
// Size: 0x3d
function light_tank_mp_deletecaptureobjects() {
    if (isdefined(self.ownercaptureobject)) {
        self.ownercaptureobject light_tank_mp_deletecaptureobject();
    }
    if (isdefined(self.othercaptureobject)) {
        self.othercaptureobject light_tank_mp_deletecaptureobject();
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cb
// Size: 0xcd
function light_tank_mp_monitorownercapture(owner, vehicle) {
    self endon("death");
    owner endon("disconnect");
    self.vehicle = vehicle;
    while (1) {
        self waittillmatch("trigger", owner);
        if (light_tank_mp_canstartcapture(owner)) {
            self.playerusing = owner;
            self.inuse = 1;
            light_tank_mp_playerstartcapture(owner);
            captured = light_tank_mp_monitorcaptureinternal();
            self.playerusing = undefined;
            self.curprogress = 0;
            self.inuse = 0;
            light_tank_mp_playerstopcapture(owner);
            if (istrue(captured) && issharedfuncdefined("light_tank", "capture")) {
                thread [[ getsharedfunc("light_tank", "capture") ]](vehicle, owner);
            }
            waitframe();
        }
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89f
// Size: 0xc1
function light_tank_mp_monitorothercapture(vehicle) {
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        if (light_tank_mp_canstartcapture(player)) {
            self.playerusing = player;
            self.inuse = 1;
            light_tank_mp_playerstartcapture(player);
            captured = light_tank_mp_monitorcaptureinternal();
            self.playerusing = undefined;
            self.curprogress = 0;
            self.inuse = 0;
            if (isdefined(player)) {
                light_tank_mp_playerstopcapture(player);
            }
            if (istrue(captured) && issharedfuncdefined("light_tank", "capture")) {
                thread [[ getsharedfunc("light_tank", "capture") ]](vehicle, player);
            }
            waitframe();
        }
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x967
// Size: 0x71
function light_tank_mp_monitorcaptureinternal() {
    self.playerusing endon("death_or_disconnect");
    while (light_tank_mp_cankeepcapturing()) {
        self.curprogress = self.curprogress + level.framedurationseconds * self.userate;
        if (self.curprogress >= self.usetime) {
            return 1;
        }
        self.playerusing namespace_19b4203b51d56488::updateuiprogress(self, 1);
        waitframe();
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9df
// Size: 0xb7
function light_tank_mp_monitorownercapturevisibility(owner) {
    self endon("death");
    while (isdefined(owner)) {
        foreach (player in level.players) {
            self disableplayeruse(player);
            if (player == owner) {
                if (isdefined(self.playerusing)) {
                    if (light_tank_mp_cankeepcapturing()) {
                        self enableplayeruse(owner);
                    }
                } else if (light_tank_mp_canstartcapture(owner)) {
                    self enableplayeruse(owner);
                }
            }
        }
        wait(0.1);
    }
    thread light_tank_mp_deletecaptureobject();
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9d
// Size: 0xfa
function light_tank_mp_monitorothercapturevisibility() {
    self endon("death");
    while (1) {
        if (isdefined(self.playerusing)) {
            foreach (player in level.players) {
                self disableplayeruse(player);
                if (player == self.playerusing) {
                    if (light_tank_mp_cankeepcapturing()) {
                        self enableplayeruse(player);
                    }
                }
            }
        } else {
            foreach (player in level.players) {
                self disableplayeruse(player);
                if (light_tank_mp_canstartcapture(player)) {
                    self enableplayeruse(player);
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9e
// Size: 0x77
function light_tank_mp_canstartcapture(player) {
    if (istrue(self.vehicle.isdestroyed)) {
        return 0;
    }
    if (!isdefined(player)) {
        return 0;
    }
    if (!player _isalive()) {
        return 0;
    }
    if (player.team == "spectator") {
        return 0;
    }
    if (!player val::get("vehicle_use")) {
        return 0;
    }
    if (!istrue(vehicle_interact_playercanusevehicle(player, self.vehicle))) {
        return 0;
    }
    return 1;
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1d
// Size: 0xba
function light_tank_mp_cankeepcapturing() {
    if (istrue(self.vehicle.isdestroyed)) {
        return 0;
    }
    if (!self.playerusing val::get("vehicle_use")) {
        return 0;
    }
    if (!istrue(vehicle_interact_playercanusevehicle(self.playerusing, self.vehicle))) {
        return 0;
    }
    if (!self.playerusing usebuttonpressed()) {
        return 0;
    }
    if (self.playerusing isonladder()) {
        return 0;
    }
    if (self.playerusing meleebuttonpressed()) {
        return 0;
    }
    if (distancesquared(self.playerusing.origin, self.origin) > 90000) {
        return 0;
    }
    return 1;
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdf
// Size: 0x24
function light_tank_mp_playerstartcapture(player) {
    player val::function_3633b947164be4f3("vehicleCapture", 0);
    player namespace_19b4203b51d56488::updateuiprogress(self, 0);
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0a
// Size: 0x2d
function light_tank_mp_playerstopcapture(player) {
    if (player _isalive()) {
        player val::function_588f2307a3040610("vehicleCapture");
    }
    player namespace_19b4203b51d56488::updateuiprogress(self, 0);
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd3e
// Size: 0x68
function light_tank_mp_shouldawardattacker(vehicle, attacker) {
    if (!isdefined(attacker)) {
        return 0;
    }
    if (level.teambased && attacker.team == vehicle.team) {
        return 0;
    }
    if (isdefined(vehicle.owner) && attacker == vehicle.owner) {
        return 0;
    }
    return 1;
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdae
// Size: 0x11f
function bctracking() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        if (namespace_54d20dd0dd79277f::isgameplayteam(self.team)) {
            var_ef269077a28646eb = utility::playersinsphere(self.origin, 3000);
            foreach (player in var_ef269077a28646eb) {
                validplayer = isdefined(player) && player _isalive() && namespace_f8065cafc523dba5::isenemy(player);
                if (!validplayer) {
                    continue;
                }
                var_ed24af7cf5cdc3dd = anglestoforward(player getplayerangles());
                var_e402c093911c20ee = math::anglebetweenvectors(var_ed24af7cf5cdc3dd, self.origin - player.origin);
                if (isdefined(var_e402c093911c20ee) && var_e402c093911c20ee <= 60) {
                    if (self sightconetrace(player geteye(), self) > 0.1) {
                    }
                    waitframe();
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed4
// Size: 0xa5
function light_tank_mp_spawncallback(spawndata, var_ee8da5624236dc89) {
    /#
        assert(namespace_1f188a13f7e79610::function_fa537f1ab52a76d1("light_tank"));
    #/
    [[ getsharedfunc("light_tank", "initSpawnData") ]](spawndata);
    if (!isdefined(spawndata.spawnmethod)) {
        spawndata.spawnmethod = "place_at_position_unsafe";
    }
    if (!isdefined(spawndata.showheadicon)) {
        spawndata.showheadicon = 0;
    }
    spawndata.cantimeout = 0;
    vehicle = [[ getsharedfunc("light_tank", "tankSpawn") ]](spawndata, var_ee8da5624236dc89);
    return vehicle;
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf81
// Size: 0xb
function light_tank_mp_ondeathrespawncallback() {
    thread light_tank_mp_waitandspawn();
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf93
// Size: 0x149
function light_tank_mp_waitandspawn() {
    if (!namespace_1f188a13f7e79610::function_fa537f1ab52a76d1("light_tank")) {
        return;
    }
    oldspawndata = getvehiclespawndata(self);
    if (isdefined(oldspawndata.var_6dc04302da1a9d03)) {
        oldspawndata = oldspawndata.var_6dc04302da1a9d03;
    }
    spawndata = spawnstruct();
    copyvehiclespawndata(oldspawndata, spawndata);
    [[ getsharedfunc("light_tank", "copySpawnData") ]](oldspawndata, spawndata);
    var_ee8da5624236dc89 = spawnstruct();
    vehicle = vehicle_spawn_waitandrespawn("light_tank", spawndata, var_ee8da5624236dc89);
    if (isdefined(vehicle)) {
        if (getgametype() == "arm" || getgametype() == "risk") {
            if (namespace_4b0406965e556711::gameflag("prematch_done")) {
                namespace_35f66e61f847336c::droptank_playincomingdialog(spawndata);
            }
            foreach (player in level.players) {
                if (player.team == vehicle.team) {
                    player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("gw_iav_respawn", undefined, 5);
                }
            }
        }
    }
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e3
// Size: 0x90
function light_tank_mp_filterdropspawns(dropspawns) {
    var_30492e606ac5ccff = dropspawns;
    if (isdefined(level.vehspawnvol)) {
        var_30492e606ac5ccff = [];
        foreach (dropspawn in dropspawns) {
            if (ispointinvolume(dropspawn.origin, level.vehspawnvol)) {
                var_30492e606ac5ccff[var_30492e606ac5ccff.size] = dropspawn;
            }
        }
    }
    return var_30492e606ac5ccff;
}

// Namespace namespace_9e287efca3724e4/namespace_d8996def0b815fdf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117b
// Size: 0x96
function light_tank_mp_getdropspawnignorelist(ignorelist) {
    var_8496e2572c67cb8c = [];
    var_8496e2572c67cb8c[var_8496e2572c67cb8c.size] = ignorelist;
    if (isdefined(level.helis)) {
        var_8496e2572c67cb8c[var_8496e2572c67cb8c.size] = level.helis;
    }
    if (isdefined(level.littlebirds)) {
        var_8496e2572c67cb8c[var_8496e2572c67cb8c.size] = level.littlebirds;
    }
    if (isdefined(level.supportdrones)) {
        var_8496e2572c67cb8c[var_8496e2572c67cb8c.size] = level.supportdrones;
    }
    var_8496e2572c67cb8c[var_8496e2572c67cb8c.size] = vehicle_tracking_getgameinstances("emp_drone");
    var_8496e2572c67cb8c[var_8496e2572c67cb8c.size] = vehicle_tracking_getgameinstances("cruise_predator");
    return namespace_3c37cb17ade254d::array_combine_multiple(var_8496e2572c67cb8c);
}

