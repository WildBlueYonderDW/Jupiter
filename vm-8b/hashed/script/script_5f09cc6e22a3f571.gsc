#using scripts\engine\utility.gsc;

#namespace namespace_7711270eeb24f454;

// Namespace namespace_7711270eeb24f454 / namespace_7c5d7b789e91a667
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90
// Size: 0x26
function function_bbdfa26a1db6eb7b() {
    return isdefined(self) && isdefined(level.escortvehicles) && array_contains(level.escortvehicles, self);
}

