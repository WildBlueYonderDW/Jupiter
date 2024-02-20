// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\dvars.gsc;
#using script_4c770a9a4ad7659c;
#using script_7ab5b649fa408138;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\parachute.gsc;
#using script_37092055e9712f79;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\points.gsc;
#using script_1a8a97698664c7c9;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\utility\debug.gsc;

#namespace ballmode;

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xecf
// Size: 0x3b7
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 480);
        setovertimelimitdvar(120);
        registerscorelimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 5);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    setspecialloadout();
    updategametypedvars();
    level.teambased = 1;
    level.vehiclegod = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.ontimelimit = &ontimelimit;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerconnect = &onplayerconnect;
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    level.nosuspensemusic = 1;
    level.requiredplayercountoveride = 1;
    level.requiredplayercount["allies"] = getdvarint(@"hash_803b34b433ca1a24", 3);
    level.requiredplayercount["axis"] = getdvarint(@"hash_803b34b433ca1a24", 3);
    if (getdvarint(@"hash_cd7a289c3a33ceda", 0) != 0) {
        level.onplayerkilled = &onhotfootplayerkilled;
    }
    game["dialog"]["offense_obj"] = "iw9_gmst_anno_uktl_gsoa";
    game["dialog"]["defense_obj"] = "iw9_gmst_anno_uktl_gsoa";
    level.testtdmanywhere = getdvarint(@"hash_157f06aff3c1f357", 0);
    level.tdmanywhere_dropheight = getdvarfloat(@"hash_c692d2a11dd6615", 1000);
    level.tdmanywhere_perpenoffset = getdvarfloat(@"hash_631c58033f43c2dc", 2048);
    level.tdmanywhere_distoffset = getdvarfloat(@"hash_f314048c87ae28aa", 4092);
    level.var_832f3e2f27bc167f = getdvarint(@"hash_f4485e63f712eee1", 0);
    if (istrue(level.testtdmanywhere)) {
        namespace_5078ee98abb32db9::initparachutedvars();
    }
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    /#
        level.var_a1c387e9b8e35312 = &function_a1c387e9b8e35312;
    #/
    level.var_15c7e6ec178feef1 = 1;
    level.var_227023e744a288b6 = "veh9_atv_boost";
    namespace_3c37cb17ade254d::registersharedfunc(level.var_227023e744a288b6, "flippedEnd", &function_ac6a3bde1c50bf84);
    namespace_b835d284f1d90ddd::main();
    namespace_1f188a13f7e79610::function_66ab4fb2175555e1("veh9_atv_boost");
    callback::add("player_spawned", &onplayerspawned);
    namespace_3c37cb17ade254d::add_fx("ball_contact", "vfx/iw9/level/mp_futbol/vfx_futbol_soccerball_contact.vfx");
    namespace_3c37cb17ade254d::add_fx("ball_contact_pulse", "vfx/iw9/level/mp_futbol/vfx_futbol_soccerball_contact_pulse.vfx");
    namespace_3c37cb17ade254d::add_fx("grenade_contact", "vfx/iw9/level/mp_futbol/vfx_futbol_pickup_grenade_active.vfx");
    namespace_3c37cb17ade254d::add_fx("player_rammed", "vfx/iw9/level/mp_futbol/vfx_futbol_atv_ram_explosion.vfx");
    namespace_3c37cb17ade254d::add_fx("player_respawn", "vfx/iw9/level/mp_futbol/vfx_futbol_atv_ram_respawn.vfx");
    namespace_3c37cb17ade254d::add_fx("grenade_launch", "vfx/iw9/level/mp_futbol/vfx_futbol_atv_grenade_launch.vfx");
    thread function_2ef7bef336791c1e();
    thread function_eae183e660ed1bd();
    thread function_b98a63c3e6f4d6db();
    setdvar(@"hash_8cf08f678ce293c9", 1);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x128d
