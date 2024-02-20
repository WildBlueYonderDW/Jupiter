// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace hostmigration;

// Namespace hostmigration/namespace_a05a5ef469174798
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd
// Size: 0x38
function hostmigration_waitlongdurationwithpause(duration) {
    if (issharedfuncdefined("hostmigration", "waitLongDurationWithPause")) {
        [[ getsharedfunc("hostmigration", "waitLongDurationWithPause") ]](duration);
    } else {
        wait(duration);
    }
}

// Namespace hostmigration/namespace_a05a5ef469174798
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc
// Size: 0x48
function hostmigration_waittillnotifyortimeoutpause(msg, duration) {
    if (issharedfuncdefined("hostmigration", "waittillNotifyOrTimeoutPause")) {
        [[ getsharedfunc("hostmigration", "waittillNotifyOrTimeoutPause") ]](msg, duration);
    } else {
        waittill_any_timeout_1(duration, msg);
    }
}

