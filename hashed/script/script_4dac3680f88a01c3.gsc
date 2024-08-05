#using scripts\asm\asm.gsc;
#using scripts\asm\gesture\script_funcs.gsc;
#using scripts\anim\utility_common.gsc;
#using script_7e4d332e911e1b90;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\notetrack.gsc;

#namespace namespace_6bc879d2947c65d2;

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x659
// Size: 0x4d0
function ai_gesture_stop(var_480e0d93b559931c) {
    self notify("new_gesture_stop_begin");
    self notify("gesture_stop");
    self endon("death");
    self endon("start_gesture_lookat");
    self endon("new_gesture_stop_begin");
    self endon("entitydeleted");
    if (isdefined(self.anim_getrootfunc) && isdefined(self.old_root)) {
        reset_root();
    }
    if (isdefined(self.anim_getrootfunc) && !isdefined(self.old_root)) {
        self.anim_getrootfunc = undefined;
    }
    if (isdefined(var_480e0d93b559931c)) {
        blend_time = var_480e0d93b559931c;
    } else {
        blend_time = 0.25;
    }
    if (!isdefined(self.is_head_tracking)) {
        return;
    }
    start_time = gettime() / 1000;
    var_cc7d64b564852548 = self getanimweight(self.head_center_anim);
    var_920f5e7265d0d6d3 = self getanimweight(self.head_right_anim);
    var_ea4fd9d5698bb0de = self getanimweight(self.head_left_anim);
    var_8a36695ea482743 = self getanimweight(self.head_rightback_anim);
    var_d94ccc571e35ad74 = self getanimweight(self.head_leftback_anim);
    var_f67c766809ec9eb1 = self getanimweight(generic_human%lookat_left_right);
    var_ff2b0adc7f8ab11 = self getanimweight(generic_human%lookat_up_down);
    var_7261fa6f5015c297 = self getanimweight(generic_human%lookat_head_base_partial);
    var_bff9b1c691b8b590 = self getanimweight(generic_human%head_gesture_look_partial);
    var_f7a05d8d154d1fca = self getanimweight(generic_human%lookat_head_adds);
    while (gettime() / 1000 - start_time < var_480e0d93b559931c) {
        var_79dec2965739392b = (gettime() / 1000 - start_time) / var_480e0d93b559931c;
        var_79dec2965739392b = smoothstep(0, 1, var_79dec2965739392b);
        var_8eda33d84e23a48e = lerp_float(var_cc7d64b564852548, 1, var_79dec2965739392b);
        var_75a6f0398c7ce571 = lerp_float(var_920f5e7265d0d6d3, 0, var_79dec2965739392b);
        var_a36adbca83488924 = lerp_float(var_ea4fd9d5698bb0de, 0, var_79dec2965739392b);
        var_3b07618ff6abc8c9 = lerp_float(var_8a36695ea482743, 0, var_79dec2965739392b);
        var_ac8aa45eb885e4f2 = lerp_float(var_d94ccc571e35ad74, 0, var_79dec2965739392b);
        var_f68167872853c4c7 = lerp_float(var_f67c766809ec9eb1, 0, var_79dec2965739392b);
        var_6f9061194bec6ea3 = lerp_float(var_ff2b0adc7f8ab11, 0, var_79dec2965739392b);
        var_accf346b44a25cfd = lerp_float(var_7261fa6f5015c297, 0, var_79dec2965739392b);
        var_cdaf7985c83b0386 = lerp_float(var_bff9b1c691b8b590, 0, var_79dec2965739392b);
        var_5948b4c152818c80 = lerp_float(var_f7a05d8d154d1fca, 0, var_79dec2965739392b);
        self setanimlimited(self.head_center_anim, var_8eda33d84e23a48e, 0.05);
        self setanimlimited(self.head_right_anim, var_75a6f0398c7ce571, 0.05);
        self setanimlimited(self.head_left_anim, var_a36adbca83488924, 0.05);
        self setanimlimited(self.head_rightback_anim, var_3b07618ff6abc8c9, 0.05);
        self setanimlimited(self.head_leftback_anim, var_ac8aa45eb885e4f2, 0.05);
        self setanimlimited(generic_human%lookat_left_right, var_f68167872853c4c7, 0.05);
        self setanimlimited(generic_human%lookat_up_down, var_6f9061194bec6ea3, 0.05);
        self setanimlimited(generic_human%lookat_head_base_partial, var_accf346b44a25cfd, 0.05);
        self setanimlimited(generic_human%head_gesture_look_partial, var_cdaf7985c83b0386, 0.05);
        self setanimlimited(generic_human%lookat_head_adds, var_5948b4c152818c80, 0.05);
        wait 0.05;
    }
    self setanimlimited(self.head_center_anim, 0, 0.05);
    self setanimlimited(self.head_right_anim, 0, 0.05);
    self setanimlimited(self.head_left_anim, 0, 0.05);
    self setanimlimited(self.head_rightback_anim, 0, 0.05);
    self setanimlimited(self.head_leftback_anim, 0, 0.05);
    self setanimlimited(generic_human%lookat_left_right, 0, 0.05);
    self setanimlimited(generic_human%lookat_up_down, 0, 0.05);
    self setanimlimited(generic_human%lookat_head_base_partial, 0, 0.05);
    self setanimlimited(generic_human%head_gesture_look_partial, 0, 0.05);
    self setanimlimited(generic_human%lookat_head_adds, 0, 0.05);
    self clearanim(generic_human%lookat_left_right, 0.05);
    self clearanim(generic_human%lookat_up_down, 0.05);
    self.is_head_tracking = undefined;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb31
// Size: 0xbd
function ai_gesture_eyes_stop(var_480e0d93b559931c) {
    self endon("death");
    self endon("entitydeleted");
    self notify("eye_gesture_stop");
    if (isdefined(var_480e0d93b559931c)) {
        blend_time = var_480e0d93b559931c;
    } else {
        blend_time = 0.25;
    }
    self clearanim(generic_human%eyes_look_leftright, blend_time);
    self clearanim(generic_human%eyes_look_updown, blend_time);
    self clearanim(generic_human%eyes_lookat_base_partial, blend_time);
    self clearanim(generic_human%facial_gesture_look_partial, blend_time);
    self clearanim(generic_human%eyes_blink_base_partial, blend_time);
    self clearanim(generic_human%facial_gesture_blink_partial, blend_time);
    self clearanim(generic_human%eyes_blink, blend_time);
    self.is_eye_tracking = undefined;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf6
// Size: 0x285
function ai_gesture_lookat_weight_down(blend_time) {
    self endon("death");
    self endon("gesture_stop");
    self endon("head_weight_up");
    self notify("head_weight_down");
    self endon("entitydeleted");
    if (isdefined(self.blend_down_in_progress)) {
        return;
    }
    var_480e0d93b559931c = blend_time;
    self.blend_down_in_progress = 1;
    self.blend_up_in_progress = undefined;
    start_time = gettime() / 1000;
    var_f67c766809ec9eb1 = self getanimweight(generic_human%lookat_left_right);
    var_ff2b0adc7f8ab11 = self getanimweight(generic_human%lookat_up_down);
    var_7261fa6f5015c297 = self getanimweight(generic_human%lookat_head_base_partial);
    var_bff9b1c691b8b590 = self getanimweight(generic_human%head_gesture_look_partial);
    var_f7a05d8d154d1fca = self getanimweight(generic_human%lookat_head_adds);
    while (gettime() / 1000 - start_time < var_480e0d93b559931c) {
        var_79dec2965739392b = (gettime() / 1000 - start_time) / var_480e0d93b559931c;
        var_79dec2965739392b = smoothstep(0, 1, var_79dec2965739392b);
        var_f68167872853c4c7 = lerp_float(var_f67c766809ec9eb1, 0, var_79dec2965739392b);
        var_6f9061194bec6ea3 = lerp_float(var_ff2b0adc7f8ab11, 0, var_79dec2965739392b);
        var_accf346b44a25cfd = lerp_float(var_7261fa6f5015c297, 0, var_79dec2965739392b);
        var_cdaf7985c83b0386 = lerp_float(var_bff9b1c691b8b590, 0, var_79dec2965739392b);
        var_5948b4c152818c80 = lerp_float(var_f7a05d8d154d1fca, 0, var_79dec2965739392b);
        self setanimlimited(generic_human%lookat_left_right, var_f68167872853c4c7, 0.05);
        self setanimlimited(generic_human%lookat_up_down, var_6f9061194bec6ea3, 0.05);
        self setanimlimited(generic_human%lookat_head_base_partial, var_accf346b44a25cfd, 0.05);
        self setanimlimited(generic_human%head_gesture_look_partial, var_cdaf7985c83b0386, 0.05);
        self setanimlimited(generic_human%lookat_head_adds, var_5948b4c152818c80, 0.05);
        wait 0.05;
    }
    self setanimlimited(generic_human%lookat_left_right, 0, 0.05);
    self setanimlimited(generic_human%lookat_up_down, 0, 0.05);
    self setanimlimited(generic_human%lookat_head_base_partial, 0, 0.05);
    self setanimlimited(generic_human%head_gesture_look_partial, 0, 0.05);
    self setanimlimited(generic_human%lookat_head_adds, 0, 0.05);
    self.blend_down_in_progress = undefined;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe83
// Size: 0x28e
function ai_gesture_lookat_weight_up(blend_time) {
    self endon("death");
    self endon("gesture_stop");
    self endon("head_weight_down");
    self notify("head_weight_up");
    self endon("entitydeleted");
    if (isdefined(self.blend_up_in_progress)) {
        return;
    }
    var_480e0d93b559931c = blend_time;
    self.blend_up_in_progress = 1;
    self.blend_down_in_progress = undefined;
    start_time = gettime() / 1000;
    var_f67c766809ec9eb1 = self getanimweight(generic_human%lookat_left_right);
    var_ff2b0adc7f8ab11 = self getanimweight(generic_human%lookat_up_down);
    var_7261fa6f5015c297 = self getanimweight(generic_human%lookat_head_base_partial);
    var_bff9b1c691b8b590 = self getanimweight(generic_human%head_gesture_look_partial);
    var_f7a05d8d154d1fca = self getanimweight(generic_human%lookat_head_adds);
    while (gettime() / 1000 - start_time < var_480e0d93b559931c) {
        var_79dec2965739392b = (gettime() / 1000 - start_time) / var_480e0d93b559931c;
        var_79dec2965739392b = smoothstep(0, 1, var_79dec2965739392b);
        var_f68167872853c4c7 = lerp_float(var_f67c766809ec9eb1, 1, var_79dec2965739392b);
        var_6f9061194bec6ea3 = lerp_float(var_ff2b0adc7f8ab11, 1, var_79dec2965739392b);
        var_accf346b44a25cfd = lerp_float(var_7261fa6f5015c297, 10, var_79dec2965739392b);
        var_cdaf7985c83b0386 = lerp_float(var_bff9b1c691b8b590, 10, var_79dec2965739392b);
        var_5948b4c152818c80 = lerp_float(var_f7a05d8d154d1fca, 0, var_79dec2965739392b);
        self setanimlimited(generic_human%lookat_left_right, var_f68167872853c4c7, 0.05);
        self setanimlimited(generic_human%lookat_up_down, var_6f9061194bec6ea3, 0.05);
        self setanimlimited(generic_human%lookat_head_base_partial, var_accf346b44a25cfd, 0.05);
        self setanimlimited(generic_human%head_gesture_look_partial, var_cdaf7985c83b0386, 0.05);
        self setanimlimited(generic_human%lookat_head_adds, var_5948b4c152818c80, 0.05);
        wait 0.05;
    }
    self setanimlimited(generic_human%lookat_left_right, 1, 0.05);
    self setanimlimited(generic_human%lookat_up_down, 1, 0.05);
    self setanimlimited(generic_human%lookat_head_base_partial, 10, 0.05);
    self setanimlimited(generic_human%head_gesture_look_partial, 10, 0.05);
    self setanimlimited(generic_human%lookat_head_adds, 1, 0.05);
    self.blend_up_in_progress = undefined;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1119
// Size: 0x28d
function ai_gesture_torso_stop(var_480e0d93b559931c) {
    self endon("death");
    self endon("start_gesture_torso_lookat");
    self endon("entitydeleted");
    self notify("gesture_stop_torso");
    if (!isdefined(self.is_torso_tracking)) {
        return;
    }
    if (isdefined(var_480e0d93b559931c)) {
        blend_time = var_480e0d93b559931c;
    } else {
        blend_time = 0.25;
    }
    start_time = gettime() / 1000;
    var_cc7d64b564852548 = self getanimweight(self.torso_center_anim);
    var_920f5e7265d0d6d3 = self getanimweight(self.torso_right_anim);
    var_ea4fd9d5698bb0de = self getanimweight(self.torso_left_anim);
    var_8a36695ea482743 = self getanimweight(self.torso_rightback_anim);
    var_d94ccc571e35ad74 = self getanimweight(self.torso_leftback_anim);
    while (gettime() / 1000 - start_time < var_480e0d93b559931c) {
        var_79dec2965739392b = (gettime() / 1000 - start_time) / var_480e0d93b559931c;
        var_79dec2965739392b = smoothstep(0, 1, var_79dec2965739392b);
        var_8eda33d84e23a48e = lerp_float(var_cc7d64b564852548, 1, var_79dec2965739392b);
        var_75a6f0398c7ce571 = lerp_float(var_920f5e7265d0d6d3, 0, var_79dec2965739392b);
        var_a36adbca83488924 = lerp_float(var_ea4fd9d5698bb0de, 0, var_79dec2965739392b);
        var_3b07618ff6abc8c9 = lerp_float(var_8a36695ea482743, 0, var_79dec2965739392b);
        var_ac8aa45eb885e4f2 = lerp_float(var_d94ccc571e35ad74, 0, var_79dec2965739392b);
        self setanimlimited(self.torso_center_anim, var_8eda33d84e23a48e, 0.05);
        self setanimlimited(self.torso_right_anim, var_75a6f0398c7ce571, 0.05);
        self setanimlimited(self.torso_left_anim, var_a36adbca83488924, 0.05);
        self setanimlimited(self.torso_rightback_anim, var_3b07618ff6abc8c9, 0.05);
        self setanimlimited(self.torso_leftback_anim, var_ac8aa45eb885e4f2, 0.05);
        wait 0.05;
    }
    self setanimlimited(self.torso_center_anim, 1, 0.05);
    self setanimlimited(self.torso_right_anim, 0, 0.05);
    self setanimlimited(self.torso_left_anim, 0, 0.05);
    self setanimlimited(self.torso_rightback_anim, 0, 0.05);
    self setanimlimited(self.torso_leftback_anim, 0, 0.05);
    self clearanim(generic_human%torso_tracking_anims, var_480e0d93b559931c);
    self.is_torso_tracking = undefined;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13ae
// Size: 0x1c5
function ai_gesture_lookat(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time) {
    self endon("entitydeleted");
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.is_head_tracking)) {
        ai_gesture_stop(0.25);
        wait 0.25;
    }
    self endon("death");
    self endon("gesture_stop");
    self notify("start_gesture_lookat");
    if (isai(self)) {
        state = asm_getcurrentstate(self.asmname);
    } else {
        state = undefined;
    }
    if (isdefined(self.anim_getrootfunc)) {
        store_old_root();
    }
    if (!isdefined(self.anim_getrootfunc)) {
        self.anim_getrootfunc = &set_root;
    }
    if (isdefined(blend_in_time)) {
        self.blend_in_time = blend_in_time;
    } else {
        self.blend_in_time = 0.7;
    }
    self.look_leftright_anim = undefined;
    self.look_updown_anim = undefined;
    self.lookat_aquired = 0;
    if (isdefined(var_ebc28d027b66fd81)) {
        self.gesture_catchup_speed = clamp(var_ebc28d027b66fd81, 0.25, 4);
    } else {
        self.gesture_catchup_speed = 0.5;
    }
    self.look_leftright_anim = generic_human%prototype_gesture_look_rightleft;
    self.look_updown_anim = generic_human%prototype_gesture_look_updwn;
    self.head_center_anim = generic_human%gesture_head_fwd;
    self.head_right_anim = generic_human%gesture_head_right;
    self.head_left_anim = generic_human%gesture_head_left;
    self.head_rightback_anim = generic_human%gesture_head_rightback;
    self.head_leftback_anim = generic_human%gesture_head_leftback;
    self.gesture_lookat = var_968583169a58b079;
    thread ai_gesture_head_leftright();
    thread ai_gesture_head_updown();
    self.is_head_tracking = 1;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x157b
// Size: 0x12d
function ai_gesture_eyes_lookat(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time) {
    self endon("death");
    self endon("entitydeleted");
    if (isdefined(self.is_eye_tracking)) {
        ai_gesture_eyes_stop(0.25);
        wait 0.25;
    }
    if (isdefined(self.anim_getrootfunc)) {
        store_old_root();
    }
    if (!isdefined(self.anim_getrootfunc)) {
        self.anim_getrootfunc = &set_root;
    }
    if (isdefined(blend_in_time)) {
        self.eye_blend_in_time = blend_in_time;
    } else {
        self.eye_blend_in_time = 0.3;
    }
    self.eyes_leftright_anim = undefined;
    self.eyes_updown_anim = undefined;
    self.lookat_aquired = 0;
    if (isdefined(var_ebc28d027b66fd81)) {
        self.eye_catchup_speed = clamp(var_ebc28d027b66fd81, 0.25, 4);
    } else {
        self.eye_catchup_speed = 2;
    }
    self.eyes_leftright_anim = generic_human%facial_gesture_look_rightleft;
    self.eyes_updown_anim = generic_human%facial_gesture_look_updwn;
    self.eyes_lookat = var_968583169a58b079;
    thread ai_gesture_eyes_leftright();
    thread ai_gesture_eyes_updown();
    self.is_eye_tracking = 1;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16b0
// Size: 0x122
function ai_gesture_lookat_torso(var_968583169a58b079, blend_in_time) {
    self endon("death");
    self endon("entitydeleted");
    self notify("start_gesture_torso_lookat");
    if (isai(self)) {
        state = asm_getcurrentstate(self.asmname);
    } else {
        state = undefined;
    }
    if (!isdefined(state)) {
        return;
    }
    if (isdefined(self.is_torso_tracking)) {
        ai_gesture_torso_stop(0.25);
        wait 0.25;
    }
    if (isdefined(blend_in_time)) {
        self.blend_in_time = blend_in_time;
    } else {
        self.blend_in_time = 0.7;
    }
    self.torso_leftright_anim = undefined;
    self.lookat_aquired = 0;
    self.torso_center_anim = generic_human%hm_grnd_grn_casual_stand_center_idle;
    self.torso_left_anim = generic_human%hm_grnd_grn_casual_stand_left_idle;
    self.torso_leftback_anim = generic_human%hm_grnd_grn_casual_stand_leftback_idle;
    self.torso_right_anim = generic_human%hm_grnd_grn_casual_stand_right_idle;
    self.torso_rightback_anim = generic_human%hm_grnd_grn_casual_stand_rightback_idle;
    self.gesture_lookat = var_968583169a58b079;
    thread ai_gesture_torso_leftright();
    self.is_torso_tracking = 1;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17da
// Size: 0xb
function set_root() {
    return generic_human%body;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17ee
// Size: 0x14
function store_old_root() {
    self.old_root = self.anim_getrootfunc;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x180a
// Size: 0x14
function reset_root() {
    self.anim_getrootfunc = self.old_root;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1826
// Size: 0x68
function ai_gesture_update_lookat(var_3e53e7e020018fc0, var_809d5bbb11b6031c) {
    self endon("death");
    self endon("entitydeleted");
    self.gesture_lookat = var_3e53e7e020018fc0;
    self.is_head_tracking = 1;
    if (isdefined(var_809d5bbb11b6031c)) {
        var_37015ada8160570c = self.gesture_catchup_speed;
        self.gesture_catchup_speed = var_809d5bbb11b6031c;
        wait var_809d5bbb11b6031c * 2;
        self.gesture_catchup_speed = var_37015ada8160570c;
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1896
// Size: 0x130
function ai_gesture_lookat_natural(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time, var_1134633b00730d29) {
    self endon("gesture_natural_stop");
    self endon("gesture_stop");
    self endon("death");
    self endon("entitydeleted");
    while (!ai_can_lookat()) {
        wait 0.05;
    }
    while (distance2d(self.origin, var_968583169a58b079.origin) > var_1134633b00730d29) {
        wait 0.05;
    }
    thread ai_gesture_lookat(var_968583169a58b079, var_ebc28d027b66fd81, blend_in_time);
    wait blend_in_time;
    while (true) {
        wait randomfloatrange(4, 5);
        if (distance2d(self.origin, var_968583169a58b079.origin) <= var_1134633b00730d29) {
            thread ai_gesture_lookat_weight_down(1);
            thread ai_gesture_eyes_stop();
        }
        wait randomfloatrange(4, 6);
        while (!ai_can_lookat()) {
            wait 0.05;
        }
        if (distance2d(self.origin, var_968583169a58b079.origin) <= var_1134633b00730d29) {
            thread ai_gesture_lookat_weight_up(0.5);
            thread ai_gesture_eyes_lookat(var_968583169a58b079, 1, 0.2);
        }
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19ce
// Size: 0x68
function ai_gesture_update_eyes_lookat(var_3e53e7e020018fc0, var_809d5bbb11b6031c) {
    self endon("death");
    self endon("entitydeleted");
    self.eyes_lookat = var_3e53e7e020018fc0;
    self.is_eye_tracking = 1;
    if (isdefined(var_809d5bbb11b6031c)) {
        var_37015ada8160570c = self.eye_catchup_speed;
        self.eye_catchup_speed = var_809d5bbb11b6031c;
        wait var_809d5bbb11b6031c * 2;
        self.eye_catchup_speed = var_37015ada8160570c;
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3e
// Size: 0x430
function ai_gesture_head_leftright() {
    self endon("gesture_stop");
    self endon("death");
    self endon("entitydeleted");
    var_480e0d93b559931c = self.blend_in_time;
    start_time = gettime() / 1000;
    var_837c12743ab916fe = undefined;
    var_4bd24adaf2ac4e79 = generic_human%lookat_left_right;
    fwd_anim = self.head_center_anim;
    right_anim = self.head_right_anim;
    left_anim = self.head_left_anim;
    var_be663f999979eacd = self.head_rightback_anim;
    var_3db053c7d0933ef6 = self.head_leftback_anim;
    thread _ai_head_weight_blend_in();
    var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
    self setanimlimited(fwd_anim, 1, self.blend_in_time);
    self setanimlimited(right_anim, 0.005, self.blend_in_time);
    self setanimlimited(left_anim, 0.005, self.blend_in_time);
    self setanimlimited(var_be663f999979eacd, 0.005, self.blend_in_time);
    self setanimlimited(var_3db053c7d0933ef6, 0.005, self.blend_in_time);
    var_9e41f6b2a5fdfa6c = 0;
    var_3a58e25d07fa8963 = 0;
    while (true) {
        if (!isdefined(self)) {
            return;
        }
        if (!isdefined(self.gesture_lookat)) {
            thread ai_gesture_stop(0.7);
            break;
        }
        if (isplayer(self.gesture_lookat)) {
            lookat = level.player geteye();
        } else if (isai(self.gesture_lookat)) {
            lookat = self.gesture_lookat geteye();
        } else if (isvector(self.gesture_lookat)) {
            lookat = self.gesture_lookat;
        } else {
            lookat = self.gesture_lookat.origin;
        }
        var_f8018ede9bc535ee = self gettagangles("J_Spine4") + (0, 0, 0);
        var_7ac7a365a6aee172 = self gettagorigin("J_Spine4");
        vec_to_player = vectornormalize(lookat - var_7ac7a365a6aee172);
        forward_vec = anglestoright(var_f8018ede9bc535ee);
        right_vec = anglestoup(var_f8018ede9bc535ee);
        var_8fc912a946a93a31 = anglestoup(var_f8018ede9bc535ee) * -1;
        var_e0e29f268e2b6297 = anglestoright(var_f8018ede9bc535ee) * -1;
        up_vec = anglestoforward(var_f8018ede9bc535ee);
        var_e32c0e4a71d1793e = clamp(vectordot(vec_to_player, forward_vec), 0.005, 1);
        dot_right = clamp(vectordot(vec_to_player, right_vec), 0.005, 1);
        var_ec8d74cda15d5374 = clamp(vectordot(vec_to_player, var_8fc912a946a93a31), 0.005, 1);
        var_b0b9a45f796b1296 = clamp(vectordot(vec_to_player, var_e0e29f268e2b6297), 0.005, 1);
        var_d7199cf973e1af07 = 1;
        if (anglebetweenvectorssigned(forward_vec, vec_to_player, up_vec) > 0) {
            var_d7199cf973e1af07 = 0;
        }
        self setanimlimited(right_anim, dot_right, self.gesture_catchup_speed);
        self setanimlimited(left_anim, var_ec8d74cda15d5374, self.gesture_catchup_speed);
        self setanimlimited(fwd_anim, var_e32c0e4a71d1793e + 0.005, self.gesture_catchup_speed);
        if (var_d7199cf973e1af07) {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, var_b0b9a45f796b1296, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, 0.005, 0.1);
        } else {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, 0.005, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, var_b0b9a45f796b1296, 0.1);
        }
        self setanimlimited(var_be663f999979eacd, var_9e41f6b2a5fdfa6c, self.gesture_catchup_speed);
        self setanimlimited(var_3db053c7d0933ef6, var_3a58e25d07fa8963, self.gesture_catchup_speed);
        waitframe();
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e76
// Size: 0x1a1
function _ai_head_weight_blend_in() {
    self endon("gesture_stop");
    self endon("death");
    self endon("entitydeleted");
    start_time = gettime() / 1000;
    self.blend_up_in_progress = 1;
    while (gettime() / 1000 - start_time < self.blend_in_time * 2) {
        var_79dec2965739392b = (gettime() / 1000 - start_time) / self.blend_in_time * 2;
        var_2d2b457aa37db993 = smoothstep(0, 1, var_79dec2965739392b);
        var_1253d54849fc8641 = smoothstep(0, 10, var_79dec2965739392b);
        weight = lerp_float(0, 1, var_2d2b457aa37db993);
        var_9145e17c603344a9 = lerp_float(0, 10, var_2d2b457aa37db993);
        self setanimlimited(generic_human%lookat_left_right, weight, 0.2);
        self setanimlimited(generic_human%lookat_up_down, weight, 0.2);
        self setanimlimited(generic_human%lookat_head_base_partial, var_9145e17c603344a9, 0.2);
        self setanimlimited(generic_human%head_gesture_look_partial, var_9145e17c603344a9, 0.2);
        wait 0.05;
    }
    self setanimlimited(generic_human%lookat_left_right, 1, 0.2);
    self setanimlimited(generic_human%lookat_up_down, 1, 0.2);
    self setanimlimited(generic_human%lookat_head_base_partial, 10, 0.2);
    self setanimlimited(generic_human%head_gesture_look_partial, 10, 0.2);
    wait 0.05;
    self.blend_up_in_progress = undefined;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x201f
// Size: 0x241
function ai_gesture_head_updown() {
    self endon("gesture_stop");
    self endon("death");
    self endon("entitydeleted");
    self setanimlimited(generic_human%lookat_up_down, 1, self.blend_in_time);
    self setanimlimited(self.look_updown_anim, 1, self.blend_in_time);
    self setanimtime(self.look_updown_anim, 0.5);
    var_8bc1a6a78e77c5d1 = 0.5;
    while (true) {
        if (!isdefined(self)) {
            break;
        }
        if (isplayer(self.gesture_lookat)) {
            offset = 0;
            if (level.player getdemeanorviewmodel() == "safe") {
                offset = 4.62;
            }
            lookat = level.player geteye() + anglestoup(self.angles) * offset;
        } else if (isai(self.gesture_lookat)) {
            lookat = self.gesture_lookat geteye();
        } else if (isvector(self.gesture_lookat)) {
            lookat = self.gesture_lookat;
        } else {
            lookat = self.gesture_lookat.origin;
        }
        var_f8018ede9bc535ee = self gettagangles("J_Spine4") + (0, 0, 0);
        var_7ac7a365a6aee172 = self gettagorigin("J_Spine4");
        var_e5d33df33698a4f5 = undefined;
        if (isai(self)) {
            var_e5d33df33698a4f5 = self geteye();
        } else {
            var_e5d33df33698a4f5 = self gettagorigin("J_Head");
        }
        vec_to_player = vectornormalize(lookat - var_e5d33df33698a4f5);
        var_295ec4aa62f17342 = anglestoforward(var_f8018ede9bc535ee);
        var_bdbf163e071652f8 = vectordot(var_295ec4aa62f17342, vec_to_player);
        var_e7e7df501885a8b7 = float_remap(var_bdbf163e071652f8, 1, -1, 0, 1);
        var_8bc1a6a78e77c5d1 += (var_e7e7df501885a8b7 - var_8bc1a6a78e77c5d1) * self.gesture_catchup_speed * 0.3;
        var_8bc1a6a78e77c5d1 = clamp(var_8bc1a6a78e77c5d1, 0.1, 0.65);
        set_time_via_rate(self.look_updown_anim, var_8bc1a6a78e77c5d1);
        waitframe();
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2268
// Size: 0x273
function ai_gesture_eyes_leftright() {
    self endon("gesture_stop");
    self endon("death");
    self endon("eye_gesture_stop");
    self endon("entitydeleted");
    self setanimlimited(generic_human%eyes_lookat_base_partial, 10, self.eye_blend_in_time * 2);
    self setanimlimited(generic_human%facial_gesture_look_partial, 10, self.eye_blend_in_time * 2);
    self setanimlimited(generic_human%eyes_look_leftright, 1, self.eye_blend_in_time);
    self setanimlimited(self.eyes_leftright_anim, 1, self.eye_blend_in_time);
    self setanimtime(self.eyes_leftright_anim, 0.5);
    self setanimrate(self.eyes_leftright_anim, 0);
    var_8bc1a6a78e77c5d1 = 0;
    while (true) {
        if (!isdefined(self)) {
            return;
        }
        if (!isdefined(self.eyes_lookat)) {
            ai_gesture_eyes_stop(0.25);
            break;
        }
        if (isplayer(self.eyes_lookat)) {
            lookat = level.player geteye();
        } else if (isai(self.eyes_lookat)) {
            lookat = self.eyes_lookat geteye();
        } else if (isvector(self.eyes_lookat)) {
            lookat = self.eyes_lookat;
        } else {
            lookat = self.eyes_lookat.origin;
        }
        var_22768c2b78f15eb0 = self gettagangles("j_head");
        var_e630138e877b75b0 = self gettagorigin("j_head");
        var_f8018ede9bc535ee = self gettagangles("J_Spine4") + (0, 90, 0);
        vec_to_player = vectornormalize(lookat - var_e630138e877b75b0);
        var_73ffcab9352f4558 = anglestoup(var_22768c2b78f15eb0);
        var_8a2a8dfdef9c641d = scripts\engine\utility::flatten_vector(vec_to_player);
        var_818e7dcbfe8c45c9 = scripts\engine\utility::flatten_vector(var_73ffcab9352f4558);
        var_f750bc72c7dca1a0 = vectordot(var_818e7dcbfe8c45c9, var_8a2a8dfdef9c641d);
        var_e7e7df501885a8b7 = float_remap(var_f750bc72c7dca1a0, 1, -1, 0, 1);
        var_a5148760d51eb926 = clamp(var_e7e7df501885a8b7, 0, 1);
        self setanimtime(self.eyes_leftright_anim, var_a5148760d51eb926);
        waitframe();
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24e3
// Size: 0x202
function ai_gesture_eyes_updown() {
    self endon("gesture_stop");
    self endon("death");
    self endon("eye_gesture_stop");
    self endon("entitydeleted");
    self setanimlimited(generic_human%eyes_look_updown, 1, self.eye_blend_in_time);
    self setanimlimited(self.eyes_updown_anim, 1, self.eye_blend_in_time);
    self setanimtime(self.eyes_updown_anim, 0.5);
    var_8bc1a6a78e77c5d1 = 0.5;
    while (true) {
        if (!isdefined(self)) {
            break;
        }
        if (isplayer(self.eyes_lookat)) {
            lookat = level.player geteye();
        } else if (isai(self.eyes_lookat)) {
            lookat = self.eyes_lookat geteye();
        } else if (isvector(self.eyes_lookat)) {
            lookat = self.eyes_lookat;
        } else {
            lookat = self.eyes_lookat.origin;
        }
        var_22768c2b78f15eb0 = self gettagangles("j_head");
        var_e630138e877b75b0 = self gettagorigin("j_head");
        var_f8018ede9bc535ee = self gettagangles("J_Spine4");
        var_96685d578c819929 = anglestoforward(var_22768c2b78f15eb0);
        vec_to_player = vectornormalize(lookat - var_e630138e877b75b0);
        dot_vec = vectordot(var_96685d578c819929, vec_to_player);
        var_e7e7df501885a8b7 = float_remap(dot_vec, 1, -1, 0.3, 0.7);
        var_a5148760d51eb926 = clamp(var_e7e7df501885a8b7, 0, 1);
        var_8bc1a6a78e77c5d1 += (var_a5148760d51eb926 - var_8bc1a6a78e77c5d1) * self.eye_catchup_speed * 0.3;
        var_8bc1a6a78e77c5d1 = clamp(var_8bc1a6a78e77c5d1, 0.1, 0.9);
        set_time_via_rate(self.eyes_updown_anim, var_8bc1a6a78e77c5d1);
        waitframe();
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26ed
// Size: 0x39d
function ai_gesture_torso_leftright() {
    self endon("gesture_stop_torso");
    self endon("death");
    self endon("entitydeleted");
    var_837c12743ab916fe = undefined;
    var_4bd24adaf2ac4e79 = generic_human%torso_tracking_anims;
    fwd_anim = self.torso_center_anim;
    right_anim = self.torso_right_anim;
    left_anim = self.torso_left_anim;
    var_be663f999979eacd = self.torso_rightback_anim;
    var_3db053c7d0933ef6 = self.torso_leftback_anim;
    childthread _ai_torso_weight_blend_in();
    var_837c12743ab916fe = vectortoangles(level.player.origin - self.origin);
    self setanimlimited(fwd_anim, 1, 0.05);
    self setanimlimited(right_anim, 0, 0.05);
    self setanimlimited(left_anim, 0, 0.05);
    self setanimlimited(var_be663f999979eacd, 0, 0.05);
    self setanimlimited(var_3db053c7d0933ef6, 0, 0.05);
    var_9e41f6b2a5fdfa6c = 0;
    var_3a58e25d07fa8963 = 0;
    while (true) {
        if (!isdefined(self)) {
            break;
        }
        if (isplayer(self.gesture_lookat)) {
            lookat = level.player geteye();
        } else if (isai(self.gesture_lookat)) {
            lookat = self.gesture_lookat geteye();
        } else if (isvector(self.gesture_lookat)) {
            lookat = self.gesture_lookat;
        } else {
            lookat = self.gesture_lookat.origin;
        }
        vec_to_player = vectornormalize(lookat - self.origin);
        forward_vec = anglestoforward(self.angles);
        right_vec = anglestoright(self.angles);
        var_8fc912a946a93a31 = anglestoright(self.angles) * -1;
        var_e0e29f268e2b6297 = anglestoforward(self.angles) * -1;
        up_vec = anglestoup(self.angles);
        var_e32c0e4a71d1793e = clamp(vectordot(vec_to_player, forward_vec), 0, 1);
        dot_right = clamp(vectordot(vec_to_player, right_vec), 0, 1);
        var_ec8d74cda15d5374 = clamp(vectordot(vec_to_player, var_8fc912a946a93a31), 0, 1);
        var_b0b9a45f796b1296 = clamp(vectordot(vec_to_player, var_e0e29f268e2b6297), 0, 1);
        var_d7199cf973e1af07 = 1;
        if (anglebetweenvectorssigned(forward_vec, vec_to_player, up_vec) > 0) {
            var_d7199cf973e1af07 = 0;
        }
        self setanimlimited(right_anim, dot_right, 0.2);
        self setanimlimited(left_anim, var_ec8d74cda15d5374, 0.2);
        self setanimlimited(fwd_anim, var_e32c0e4a71d1793e + 0.005, 0.2);
        if (var_d7199cf973e1af07) {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, var_b0b9a45f796b1296, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, 0, 0.1);
        } else {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, 0, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, var_b0b9a45f796b1296, 0.1);
        }
        self setanimlimited(var_be663f999979eacd, var_9e41f6b2a5fdfa6c, 0.2);
        self setanimlimited(var_3db053c7d0933ef6, var_3a58e25d07fa8963, 0.2);
        waitframe();
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a92
// Size: 0xa9
function _ai_torso_weight_blend_in() {
    start_time = gettime() / 1000;
    while (gettime() / 1000 - start_time < self.blend_in_time) {
        var_79dec2965739392b = (gettime() / 1000 - start_time) / self.blend_in_time;
        var_79dec2965739392b = smoothstep(0, 1, var_79dec2965739392b);
        weight = lerp_float(0, 1, var_79dec2965739392b);
        self setanimlimited(generic_human%torso_tracking_anims, weight, 0.05);
        wait 0.05;
        waittillframeend();
    }
    self setanimlimited(generic_human%torso_tracking_anims, 1, 0.05);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b43
// Size: 0x70
function ai_gesture_blink_loop(var_25362a792b0e1353) {
    self endon("gesture_stop");
    self endon("death");
    self endon("entitydeleted");
    ai_gesture_single_blink();
    while (true) {
        wait randomfloatrange(var_25362a792b0e1353 * 0.5, var_25362a792b0e1353);
        self clearanim(generic_human%facial_gesture_blink_1, 0);
        wait 0.05;
        self setanimlimited(generic_human%facial_gesture_blink_1, 1, 0);
        waitframe();
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bbb
// Size: 0x66
function ai_gesture_single_blink() {
    self endon("gesture_stop");
    self endon("death");
    self endon("entitydeleted");
    if (!isdefined(self)) {
        return;
    }
    self setanimlimited(generic_human%eyes_blink, 1, 0);
    self clearanim(generic_human%facial_gesture_blink_1, 0);
    wait 0.05;
    self setanimlimited(generic_human%facial_gesture_blink_1, 1, 0);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c29
// Size: 0x6bd
function ai_gesture_point(var_4a32ecbaa6c22f70) {
    self endon("gesture_stop");
    self endon("death");
    self endon("entitydeleted");
    self.point_center_anim = undefined;
    self.point_left_anim = undefined;
    self.point_right_anim = undefined;
    self.point_up_anim = undefined;
    self.point_down_anim = undefined;
    self.no_point_defined = 0;
    self._blackboard.point_gesture_active = 1;
    demeanor = asm_getdemeanor();
    state = asm_getcurrentstate(self.asmname);
    scripts\asm\asm::asm_setupgesture(self.asmname, state);
    if (demeanor != "casual" && demeanor != "casual_gun") {
        self.gesture_point_parent = generic_human%gesture_partials;
    } else {
        self.gesture_point_parent = generic_human%point_at_without_head;
    }
    if (!asm_currentstatehasflag(self.asmname, "gesture")) {
        println("<dev string:x1c>" + state + "<dev string:x29>");
        return;
    } else if (demeanor == "casual" || demeanor == "combat" || demeanor == "casual_gun" || demeanor == "frantic") {
        self.point_center_anim = self.asm.gestures.gesture_point_center;
        self.point_left_anim = self.asm.gestures.gesture_point_left;
        self.point_right_anim = self.asm.gestures.gesture_point_right;
        self.point_up_anim = self.asm.gestures.gesture_point_up;
        self.point_down_anim = self.asm.gestures.gesture_point_down;
        self.gesture_body_knob = asm_getbodyknob();
    } else {
        println(demeanor + "<dev string:x44>");
        return;
    }
    if (isplayer(var_4a32ecbaa6c22f70)) {
        lookat = level.player geteye();
    } else if (!isdefined(var_4a32ecbaa6c22f70)) {
        lookat = self.origin;
        self.no_point_defined = 1;
    } else if (isai(var_4a32ecbaa6c22f70)) {
        lookat = var_4a32ecbaa6c22f70 geteye();
    } else if (isvector(var_4a32ecbaa6c22f70)) {
        lookat = var_4a32ecbaa6c22f70;
    } else {
        lookat = var_4a32ecbaa6c22f70.origin;
    }
    var_148c7412fde9224d = self gettagangles("J_Spine4") + (0, 90, 0);
    var_b65a151051532493 = self gettagorigin("J_Spine4");
    var_84debf527911a15d = anglestoright(var_148c7412fde9224d);
    var_4bd579fa63eb0ed2 = anglestoup(var_148c7412fde9224d);
    var_53b34aadf7b8e731 = vectornormalize(lookat - var_b65a151051532493);
    var_b4291343f067bb1d = scripts\engine\utility::flatten_vector(var_84debf527911a15d);
    var_ebf67e00f0184992 = scripts\engine\utility::flatten_vector(var_4bd579fa63eb0ed2);
    var_af48fc7d3df203f1 = scripts\engine\utility::flatten_vector(var_53b34aadf7b8e731);
    dot_vec = vectordot(var_b4291343f067bb1d, var_af48fc7d3df203f1) * -1;
    var_8e8c89b2cbb6bc04 = dot_vec * -1;
    var_2208a80dc5f47661 = clamp(float_remap(dot_vec, 0.2, 1, 0, 1), 0, 1);
    var_824c03276d8cdcec = clamp(float_remap(var_8e8c89b2cbb6bc04, 0.2, 1, 0, 1), 0, 1);
    var_9088cba4a109b331 = self gettagorigin("J_Spine4");
    var_20f493dca3c1483f = vectornormalize(lookat - var_9088cba4a109b331);
    var_ca399d17885e392 = anglestoforward(var_148c7412fde9224d);
    var_2cb0644208843c51 = vectordot(var_20f493dca3c1483f, var_ca399d17885e392);
    var_2e436ef195c55994 = var_2cb0644208843c51 * -1;
    var_f25cc6d803539f37 = vectordot(var_4bd579fa63eb0ed2, var_20f493dca3c1483f);
    var_7ba291bb89a5d6dd = clamp(float_remap(var_f25cc6d803539f37, 0.2, 1, 0, 1), 0, 1);
    var_bed61d13bd0fe46f = clamp(float_remap(var_2cb0644208843c51, 0.2, 1, 0, 1), 0, 1);
    var_bd630759847e7b0c = clamp(float_remap(var_2e436ef195c55994, 0.2, 1, 0, 1), 0, 1);
    if (!self.no_point_defined) {
        if (var_f25cc6d803539f37 < -0.9) {
            ai_gesture_simple("fallback_up");
        } else {
            if (demeanor != "casual" && demeanor != "casual_gun") {
                self setanimlimited(self.gesture_point_parent, 10, 0.25);
            } else {
                self setanimlimited(self.gesture_point_parent, 1, 0.25);
            }
            if (var_7ba291bb89a5d6dd < 0.3) {
                self setanimlimited(self.point_center_anim, 0, 0, 0.85);
            } else {
                self setanimlimited(self.point_center_anim, var_7ba291bb89a5d6dd, 0.25, 0.85);
            }
            if (isdefined(self.point_up_anim)) {
                self setanimlimited(self.point_up_anim, var_bed61d13bd0fe46f, 0.25, 0.85);
            }
            if (isdefined(self.point_down_anim)) {
                self setanimlimited(self.point_down_anim, var_bd630759847e7b0c, 0.2, 0.85);
            }
            self setanimlimited(self.point_left_anim, var_824c03276d8cdcec, 0.25, 0.85);
            self setanimlimited(self.point_right_anim, var_2208a80dc5f47661, 0.25, 0.85);
        }
    } else {
        if (demeanor != "casual" && demeanor != "casual_gun") {
            self setanimlimited(self.gesture_point_parent, 10, 0.2);
        } else {
            self setanimlimited(self.gesture_point_parent, 1, 0.2);
        }
        self setanimlimited(self.point_center_anim, 1, 0.2, 0.85);
    }
    wait_time = getanimlength(generic_human%prototype_gesture_point_center) * 0.85;
    wait wait_time;
    self clearanim(self.gesture_point_parent, 0.25);
    self setanimlimited(self.gesture_body_knob, 1, 0.25);
    self._blackboard.point_gesture_active = 0;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32ee
// Size: 0xbe5
function ai_gesture_simple(var_7ca8d1ce367054f8) {
    self endon("death");
    self endon("entitydeleted");
    self.point_center_anim = undefined;
    self.gesture_body_knob = undefined;
    self.is_partial = 0;
    demeanor = "casual";
    state = undefined;
    if (isai(self)) {
        self._blackboard.gesture_active = 1;
        demeanor = asm_getdemeanor();
        state = asm_getcurrentstate(self.asmname);
    }
    var_3b61fb88f64b3755 = ["shrug", "cross", "nod", "salute", "wave", "wait", "fallback_up"];
    var_a534bbf61c8c91af = ["move_up", "on_me", "hold", "fallback_up", "fallback_down", "arm_up"];
    var_337fd93417b7bcbd = ["move_up", "on_me", "hold", "fallback_up", "fallback_down", "arm_up"];
    var_684250e83139a238 = ["shrug", "cross", "nod", "salute", "wave", "wait", "move_up", "on_me", "hold", "fallback_up", "fallback_down", "arm_up"];
    if (!scripts\engine\utility::array_contains(var_3b61fb88f64b3755, var_7ca8d1ce367054f8) && !scripts\engine\utility::array_contains(var_a534bbf61c8c91af, var_7ca8d1ce367054f8)) {
        assertex(var_7ca8d1ce367054f8, "Gesture type specified is not a valid type");
        return;
    }
    if (!isdefined(self)) {
        return;
    }
    if (isai(self) && !asm_currentstatehasflag(self.asmname, "gesture")) {
        println("<dev string:x1c>" + state + "<dev string:x29>");
        return;
    } else if (isai(self)) {
        self.gesture_body_knob = asm_getbodyknob();
        if (demeanor == "casual") {
            if (scripts\engine\utility::array_contains(var_3b61fb88f64b3755, var_7ca8d1ce367054f8)) {
                self.gesture_shrug_anim = self.asm.gestures.gesture_shrug_anim;
                self.gesture_cross_anim = self.asm.gestures.gesture_cross_anim;
                self.gesture_nod_anim = self.asm.gestures.gesture_nod_anim;
                self.gesture_salute_anim = self.asm.gestures.gesture_salute_anim;
                self.gesture_wave_anim = self.asm.gestures.gesture_wave_anim;
                self.gesture_wait_anim = self.asm.gestures.gesture_wait_anim;
                self.gesture_fallback_up_anim = self.asm.gestures.gesture_fallback_up_anim;
            } else {
                println("<dev string:x69>");
                return;
            }
        } else if (demeanor == "casual_gun") {
            if (scripts\engine\utility::array_contains(var_684250e83139a238, var_7ca8d1ce367054f8)) {
                self.gesture_shrug_anim = self.asm.gestures.gesture_shrug_anim;
                self.gesture_cross_anim = self.asm.gestures.gesture_cross_anim;
                self.gesture_nod_anim = self.asm.gestures.gesture_nod_anim;
                self.gesture_salute_anim = self.asm.gestures.gesture_salute_anim;
                self.gesture_wave_anim = self.asm.gestures.gesture_wave_anim;
                self.gesture_wait_anim = self.asm.gestures.gesture_wait_anim;
                self.gesture_moveup_anim = self.asm.gestures.gesture_moveup_anim;
                self.gesture_onme_anim = self.asm.gestures.gesture_onme_anim;
                self.gesture_hold_anim = self.asm.gestures.gesture_hold_anim;
                self.gesture_fallback_up_anim = self.asm.gestures.gesture_fallback_up_anim;
                self.gesture_fallback_down_anim = self.asm.gestures.gesture_fallback_down_anim;
                self.gesture_armup_anim = self.asm.gestures.gesture_armup_anim;
            } else {
                println("<dev string:x93>");
                return;
            }
        } else if (demeanor == "combat") {
            if (scripts\engine\utility::array_contains(var_a534bbf61c8c91af, var_7ca8d1ce367054f8)) {
                self.gesture_moveup_anim = self.asm.gestures.gesture_moveup_anim;
                self.gesture_onme_anim = self.asm.gestures.gesture_onme_anim;
                self.gesture_hold_anim = self.asm.gestures.gesture_hold_anim;
                self.gesture_fallback_up_anim = self.asm.gestures.gesture_fallback_up_anim;
                self.gesture_fallback_down_anim = self.asm.gestures.gesture_fallback_down_anim;
                self.gesture_armup_anim = self.asm.gestures.gesture_armup_anim;
            } else {
                println("<dev string:xc1>");
                return;
            }
        } else if (demeanor == "cqb") {
            if (scripts\engine\utility::array_contains(var_337fd93417b7bcbd, var_7ca8d1ce367054f8)) {
                self.gesture_moveup_anim = self.asm.gestures.gesture_moveup_anim;
                self.gesture_onme_anim = self.asm.gestures.gesture_onme_anim;
                self.gesture_hold_anim = self.asm.gestures.gesture_hold_anim;
                self.gesture_fallback_up_anim = self.asm.gestures.gesture_fallback_up_anim;
                self.gesture_fallback_down_anim = self.asm.gestures.gesture_fallback_down_anim;
                self.gesture_armup_anim = self.asm.gestures.gesture_armup_anim;
            } else {
                println("<dev string:xeb>");
                return;
            }
        } else if (demeanor == "frantic") {
            if (scripts\engine\utility::array_contains(var_a534bbf61c8c91af, var_7ca8d1ce367054f8)) {
                self.gesture_moveup_anim = self.asm.gestures.gesture_moveup_anim;
                self.gesture_onme_anim = self.asm.gestures.gesture_onme_anim;
                self.gesture_hold_anim = self.asm.gestures.gesture_hold_anim;
                self.gesture_fallback_up_anim = self.asm.gestures.gesture_fallback_up_anim;
                self.gesture_fallback_down_anim = self.asm.gestures.gesture_fallback_down_anim;
                self.gesture_armup_anim = self.asm.gestures.gesture_armup_anim;
            } else {
                println("<dev string:xc1>");
                return;
            }
        } else {
            println(demeanor + "<dev string:x44>");
            return;
        }
    } else {
        self.gesture_shrug_anim = generic_human%shipcrib_gst_body_shrug_01;
        self.gesture_cross_anim = generic_human%shipcrib_gst_body_cross_01;
        self.gesture_nod_anim = generic_human%shipcrib_gst_head_nod_01;
        self.gesture_salute_anim = generic_human%shipcrib_gst_head_salute_01;
        self.gesture_wave_anim = generic_human%shipcrib_gst_body_wave_01;
        self.gesture_wait_anim = generic_human%shipcrib_gst_body_wait_01;
        self.gesture_fallback_up_anim = generic_human%hm_grnd_org_gest_fallback_up;
    }
    var_d36c326e46c200a3 = undefined;
    switch (var_7ca8d1ce367054f8) {
    case #"hash_f95a6a3ee8c001ec": 
        var_d36c326e46c200a3 = self.gesture_shrug_anim;
        break;
    case #"hash_eb00cb01bd7a6e7b": 
        var_d36c326e46c200a3 = self.gesture_cross_anim;
        break;
    case #"hash_40a1376c2c1dba9a": 
        var_d36c326e46c200a3 = self.gesture_nod_anim;
        break;
    case #"hash_c7d247b0c27f20b1": 
        var_d36c326e46c200a3 = self.gesture_salute_anim;
        break;
    case #"hash_bda5687440fc2934": 
        var_d36c326e46c200a3 = self.gesture_wave_anim;
        break;
    case #"hash_bdf347744138cb00": 
        var_d36c326e46c200a3 = self.gesture_wait_anim;
        break;
    case #"hash_dd93195493d0c818": 
        self.is_partial = 1;
        var_d36c326e46c200a3 = self.gesture_hold_anim;
        break;
    case #"hash_b8e7e4b53801f40f": 
        self.is_partial = 1;
        var_d36c326e46c200a3 = self.gesture_onme_anim;
        break;
    case #"hash_c49910ada754deb4": 
        self.is_partial = 1;
        var_d36c326e46c200a3 = self.gesture_moveup_anim;
        break;
    case #"hash_486396f4d5e0cc51": 
        self.is_partial = 1;
        var_d36c326e46c200a3 = self.gesture_fallback_up_anim;
        break;
    case #"hash_f61262b439059658": 
        self.is_partial = 1;
        var_d36c326e46c200a3 = self.gesture_fallback_down_anim;
        break;
    case #"hash_de706ce2cae61473": 
        self.is_partial = 1;
        var_d36c326e46c200a3 = self.gesture_armup_anim;
        break;
    }
    if (self.is_partial) {
        self.simple_gesture_parent = generic_human%gesture_partials;
    } else {
        self.simple_gesture_parent = generic_human%add_gesture;
    }
    if (self.is_partial) {
        thread blend_partial_in(self.simple_gesture_parent, var_d36c326e46c200a3, 0.5);
    } else {
        self setanimlimited(self.simple_gesture_parent, 1, 0.5);
        self setanimlimited(var_d36c326e46c200a3, 1, 0.5, 0.75);
    }
    wait_time = getanimlength(var_d36c326e46c200a3) * 0.85;
    wait wait_time;
    if (self.is_partial) {
        thread blend_partial_out(self.simple_gesture_parent, var_d36c326e46c200a3, 0.5);
    } else {
        self clearanim(self.simple_gesture_parent, 0.5);
        self clearanim(var_d36c326e46c200a3, 0.5);
    }
    self.is_partial = 0;
    if (isai(self)) {
        self._blackboard.gesture_active = undefined;
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3edb
// Size: 0x7f
function blend_partial_in(var_10c67b12be486d55, animation, blend_time, notetrack) {
    blend = blend_time * 0.5;
    self setanimlimited(var_10c67b12be486d55, 1, blend);
    self setanimlimited(animation, 1, blend, 0.75);
    wait blend_time * 0.5;
    self setanimlimited(animation, 10, blend, 0.75);
    self setanimlimited(var_10c67b12be486d55, 10, blend);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3f62
// Size: 0x5d
function blend_partial_out(var_10c67b12be486d55, animation, var_6e2597877d503152) {
    clear = var_6e2597877d503152 * 0.5;
    self setanimlimited(var_10c67b12be486d55, 1, clear);
    self setanimlimited(animation, 1, clear);
    wait clear;
    self clearanim(var_10c67b12be486d55, clear);
    self clearanim(animation, clear);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc7
// Size: 0x38
function float_remap(value, from1, to1, from2, to2) {
    return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4008
// Size: 0x22
function lerp_float(from, to, delta) {
    return from + delta * (to - from);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4033
// Size: 0x3e
function smoothstep(start, end, delta) {
    delta = clamp((delta - start) / (end - start), 0, 1);
    return delta * delta * (3 - 2 * delta);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x407a
// Size: 0x7f
function set_time_via_rate(anime, time, weight, blend_time) {
    if (!isdefined(weight)) {
        weight = 1;
    }
    if (!isdefined(blend_time)) {
        blend_time = 0.25;
    }
    prev_time = self getanimtime(anime);
    duration = getanimlength(anime);
    rate = (time - prev_time) * duration / 0.05;
    self setanimlimited(anime, weight, blend_time, rate);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4101
// Size: 0x477
function ai_gesture_directional_custom(target, anim_array, var_4e9e76b78d716037) {
    self endon("gesture_stop");
    self endon("death");
    self endon("entitydeleted");
    anims = anim_array;
    var_5286de9bce84f2c4 = anim_array[0];
    var_18e5b6b83a6361c0 = anim_array[1];
    var_b849486170a283ff = anim_array[2];
    var_dc7d859aab697700 = anim_array[3];
    var_e990bebf600b1c9f = anim_array[4];
    var_8bc1a08153e71af8 = 0;
    gesture_body_knob = undefined;
    self.no_point_defined = 0;
    var_10c67b12be486d55 = undefined;
    if (isdefined(var_4e9e76b78d716037)) {
        gesture_body_knob = asm_getbodyknob();
        var_10c67b12be486d55 = generic_human%gesture_partials;
    } else {
        var_10c67b12be486d55 = generic_human%add_gesture;
    }
    if (!isdefined(self)) {
        return;
    }
    if (isplayer(target)) {
        lookat = level.player geteye();
    } else if (!isdefined(target)) {
        lookat = self.origin;
        var_8bc1a08153e71af8 = 1;
    } else if (isai(target)) {
        lookat = target geteye();
    } else if (isvector(target)) {
        lookat = target;
    } else {
        lookat = target.origin;
    }
    var_148c7412fde9224d = self gettagangles("tag_origin");
    var_b65a151051532493 = self gettagorigin("tag_origin");
    var_84debf527911a15d = anglestoright(var_148c7412fde9224d);
    var_4bd579fa63eb0ed2 = anglestoforward(var_148c7412fde9224d);
    var_53b34aadf7b8e731 = vectornormalize(lookat - var_b65a151051532493);
    var_b4291343f067bb1d = scripts\engine\utility::flatten_vector(var_84debf527911a15d);
    var_ebf67e00f0184992 = scripts\engine\utility::flatten_vector(var_4bd579fa63eb0ed2);
    var_af48fc7d3df203f1 = scripts\engine\utility::flatten_vector(var_53b34aadf7b8e731);
    dot_vec = vectordot(var_b4291343f067bb1d, var_af48fc7d3df203f1);
    var_8e8c89b2cbb6bc04 = dot_vec * -1;
    var_2208a80dc5f47661 = clamp(float_remap(dot_vec, 0.2, 1, 0, 1), 0, 1);
    var_824c03276d8cdcec = clamp(float_remap(var_8e8c89b2cbb6bc04, 0.2, 1, 0, 1), 0, 1);
    var_9088cba4a109b331 = self gettagorigin("J_Spine4");
    var_20f493dca3c1483f = vectornormalize(lookat - var_9088cba4a109b331);
    var_ca399d17885e392 = anglestoup(var_148c7412fde9224d);
    var_2cb0644208843c51 = vectordot(var_20f493dca3c1483f, var_ca399d17885e392);
    var_2e436ef195c55994 = var_2cb0644208843c51 * -1;
    var_f25cc6d803539f37 = vectordot(var_ebf67e00f0184992, var_20f493dca3c1483f);
    var_7ba291bb89a5d6dd = clamp(float_remap(var_f25cc6d803539f37, 0.2, 1, 0, 1), 0, 1);
    var_bed61d13bd0fe46f = clamp(float_remap(var_2cb0644208843c51, 0.2, 1, 0, 1), 0, 1);
    var_bd630759847e7b0c = clamp(float_remap(var_2e436ef195c55994, 0.2, 1, 0, 1), 0, 1);
    if (!self.no_point_defined) {
        if (isdefined(var_4e9e76b78d716037)) {
            self setanimlimited(var_10c67b12be486d55, 10, 0.25);
        } else {
            self setanimlimited(var_10c67b12be486d55, 1, 0.25);
        }
        if (var_7ba291bb89a5d6dd < 0.3) {
            self setanimlimited(var_5286de9bce84f2c4, 0, 0, 1);
        } else {
            self setanimlimited(var_5286de9bce84f2c4, var_7ba291bb89a5d6dd, 0.25, 1);
        }
        if (isdefined(var_dc7d859aab697700)) {
            self setanimlimited(var_dc7d859aab697700, var_bed61d13bd0fe46f, 0.25, 1);
        }
        if (isdefined(var_e990bebf600b1c9f)) {
            self setanimlimited(var_e990bebf600b1c9f, var_bd630759847e7b0c, 0.25, 1);
        }
        self setanimlimited(var_18e5b6b83a6361c0, var_824c03276d8cdcec, 0.25, 1);
        self setanimlimited(var_b849486170a283ff, var_2208a80dc5f47661, 0.25, 1);
    } else {
        if (isdefined(var_4e9e76b78d716037)) {
            self setanimlimited(gesture_body_knob, 0.001, 0.1);
        }
        self setanimlimited(var_10c67b12be486d55, 1, 0.25);
        self setanimlimited(var_5286de9bce84f2c4, 1, 0.25);
    }
    wait_time = getanimlength(var_5286de9bce84f2c4);
    wait wait_time;
    self clearanim(var_10c67b12be486d55, 0.25);
    self setanimlimited(gesture_body_knob, 1, 0.25);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4580
// Size: 0x107
function ai_custom_gesture(gesture_anim, var_4e9e76b78d716037) {
    self endon("death");
    self endon("gesture_stop");
    self endon("entitydeleted");
    var_feaa792b9588834d = generic_human%add_gesture;
    var_e97ec92eaf750b95 = 0;
    notification = "single anim";
    thread scripts\common\notetrack::start_notetrack_wait(self, notification, undefined, undefined, gesture_anim);
    if (isdefined(var_4e9e76b78d716037) && var_4e9e76b78d716037) {
        var_feaa792b9588834d = generic_human%gesture_partials;
        var_e97ec92eaf750b95 = 1;
    }
    if (var_e97ec92eaf750b95) {
        thread blend_partial_in(var_feaa792b9588834d, gesture_anim, 0.2);
    } else {
        self setanimlimited(var_feaa792b9588834d, 1, 0.1);
        self setanimlimited(gesture_anim, 1, 0.1);
    }
    wait_time = getanimlength(gesture_anim) * 0.75 - 0.2;
    wait wait_time;
    if (var_e97ec92eaf750b95) {
        thread blend_partial_out(var_feaa792b9588834d, gesture_anim, 0.2);
        return;
    }
    self clearanim(var_feaa792b9588834d, 0.2);
    self clearanim(gesture_anim, 0.2);
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x468f
// Size: 0x724
function blended_loop_anim() {
    guy = self;
    self endon(self.ender);
    guy.fwd_anim = undefined;
    guy.right_anim = undefined;
    guy.left_anim = undefined;
    guy.leftback_anim = undefined;
    guy.rightback_anim = undefined;
    foreach (thing in guy.anim_array) {
        if (issubstr(thing, "forward")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.fwd_anim = level.scr_anim[guy.animname][thing];
            }
            continue;
        }
        if (issubstr(thing, "right") && !issubstr(thing, "back")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.right_anim = level.scr_anim[guy.animname][thing];
            }
            continue;
        }
        if (issubstr(thing, "left") && !issubstr(thing, "back")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.left_anim = level.scr_anim[guy.animname][thing];
            }
            continue;
        }
        if (issubstr(thing, "leftback")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.leftback_anim = level.scr_anim[guy.animname][thing];
            }
            continue;
        }
        if (issubstr(thing, "rightback")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.rightback_anim = level.scr_anim[guy.animname][thing];
            }
        }
    }
    org = getstartorigin(self.animnode.origin, self.animnode.angles, guy.fwd_anim);
    ang = getstartangles(self.animnode.origin, self.animnode.angles, guy.fwd_anim);
    if (isai(guy)) {
        guy forceteleport(org, ang, 10000);
    } else {
        guy.origin = org;
        guy.angles = ang;
    }
    var_837c12743ab916fe = vectortoangles(level.player.origin - guy.origin);
    guy setanimknoball(guy.fwd_anim, generic_human%root, 1, 0.2);
    if (isdefined(guy.right_anim)) {
        guy setanimlimited(guy.right_anim, 0, 0.2);
    }
    if (isdefined(guy.left_anim)) {
        guy setanimlimited(guy.left_anim, 0, 0.2);
    }
    if (isdefined(guy.leftback_anim)) {
        guy setanimlimited(guy.leftback_anim, 0, 0.2);
    }
    if (isdefined(guy.rightback_anim)) {
        guy setanimlimited(guy.rightback_anim, 0, 0.2);
    }
    var_9e41f6b2a5fdfa6c = 0;
    var_3a58e25d07fa8963 = 0;
    guy pushplayer(1);
    while (true) {
        if (!isdefined(guy)) {
            break;
        }
        if (isplayer(guy.gesture_lookat)) {
            lookat = level.player geteye();
        } else if (isai(guy.gesture_lookat)) {
            lookat = guy.gesture_lookat geteye();
        } else if (isvector(guy.gesture_lookat)) {
            lookat = guy.gesture_lookat;
        } else {
            lookat = guy.gesture_lookat.origin;
        }
        var_f8018ede9bc535ee = guy gettagangles("tag_origin");
        var_7ac7a365a6aee172 = guy gettagorigin("tag_origin");
        vec_to_player = flatten_vector(vectornormalize(lookat - var_7ac7a365a6aee172));
        forward_vec = anglestoforward(var_f8018ede9bc535ee);
        right_vec = anglestoright(var_f8018ede9bc535ee);
        var_8fc912a946a93a31 = anglestoright(var_f8018ede9bc535ee) * -1;
        var_e0e29f268e2b6297 = anglestoforward(var_f8018ede9bc535ee) * -1;
        up_vec = anglestoup(var_f8018ede9bc535ee);
        var_e32c0e4a71d1793e = clamp(vectordot(vec_to_player, forward_vec), 0, 1);
        dot_right = clamp(vectordot(vec_to_player, right_vec), 0, 1);
        var_ec8d74cda15d5374 = clamp(vectordot(vec_to_player, var_8fc912a946a93a31), 0, 1);
        var_b0b9a45f796b1296 = clamp(vectordot(vec_to_player, var_e0e29f268e2b6297), 0, 1);
        var_d7199cf973e1af07 = 1;
        if (anglebetweenvectorssigned(forward_vec, vec_to_player, up_vec) > 0) {
            var_d7199cf973e1af07 = 0;
        }
        if (isdefined(guy.right_anim)) {
            guy setanimlimited(guy.right_anim, dot_right, 0.2);
        }
        if (isdefined(guy.left_anim)) {
            guy setanimlimited(guy.left_anim, var_ec8d74cda15d5374, 0.2);
        }
        guy setanimlimited(guy.fwd_anim, var_e32c0e4a71d1793e + 0.005, 0.2);
        if (var_d7199cf973e1af07) {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, var_b0b9a45f796b1296, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, 0, 0.1);
        } else {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, 0, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, var_b0b9a45f796b1296, 0.1);
        }
        if (isdefined(guy.rightback_anim)) {
            guy setanimlimited(guy.rightback_anim, var_9e41f6b2a5fdfa6c + 0.005, 0.2);
        }
        if (isdefined(guy.leftback_anim)) {
            guy setanimlimited(guy.leftback_anim, var_3a58e25d07fa8963 + 0.005, 0.2);
        }
        waitframe();
        waittillframeend();
    }
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dbb
// Size: 0x13a
function blended_loop_cleanup() {
    guy = self;
    if (isdefined(guy.ender)) {
        guy notify(guy.ender);
    }
    guy clearanim(guy.fwd_anim, 0.2);
    if (isdefined(guy.right_anim)) {
        guy clearanim(guy.right_anim, 0.2);
    }
    if (isdefined(guy.left_anim)) {
        guy clearanim(guy.left_anim, 0.2);
    }
    if (isdefined(guy.leftback_anim)) {
        guy clearanim(guy.leftback_anim, 0.2);
    }
    if (isdefined(guy.rightback_anim)) {
        guy clearanim(guy.rightback_anim, 0.2);
    }
    guy pushplayer(0);
    guy.fwd_anim = undefined;
    guy.right_anim = undefined;
    guy.left_anim = undefined;
    guy.leftback_anim = undefined;
    guy.rightback_anim = undefined;
    guy.anim_array = undefined;
    guy.ender = undefined;
    guy.gesture_lookat = undefined;
}

// Namespace namespace_6bc879d2947c65d2 / namespace_3123a12d1da4993
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4efd
// Size: 0x755
function blended_anim() {
    guy = self;
    guy.fwd_anim = undefined;
    guy.right_anim = undefined;
    guy.left_anim = undefined;
    guy.leftback_anim = undefined;
    guy.rightback_anim = undefined;
    foreach (thing in guy.anim_array) {
        if (issubstr(thing, "forward")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.fwd_anim = level.scr_anim[guy.animname][thing];
            }
            continue;
        }
        if (issubstr(thing, "right") && !issubstr(thing, "back")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.right_anim = level.scr_anim[guy.animname][thing];
            }
            continue;
        }
        if (issubstr(thing, "left") && !issubstr(thing, "back")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.left_anim = level.scr_anim[guy.animname][thing];
            }
            continue;
        }
        if (issubstr(thing, "leftback")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.leftback_anim = level.scr_anim[guy.animname][thing];
            }
            continue;
        }
        if (issubstr(thing, "rightback")) {
            if (isdefined(level.scr_anim[guy.animname][thing])) {
                guy.rightback_anim = level.scr_anim[guy.animname][thing];
            }
        }
    }
    org = getstartorigin(self.animnode.origin, self.animnode.angles, guy.fwd_anim);
    ang = getstartangles(self.animnode.origin, self.animnode.angles, guy.fwd_anim);
    if (isai(guy)) {
        guy forceteleport(org, ang, 10000);
    } else {
        guy.origin = org;
        guy.angles = ang;
    }
    var_837c12743ab916fe = vectortoangles(level.player.origin - guy.origin);
    guy setanimknoball(guy.fwd_anim, generic_human%root, 1, 0.2);
    if (isdefined(guy.right_anim)) {
        guy setanimlimited(guy.right_anim, 0, 0.2);
    }
    if (isdefined(guy.left_anim)) {
        guy setanimlimited(guy.left_anim, 0, 0.2);
    }
    if (isdefined(guy.leftback_anim)) {
        guy setanimlimited(guy.leftback_anim, 0, 0.2);
    }
    if (isdefined(guy.rightback_anim)) {
        guy setanimlimited(guy.rightback_anim, 0, 0.2);
    }
    var_9e41f6b2a5fdfa6c = 0;
    var_3a58e25d07fa8963 = 0;
    start_time = gettime() / 1000;
    wait_time = getanimlength(guy.fwd_anim);
    while (gettime() / 1000 - start_time < wait_time) {
        if (!isdefined(guy)) {
            break;
        }
        if (isplayer(guy.gesture_lookat)) {
            lookat = level.player geteye();
        } else if (isai(guy.gesture_lookat)) {
            lookat = guy.gesture_lookat geteye();
        } else if (isvector(guy.gesture_lookat)) {
            lookat = guy.gesture_lookat;
        } else {
            lookat = guy.gesture_lookat.origin;
        }
        var_f8018ede9bc535ee = guy gettagangles("tag_origin");
        var_7ac7a365a6aee172 = guy gettagorigin("tag_origin");
        vec_to_player = flatten_vector(vectornormalize(lookat - var_7ac7a365a6aee172));
        forward_vec = anglestoforward(var_f8018ede9bc535ee);
        right_vec = anglestoright(var_f8018ede9bc535ee);
        var_8fc912a946a93a31 = anglestoright(var_f8018ede9bc535ee) * -1;
        var_e0e29f268e2b6297 = anglestoforward(var_f8018ede9bc535ee) * -1;
        up_vec = anglestoup(var_f8018ede9bc535ee);
        var_e32c0e4a71d1793e = clamp(vectordot(vec_to_player, forward_vec), 0, 1);
        dot_right = clamp(vectordot(vec_to_player, right_vec), 0, 1);
        var_ec8d74cda15d5374 = clamp(vectordot(vec_to_player, var_8fc912a946a93a31), 0, 1);
        var_b0b9a45f796b1296 = clamp(vectordot(vec_to_player, var_e0e29f268e2b6297), 0, 1);
        var_d7199cf973e1af07 = 1;
        if (anglebetweenvectorssigned(forward_vec, vec_to_player, up_vec) > 0) {
            var_d7199cf973e1af07 = 0;
        }
        if (isdefined(guy.right_anim)) {
            guy setanimlimited(guy.right_anim, dot_right, 0.2);
        }
        if (isdefined(guy.left_anim)) {
            guy setanimlimited(guy.left_anim, var_ec8d74cda15d5374, 0.2);
        }
        guy setanimlimited(guy.fwd_anim, var_e32c0e4a71d1793e + 0.005, 0.2);
        if (var_d7199cf973e1af07) {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, var_b0b9a45f796b1296, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, 0, 0.1);
        } else {
            var_9e41f6b2a5fdfa6c = math::lerp(var_9e41f6b2a5fdfa6c, 0, 0.1);
            var_3a58e25d07fa8963 = math::lerp(var_3a58e25d07fa8963, var_b0b9a45f796b1296, 0.1);
        }
        if (isdefined(guy.rightback_anim)) {
            guy setanimlimited(guy.rightback_anim, var_9e41f6b2a5fdfa6c + 0.005, 0.2);
        }
        if (isdefined(guy.leftback_anim)) {
            guy setanimlimited(guy.leftback_anim, var_3a58e25d07fa8963 + 0.005, 0.2);
        }
        waitframe();
        waittillframeend();
    }
    guy thread blended_loop_cleanup();
}

