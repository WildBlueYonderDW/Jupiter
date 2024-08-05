#using scripts\engine\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\utility\spawn_event_aggregator.gsc;
#using script_7c110e744404ee81;

#namespace namespace_17e488825cae945a;

// Namespace namespace_17e488825cae945a / namespace_7421af812c81d88b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0xe
function init() {
    scripts\cp\utility\spawn_event_aggregator::registeronplayerspawncallback(&namespace_d6e7a6955029e9b9::function_9ff225017ef5ce19);
}

