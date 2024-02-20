// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_14ba8cd418adf1a6;

// Namespace namespace_14ba8cd418adf1a6/namespace_ed24ea3973f52fdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78
// Size: 0x1d
function calculateinterruptdelay(duration) {
    return max(0, duration - 2.6) * 1000;
}

