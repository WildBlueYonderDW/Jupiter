#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\killstreaks\remoteuav.gsc;

#namespace uav_mp;

// Namespace uav_mp / scripts\mp\killstreaks\uav_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d
// Size: 0x3ce
function init_uav_mp() {
    level.radarviewtime = 25;
    level.advradarviewtime = getdvarint(@"hash_9f9e7d3a7b0b123d", 50);
    level.uavblocktime = 23;
    scripts\mp\killstreaks\killstreaks::registerkillstreak("uav", &tryuseuavfromstruct);
    scripts\mp\killstreaks\killstreaks::registerkillstreak("counter_uav", &tryuseuavfromstruct);
    scripts\mp\killstreaks\killstreaks::registerkillstreak("directional_uav", &tryuseuavfromstruct);
    uav_bundle = level.streakglobals.streakbundles["uav"];
    level.uavsettings = [];
    level.uavsettings["uav"] = spawnstruct();
    level.uavsettings["uav"].timeout = level.radarviewtime;
    level.uavsettings["uav"].health = 999999;
    level.uavsettings["uav"].maxhealth = 450;
    level.uavsettings["uav"].streakname = "uav";
    level.uavsettings["uav"].modelbase = default_to(uav_bundle.uavmodel, "veh9_mil_air_uav_small_mp");
    level.uavsettings["uav"].sound_explode = "mp_uav_explo_dist";
    level.uavsettings["uav"].teamsplash = "used_uav";
    level.uavsettings["uav"].votimeout = "timeout_uav";
    level.uavsettings["uav"].calloutdestroyed = "callout_destroyed_uav";
    level.uavsettings["uav"].addfunc = &function_a4d3120487c90203;
    level.uavsettings["uav"].removefunc = &uav_removeactiveuav;
    function_7dbeff3d392879b3();
    var_5085fa19030c6eb9 = level.streakglobals.streakbundles["directional_uav"];
    var_30bd814725530611 = "veh9_mil_air_uav_small_mp";
    if (isdefined(var_5085fa19030c6eb9) && isdefined(var_5085fa19030c6eb9.var_30bd814725530611)) {
        var_30bd814725530611 = var_5085fa19030c6eb9.var_30bd814725530611;
    }
    level.uavsettings["directional_uav"] = spawnstruct();
    level.uavsettings["directional_uav"].timeout = level.advradarviewtime;
    level.uavsettings["directional_uav"].health = 999999;
    level.uavsettings["directional_uav"].maxhealth = 2000;
    level.uavsettings["directional_uav"].streakname = "directional_uav";
    level.uavsettings["directional_uav"].modelbase = var_30bd814725530611;
    level.uavsettings["directional_uav"].votimeout = "timeout_directional_uav";
    level.uavsettings["directional_uav"].teamsplash = "used_directional_uav";
    level.uavsettings["directional_uav"].addfunc = &function_a4d3120487c90203;
    level.uavsettings["directional_uav"].removefunc = &uav_removeactiveuav;
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
    scripts\engine\utility::registersharedfunc("uav", "remoteUAV_processTaggedAssist", &scripts\mp\killstreaks\remoteuav::remoteuav_processtaggedassist);
    scripts\engine\utility::registersharedfunc("uav", "attachXRays", &function_91be4c07add55c1a);
}

// Namespace uav_mp / scripts\mp\killstreaks\uav_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x653
// Size: 0x27a
function function_7dbeff3d392879b3() {
    cuav_bundle = level.streakglobals.streakbundles["counter_uav"];
    if (!isdefined(cuav_bundle)) {
        cuav_bundle = spawnstruct();
    }
    level.uavsettings["counter_uav"] = spawnstruct();
    level.uavsettings["counter_uav"].timeout = level.uavblocktime;
    level.uavsettings["counter_uav"].health = 999999;
    level.uavsettings["counter_uav"].maxhealth = 800;
    level.uavsettings["counter_uav"].streakname = "counter_uav";
    level.uavsettings["counter_uav"].modelbase = default_to(cuav_bundle.cuavmodel, "veh8_mil_air_cuniform");
    level.uavsettings["counter_uav"].modelbasealt = default_to(cuav_bundle.var_5aa9050ef59f30d3, "veh8_mil_air_cuniform_east");
    level.uavsettings["counter_uav"].fx_leave_tag = "tag_origin";
    level.uavsettings["counter_uav"].sound_explode = "scrambler_drone_explode";
    level.uavsettings["counter_uav"].votimeout = "counter_uav_timeout";
    level.uavsettings["counter_uav"].vodestroyed = "destroyed_scrambler_drone_guard";
    level.uavsettings["counter_uav"].votimedout = "timeout_scrambler_drone_guard";
    level.uavsettings["counter_uav"].teamsplash = "used_scrambler_drone_guard";
    level.uavsettings["counter_uav"].destroyedsplash = "callout_destroyed_scrambler_drone_guard";
    level.uavsettings["counter_uav"].scorepopup = "destroyed_scrambler_drone_guard";
    level.uavsettings["counter_uav"].calloutdestroyed = "callout_destroyed_counter_uav";
    level.uavsettings["counter_uav"].addfunc = &function_24d8b56676d4d3d1;
    level.uavsettings["counter_uav"].removefunc = &uav_removeactivecounteruav;
}

// Namespace uav_mp / scripts\mp\killstreaks\uav_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d5
// Size: 0x20
function function_91be4c07add55c1a(uavmodel) {
    uavmodel function_5226227bce83ebe9(3, uavmodel.team);
    return uavmodel;
}

