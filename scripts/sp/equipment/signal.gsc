#using scripts\sp\equipment\offhands.gsc;

#namespace signal;

// Namespace signal / scripts\sp\equipment\signal
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &signalfiremain);
}

// Namespace signal / scripts\sp\equipment\signal
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x90
// Size: 0x13
function signalfiremain(grenade, weapon) {
    
}

