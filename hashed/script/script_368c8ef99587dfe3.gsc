// mwiii decomp prototype
#using script_451a1a9bd9613164;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;

#namespace namespace_6ea38b6e0f4f1418;

// Namespace namespace_6ea38b6e0f4f1418/namespace_f280858cfad8e545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab
// Size: 0x1b
function init() {
    namespace_bc0abb78a303bb78::function_8ece37593311858a(&onplayerconnect);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
}

// Namespace namespace_6ea38b6e0f4f1418/namespace_f280858cfad8e545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd
// Size: 0x18
function onplayerconnect() {
    player = self;
    player thread function_ba61f4ee48e1b99();
}

// Namespace namespace_6ea38b6e0f4f1418/namespace_f280858cfad8e545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec
// Size: 0x2d
function function_ba61f4ee48e1b99() {
    player = self;
    player endon("death_or_disconnect");
    while (1) {
        player iprintlnbold("juggermosh - remove me");
        wait(2);
    }
}

// Namespace namespace_6ea38b6e0f4f1418/namespace_f280858cfad8e545
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120
// Size: 0x2e
function onplayerspawned() {
    /#
        if (getdvarint(@"hash_672437747e65ed17", 0)) {
            return;
        }
    #/
    player = self;
    player thread activatejugg();
}

