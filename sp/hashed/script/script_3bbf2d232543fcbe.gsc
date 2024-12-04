#using script_5d265b4fca61f070;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\anim;

#namespace dialogue;

// Namespace dialogue / namespace_b824973b0ec64162
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x140
// Size: 0x3e
function init() {
    level.var_9a62261b5b534b06 = &function_7bd4fbf21584d46e;
    setdvarifuninitialized(@"hash_863010f158bacdd1", 0);
    setdvarifuninitialized(@"hash_a1e2ee2c6fe41007", 0);
    level.var_621af16ef0684a11 = &function_168830b0663bc9f4;
}

// Namespace dialogue / namespace_b824973b0ec64162
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x186
// Size: 0x36
function function_168830b0663bc9f4(maxdist) {
    maxdist = default_to(maxdist, level.var_587de0e7b537210a);
    return getcorpsearrayinradius(level.player.origin, maxdist);
}

// Namespace dialogue / namespace_b824973b0ec64162
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5
// Size: 0x345
function function_7bd4fbf21584d46e(alias, tag, skip_face, temp_emitter) {
    speaker = self;
    if (isstruct(self) && isdefined(self.vo_parent)) {
        speaker = self.vo_parent;
    }
    var_cbc44e3ab4fe0707 = istrue(self.var_cbc44e3ab4fe0707);
    assertex(!var_cbc44e3ab4fe0707 || !issound3d(alias), "Tried to play non-radio line '" + alias + "' on level/struct.");
    if (istrue(self.var_ed56b39b72558e56)) {
        tag = default_to(tag, "j_hip_ri");
    } else {
        tag = default_to(tag, "j_head");
    }
    temp_emitter = default_to(temp_emitter, 1);
    emitter = self;
    if (isdefined(self.vo_parent)) {
        emitter = self.vo_parent function_f5eb5b4d0e6714aa(tag, (0, 0, 0), (0, 0, 0), temp_emitter);
    } else if (isplayer(self) || isstruct(self) || isdefined(self.vo_emitter)) {
        emitter = function_f5eb5b4d0e6714aa();
    } else if (!istrue(self.var_cbc44e3ab4fe0707) && !istrue(self.var_b05aad42f8a13a4) && self tagexists(tag)) {
        emitter = function_f5eb5b4d0e6714aa(tag, (-0.35, -3.5, 0), (0, 0, 0), temp_emitter);
    }
    emitter stopsounds();
    if (isdefined(speaker) && isent(speaker)) {
        speaker stopsoundchannel("voice_bchatter_1_3d", 1);
    }
    self notify("stop_dialogue");
    if (!function_8ff454339557a41b()) {
        if (istrue(self.var_ed56b39b72558e56)) {
            context = "dx_radio_3d";
        } else {
            if (isdefined(level.var_cb329546ed01d21a) && isdefined(level.var_cb329546ed01d21a[alias])) {
                radio_dist = level.var_cb329546ed01d21a[alias];
            } else {
                radio_dist = function_405ca75fc1a4ec12(alias) * 0.33;
            }
            player_distsq = distancesquared(level.player.origin + (0, 0, 60), emitter.origin);
            context = ter_op(player_distsq < squared(radio_dist), "dx_open_air", "dx_radio_2d");
        }
        emitter playcontextsound(alias, "dx_type", context);
        if (!istrue(self.skip_face) && !istrue(skip_face) && (isai(self) || istrue(self.fakeactor_face_anim))) {
            face_anim = function_6d4c7d2bd5969057(alias);
            if (isdefined(face_anim)) {
                thread scripts\sp\anim::anim_facialanim(self, alias, face_anim);
            } else {
                thread scripts\sp\anim::anim_facialfiller("stop_facialFiller", undefined, 0, undefined, get_intensity(alias));
            }
        }
    }
    /#
        if (getdvarint(@"hash_863010f158bacdd1")) {
            emitter thread function_14aeae4cd83bd734();
        }
    #/
    if (emitter != self) {
        emitter.shoulddelete = 0;
    }
    function_ea5c0accfc20ea48(alias);
    self notify("stop_facialFiller");
    thread function_690ccae4e694f51e(emitter);
    return true;
}

// Namespace dialogue / namespace_b824973b0ec64162
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x513
// Size: 0x30
function function_ea5c0accfc20ea48(alias) {
    self endon("death");
    self endon("stop_dialogue");
    duration = lookupsoundlength(alias) / 1000;
    wait duration;
}

// Namespace dialogue / namespace_b824973b0ec64162
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54b
// Size: 0x6f
function function_8ff454339557a41b() {
    if (isdefined(self.team) && self.team == "allies" && !istrue(level.var_ea3abe68a9130a0f) && !isalive(level.player)) {
        return true;
    }
    return istrue(self.var_41cde346af45ceca) || istrue(level.var_41cde346af45ceca) || getdvarint(@"hash_a1e2ee2c6fe41007");
}

// Namespace dialogue / namespace_b824973b0ec64162
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c3
// Size: 0x6d
function get_intensity(alias) {
    if (isdefined(self.var_9af882a4ef5986c0)) {
        return self.var_9af882a4ef5986c0;
    }
    var_c59c1d18b26c886e = ["sm", "sm", "md", "lg"];
    intensity = default_to(function_d159656d2b07f8a5(alias), 0);
    return var_c59c1d18b26c886e[intensity];
}

/#

    // Namespace dialogue / namespace_b824973b0ec64162
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x639
    // Size: 0x1bc
    function function_14aeae4cd83bd734() {
        self endon("<dev string:x1c>");
        endscale = 0.65;
        depthtest = 0;
        while (true) {
            forward = anglestoforward(self.angles) * 2;
            up = forward + anglestoup(self.angles) * endscale;
            down = forward - anglestoup(self.angles) * endscale;
            left = forward + anglestoleft(self.angles) * endscale;
            right = forward + anglestoright(self.angles) * endscale;
            sphere(self.origin, 0.2, (1, 1, 1), depthtest, 1);
            sphere(self.origin + forward, endscale, (1, 0, 1), depthtest, 1);
            line(self.origin, self.origin + up, (1, 0, 1), 1, depthtest, 1);
            line(self.origin, self.origin + down, (1, 0, 1), 1, depthtest, 1);
            line(self.origin, self.origin + left, (1, 0, 1), 1, depthtest, 1);
            line(self.origin, self.origin + right, (1, 0, 1), 1, depthtest, 1);
            waitframe();
        }
    }

#/
