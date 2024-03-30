// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\poi.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\utility\points.gsc;

#namespace tripwire_mp;

// Namespace tripwire_mp / scripts/mp/tripwire_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0x29
function onTripwireCreate(tripwire) {
    tripwire.poi = scripts/mp/poi::function_6cc445c02b5effac(tripwire.origin);
}

// Namespace tripwire_mp / scripts/mp/tripwire_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb8
// Size: 0x1d
function onTripwireTriggered(player, tripwire) {
    namespace_8361bad7391de074::function_800f75fe5e5c7462(player, tripwire);
}

// Namespace tripwire_mp / scripts/mp/tripwire_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdc
// Size: 0x26
function onTripwireDefused(player, tripwire) {
    player thread scripts/mp/utility/points::doScoreEvent(#"hash_8ebedeb366a503f7");
}

