#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace hostmigration;

// Namespace hostmigration / scripts\cp_mp\hostmigration
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd
// Size: 0x37
function hostmigration_waitlongdurationwithpause(duration) {
    if (issharedfuncdefined("hostmigration", "waitLongDurationWithPause")) {
        [[ getsharedfunc("hostmigration", "waitLongDurationWithPause") ]](duration);
        return;
    }
    wait duration;
}

// Namespace hostmigration / scripts\cp_mp\hostmigration
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc
// Size: 0x47
function hostmigration_waittillnotifyortimeoutpause(msg, duration) {
    if (issharedfuncdefined("hostmigration", "waittillNotifyOrTimeoutPause")) {
        [[ getsharedfunc("hostmigration", "waittillNotifyOrTimeoutPause") ]](msg, duration);
        return;
    }
    waittill_any_timeout_1(duration, msg);
}

