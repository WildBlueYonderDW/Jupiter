#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\common\notetrack.gsc;

#namespace gestures_mp;

// Namespace gestures_mp / scripts\mp\gestures_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8
// Size: 0x15
function init_mp() {
    scripts\mp\utility\lui_game_event_aggregator::registeronluieventcallback(&watchradialgestureactivation);
    scripts\common\notetrack::function_11f8c6d6f5ba948();
}

