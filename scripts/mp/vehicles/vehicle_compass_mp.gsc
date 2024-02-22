// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\utility\perk.gsc;

#namespace namespace_5eac2b19504e7004;

// Namespace namespace_5eac2b19504e7004/namespace_597c42ba275de1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9
// Size: 0x31
function vehicle_compass_mp_init() {
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&vehicle_compass_playerspawnedcallback);
    namespace_1309ce202b9aa92b::registeronplayerjointeamnospectatorcallback(&vehicle_compass_playerjoinedteamcallback);
    registersharedfunc("vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_mp_shouldbevisibletoplayer);
}

// Namespace namespace_5eac2b19504e7004/namespace_597c42ba275de1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121
// Size: 0x5c
function vehicle_compass_mp_shouldbevisibletoplayer(vehicle, player) {
    if (player entitymarkfilteredin(vehicle)) {
        return 1;
    } else if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        if (!namespace_1f188a13f7e79610::vehicle_isenemytoplayer(vehicle, player)) {
            return 1;
        }
    } else if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_tactical_recon")) {
        if (!namespace_1f188a13f7e79610::vehicle_isneutraltoplayer(vehicle, player)) {
            return 1;
        }
    }
    return undefined;
}

