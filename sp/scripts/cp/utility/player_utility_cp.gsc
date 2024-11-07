#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_818c8cf2db9eac77;

// Namespace namespace_818c8cf2db9eac77 / scripts\cp\utility\player_utility_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x17
function _isalive() {
    if (istrue(self.inlaststand)) {
        return 0;
    }
    return isalive(self);
}

