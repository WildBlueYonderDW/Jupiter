#using scripts\common\utility;
#using scripts\engine\utility;

#namespace concussion_utility;

// Namespace concussion_utility / scripts\common\concussion_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x1c
function calculateinterruptdelay( duration )
{
    return max( 0, duration - 2.6 ) * 1000;
}