// Size: 0x46
function private function_b98a63c3e6f4d6db() {
    level endon("game_ended");
    delayseconds = getdvarint(@"hash_72df5f8fcefc0bad", 30);
    wait(delayseconds);
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    level.nojip = 1;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x12da
// Size: 0xa2
function private function_9baa17db0bddc192(entity) {
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (objid == -1) {
        return;
    }
    var_53480b10269770a5 = 100;
    objective_setlabel(objid, "");
    objective_setplayintro(objid, 0);
    objective_setpings(objid, 1);
    objective_setzoffset(objid, var_53480b10269770a5);
    objective_icon(objid, "icon_waypoint_enemy_goal");
    objective_setbackground(objid, 1);
    objective_state(objid, "current");
    objective_position(objid, entity.origin + (0, 0, var_53480b10269770a5));
    objective_setshowdistance(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_mask_showtoplayerteam(objid, entity);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1383
// Size: 0x91
function private function_fb4fcf1cecf14944() {
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (objid == -1) {
        return;
    }
    var_53480b10269770a5 = 100;
    objective_setlabel(objid, "");
    objective_setplayintro(objid, 0);
    objective_setpings(objid, 1);
    objective_setzoffset(objid, var_53480b10269770a5);
    objective_icon(objid, "icon_waypoint_soccer_ball");
    objective_setbackground(objid, 1);
    objective_state(objid, "current");
    objective_onentity(objid, level.ball);
    objective_setshowdistance(objid, 0);
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objid);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x141b
// Size: 0x95
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    spawndata.vehicleoverride = ter_op(self.team == "axis", "veh9_mil_lnd_atv_physics_mp_boostball_al", "veh9_mil_lnd_atv_physics_mp_boostball_las");
    return spawndata;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b8
// Size: 0xe2
function function_d7522ff35ba39906() {
    self notify("respawn");
    self.var_ea02a8bfcfde7c4b = 1;
    position = spawnstruct();
    position.origin = self.origin;
    position.angles = self.angles;
    spawndata = vehiclespawn_getspawndata(position);
    vehicle = namespace_1f188a13f7e79610::vehicle_spawn(level.var_227023e744a288b6, spawndata);
    vehicle.var_a8f4bb03b366aa80 = 1;
    vehicle.godmode = 1;
    vehicle.var_22aa4aa0cf0aa6bb = 1;
    vehicle.lastpushtime = -1;
    vehicle.rider = self;
    if (level.forceRetryOnVehicleOccupancyFailed) {
        thread entervehicle(vehicle);
    } else {
        entervehicle(vehicle);
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15a1
// Size: 0x307
function entervehicle(vehicle) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    var_c641ed06d8042061 = spawnstruct();
    if (level.forceRetryOnVehicleOccupancyFailed) {
        while (!istrue(var_c641ed06d8042061.success)) {
            waitframe();
            namespace_1fbd40990ee60ede::vehicle_occupancy_enter(vehicle, "driver", self, var_c641ed06d8042061, 1);
        }
    } else {
        namespace_1fbd40990ee60ede::vehicle_occupancy_enter(vehicle, "driver", self, var_c641ed06d8042061, 1);
    }
    if (getdvarint(@"hash_f5e40a9aa678afcd", 0)) {
        vehicle.mtx = "v004";
        vehicle function_788d3c14d6b4ba6b("v004");
    } else if (!isdefined(vehicle.mtx)) {
        if (self.team == "axis") {
            vehicle.mtx = "v008";
            vehicle function_788d3c14d6b4ba6b("v008");
        } else {
            vehicle.mtx = "v009";
            vehicle function_788d3c14d6b4ba6b("v009");
        }
    }
    var_65091e17847072c9 = getdvarint(@"hash_d1746d26196af99e", 0);
    if (self.team == "axis") {
        self.vehicle setscriptablepartstate("tail_lights", "green", 1);
    } else {
        self.vehicle setscriptablepartstate("tail_lights", "yellow", 1);
    }
    if (var_65091e17847072c9) {
        thread function_263274274f7871fa();
        thread function_57751ab79abf8f20();
        thread function_72b3e6d160929c0a();
    }
    thread function_c484ebbdf856ffec();
    if (!istrue(level.disablePlayerOutlines)) {
        if (istrue(level.useRedAndBluePlayerOutlines)) {
            var_ac6ca28a64718193 = "outline_nodepth_blue";
            enemyteam = "outline_nodepth_red";
            namespace_cbd3754a0c69cc63::outlineenableforteam(self, self.team, var_ac6ca28a64718193, "level_script", [0:self]);
            namespace_cbd3754a0c69cc63::outlineenableforteam(self.vehicle, self.team, var_ac6ca28a64718193, "level_script", [0:self]);
            namespace_cbd3754a0c69cc63::outlineenableforteam(self, enemyteam(self.team), enemyteam, "level_script");
            namespace_cbd3754a0c69cc63::outlineenableforteam(self.vehicle, enemyteam(self.team), enemyteam, "level_script");
        } else {
            teamcolor = namespace_3c37cb17ade254d::ter_op(self.team == "allies", "outline_nodepth_yellow", "outline_nodepth_green");
            namespace_cbd3754a0c69cc63::outlineenableforteam(self, self.team, teamcolor, "level_script", [0:self]);
            namespace_cbd3754a0c69cc63::outlineenableforteam(self.vehicle, self.team, teamcolor, "level_script", [0:self]);
            namespace_cbd3754a0c69cc63::outlineenableforteam(self, enemyteam(self.team), teamcolor, "level_script");
            namespace_cbd3754a0c69cc63::outlineenableforteam(self.vehicle, enemyteam(self.team), teamcolor, "level_script");
        }
    }
    thread function_32df9962eea79205();
    thread listenForVehicleExit(self);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x18af
// Size: 0x7f
function private function_c484ebbdf856ffec() {
    while (!isdefined(level.ball)) {
        waitframe();
    }
    if (istrue(self.pers["lookingAtBall"])) {
        self function_522fb0cbb445cdc8(level.ball);
        self setclientomnvar("ballmode_cameramode", 1);
        self.pers["lookingAtBall"] = 1;
    } else {
        self function_522fb0cbb445cdc8();
        self setclientomnvar("ballmode_cameramode", 0);
        self.pers["lookingAtBall"] = 0;
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1935
// Size: 0x68
function private function_ac6a3bde1c50bf84(vehicle, timedout) {
    if (isdefined(vehicle) && istrue(timedout)) {
        position = vehicle.origin + (0, 0, 100);
        angles = (0, vehicle.angles[1], 0);
        vehicle vehicle_teleport(position, angles);
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a4
// Size: 0x9e
function function_690be95de2e8c072() {
    if (!isdefined(self.pers["lookingAtBall"]) || !isdefined(level.ball) || !isdefined(self.vehicle)) {
        return;
    }
    if (!self.pers["lookingAtBall"]) {
        self function_522fb0cbb445cdc8(level.ball);
        self setclientomnvar("ballmode_cameramode", 1);
        self.pers["lookingAtBall"] = 1;
    } else {
        self function_522fb0cbb445cdc8();
        self setclientomnvar("ballmode_cameramode", 0);
        self.pers["lookingAtBall"] = 0;
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a49
// Size: 0x38
function function_d9702c5b7d3eaa95() {
    self endon("disconnect");
    self notifyonplayercommand("toggleLookAt", "+melee_zoom");
    while (1) {
        self waittill("toggleLookAt");
        function_690be95de2e8c072();
        wait(0.5);
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a88
// Size: 0x18a
function onplayerspawned(params) {
    self.plotarmor = 1;
    if (level.var_832f3e2f27bc167f > 0) {
        level.var_832f3e2f27bc167f = level.var_832f3e2f27bc167f - 1;
        return;
    }
    namespace_25c5a6f43bb97b43::disablebattlechatter(self);
    function_d7522ff35ba39906();
    self clearsoundsubmix("iw9_mp_soccer_goal", 1);
    namespace_4887422e77f3514e::function_a2b4e6088394bade();
    self clearsoundsubmix("iw9_mp_killcam", 2);
    self clearclienttriggeraudiozone(2);
    thread function_cb63e733bd0d9f0b();
    thread function_7331ba007cea2319();
    thread time();
    thread function_d9702c5b7d3eaa95();
    thread function_9e64420982a86219();
    var_4db9734effb2dd9d = spawnfx(namespace_3c37cb17ade254d::getfx("player_respawn"), self.origin);
    triggerfx(var_4db9734effb2dd9d);
    skin = namespace_6d8da2b47f878104::lookupcurrentoperator(self.team);
    if (skin == "neymar_eastern" || skin == "messi_western" || skin == "pogba_western") {
        self.var_23511319cec8f63 = 1;
    }
    if (self.var_23511319cec8f63 && getdvarint(@"hash_17a42017d84df7ec", 0)) {
        self playsound("equip_codball_shockstick_pickup");
        self.var_a9fbde0565fc4be7 = 1;
        self setclientomnvar("ballmode_grenade", self.var_a9fbde0565fc4be7);
    }
    namespace_3c5a4254f2b957ea::setextrascore0(0);
    if (isdefined(self.pers["goals"])) {
        namespace_3c5a4254f2b957ea::setextrascore0(self.pers["goals"]);
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c19
// Size: 0x40
function time() {
    level endon("game_ended");
    self endon("disconnect");
    self.var_3c11f592093dc36d = 0;
    while (1) {
        waitframe();
        self.var_3c11f592093dc36d = self.var_3c11f592093dc36d + level.framedurationseconds;
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c60
// Size: 0xd9
function function_e1ef76f2cb1b17a1() {
    self endon("disconnect");
    self.isstunned = 1;
    self allowmovement(0);
    self.vehicle setscriptablepartstate("stunned", "stunned", 1);
    self earthquakeforplayer(0.3, 0.6, self.origin, 5000);
    self.vehicle vehicle_settopspeedforward(self.normalspeed * getdvarfloat(@"hash_1576e2ea08aa2848", 0.8));
    namespace_44abc05161e2e2cb::showsplash("ballmode_stunned_by_player");
    wait(1);
    self.vehicle vehicle_settopspeedforward(self.normalspeed);
    self.vehicle setscriptablepartstate("stunned", "not_stunned", 1);
    self allowmovement(1);
    self.isstunned = 0;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d40
// Size: 0x1a
function function_b81ddb79cb822f7a(var_b81ddb79cb822f7a) {
    if (var_b81ddb79cb822f7a) {
        goto LOC_00000018;
    }
    self function_d5592214acc99425();
LOC_00000018:
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d61
// Size: 0x32d
function function_9e64420982a86219() {
    self endon("disconnect");
    slot = namespace_1a507865f681850e::getdefaultslot("equip_shockstick_ballmode");
    namespace_1a507865f681850e::giveequipment("equip_shockstick_ballmode", slot);
    self notifyonplayercommand("ballmode_preview_grenade", "+attack");
    self notifyonplayercommand("ballmode_throw_grenade", "-attack");
    while (1) {
        self waittill("ballmode_preview_grenade");
        if (!istrue(self.isstunned) && istrue(self.var_a9fbde0565fc4be7) && isalive(self)) {
            function_b81ddb79cb822f7a(1);
        }
        self waittill("ballmode_throw_grenade");
        function_b81ddb79cb822f7a(0);
        if (istrue(self.isstunned)) {
            waitframe();
            continue;
        }
        if (!istrue(self.var_a9fbde0565fc4be7)) {
            waitframe();
            continue;
        }
        if (!isalive(self)) {
            waitframe();
            continue;
        }
        var_60151e580078e160 = getdvarfloat(@"hash_2e6a0a6ee3b2cd6", 40);
        var_f0cde6bba09c4ab6 = getdvarvector(@"hash_73b69837141ae856", (0, 0, 40));
        var_8367267663479c02 = getdvarfloat(@"hash_90221071ebbf785e", 1500);
        var_7a65053818ba8fab = getdvarvector(@"hash_3ea5f4b035285d67", (0, 0, 150));
        self.var_a9fbde0565fc4be7 = 0;
        self setclientomnvar("ballmode_grenade", self.var_a9fbde0565fc4be7);
        playerangles = anglestoforward(self function_aa015a529e61c67d());
        vehicleangles = anglestoforward(self.angles);
        grenadethrowposition = self.vehicle.origin + vehicleangles * var_60151e580078e160 + var_f0cde6bba09c4ab6;
        if (vectordot(playerangles, vehicleangles) < 0) {
            grenadethrowposition = self.vehicle.origin - vehicleangles * var_60151e580078e160 + var_f0cde6bba09c4ab6;
        }
        grenade = namespace_68e641469fde3fa7::_launchgrenade("shock_stick_mp_ballmode", grenadethrowposition, playerangles * var_8367267663479c02 + var_7a65053818ba8fab, 1, undefined, undefined);
        self playsound("weap_codball_shockstick_fire");
        triggerfx(spawnfx(namespace_3c37cb17ade254d::getfx("grenade_launch"), grenadethrowposition));
        grenade waittill_any_timeout_1(5, "missile_stuck");
        position = grenade.origin;
        playfx(getfx("grenade_contact"), position);
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player earthquakeforplayer(0.3, 0.2, position, 1000);
            if (player.team == self.team) {
                continue;
            }
            if (length(player.origin - position) < 150) {
                player thread function_e1ef76f2cb1b17a1();
                namespace_48a08c5037514e04::doScoreEvent(#"hash_89e428ee14238868");
            }
        }
        waitframe();
        grenade delete();
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2095
// Size: 0x17f
function function_e69ba41ccdf770af(var_979e96006d8a4e2) {
    level endon("game_ended");
    pickup = spawnscriptable("ballmode_grenade_pickup", var_979e96006d8a4e2.origin + (0, 0, 30));
    pickup setscriptablepartstate("grenade_pickup", "ready", 1);
    while (1) {
        var_373c494d2156cd01 = undefined;
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (istrue(player.var_a9fbde0565fc4be7)) {
                continue;
            }
            if (lengthsquared(player.origin - pickup.origin) < 3600) {
                var_373c494d2156cd01 = player;
                break;
            }
        }
        if (!isdefined(var_373c494d2156cd01)) {
            waitframe();
            continue;
        }
        pickup setscriptablepartstate("grenade_pickup", "inactive", 1);
        var_373c494d2156cd01 playsound("equip_codball_shockstick_pickup");
        var_373c494d2156cd01.var_a9fbde0565fc4be7 = 1;
        var_373c494d2156cd01 setclientomnvar("ballmode_grenade", var_373c494d2156cd01.var_a9fbde0565fc4be7);
        wait(getdvarint(@"hash_5da7e98d7f5dd03e", 20));
        pickup setscriptablepartstate("grenade_pickup", "ready", 1);
        playsoundatpos(var_979e96006d8a4e2.origin, "equip_codball_shockstick_spawn");
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x221b
// Size: 0x5e9
function function_2ef7bef336791c1e() {
    level endon("game_ended");
    waitframe();
    level.var_3e5a26826d8b8e2f = getent("goal_axis", "targetname");
    level.var_3e5a26826d8b8e2f.team = "axis";
    level.var_a970fbbf4c65f18c = getent("goal_allies", "targetname");
    level.var_a970fbbf4c65f18c.team = "allies";
    level.var_36b1c8c99a6b27ef = getstruct("ball_respawn", "targetname");
    namespace_fbaab9e509f00d3d::function_2e68ab6566b199cb(level.var_3e5a26826d8b8e2f.team, namespace_e8a49b70d0769b66::_getteamscore(level.var_3e5a26826d8b8e2f.team));
    namespace_fbaab9e509f00d3d::function_2e68ab6566b199cb(level.var_a970fbbf4c65f18c.team, namespace_e8a49b70d0769b66::_getteamscore(level.var_a970fbbf4c65f18c.team));
    var_afc0cf2f0e71eae3 = getstructarray("ballmode_pickup", "targetname");
    level thread function_e69ba41ccdf770af(var_afc0cf2f0e71eae3[0]);
    level thread function_e69ba41ccdf770af(var_afc0cf2f0e71eae3[1]);
    level thread function_e69ba41ccdf770af(var_afc0cf2f0e71eae3[2]);
    level thread function_e69ba41ccdf770af(var_afc0cf2f0e71eae3[3]);
    wait(5);
    level.ball = spawn("script_model", level.var_36b1c8c99a6b27ef.origin);
    level.ball setmodel("art_stadium_ball");
    level.ball.targetname = "ball";
    level.ball physicslaunchserver((0, 0, 0), (0, 0, 0), -1000);
    level.ball thread function_26a3f9262c0e61c1();
    function_9baa17db0bddc192(level.var_3e5a26826d8b8e2f);
    function_9baa17db0bddc192(level.var_a970fbbf4c65f18c);
    function_fb4fcf1cecf14944();
    if (isdefined(game["ballmodeTimePassed"])) {
        level.starttime = gettime();
        gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit");
        level.watchdvars[gamemode].value = game["ballmodeTimePassed"] / 1000;
        setdvar(gamemode, game["ballmodeTimePassed"] / 1000);
    }
    var_1fbf6aaa31163feb = undefined;
    while (1) {
        if (level.var_3e5a26826d8b8e2f istouching(level.ball)) {
            var_1fbf6aaa31163feb = level.var_3e5a26826d8b8e2f.team;
            break;
        }
        if (level.var_a970fbbf4c65f18c istouching(level.ball)) {
            var_1fbf6aaa31163feb = level.var_a970fbbf4c65f18c.team;
            break;
        }
        waitframe();
    }
    level notify("ballmode_goal_scored");
    function_75ca6e1e31fa03a8(var_1fbf6aaa31163feb);
    foreach (player in level.players) {
        player.var_9835cdc5507afa4f = 0;
        player earthquakeforplayer(0.4, 2.5, level.ball.origin, 5000);
        function_d4eaf53b4475969e(player, var_1fbf6aaa31163feb);
        if (player.team == var_1fbf6aaa31163feb) {
            if (isdefined(level.ball.var_9b593f980e1df35b) && player == level.ball.var_9b593f980e1df35b.player) {
                level.ball.var_9b593f980e1df35b.player namespace_48a08c5037514e04::doScoreEvent(#"ballmode_goal_score");
                player namespace_3c5a4254f2b957ea::incpersstat("goals", 1);
                player namespace_3c5a4254f2b957ea::setextrascore0(player.pers["goals"]);
                if (istrue(level.ball.var_9b593f980e1df35b.var_909dd2932bf61c47)) {
                    level.ball.var_9b593f980e1df35b.player namespace_48a08c5037514e04::doScoreEvent(#"hash_622e70d79766b33f");
                }
                player.pers["hasDoneAnyCombat"] = 1;
            } else {
                if (isdefined(level.ball.var_fd1b69daea740e45) && isdefined(level.ball.var_fd1b69daea740e45[player.guid])) {
                    player namespace_48a08c5037514e04::doScoreEvent(#"hash_503431be2973fc9b");
                    player.pers["hasDoneAnyCombat"] = 1;
                    player.pers["assists"] = player.pers["assists"] + 1;
                }
                player namespace_48a08c5037514e04::doScoreEvent(#"hash_7f2b80912012133f");
            }
        }
    }
    namespace_d576b6dc7cef9c62::pausetimer();
    game["ballmodeTimePassed"] = namespace_d576b6dc7cef9c62::gettimeremaining();
    level.var_18250df1dd55da52 = 1;
    wait(3);
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(var_1fbf6aaa31163feb, 1, 1, undefined, 1);
    namespace_fbaab9e509f00d3d::function_2e68ab6566b199cb(level.var_3e5a26826d8b8e2f.team, namespace_e8a49b70d0769b66::_getteamscore(level.var_3e5a26826d8b8e2f.team));
    namespace_fbaab9e509f00d3d::function_2e68ab6566b199cb(level.var_a970fbbf4c65f18c.team, namespace_e8a49b70d0769b66::_getteamscore(level.var_a970fbbf4c65f18c.team));
    if (game["status"] == "overtime") {
        level thread namespace_d576b6dc7cef9c62::endgame(var_1fbf6aaa31163feb, game["end_reason"]["score_limit_reached"]);
    } else {
        namespace_d576b6dc7cef9c62::pausetimer();
        game["ballmodeTimePassed"] = namespace_d576b6dc7cef9c62::gettimeremaining();
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x280b
// Size: 0x80
function function_75ca6e1e31fa03a8(var_200a113a1e7807eb) {
    if (var_200a113a1e7807eb == "axis") {
        exploder("goal_2");
    } else {
        exploder("goal_1");
    }
    setmusicstate("goal_scored");
    playsoundatpos(level.ball.origin, "mp_codball_goal_whistle");
    playsoundatpos(level.ball.origin, "mp_codball_goal_cheer");
    thread function_d5fe07f36853c957();
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2892
// Size: 0x1a
function function_d5fe07f36853c957() {
    function_4e8ba327eb12540c(level.players, "iw9_mp_soccer_goal", 2);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b3
// Size: 0x66
function function_76d65f0b5902d51d() {
    if (self.var_1f5985d661e980fe == 0) {
        return 0;
    }
    var_d51d711dd370439c = getdvarint(@"hash_d1746d26196af99e", 0);
    return var_d51d711dd370439c && self.var_3c11f592093dc36d >= self.var_1f5985d661e980fe && self.var_3c11f592093dc36d <= self.var_1f5985d661e980fe + self.var_8c9da67cf413df2e;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2921
// Size: 0x29b
function function_81905c4905cbcb80(vehicle, ball, normal, var_efce983b772a6f22, var_251c5472955825a4) {
    if (isdefined(vehicle.lastpushtime) && vehicle.rider.var_3c11f592093dc36d < vehicle.lastpushtime + 0.2) {
        return;
    }
    if (isdefined(vehicle.lastpushtime)) {
    }
    vehicle.lastpushtime = vehicle.rider.var_3c11f592093dc36d;
    var_76d65f0b5902d51d = function_76d65f0b5902d51d();
    var_745a7280c169244d = 1;
    var_7f6f2ff9dc45ced = 1;
    if (var_76d65f0b5902d51d) {
        var_745a7280c169244d = getdvarint(@"hash_eb8ae893bdadfa96", 3);
        var_7f6f2ff9dc45ced = var_745a7280c169244d / 2;
    }
    var_b671dda1c1164ec4 = vehicle vehicle_getvelocity();
    var_2547eec1179557e3 = ball.velocity;
    var_558115a08635de95 = var_b671dda1c1164ec4 - var_2547eec1179557e3;
    var_ce2277814a41a6a2 = math::remap(clamp(length(var_558115a08635de95), 0, 1000), 0, 1000, 0, 1);
    var_eb3b42597661a6ea = math::remap(var_ce2277814a41a6a2, 0, 1, 20, 60);
    var_ad3dc842bed328b9 = var_eb3b42597661a6ea * var_7f6f2ff9dc45ced;
    if (ball.velocity[2] > 40) {
        var_ad3dc842bed328b9 = var_ad3dc842bed328b9 / 3;
    }
    ball physics_applyimpulse(ball.origin, (0, 0, var_ad3dc842bed328b9));
    normal = vectornormalize((normal[0], normal[1], normal[2] * 0.8));
    var_5a4ed8bed236876a = math::remap(var_ce2277814a41a6a2, 0, 1, 100, 600);
    var_9e8d543ba58e308 = normal * var_5a4ed8bed236876a;
    ball physics_applyimpulse(ball.origin, var_9e8d543ba58e308 * var_efce983b772a6f22 * var_745a7280c169244d);
    if (var_76d65f0b5902d51d) {
        playfx(getfx("ball_contact_pulse"), var_251c5472955825a4);
        function_508a666f8c32e510(ball, var_5a4ed8bed236876a, 0, 1);
    } else {
        playfx(getfx("ball_contact"), var_251c5472955825a4);
        function_508a666f8c32e510(ball, var_5a4ed8bed236876a, 0, 0);
    }
    if (var_76d65f0b5902d51d) {
        vehicle.rider earthquakeforplayer(0.3, 0.6, ball.origin, 5000);
    } else {
        vehicle.rider earthquakeforplayer(0.15, 0.3, ball.origin, 5000);
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc3
// Size: 0x130
function function_508a666f8c32e510(ball, var_e4571cc8915e45fb, var_54a18641ee8161c5, pulse) {
    var_9e3bd18d45e1daa4 = "mp_codball_ball_impact";
    surfacetype = "_grass";
    var_a78160b865206ae9 = "_light";
    soundalias = "mp_codball_ball_impact_grass_light";
    var_aa3f1450e82e8306 = 0;
    var_fb21aaa624ab594d = 200;
    var_453830eccd9ea0cf = 500;
    if (var_54a18641ee8161c5 > 2 || var_54a18641ee8161c5 < 0) {
        return;
    }
    switch (var_54a18641ee8161c5) {
    case 0:
        surfacetype = "_atv";
        if (pulse) {
            surfacetype = "_atv_pulse";
        }
        break;
    case 1:
        surfacetype = "_grass";
        break;
    case 2:
        surfacetype = "_wall";
        break;
    }
    if (var_e4571cc8915e45fb >= var_453830eccd9ea0cf) {
        var_a78160b865206ae9 = "_heavy";
    } else if (var_e4571cc8915e45fb >= var_fb21aaa624ab594d) {
        var_a78160b865206ae9 = "_medium";
    }
    soundalias = var_9e3bd18d45e1daa4 + surfacetype + var_a78160b865206ae9;
    if (isdefined(soundalias) && isdefined(ball)) {
        ball playsound(soundalias);
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cfa
// Size: 0x373
function function_cb63e733bd0d9f0b() {
    self endon("disconnect");
    while (1) {
        if (!isdefined(self.vehicle)) {
            waitframe();
            continue;
        }
        partenum = ent = normalspeed = normal = position = flag1 = flag0 = body1 = body0 = self.vehicle waittill("collision");
        if (!isdefined(ent) || !isdefined(ent.owner)) {
            continue;
        }
        if (isdefined(ent.targetname) && ent.targetname == "ball") {
            function_81905c4905cbcb80(self.vehicle, ent, normal, 1, position);
            continue;
        }
        isentityvehicle = isdefined(ent) && ent.classname == "script_vehicle";
        var_9da4991e43437a9e = isdefined(ent.owner) && ent.owner.team == self.team;
        if (isentityvehicle && !var_9da4991e43437a9e && istrue(self.var_9835cdc5507afa4f)) {
            var_2b047f029ff53ad4 = vectornormalize(position - self.vehicle.origin);
            var_f00cad494ace11f1 = vectornormalize(anglestoforward(self.vehicle.angles));
            dotproduct = vectordot(var_2b047f029ff53ad4, var_f00cad494ace11f1);
            var_d23ed04594864bea = acos(dotproduct);
            if (var_d23ed04594864bea < 60) {
                if (!isdefined(self.var_a9bcf4e8440e11be["ballmode_rammed_player"]) || gettime() - self.var_a9bcf4e8440e11be["ballmode_rammed_player"] > 100) {
                    namespace_48a08c5037514e04::doScoreEvent(#"ballmode_rammed_player");
                    self.var_a9bcf4e8440e11be["ballmode_rammed_player"] = gettime();
                }
                self.pers["hasDoneAnyCombat"] = 1;
                self.pers["lastRamTime"] = namespace_6d8da2b47f878104::function_19300abfbb10928b();
                ent.owner function_b81ddb79cb822f7a(0);
                ent.owner.plotarmor = 0;
                ent.owner dodamage(ent.owner.maxhealth, ent.owner.origin, self, self.vehicle, "MOD_EXPLOSIVE", self.vehicle.objweapon, "torso_upper");
                ent.owner namespace_44abc05161e2e2cb::showsplash("ballmode_rammed_by_player");
                explosionfx = spawnfx(namespace_3c37cb17ade254d::getfx("player_rammed"), ent.origin);
                playsoundatpos(ent.origin, "veh9_dmg_mil_lnd_atv_codball_explode");
                triggerfx(explosionfx);
                playrumbleonposition("grenade_rumble", ent.origin);
                earthquake(0.5, 1, ent.origin, 500);
            }
        }
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3074
// Size: 0x185
function function_26a3f9262c0e61c1() {
    level endon("game_ended");
    var_63ab34b4a76e8f86 = 0.1;
    var_7856e907f2d37675 = 1;
    var_64f13c589a594107 = 3;
    var_38f5340b182b64f0 = 0;
    var_653bf22a4d053b24 = 0;
    var_4be5096ca36000af = 200;
    var_c59ce7533110caff = 500;
    var_179aed0864d2f9cd = 1;
    var_9d498e7c2fca6288 = 1;
    var_530c26140df7c1f8 = 2;
    self physics_registerforcollisioncallback();
    while (1) {
        partenum = ent = normalspeed = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
        surface = physics_getsurfacetypefromflags(flag1);
        surfacetype = getsubstr(surface["name"], 9);
        if (normalspeed > var_63ab34b4a76e8f86 && surfacetype != "metal_car") {
            if (normalspeed > var_64f13c589a594107) {
                var_38f5340b182b64f0 = var_c59ce7533110caff;
            } else if (normalspeed > var_7856e907f2d37675) {
                var_38f5340b182b64f0 = var_4be5096ca36000af;
            } else {
                var_38f5340b182b64f0 = var_653bf22a4d053b24;
            }
            var_179aed0864d2f9cd = var_9d498e7c2fca6288;
            if (surfacetype != "grass_short") {
                var_179aed0864d2f9cd = var_530c26140df7c1f8;
            }
            function_508a666f8c32e510(self, var_38f5340b182b64f0, var_179aed0864d2f9cd, 0);
            waitframe();
        }
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3200
// Size: 0x23
function function_f16883296ade7f2f(v, var_1ad2a33fb3c88895) {
    return vectordot(v, var_1ad2a33fb3c88895) / vectordot(var_1ad2a33fb3c88895, var_1ad2a33fb3c88895);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x322b
// Size: 0x486
function function_7331ba007cea2319() {
    self endon("disconnect");
    while (1) {
        if (!isdefined(level.ball)) {
            waitframe();
            continue;
        }
        if (!isdefined(self.vehicle)) {
            waitframe();
            continue;
        }
        var_c02ecdadd14a8875 = level.ball.origin - self.vehicle.origin;
        normal = vectornormalize(var_c02ecdadd14a8875);
        forward = anglestoforward(self.vehicle.angles);
        left = anglestoleft(self.vehicle.angles);
        up = anglestoup(self.vehicle.angles);
        forwarddot = function_f16883296ade7f2f(var_c02ecdadd14a8875, forward * 90);
        leftdot = function_f16883296ade7f2f(var_c02ecdadd14a8875, left * 60);
        var_89e70a63b116955b = function_f16883296ade7f2f(var_c02ecdadd14a8875, up * 85);
        var_11fa10620a425b56 = sqrt(forwarddot * forwarddot + leftdot * leftdot + var_89e70a63b116955b * var_89e70a63b116955b);
        if (var_11fa10620a425b56 < 1) {
            if (!isdefined(level.ball.var_fd1b69daea740e45)) {
                level.ball.var_fd1b69daea740e45 = [];
            }
            if (!isdefined(level.ball.var_fd1b69daea740e45[self.guid])) {
                namespace_48a08c5037514e04::doScoreEvent(#"hash_f87dedf6aa32e256");
                level.ball.var_fd1b69daea740e45[self.guid] = self;
            }
            if (istrue(self.var_9835cdc5507afa4f)) {
                if (!isdefined(self.var_a9bcf4e8440e11be["ballmode_rammed_ball"]) || gettime() - self.var_a9bcf4e8440e11be["ballmode_rammed_ball"] > 100) {
                    namespace_48a08c5037514e04::doScoreEvent(#"ballmode_rammed_ball");
                    self.var_a9bcf4e8440e11be["ballmode_rammed_ball"] = gettime();
                }
            }
            self.pers["hasDoneAnyCombat"] = 1;
            self.pers["lastTouchTime"] = namespace_6d8da2b47f878104::function_19300abfbb10928b();
            goalent = undefined;
            if (self.team == "allies") {
                goalent = level.var_3e5a26826d8b8e2f;
            } else {
                goalent = level.var_a970fbbf4c65f18c;
            }
            if (isdefined(goalent) && (!isdefined(level.ball.var_9b593f980e1df35b) || level.ball.var_9b593f980e1df35b != self)) {
                var_579b57f0f6ff2cf2 = goalent.origin - level.ball.origin;
                var_e5b0ec0e97542a26 = length(var_579b57f0f6ff2cf2);
                var_474316929ff377fe = vectordot(level.ball.velocity, var_579b57f0f6ff2cf2);
                if (var_e5b0ec0e97542a26 <= 500 && var_474316929ff377fe > 0) {
                    var_c81d07983e9fb9b = vectornormalize(level.ball.velocity);
                    var_6b36173e1c9d0057 = level.ball.origin + var_c81d07983e9fb9b * var_e5b0ec0e97542a26;
                    trace = namespace_2a184fc4902783dc::sphere_trace(level.ball.origin, var_6b36173e1c9d0057, 28, [0:self, 1:self.vehicle, 2:level.ball]);
                    if (trace["fraction"] > 0.99) {
                        thread function_3ea35b42c5e9419e();
                    }
                }
            }
            var_9b593f980e1df35b = spawnstruct();
            var_9b593f980e1df35b.player = self;
            if (forwarddot < 0) {
                velocity = self.vehicle vehicle_getvelocity();
                if (vectordot(velocity, forward) < 0) {
                    var_9b593f980e1df35b.var_909dd2932bf61c47 = 1;
                }
            }
            level.ball.var_9b593f980e1df35b = var_9b593f980e1df35b;
            thread function_53eb14eedd8c8cf8();
            function_81905c4905cbcb80(self.vehicle, level.ball, normal, 1, level.ball.origin);
        }
        waitframe();
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x36b8
// Size: 0x47
function private function_53eb14eedd8c8cf8() {
    self notify("ballmode_watch_for_assist");
    level endon("game_ended");
    self endon("disconnect");
    self endon("ballmode_watch_for_assist");
    wait(level.assistTouchTime);
    level.ball.var_fd1b69daea740e45[self.guid] = undefined;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3706
// Size: 0x4c
function private function_3ea35b42c5e9419e() {
    self notify("ballmode_watch_for_save");
    level endon("game_ended");
    level endon("ballmode_goal_scored");
    self endon("disconnect");
    self endon("ballmode_watch_for_save");
    wait(1);
    namespace_48a08c5037514e04::doScoreEvent(#"hash_24ea0be5efec97c5");
    self.pers["hasDoneAnyCombat"] = 1;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3759
// Size: 0x39b
function function_263274274f7871fa() {
    self endon("disconnect");
    self endon("respawn");
    level endon("game_ended");
    self.var_1f5985d661e980fe = 0;
    self.var_7e44aef4fdc0e5d3 = 100;
    self.var_8c9da67cf413df2e = getdvarint(@"hash_8839756ee5e73455", 1);
    self.normalspeed = getdvarint(@"hash_b41aec456a71399a", 35);
    var_9381ca324b30f76 = getdvarint(@"hash_b8ee638db3d40fa6", 50);
    var_c02646f657bd26c0 = getdvarfloat(@"hash_b7615c14184146dd", 8);
    if (self.var_23511319cec8f63 && getdvarint(@"hash_bea2f654590e1855", 0)) {
        var_c02646f657bd26c0 = getdvarint(@"hash_bea2f654590e1855", 0);
    }
    if (self.var_23511319cec8f63 && getdvarint(@"hash_21590fe81942ff74", 0)) {
        self.normalspeed = getdvarint(@"hash_21590fe81942ff74", 0);
    }
    self.vehicle setscriptablepartstate("pulse", "default", 1);
    var_913ae0d782d6dafa = 0;
    self.vehicle vehicle_settopspeedforward(self.normalspeed);
    while (1) {
        if (!isdefined(self.vehicle)) {
            waitframe();
            continue;
        }
        if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            waitframe();
            continue;
        }
        if (istrue(self.isstunned)) {
            waitframe();
            continue;
        }
        self.var_7e44aef4fdc0e5d3 = self.var_7e44aef4fdc0e5d3 + var_c02646f657bd26c0 * level.framedurationseconds;
        if (self.var_7e44aef4fdc0e5d3 > 100) {
            self.var_7e44aef4fdc0e5d3 = 100;
        }
        self setclientomnvar("ballmode_pulse_recharge", self.var_7e44aef4fdc0e5d3 / 100);
        if (self.var_7e44aef4fdc0e5d3 >= 100) {
            if (!var_913ae0d782d6dafa) {
                self.vehicle setscriptablepartstate("pulse", "pulse_ready", 1);
                self playlocalsound("mp_codball_pulse_ready_plr");
                self playsound("mp_codball_pulse_ready_npc", self, self);
                var_913ae0d782d6dafa = 1;
            }
            if (self jumpbuttonpressed()) {
                self.var_7e44aef4fdc0e5d3 = 0;
                self setclientomnvar("ballmode_pulse_recharge", self.var_7e44aef4fdc0e5d3 / 100);
                self.var_1f5985d661e980fe = self.var_3c11f592093dc36d;
                self.var_5018479a0f0ca9c2 = self.var_48d12de553c8eead;
                var_913ae0d782d6dafa = 0;
                self.vehicle vehicle_settopspeedforward(var_9381ca324b30f76);
                self.vehicle setscriptablepartstate("pulse", "pulsing", 1);
                self playlocalsound("mp_codball_pulse_plr");
                self playsound("mp_codball_pulse_npc", self, self);
                self earthquakeforplayer(0.15, 0.5, self.origin, 5000);
                namespace_48a08c5037514e04::doScoreEvent(#"hash_78bf5d029b54a6d9");
                self.pers["hasDoneAnyCombat"] = 1;
                for (x = 0; x < 5; x++) {
                    self.vehicle function_e0201404a8b6f664(anglestoforward(self.vehicle.angles), 55, 0);
                    wait(0.1);
                    if (!isdefined(self.vehicle)) {
                        break;
                    }
                }
                wait(0.5);
                if (!isdefined(self.vehicle)) {
                    break;
                }
                self.vehicle vehicle_settopspeedforward(self.normalspeed);
                self.vehicle setscriptablepartstate("pulse", "default", 1);
            }
        }
        waitframe();
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3afb
// Size: 0x183
function function_57751ab79abf8f20() {
    self endon("disconnect");
    self endon("respawn");
    self.vehicle setscriptablepartstate("max_speed", "default", 1);
    var_99bb1f0db99012f0 = 0;
    self.var_48d12de553c8eead = 0;
    var_3815e60ba5ddc269 = 0;
    while (1) {
        if (!isdefined(self.vehicle)) {
            waitframe();
            continue;
        }
        velocity = self.vehicle vehicle_getvelocity();
        if (length(velocity) > 530 && vectordot(anglestoforward(self.vehicle.angles), velocity) > 0) {
            self.var_48d12de553c8eead = 1;
            if (!var_99bb1f0db99012f0) {
                var_99bb1f0db99012f0 = 1;
                if (getdvarint(@"hash_3d45b5bad11c6ff1", 1)) {
                    self.vehicle setscriptablepartstate("max_speed", "max_speed", 1);
                }
            }
        }
        if (length(velocity) < 100) {
            if (var_99bb1f0db99012f0) {
                var_99bb1f0db99012f0 = 0;
                self.vehicle setscriptablepartstate("max_speed", "default", 1);
                self.var_48d12de553c8eead = 0;
            }
        }
        waitframe();
        var_3815e60ba5ddc269 = var_3815e60ba5ddc269 + level.framedurationseconds;
        if (var_3815e60ba5ddc269 >= 0.25) {
            var_3815e60ba5ddc269 = var_3815e60ba5ddc269 - 0.25;
            if (!self.var_48d12de553c8eead) {
                if (var_99bb1f0db99012f0) {
                    var_99bb1f0db99012f0 = 0;
                    self.vehicle setscriptablepartstate("max_speed", "default", 1);
                }
            }
            self.var_48d12de553c8eead = 0;
        }
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c85
// Size: 0xd8
function function_72b3e6d160929c0a() {
    self endon("disconnect");
    self endon("respawn");
    self.var_9835cdc5507afa4f = 0;
    self.vehicle setscriptablepartstate("ramming", "default", 1);
    while (1) {
        if (!isdefined(self.vehicle)) {
            waitframe();
            continue;
        }
        var_76d65f0b5902d51d = function_76d65f0b5902d51d();
        if (!var_76d65f0b5902d51d) {
            waitframe();
            continue;
        }
        if (istrue(self.var_5018479a0f0ca9c2)) {
            self.vehicle setscriptablepartstate("ramming", "ramming", 1);
            if (!istrue(level.var_18250df1dd55da52)) {
                self.var_9835cdc5507afa4f = 1;
            }
        }
        wait(self.var_8c9da67cf413df2e);
        self.vehicle setscriptablepartstate("ramming", "default", 1);
        self.var_9835cdc5507afa4f = 0;
        waitframe();
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3d64
// Size: 0x7f
function private listenForVehicleExit(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    if (!istrue(level.listenForVehicleExit)) {
        return;
    }
    while (isdefined(player.vehicle) && !istrue(player.vehicle.isdestroyed)) {
        waitframe();
    }
    player.plotarmor = 0;
    player dodamage(player.maxhealth, player.origin);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dea
// Size: 0x43
function function_32df9962eea79205() {
    level endon("game_ended");
    self endon("respawn");
    var_7c1608abed261e5c = self.vehicle;
    self waittill("death_or_disconnect");
    namespace_1fbd40990ee60ede::vehicle_occupancy_exit(var_7c1608abed261e5c, "driver", self);
    namespace_1f188a13f7e79610::vehicle_death(var_7c1608abed261e5c);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e34
// Size: 0xe4
function function_eae183e660ed1bd(ball) {
    while (1) {
        if (isdefined(level.ball) && isdefined(level.ball.origin)) {
            if (!isdefined(level.ball.oldorigin)) {
                level.ball.oldorigin = level.ball.origin;
            }
            level.ball.velocity = (level.ball.origin - level.ball.oldorigin) / level.framedurationseconds;
            level.ball.oldorigin = level.ball.origin;
        }
        waitframe();
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f1f
// Size: 0x38
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f5e
// Size: 0x167
function onstartgametype() {
    setclientnamemode("auto_change");
    level.scorelimitoverride = 1;
    level.roundenddelay = 3;
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    if (isdefined(level.initspawnsoverridefunc)) {
        [[ level.initspawnsoverridefunc ]]();
    } else {
        initspawns();
    }
    namespace_662734e7fa8a8b94::inittankspawns();
    if (getdvarint(@"hash_cd7a289c3a33ceda", 0) != 0) {
        thread monitorhotfoot();
    }
    /#
        thread function_8469a5927d069db7();
        if (0) {
            function_bf2918399f1800b1();
        }
    #/
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40cc
// Size: 0xcf
function updategametypedvars() {
    level.postGoalCooldown = dvarintvalue("postGoalCooldown", 8, 0, 10);
    level.assistTouchTime = dvarintvalue("assistTouchTime", 10, 0, 30);
    level.disablePlayerOutlines = dvarintvalue("disablePlayerOutlines", 0, 0, 1);
    level.useRedAndBluePlayerOutlines = dvarintvalue("useRedAndBluePlayerOutlines", 0, 0, 1);
    level.useRedAndBlueGoalScoreSplashes = dvarintvalue("useRedAndBlueGoalScoreSplashes", 1, 0, 1);
    level.useTeamNamesOnGoalScoreSplashes = dvarintvalue("useTeamNamesOnGoalScoreSplashes", 0, 0, 1);
    level.forceRetryOnVehicleOccupancyFailed = dvarintvalue("forceRetryOnVehicleOccupancyFailed", 1, 0, 1);
    level.listenForVehicleExit = dvarintvalue("listenForVehicleExit", 1, 0, 1);
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41a2
// Size: 0x277
function initspawns() {
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    } else if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("BigTDM", "Crit_Frontline");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    if (istrue(level.testtdmanywhere)) {
        x = getdvarfloat(@"hash_b6294c84c04e377b", randomfloatrange(-4096, 4096));
        y = getdvarfloat(@"hash_b6294b84c04e3548", randomfloatrange(-4096, 4096));
        z = getdvarfloat(@"hash_b6294e84c04e3be1", randomfloatrange(0, 512));
        level.mapcenter = (x, y, z);
        tdmanywhere_debugshowlocs();
    } else {
        level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4420
// Size: 0x64
function function_a1c387e9b8e35312() {
    /#
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("veh9_mil_lnd_atv_physics_mp_boostball_las");
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("v009");
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("lookingAtBall");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("stunned");
        namespace_b2d5aa2baf2b5701::registerspawnset("veh9_mil_lnd_atv_physics_mp_boostball_las", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("v009", var_3a5288f40c8be099);
    #/
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x448b
// Size: 0x75
function getspawnpoint() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (spawnteam == game["attackers"]) {
        namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
    }
    return spawnpoint;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4508
// Size: 0x45
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    if (!istrue(level.testtdmanywhere)) {
        return;
    }
    self setplayerangles(vectortoangles(level.mapcenter - self.origin));
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4554
// Size: 0x17c
function function_d73615f1fc12f3db(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            var_965ef52941de8769 = namespace_90f75d3fdf89a43e::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("ball" + var_965ef52941de8769.index + "collision" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("prematch_done" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "BigTDM" + "time_limit_reached" + level.var_2dc7108159dc1da3 + "ballmode_overtime_banner" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("outlinefill_nodepth_orange" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "BigTDM" + "time_limit_reached" + level.var_2dc7108159dc1da3 + "ballmode_overtime_banner" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x46d7
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x471f
// Size: 0x134
function ontimelimit() {
    winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
    if (game["status"] == "overtime") {
        level thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["time_limit_reached"]);
    } else if (winner == "tie") {
        foreach (player in level.players) {
            player namespace_44abc05161e2e2cb::showsplash("ballmode_overtime_banner");
        }
        game["status"] = "overtime";
        level.starttime = gettime();
        gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit");
        level.watchdvars[gamemode].value = getdvarint(@"hash_e55ef5d10527388");
        setdvar(gamemode, getdvarint(@"hash_e55ef5d10527388"));
    } else {
        level thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x485a
// Size: 0xe8
function function_8469a5927d069db7() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                points = getdvarint(@"hash_46a6b424af6acbc2");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = getdvarint(@"hash_86e14326e43c0115");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_8469a5927d069db7();
    #/
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4949
// Size: 0x1f9
function function_bf2918399f1800b1() {
    /#
        wait(5);
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
    #/
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b49
// Size: 0x19b
function tdmanywhere_debugshowlocs() {
    thread namespace_d028276791d9cff6::drawsphere(level.mapcenter, 128, 100, (0, 1, 0));
    if (!isdefined(level.tdmanywherefrontline)) {
        waitframe();
    }
    var_cc015915d647fbdf = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset;
    var_c1d9d45c8845eb82 = level.tdmanywherefrontline.anchorrt * level.tdmanywhere_perpenoffset;
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter + var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter - var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ceb
// Size: 0x25
function enemyteam(var_ac6ca28a64718193) {
    if (var_ac6ca28a64718193 == "allies") {
        return "axis";
    } else {
        return "allies";
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d17
// Size: 0x407
function monitorhotfoot() {
    level endon("game_ended");
    level.outlinedplayers = [];
    level.hotfootabsloops = 0;
    timepassed = 0;
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        foreach (player in level.players) {
            if (!isdefined(player.hotfootlastposition)) {
                player.hotfootdisttraveledsq = 0;
                player.hotfootlastposition = player.origin;
                player.abshotfootlastposition = player.origin;
            }
            player.hotfootdisttraveledsq = player.hotfootdisttraveledsq + distancesquared(player.hotfootlastposition, player.origin);
            player.hotfootlastposition = player.origin;
        }
        timepassed = timepassed + level.framedurationseconds;
        if (timepassed > 3) {
            if (level.hotfootabsloops >= 2) {
                level.hotfootabsloops = 0;
                foreach (player in level.players) {
                    if (!isdefined(player.abshotfootlastposition)) {
                        player.abshotfootlastposition = player.origin;
                    }
                    player.forceabshotfoot = distancesquared(player.abshotfootlastposition, player.origin) < 4225;
                    player.abshotfootlastposition = player.origin;
                }
            }
            foreach (player in level.players) {
                entnum = player getentitynumber();
                var_ac6ca28a64718193 = player.pers["team"];
                enemyteam = enemyteam(var_ac6ca28a64718193);
                if (isalive(player) && (istrue(player.forceabshotfoot) || player.hotfootdisttraveledsq < 4225 && !istrue(player.hotfootreset))) {
                    /#
                        if (istrue(player.forceabshotfoot)) {
                            player iprintlnbold("<unknown string>");
                        } else {
                            player iprintlnbold("<unknown string>");
                        }
                    #/
                    player.forceabshotfoot = 0;
                    if (!isdefined(level.outlinedplayers[entnum])) {
                        level.outlinedplayers[entnum] = player;
                        player.outlineidfriend = outlineenableforteam(player, var_ac6ca28a64718193, "outline_nodepth_orange", "level_script");
                        player.outlineidenemy = outlineenableforteam(player, enemyteam, "outline_nodepth_red", "level_script");
                        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable("outlinefill_nodepth_orange", 0);
                    }
                } else {
                    if (isalive(player)) {
                        player.hotfootreset = 0;
                    }
                    player.forceabshotfoot = 0;
                    if (isdefined(level.outlinedplayers[entnum])) {
                        outlinedisable(player.outlineidfriend, player);
                        outlinedisable(player.outlineidenemy, player);
                        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
                        player.outlineidfriend = undefined;
                        player.outlineidenemy = undefined;
                        level.outlinedplayers[entnum] = undefined;
                    }
                }
                player.hotfootdisttraveledsq = 0;
            }
            timepassed = 0;
        }
        level.hotfootabsloops++;
        waitframe();
    }
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x5125
// Size: 0xc0
function onhotfootplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    entnum = self getentitynumber();
    if (isdefined(level.outlinedplayers[entnum])) {
        outlinedisable(self.outlineidfriend, self);
        outlinedisable(self.outlineidenemy, self);
        self.outlineidfriend = undefined;
        self.outlineidenemy = undefined;
        level.outlinedplayers[entnum] = undefined;
    }
    self.hotfootreset = 1;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51ec
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    var_f9c7aae8c6acd600 = axisscore - alliesscore;
    return var_f9c7aae8c6acd600 < 10;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5243
// Size: 0x51
function onplayerconnect(player) {
    player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    player.pers["gamemodeLoadout"] = level.var_d4867c54e1ae2315;
    player allowspectateallteams(0);
    player.var_a9bcf4e8440e11be = [];
    player.var_23511319cec8f63 = 0;
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x529b
// Size: 0x19b
function setspecialloadout() {
    level.var_d4867c54e1ae2315["loadoutPrimary"] = "iw9_me_fists";
    level.var_d4867c54e1ae2315["loadoutPrimaryAttachment"] = "none";
    level.var_d4867c54e1ae2315["loadoutPrimaryAttachment2"] = "none";
    level.var_d4867c54e1ae2315["loadoutPrimaryCamo"] = "none";
    level.var_d4867c54e1ae2315["loadoutPrimaryReticle"] = "none";
    level.var_d4867c54e1ae2315["loadoutPrimaryVariantID"] = 0;
    level.var_d4867c54e1ae2315["loadoutSecondary"] = "none";
    level.var_d4867c54e1ae2315["loadoutSecondaryAttachment"] = "none";
    level.var_d4867c54e1ae2315["loadoutSecondaryAttachment2"] = "none";
    level.var_d4867c54e1ae2315["loadoutSecondaryCamo"] = "none";
    level.var_d4867c54e1ae2315["loadoutSecondaryReticle"] = "none";
    level.var_d4867c54e1ae2315["loadoutSecondaryVariantID"] = 0;
    level.var_d4867c54e1ae2315["loadoutEquipment"] = "specialty_null";
    level.var_d4867c54e1ae2315["loadoutOffhand"] = "none";
    level.var_d4867c54e1ae2315["loadoutStreakType"] = "assault";
    level.var_d4867c54e1ae2315["loadoutKillstreak1"] = "none";
    level.var_d4867c54e1ae2315["loadoutKillstreak2"] = "none";
    level.var_d4867c54e1ae2315["loadoutKillstreak3"] = "none";
    level.var_d4867c54e1ae2315["loadoutPerks"] = [];
    level.var_d4867c54e1ae2315["loadoutGesture"] = "playerData";
}

// Namespace ballmode/namespace_7952a7a03164e1a8
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x543d
// Size: 0xf8
function private function_d4eaf53b4475969e(player, var_1fbf6aaa31163feb) {
    if (!isdefined(player) || !isdefined(player.team) || !isdefined(var_1fbf6aaa31163feb)) {
        return;
    }
    teamname = undefined;
    teamcolor = undefined;
    if (level.useTeamNamesOnGoalScoreSplashes) {
        teamname = var_1fbf6aaa31163feb;
    } else if (player.team == var_1fbf6aaa31163feb) {
        teamname = "friendly";
    } else {
        teamname = "enemy";
    }
    if (!level.useRedAndBlueGoalScoreSplashes) {
        teamcolor = namespace_3c37cb17ade254d::ter_op(var_1fbf6aaa31163feb == "allies", "yellow", "green");
    } else if (player.team == var_1fbf6aaa31163feb) {
        teamcolor = "blue";
    } else {
        teamcolor = "red";
    }
    splashname = namespace_3c37cb17ade254d::function_996b01cd49d0128d([0:"ballmode_goal_score", 1:teamname, 2:teamcolor], "_");
    player namespace_44abc05161e2e2cb::showsplash(splashname);
}

