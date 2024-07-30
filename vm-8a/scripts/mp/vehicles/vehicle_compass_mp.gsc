#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\utility\perk.gsc;

#namespace namespace_5eac2b19504e7004;

// Namespace namespace_5eac2b19504e7004 / scripts\mp\vehicles\vehicle_compass_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9
// Size: 0x30
function vehicle_compass_mp_init() {
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&vehicle_compass_playerspawnedcallback);
    scripts\mp\utility\join_team_aggregator::registeronplayerjointeamnospectatorcallback(&vehicle_compass_playerjoinedteamcallback);
    registersharedfunc("vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_mp_shouldbevisibletoplayer);
}

// Namespace namespace_5eac2b19504e7004 / scripts\mp\vehicles\vehicle_compass_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121
// Size: 0x5b
function vehicle_compass_mp_shouldbevisibletoplayer(vehicle, player) {
    if (player entitymarkfilteredin(vehicle)) {
        return 1;
    } else if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (!scripts\cp_mp\vehicles\vehicle::vehicle_isenemytoplayer(vehicle, player)) {
            return 1;
        }
    } else if (player scripts\mp\utility\perk::_hasperk("specialty_tactical_recon")) {
        if (!scripts\cp_mp\vehicles\vehicle::vehicle_isneutraltoplayer(vehicle, player)) {
            return 1;
        }
    }
    return undefined;
}

