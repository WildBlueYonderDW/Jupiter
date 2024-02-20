// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_63b1d4028d6de982;

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398
// Size: 0x3
function init() {
    
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a2
// Size: 0x90
function makerallypoint(object) {
    if (istrue(object.israllypoint)) {
        return;
    }
    object.israllypoint = 1;
    object.registeredrallypointplayers = [];
    object.autorespawntime = getdvarint(@"hash_546d8a10bb4e83de");
    if (!isdefined(level.rallypoints)) {
        level.rallypoints = [];
    }
    level.rallypoints[level.rallypoints.size] = object;
    thread watchforplayerdeath(object);
    thread watchforrallypointdeath(object);
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x439
// Size: 0x88
function registerplayerwithrallypoint(player, rallypoint) {
    if (!istrue(rallypoint.israllypoint)) {
        debugprint("Trying to register a player with an object that is not a rally point.");
        return;
    }
    debugprint(player.name + " has been registered wtih rally point: " + rallypoint.targetname);
    player.rallypoint = rallypoint;
    player.beingrallyrespawned = 0;
    rallypoint.registeredrallypointplayers[rallypoint.registeredrallypointplayers.size] = player;
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c8
// Size: 0xc2
function watchforplayerdeath(rallypoint) {
    while (isdefined(rallypoint)) {
        foreach (player in rallypoint.registeredrallypointplayers) {
            if (!isdefined(player)) {
                rallypoint.registeredrallypointplayers = array_remove(rallypoint.registeredrallypointplayers, player);
            } else if (!isreallyalive(player) && isdefined(player.rallypoint) && !player.beingrallyrespawned) {
                prepareplayerforrespawn(player, rallypoint);
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x591
// Size: 0x1d7
function prepareplayerforrespawn(player, rallypoint) {
    level endon("game_ended");
    player endon("team_eliminated");
    var_eea4fd6eee3beb45 = [0:"rally_point_respawn", 1:"rally_point_destroyed"];
    msg = player waittill_any_in_array_or_timeout(var_eea4fd6eee3beb45, rallypoint.autorespawntime);
    if (msg == "rally_point_destroyed") {
        if (isdefined(player) || !isreallyalive(player)) {
            return;
        }
        message = player namespace_58fb4f2e73fd41a0::getlowermessage();
        timeremaining = message.time;
        player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("rally_wait_revive", int(gettime() + self.timeuntilbleedout * 1000));
        waitframe();
        player.lowertimer settimer(player.timelefttospawnaction);
        return;
    }
    player.beingrallyrespawned = 1;
    spawnposition = vectornormalize(anglestoforward(rallypoint.angles));
    spawnposition = spawnposition * -175 + rallypoint.origin;
    player.forcespawnorigin = getclosestpointonnavmesh(spawnposition);
    waitframe();
    debugprint("Player respawning at rally point location:" + player.forcespawnorigin);
    player.forcespawnangles = (0, 90, 0);
    player notify("last_stand_revived");
    player _freezecontrols(0);
    player thread namespace_7db13bdf599e41a6::respawn();
    player setclientomnvar("ui_securing", 0);
    player setclientomnvar("ui_securing_progress", 0.01);
    player.ui_securing = undefined;
    while (!isreallyalive(player)) {
        wait(0.1);
    }
    player.beingrallyrespawned = 0;
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76f
// Size: 0x77
function watchforrallypointdeath(rallypoint) {
    rallypoint waittill("death");
    foreach (owner in rallypoint.registeredrallypointplayers) {
        owner notify("rally_point_destroyed");
        owner iprintlnbold("Your Rally Point has been destroyed");
    }
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ed
// Size: 0x1b
function debugprint(text) {
    /#
        if (1) {
            println(text);
        }
    #/
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80f
// Size: 0x109
function rallypointvehicle_activate(vehicle) {
    spawndata = namespace_f64231d5b7a2c3c4::getvehiclespawndata(vehicle);
    team = vehicle.team;
    ref = spawndata.ref;
    vehicle.israllypointvehicle = 1;
    thread namespace_8e28f8b325a83325::vehicleindangertracking(vehicle);
    namespace_8e28f8b325a83325::adddynamicspawnarea(team, vehicle, ref, (0, 0, 128));
    if (istrue(level.var_b307135dbcef5a38)) {
        level.var_694388259afb589b[team][level.var_694388259afb589b[team].size] = ref;
        namespace_8e28f8b325a83325::setspawnlocations(level.var_694388259afb589b[team], team);
    } else {
        level.spawnareas[team][level.spawnareas[team].size] = ref;
        namespace_8e28f8b325a83325::setspawnlocations(level.spawnareas[team], team);
    }
    vehicle.ref = ref;
    rallypoint_activatevehiclemarker(vehicle);
    thread rallypoint_watchforvehicledeath(vehicle);
    thread rallypoint_wathcforenemydiscovery(vehicle);
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x91f
// Size: 0xc
function rallypointvehicle_deactivate(vehicle) {
    
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x932
// Size: 0xec
function rallypoint_showafterprematch(vehicle) {
    vehicle endon("death");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (player in level.players) {
        if (player.team == vehicle.team) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(vehicle.marker.objidnum, player);
            var_328c7313a47e3c6b = namespace_dace9d390bc4a290::vehicle_spawn_getleveldataforvehicle(vehicle namespace_1f188a13f7e79610::function_d93ec4635290febd()).var_328c7313a47e3c6b;
            /#
                assert(isdefined(var_328c7313a47e3c6b) && var_328c7313a47e3c6b != "", "rallySpawnReference was not set for a rally vehicle. Set it in the vehicle bundle - see the MP Spawn Info section");
            #/
            player namespace_58fb4f2e73fd41a0::setlowermessageomnvar(var_328c7313a47e3c6b, undefined, 5);
        }
    }
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa25
// Size: 0xde
function rallypoint_watchforvehicledeath(vehicle) {
    vehicle waittill("death");
    if (istrue(level.var_b307135dbcef5a38)) {
        level.var_694388259afb589b[vehicle.team] = array_remove(level.var_694388259afb589b[vehicle.team], vehicle.ref);
    } else {
        level.spawnareas[vehicle.team] = array_remove(level.spawnareas[vehicle.team], vehicle.ref);
    }
    rallypoint_deacivatevehiclemarker(vehicle);
    namespace_8e28f8b325a83325::removedynamicspawnarea(vehicle.team, vehicle.ref);
    namespace_8e28f8b325a83325::removespawnlocation(vehicle.ref, vehicle.team);
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0a
// Size: 0x2dc
function rallypoint_activatevehiclemarker(vehicle) {
    visibility = "friendly";
    origin = vehicle.origin + (0, 0, 128);
    marker = namespace_19b4203b51d56488::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(marker.objidnum, vehicle.team);
    vehicle.marker = marker;
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        foreach (player in level.players) {
            if (player.team == vehicle.team) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(vehicle.marker.objidnum, player);
                var_328c7313a47e3c6b = vehicle_spawn_getleveldataforvehicle(vehicle namespace_1f188a13f7e79610::function_d93ec4635290febd()).var_328c7313a47e3c6b;
                /#
                    assert(isdefined(var_328c7313a47e3c6b) && var_328c7313a47e3c6b != "", "rallySpawnReference was not set for a rally vehicle. Set it in the vehicle bundle - see the MP Spawn Info section");
                #/
                player namespace_58fb4f2e73fd41a0::setlowermessageomnvar(var_328c7313a47e3c6b, undefined, 5);
            }
        }
    } else {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(marker.objidnum);
        thread rallypoint_showafterprematch(vehicle);
    }
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    namespace_5a22b6f3a56f7e9b::objective_pin_global(marker.objidnum, 0);
    icon = "hud_icon_minimap_vehicle_apc";
    switch (vehicle.vehiclename) {
    case #"hash_41afa3eacdeba917":
        icon = "hud_icon_minimap_vehicle_apc";
        break;
    case #"hash_66c8846b85d8c948":
    case #"hash_9d4e22a00fc630b5":
        icon = "hud_icon_minimap_vehicle_palfa";
        break;
    case #"hash_a2c475614741731":
        icon = "hud_icon_minimap_vehicle_armored_patrol";
        break;
    default:
        icon = "hud_icon_minimap_vehicle_apc";
        break;
    }
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, icon);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(marker.objidnum, vehicle);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(vehicle.marker.objidnum, 128);
    namespace_5a22b6f3a56f7e9b::update_objective_state(vehicle.marker.objidnum, "invisible");
    marker.lockupdatingicons = 1;
    vehicle.marker = marker;
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xded
// Size: 0x50
function rallypoint_deacivatevehiclemarker(vehicle) {
    vehicle.marker namespace_19b4203b51d56488::setvisibleteam("none");
    vehicle.marker namespace_19b4203b51d56488::releaseid();
    vehicle.marker.visibleteam = "none";
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe44
// Size: 0x73
function rallypoint_wathcforenemydiscovery(vehicle) {
    vehicle endon("death");
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    var_a25ca362bcc21c2d = spawn("trigger_radius", vehicle.origin - (0, 0, 512), 0, 1024, 1536);
    var_a25ca362bcc21c2d thread watchrallytriggeruse(vehicle);
    var_a25ca362bcc21c2d waittill("rallyPoint_revealed");
    var_a25ca362bcc21c2d delete();
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebe
// Size: 0xeb
function watchrallytriggeruse(vehicle) {
    self endon("rallyPoint_revealed");
    vehicle endon("death");
    while (1) {
        player = self waittill("trigger");
        waitframe();
        if (!isplayer(player)) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        if (player.team == vehicle.team) {
            continue;
        }
        vehicle.revealed = 1;
        foreach (plr in level.players) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(vehicle.marker.objidnum, plr);
        }
        self notify("rallyPoint_revealed");
    }
}

// Namespace namespace_63b1d4028d6de982/namespace_fdd1a79841ab3fe7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb0
// Size: 0xe7
function rallypoint_showtoplayer(player) {
    player endon("death_or_disconnect");
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    while (!isdefined(player.team) || player.team == "spectator") {
        waitframe();
    }
    if (isdefined(level.rallypointvehicles)) {
        foreach (vehicle in level.rallypointvehicles) {
            if (!isdefined(vehicle)) {
                continue;
            }
            if (player.team == vehicle.team) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(vehicle.marker.objidnum, player);
            }
        }
    }
}

