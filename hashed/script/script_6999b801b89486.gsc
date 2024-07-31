#using scripts\engine\utility.gsc;

#namespace namespace_ad3ea2ebde487f66;

// Namespace namespace_ad3ea2ebde487f66 / namespace_693f10db5db629e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8
// Size: 0x2
function main() {
    
}

// Namespace namespace_ad3ea2ebde487f66 / namespace_693f10db5db629e2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2
// Size: 0x2b
function function_c8f303cb5ce4d4f1(var_9987f1479ff203d8) {
    var_9987f1479ff203d8 playsoundonmovingent("sfx_mp_vertigo_moving_block_forward_start");
    var_9987f1479ff203d8 waittill("movedone");
    var_9987f1479ff203d8 playsoundonmovingent("sfx_mp_vertigo_moving_block_forward_stop");
}

// Namespace namespace_ad3ea2ebde487f66 / namespace_693f10db5db629e2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5
// Size: 0x2b
function function_15f3cb16ea85459b(var_5b2bb6d240415c98) {
    var_5b2bb6d240415c98 playsoundonmovingent("sfx_mp_vertigo_moving_block_back_start");
    var_5b2bb6d240415c98 waittill("movedone");
    var_5b2bb6d240415c98 playsoundonmovingent("sfx_mp_vertigo_moving_block_back_stop");
}

// Namespace namespace_ad3ea2ebde487f66 / namespace_693f10db5db629e2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x218
// Size: 0x1f
function function_a98ceea0b676d81a(var_9987f1479ff203d8) {
    var_9987f1479ff203d8 waittill("movedone");
    var_9987f1479ff203d8 playsoundonmovingent("sfx_mp_vertigo_moving_block_push_stop");
}

// Namespace namespace_ad3ea2ebde487f66 / namespace_693f10db5db629e2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23f
// Size: 0x18
function function_f182f4bfb0416785(rotater) {
    rotater play_loop_sound_on_entity("sfx_mp_vertigo_rotate");
}

// Namespace namespace_ad3ea2ebde487f66 / namespace_693f10db5db629e2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25f
// Size: 0x17
function rotatestopsound(rotater) {
    rotater playsoundonmovingent("sfx_mp_vertigo_rotate_stop");
}

