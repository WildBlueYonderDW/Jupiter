// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_5def7af2a9f04234;
#using script_6a8ec730b2bfa844;
#using scripts\mp\utility\points.gsc;

#namespace namespace_40ec518e5ba6eab9;

// Namespace namespace_40ec518e5ba6eab9/namespace_f449a60e8ec95b60
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0x29
function ontripwirecreate(tripwire) {
    tripwire.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(tripwire.origin);
}

// Namespace namespace_40ec518e5ba6eab9/namespace_f449a60e8ec95b60
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb8
// Size: 0x1d
function ontripwiretriggered(player, tripwire) {
    namespace_8361bad7391de074::function_800f75fe5e5c7462(player, tripwire);
}

// Namespace namespace_40ec518e5ba6eab9/namespace_f449a60e8ec95b60
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdc
// Size: 0x26
function ontripwiredefused(player, tripwire) {
    player thread namespace_48a08c5037514e04::doscoreevent(#"hash_8ebedeb366a503f7");
}

