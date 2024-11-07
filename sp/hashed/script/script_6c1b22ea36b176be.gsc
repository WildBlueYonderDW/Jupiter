#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_addbcd7d5a4b8ac1;

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb
// Size: 0x1d3
function slidetriggerplayerthink(trig) {
    if (!isdefined(self.var_a084a815b06d6479)) {
        self.var_a084a815b06d6479 = 0;
    }
    if (self.var_a084a815b06d6479) {
        return;
    }
    if (isdefined(self.vehicle)) {
        return;
    }
    if (self issprintsliding() || self isjumping()) {
        return;
    }
    if (isdefined(self.player_view)) {
        return;
    }
    if (function_a9ae329ed6dd3a61()) {
        return;
    }
    if (!isalive(self)) {
        return;
    }
    self endon("death");
    if (self isparachuting()) {
        self skydive_interrupt();
    }
    if (soundexists("SCN_cliffhanger_player_hillslide")) {
        self playsound("SCN_cliffhanger_player_hillslide");
    }
    accel = undefined;
    if (isdefined(trig.script_accel)) {
        accel = trig.script_accel;
    }
    self endon("cancel_sliding");
    level.var_710e62dd77639361 = "default";
    /#
        if (getdvarint(@"hash_69fdaf7cc701b6b", 0) > 0) {
            thread function_572b7fa13e251ec9();
        }
    #/
    if (getdvarint(@"hash_4c481f7e26afb913") > 0) {
        thread beginslidinglegacy();
    } else {
        thread beginsliding(undefined, accel, undefined, trig.script_gesture, trig.script_noteworthy);
    }
    while (true) {
        if (!self istouching(trig)) {
            break;
        }
        if (self.var_a084a815b06d6479) {
            thread function_6009f043b924d50(trig);
            break;
        }
        waitframe();
    }
    if (isdefined(level.end_slide_delay)) {
        wait level.end_slide_delay;
    }
    if (getdvarint(@"hash_4c481f7e26afb913") > 0) {
        endslidinglegacy();
        return;
    }
    endsliding(trig.script_stance, trig.script_damage, trig.script_gesture, trig.script_noteworthy);
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d6
// Size: 0x165
function doslide(slidemodel, var_82ebfb9873bebd03, var_f8d869e874843e58) {
    self endon("death");
    self endon("stop_sliding");
    player = self;
    last_pos = slidemodel.origin;
    current_pos = slidemodel.origin;
    var_3fa79149e2d479d1 = undefined;
    thread function_71d30054f4d134d();
    while (true) {
        movement = player getnormalizedmovement();
        forward = anglestoforward(player.angles);
        right = anglestoright(player.angles);
        movement = (movement[1] * right[0] + movement[0] * forward[0], movement[1] * right[1] + movement[0] * forward[1], 0);
        slidemodel.slidevelocity += movement * var_82ebfb9873bebd03;
        player.fx_tag.origin = slidemodel.origin + anglestoforward(slidemodel.gesture_target.angles) * 400;
        waitframe();
        slidemodel.slidevelocity *= 1 - var_f8d869e874843e58;
    }
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x643
// Size: 0x1c
function function_a9ae329ed6dd3a61() {
    return ent_flag_exist("is_sliding") && ent_flag("is_sliding");
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x668
// Size: 0x14b
function function_93aa9ae582355ff9() {
    self endon("stop_sliding");
    self endon("death");
    while (isdefined(self.slidemodel)) {
        /#
            trace_contents = trace::create_contents(0, 1, 0, 0, 0, 0);
            trace = ray_trace(self geteye(), self geteye() - (0, 0, 100), self, trace_contents);
            normal = trace["<dev string:x1c>"];
            var_76d34dc0f1f05f18 = vectornormalize(vectorcross(normal, (0, 1, 0)));
            var_5e829c3a809cbb07 = vectornormalize(vectorcross(normal, var_76d34dc0f1f05f18));
            thread draw_line_for_time(trace["<dev string:x23>"], trace["<dev string:x23>"] + normal * 50, 1, 0, 0, 10);
            thread draw_line_for_time(trace["<dev string:x23>"], trace["<dev string:x23>"] + var_76d34dc0f1f05f18 * 50, 0, 1, 0, 10);
            thread draw_line_for_time(trace["<dev string:x23>"], trace["<dev string:x23>"] + var_5e829c3a809cbb07 * 50, 0, 0, 1, 10);
            thread draw_line_for_time(self.origin, self.origin + anglestoforward(self.angles) * 50, 1, 1, 0, 10);
        #/
        waitframe();
    }
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bb
// Size: 0x59
function function_6009f043b924d50(var_9888fb7510cb36f4) {
    self endon("death");
    stuckpos = self.origin;
    while (self istouching(var_9888fb7510cb36f4) && distancesquared(stuckpos, self.origin) < squared(30)) {
        waitframe();
    }
    self.var_a084a815b06d6479 = 0;
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81c
// Size: 0xd1
function function_71d30054f4d134d() {
    self endon("stop_sliding");
    self endon("death");
    var_48642c20d8f8703c = 4;
    var_5ddb763e773845c4 = [];
    for (i = 0; i < var_48642c20d8f8703c; i++) {
        var_5ddb763e773845c4[i] = self.slidemodel.origin;
        waitframe();
    }
    var_1d3a21a69ce70731 = 0;
    while (!var_1d3a21a69ce70731 && isdefined(self.slidemodel)) {
        var_1d3a21a69ce70731 = 1;
        for (i = 0; i < var_48642c20d8f8703c - 1; i++) {
            if (var_5ddb763e773845c4[i] != var_5ddb763e773845c4[i + 1]) {
                var_1d3a21a69ce70731 = 0;
                var_5ddb763e773845c4[i] = var_5ddb763e773845c4[i + 1];
            }
        }
        var_5ddb763e773845c4[var_48642c20d8f8703c - 1] = self.slidemodel.origin;
        waitframe();
    }
    self.var_a084a815b06d6479 = 1;
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x8f5
// Size: 0x5e0
function beginsliding(velocity, var_82ebfb9873bebd03, var_f8d869e874843e58, gesture, surfacetype) {
    self endon("stop_sliding");
    self endon("death");
    assert(isplayer(self));
    player = self;
    if (player ent_flag_exist("is_sliding")) {
        player ent_flag_clear("is_sliding");
    } else {
        player ent_flag_init("is_sliding");
    }
    player ent_flag_set("is_sliding");
    var_f7d4dd03f8c4ac9e = isdefined(level.custom_linkto_slide);
    assert(!isdefined(player.slidemodel));
    slidemodel = player spawn_tag_origin();
    player.slidemodel = slidemodel;
    fx_tag = player spawn_tag_origin();
    player.fx_tag = fx_tag;
    trace_contents = trace::create_contents(0, 1, 0, 0, 0, 0);
    trace = ray_trace(player geteye(), player geteye() - (0, 0, 100), player, trace_contents);
    angle = 0;
    point = (0, 0, 0);
    normal = trace["normal"];
    while (true) {
        if (!player isjumping()) {
            trace = ray_trace(player geteye(), player geteye() - (0, 0, 100), player, trace_contents);
            normal = trace["normal"];
            if (isdefined(normal)) {
                var_c22baca169342a86 = vectordot(normal, (0, 0, 1));
                if (var_c22baca169342a86 <= 0.95) {
                    angle = acos(var_c22baca169342a86);
                    point = trace["position"];
                    break;
                }
            }
        }
        wait 0.05;
    }
    normal = vectornormalize(flatten_vector(normal, (0, 0, 1)));
    var_76d34dc0f1f05f18 = vectornormalize(vectorcross(normal, (0, 1, 0)));
    var_5e829c3a809cbb07 = vectornormalize(vectorcross(normal, var_76d34dc0f1f05f18));
    slidemodel.angles = player.angles;
    slidemodel.origin = player.origin;
    var_9cbf3e1432e34389 = vectortoangles(normal) + normal * angle;
    slidemodel.gesture_target = spawn("script_model", slidemodel.origin + anglestoforward(var_9cbf3e1432e34389) * 2000);
    slidemodel.gesture_target.angles = var_9cbf3e1432e34389;
    player.fx_tag.angles = var_9cbf3e1432e34389;
    if (!isdefined(velocity)) {
        velocity = player getvelocity() + (0, 0, -10);
    }
    if (!isdefined(var_82ebfb9873bebd03)) {
        var_82ebfb9873bebd03 = 10;
    }
    if (!isdefined(var_f8d869e874843e58)) {
        var_f8d869e874843e58 = 0.035;
    }
    slidemodel moveslide((0, 0, 15), 15, velocity);
    if (isdefined(surfacetype) && getdvarint(@"hash_94150a895cddf69d", 0)) {
        player childthread function_4ded73402b984ff9(surfacetype);
    } else {
        player thread scripts\engine\utility::playsoundonentity("foot_slide_plr_start");
    }
    if (getdvarint(@"hash_e7c074c9ef3fd481", 1)) {
        player hidelegsandshadow();
    }
    weapons = player getweaponslistprimaries();
    if (weapons.size > 0) {
        gesture = default_to(gesture, "ges_slide");
        if (gesture != "no_gesture" && !player isgestureplaying(gesture)) {
            player forceplaygestureviewmodel(gesture, slidemodel.gesture_target, 0.2, undefined, 1, 1);
        }
    }
    if (isdefined(level._effect["vfx_slide_dirt"])) {
        effect = getfx("vfx_slide_dirt");
        playfxontag(getfx("vfx_slide_dirt"), player.fx_tag, "tag_origin");
        player.fx_tag show();
    }
    if (var_f7d4dd03f8c4ac9e) {
        player playerlinktoblend(slidemodel, undefined, 1);
        wait 1;
        player playerlinktodelta(slidemodel, "tag_origin", 1, 180, 180, 180, 180, 1);
    } else {
        player playerlinktodelta(slidemodel, "tag_origin", 0, 180, 180, 180, 180);
    }
    if (getdvarint(@"hash_2f40a2e9ae1a9a47", 1)) {
        noself_func("SetSavedDvar", @"hash_7eb1641737ab83b7", 1);
    }
    player val::set("slide", "fire", 0);
    player val::set("slide", "prone", 0);
    player val::set("slide", "stand", 0);
    player val::set("slide", "reload", 0);
    if (istrue(level.var_ef533d9edb03d515)) {
        player val::set("slide", "sprint", 0);
    }
    player thread doslide(slidemodel, var_82ebfb9873bebd03, var_f8d869e874843e58);
    if (isdefined(surfacetype) && getdvarint(@"hash_94150a895cddf69d", 0)) {
        player childthread function_ddf979aedbe53699(surfacetype);
    } else {
        player thread play_loop_sound_on_tag("foot_slide_plr_loop");
    }
    if (utility::issharedfuncdefined("player", "get_rumble_ent")) {
        player.var_98ac01a65b073642 = utility::function_f3bb4f4911a1beb2("player", "get_rumble_ent");
        player.var_98ac01a65b073642 thread utility::function_f3bb4f4911a1beb2("player", "rumble_ramp_to", 0.6, 3);
    }
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xedd
// Size: 0x231
function endsliding(var_15060420a136afe6, var_1363a88619936df7, gesture, surfacetype) {
    assert(isplayer(self));
    player = self;
    assert(isdefined(player.slidemodel));
    gesture = default_to(gesture, "ges_slide");
    if (gesture != "no_gesture" && player isgestureplaying(gesture)) {
        player stopgestureviewmodel(gesture);
    }
    if (isdefined(player.var_98ac01a65b073642)) {
        player.var_98ac01a65b073642 delete();
    }
    if (isdefined(surfacetype) && getdvarint(@"hash_94150a895cddf69d", 0)) {
        player childthread function_215b249240166e44(surfacetype);
    } else {
        player notify("stop sound" + "foot_slide_plr_loop");
        player thread scripts\engine\utility::playsoundonentity("foot_slide_plr_end");
    }
    if (getdvarint(@"hash_e7c074c9ef3fd481", 1)) {
        player delaycall(0.2, &showlegsandshadow);
    }
    if (player islinked()) {
        player unlink();
        player setvelocity(player.slidemodel.slidevelocity);
    }
    if (isdefined(player.fx_tag)) {
        if (isdefined(level._effect["vfx_slide_dirt"])) {
            effect = getfx("vfx_slide_dirt");
            if (isdefined(effect)) {
                stopfxontag(getfx("vfx_slide_dirt"), player.fx_tag, "tag_origin");
            }
        }
        player.fx_tag delete();
    }
    if (player function_a9ae329ed6dd3a61()) {
        player ent_flag_clear("is_sliding");
    }
    player val::reset_all("slide");
    if (isdefined(var_15060420a136afe6)) {
        player setstance(var_15060420a136afe6);
    }
    if (isdefined(var_1363a88619936df7)) {
        player delaycall(0.2, &dodamage, var_1363a88619936df7, player.origin);
    }
    player.slidemodel delete();
    if (getdvarint(@"hash_2f40a2e9ae1a9a47", 1)) {
        noself_func("SetSavedDvar", @"hash_7eb1641737ab83b7", 0);
    }
    player notify("stop_sliding");
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1116
// Size: 0x1b4
function beginslidinglegacy(velocity, var_82ebfb9873bebd03, var_f8d869e874843e58) {
    assert(isplayer(self));
    player = self;
    if (player ent_flag_exist("is_sliding")) {
        player ent_flag_clear("is_sliding");
    } else {
        player ent_flag_init("is_sliding");
    }
    player ent_flag_set("is_sliding");
    player thread scripts\engine\utility::playsoundonentity("foot_slide_plr_start");
    player thread play_loop_sound_on_tag("foot_slide_plr_loop");
    var_f7d4dd03f8c4ac9e = isdefined(level.custom_linkto_slide);
    if (!isdefined(velocity)) {
        velocity = player getvelocity() + (0, 0, -10);
    }
    if (!isdefined(var_82ebfb9873bebd03)) {
        var_82ebfb9873bebd03 = 10;
    }
    if (!isdefined(var_f8d869e874843e58)) {
        var_f8d869e874843e58 = 0.035;
    }
    assert(!isdefined(player.slidemodel));
    slidemodel = spawn("script_origin", player.origin);
    slidemodel.angles = player.angles;
    player.slidemodel = slidemodel;
    slidemodel moveslide((0, 0, 15), 15, velocity);
    if (var_f7d4dd03f8c4ac9e) {
        player playerlinktoblend(slidemodel, undefined, 1);
    } else {
        player playerlinkto(slidemodel);
    }
    player val::set("slide_legacy", "weapon", 0);
    player val::set("slide_legacy", "prone", 0);
    player val::set("slide_legacy", "crouch", 1);
    player val::set("slide_legacy", "stand", 0);
    player thread doslide(slidemodel, var_82ebfb9873bebd03, var_f8d869e874843e58);
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d2
// Size: 0xae
function endslidinglegacy() {
    assert(isplayer(self));
    player = self;
    assert(isdefined(player.slidemodel));
    player notify("stop sound" + "foot_slide_plr_loop");
    player thread scripts\engine\utility::playsoundonentity("foot_slide_plr_end");
    player unlink();
    player setvelocity(player.slidemodel.slidevelocity);
    player.slidemodel delete();
    player val::reset_all("slide_legacy");
    player notify("stop_sliding");
    if (player function_a9ae329ed6dd3a61()) {
        player ent_flag_clear("is_sliding");
    }
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1388
// Size: 0x89
function trigger_slide(trigger) {
    setdvarifuninitialized(@"hash_4c481f7e26afb913", 0);
    /#
        setdvarifuninitialized(@"hash_69fdaf7cc701b6b", 0);
    #/
    trigger.script_gesture = default_to(trigger.script_gesture, "ges_slide");
    while (true) {
        trigger waittill("trigger", player);
        if (!isdefined(player)) {
            continue;
        }
        if (!isplayer(player)) {
            continue;
        }
        player thread slidetriggerplayerthink(trigger);
    }
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1419
// Size: 0x11b
function function_4ded73402b984ff9(surfacetype) {
    var_79472d5460618081 = "slide_start_plr";
    if (isdefined(surfacetype)) {
        if (surfacetype == "wet") {
            var_79472d5460618081 = "slide_plr_dam_wall_wet_start";
        } else if (surfacetype == "dry") {
            var_79472d5460618081 = "slide_plr_dam_wall_dry_start";
        }
        if (soundexists(var_79472d5460618081)) {
            thread scripts\engine\utility::playsoundonentity(var_79472d5460618081);
        }
        return;
    }
    var_73b8384749fff985 = create_contents(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1);
    var_7fd3c1694ff5e9de = ray_trace(level.player geteye() + (0, 0, 200), level.player geteye() - (0, 0, 100), level.player, var_73b8384749fff985, 1);
    if (isdefined(var_7fd3c1694ff5e9de)) {
        surface = function_2e84a570d6af300a(var_7fd3c1694ff5e9de["surfacetype"], "surftype_");
        if (isdefined(surface)) {
            level.var_710e62dd77639361 = surface;
        }
    }
    if (isdefined(level.var_710e62dd77639361)) {
        self playsurfacesound(var_79472d5460618081, level.var_710e62dd77639361);
    }
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x153c
// Size: 0x78
function function_ddf979aedbe53699(surfacetype) {
    var_56354f06d65eef1f = "slide_loop_plr";
    if (isdefined(surfacetype)) {
        if (surfacetype == "wet") {
            var_56354f06d65eef1f = "slide_plr_dam_wall_wet";
        } else if (surfacetype == "dry") {
            var_56354f06d65eef1f = "slide_plr_dam_wall_dry";
        }
        if (soundexists(var_56354f06d65eef1f)) {
            thread scripts\engine\utility::play_loop_sound_on_entity(var_56354f06d65eef1f);
        }
        return;
    }
    if (isdefined(level.var_710e62dd77639361)) {
        self playsurfacesound(var_56354f06d65eef1f, level.var_710e62dd77639361);
    }
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15bc
// Size: 0xa8
function function_215b249240166e44(surfacetype) {
    var_56354f06d65eef1f = "slide_loop_plr";
    var_fdee60d39b96cce6 = "slide_ease_out_plr";
    if (isdefined(surfacetype)) {
        if (surfacetype == "wet") {
            var_56354f06d65eef1f = "slide_plr_dam_wall_wet";
            var_fdee60d39b96cce6 = "slide_plr_dam_wall_wet_ease_out";
        } else if (surfacetype == "dry") {
            var_56354f06d65eef1f = "slide_plr_dam_wall_dry";
            var_fdee60d39b96cce6 = "slide_plr_dam_wall_dry_ease_out";
        }
        thread scripts\engine\utility::stop_loop_sound_on_entity(var_56354f06d65eef1f);
        if (soundexists(var_fdee60d39b96cce6)) {
            thread scripts\engine\utility::playsoundonentity(var_fdee60d39b96cce6);
        }
        return;
    }
    thread scripts\engine\utility::stop_loop_sound_on_entity(var_56354f06d65eef1f);
    if (isdefined(level.var_710e62dd77639361)) {
        self playsurfacesound(var_fdee60d39b96cce6, level.var_710e62dd77639361);
    }
}

// Namespace namespace_addbcd7d5a4b8ac1 / namespace_7b69f911b6d80230
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166c
// Size: 0x12f
function function_572b7fa13e251ec9() {
    last_pos = (0, 0, 0);
    var_7ea79e4ad3f2f3f9 = "";
    text = "";
    pos_array = [];
    while (true) {
        if (isdefined(self.slidemodel)) {
            parent = self getlinkedparent();
            last_pos = self.slidemodel.origin;
            pos_array[pos_array.size] = last_pos;
            /#
                var_7ea79e4ad3f2f3f9 = "<dev string:x2c>" + self.slidemodel getentitynumber();
            #/
            text = var_7ea79e4ad3f2f3f9;
        } else {
            text = var_7ea79e4ad3f2f3f9 + " DELETED";
        }
        /#
            debugstar(last_pos, (1, 1, 0), 1, text);
            if (pos_array.size >= 2) {
                for (i = 1; i < pos_array.size; i++) {
                    if (i % 2) {
                        color = (1, 1, 0);
                    } else {
                        color = (1, 0, 1);
                    }
                    line(pos_array[i - 1], pos_array[i], color);
                }
            }
        #/
        waitframe();
    }
}

