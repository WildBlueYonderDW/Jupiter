#using scripts\engine\utility.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using script_7c110e744404ee81;

#namespace namespace_17ca84825c926284;

// Namespace namespace_17ca84825c926284 / namespace_fc31f517a806b2d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80
// Size: 0xe
function init() {
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&namespace_d6e7a6955029e9b9::function_9ff225017ef5ce19);
}

