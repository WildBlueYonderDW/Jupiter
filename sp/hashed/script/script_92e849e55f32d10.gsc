#using scripts\sp\equipment\offhands.gsc;

#namespace hb_sensor;

// Namespace hb_sensor / namespace_5c033c097ea4bf82
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70
// Size: 0x18
function precache(offhand) {
    registeroffhandfirefunc(offhand, &function_8f256a2c4afab75f);
}

// Namespace hb_sensor / namespace_5c033c097ea4bf82
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x90
// Size: 0x20
function function_8f256a2c4afab75f(grenade, weapon) {
    waitframe();
    if (isdefined(grenade)) {
        grenade delete();
    }
}

