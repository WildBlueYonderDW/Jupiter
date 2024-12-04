#using scripts\sp\equipment\offhands;

#namespace pipebomb;

// Namespace pipebomb / scripts\sp\equipment\pipebomb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &pipebombfiremain);
}

// Namespace pipebomb / scripts\sp\equipment\pipebomb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xab
// Size: 0x2b
function pipebombfiremain(grenade, weapon) {
    if (!isdefined(grenade)) {
        return;
    }
    function_216c67ab6749137a(self, undefined, "grenade_throw", "frag_grenade");
}

