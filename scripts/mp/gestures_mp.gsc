// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\common\notetrack.gsc;

#namespace namespace_e94cba3cb760c2f7;

// Namespace namespace_e94cba3cb760c2f7/namespace_e44030e132d2f79e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98
// Size: 0x16
function init_mp() {
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&watchradialgestureactivation);
    namespace_b5a115f53b441ef5::function_11f8c6d6f5ba948();
}

