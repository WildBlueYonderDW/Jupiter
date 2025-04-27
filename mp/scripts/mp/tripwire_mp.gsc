#using scripts\engine\utility;
#using scripts\mp\pmc_missions;
#using scripts\mp\poi;
#using scripts\mp\utility\points;

#namespace tripwire_mp;

// Namespace tripwire_mp / scripts\mp\tripwire_mp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa7
// Size: 0x28
function ontripwirecreate( tripwire )
{
    tripwire.poi = scripts\mp\poi::function_6cc445c02b5effac( tripwire.origin );
}

// Namespace tripwire_mp / scripts\mp\tripwire_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd7
// Size: 0x1c
function ontripwiretriggered( player, tripwire )
{
    scripts\mp\pmc_missions::function_800f75fe5e5c7462( player, tripwire );
}

// Namespace tripwire_mp / scripts\mp\tripwire_mp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfb
// Size: 0x25
function ontripwiredefused( player, tripwire )
{
    player thread scripts\mp\utility\points::doscoreevent( #"hash_8ebedeb366a503f7" );
}

