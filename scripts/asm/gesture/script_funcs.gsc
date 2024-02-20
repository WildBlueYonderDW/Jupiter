// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\anim\utility_common.gsc;
#using script_7e4d332e911e1b90;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;

#namespace namespace_16e2a34e24c32e5e;

// Namespace namespace_16e2a34e24c32e5e/namespace_322351f7e5201bc7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x98
// Size: 0x38
function ai_gesture_requested(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self._blackboard.gesture_active);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_322351f7e5201bc7
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd8
// Size: 0x38
function ai_point_gesture_requested(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self._blackboard.point_gesture_active);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_322351f7e5201bc7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x118
// Size: 0xe
function ai_lookat_hold() {
    self.hold_lookat = 1;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_322351f7e5201bc7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0xd
function ai_lookat_release() {
    self.hold_lookat = undefined;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_322351f7e5201bc7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x141
// Size: 0x18
function ai_can_lookat() {
    if (isdefined(self.hold_lookat)) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_322351f7e5201bc7
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0x39
function float_remap(value, var_cffd6e654a5673e8, var_e9731d032a86c293, var_cffd71654a567a81, var_e9731e032a86c4c6) {
    return (value - var_cffd6e654a5673e8) / (var_e9731d032a86c293 - var_cffd6e654a5673e8) * (var_e9731e032a86c4c6 - var_cffd71654a567a81) + var_cffd71654a567a81;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_322351f7e5201bc7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1
// Size: 0x23
function lerp_float(from, to, delta) {
    return from + delta * (to - from);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_322351f7e5201bc7
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc
// Size: 0x3f
function smoothstep(start, end, delta) {
    delta = clamp((delta - start) / (end - start), 0, 1);
    return delta * delta * (3 - 2 * delta);
}

