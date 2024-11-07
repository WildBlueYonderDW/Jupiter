#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_snakecam.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using script_2c075d80ec62e503;
#using script_71332a5b74214116;
#using scripts\cp\coop_personal_ents.gsc;

#namespace namespace_c9c9780506580f5a;

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3
// Size: 0x8c
function function_53ab5dd012d67963() {
    level.var_5f4060aac4473ec4 = getentarray("enemy_cam", "targetname");
    if (isdefined(level.var_5f4060aac4473ec4) && level.var_5f4060aac4473ec4.size > 0) {
        array_thread_amortized(level.var_5f4060aac4473ec4, &function_35e7a47dcc0a0e1c, 0.1);
        array_thread_amortized(level.var_5f4060aac4473ec4, &function_a159676f4a7d4782, 0.1);
        array_thread_amortized(level.var_5f4060aac4473ec4, &function_6a99e314e438fe9, 0.1);
        namespace_ae34222dcb9dda53::function_db25531fe9ac9980();
    }
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x247
// Size: 0x49
function function_db25531fe9ac9980() {
    namespace_a3902e911697e714::registerinteraction("enemy_cam_disable", &function_4639b73e8f9a49d7, &function_cd9c16ff4b5a2d18, &function_3c538df6803129e2, 0);
    scripts\cp\coop_personal_ents::registerpentparams("enemy_cam_disable", "HINT_BUTTON", undefined, %SNAKECAM/USE, undefined, "duration_long", "hide", 400, 65, 110, 65);
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x298
// Size: 0xa7
function function_3c538df6803129e2(var_25eec91edef511dd) {
    level endon("game_ended");
    precacheshader("nightvision_overlay_goggles_grain");
    precacherumble("cp_wheelson_rumble");
    level.pentskipfov["enemy_cam_disable"] = 1;
    foreach (var_df071553d0996ff9 in var_25eec91edef511dd) {
        var_df071553d0996ff9.p_ent_skip_fov = 1;
        var_df071553d0996ff9.benabled = 1;
        namespace_a3902e911697e714::remove_from_current_interaction_list(var_df071553d0996ff9);
        scripts\cp\coop_personal_ents::addtopersonalinteractionlist(var_df071553d0996ff9);
    }
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x347
// Size: 0x18
function function_4639b73e8f9a49d7(var_df071553d0996ff9, player) {
    return %SNAKECAM/USE;
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x368
// Size: 0x3d
function function_cd9c16ff4b5a2d18(var_df071553d0996ff9, player) {
    player endon("disconnect");
    if (!istrue(var_df071553d0996ff9.benabled)) {
        return;
    }
    var_df071553d0996ff9.benabled = undefined;
    level notify("trigger_cam_disable");
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ad
// Size: 0x85
function function_a159676f4a7d4782() {
    level endon("cameras_disabled");
    level endon("death");
    while (true) {
        foreach (player in level.players) {
            if (player sightconetrace(self.origin, self)) {
                iprintln(" CAMERA SPOTTED A PLAYER!! ");
            }
        }
        wait 0.5;
    }
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x43a
// Size: 0xa6
function function_c625ac772b755445(start, dot, dot_only, ignore_ent) {
    self endon("death");
    if (!isdefined(dot)) {
        dot = 0.8;
    }
    end = self.origin + anglestoforward(self.angles) * 1024;
    thread draw_line_for_time(start, end, 1, 0, 0, 5);
    results = scripts\engine\trace::ray_trace_detail(start, end, ignore_ent, scripts\engine\trace::create_character_contents());
    if (isdefined(results["entity"]) && isplayer(results["entity"])) {
        return true;
    }
    return false;
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e9
// Size: 0x23
function function_6a99e314e438fe9() {
    level endon("death");
    level endon("cameras_disabled");
    level waittill("trigger_cam_disable");
    wait 2;
    level notify("cameras_disabled");
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x514
// Size: 0x4b6
function function_35e7a47dcc0a0e1c() {
    level endon("cameras_disabled");
    level endon("death");
    og_angles = self.angles;
    minpitch = -90;
    maxpitch = 90;
    var_cb6680317be1e374 = 90;
    var_aae6a37f78b5674 = 90;
    minyaw = og_angles[1] - var_cb6680317be1e374;
    maxyaw = og_angles[1] + var_cb6680317be1e374;
    minroll = og_angles[2] - var_aae6a37f78b5674;
    maxroll = og_angles[2] + var_aae6a37f78b5674;
    var_827abacd5ca8f6b3 = 20;
    var_594240552b896878 = 90;
    var_440ebeeb83bd05a8 = 0.6;
    var_75eb1524afeb7f2b = 0.8;
    var_c9ff6eeaaf645cee = 10;
    var_2fca29730a69ee8a = 4;
    var_e47ae22ec47fcedb = 1.2;
    var_d296b0eaf4a6b00f = [0, 0];
    var_d5e6310914396ac3 = 0.2;
    var_848e35f763ce65b0 = 0.2;
    var_91ab80bc6772504d = 0;
    self hudoutlineenable("outlinefill_depth_cyan");
    while (true) {
        currentangles = og_angles;
        var_b4f55166f66361e9 = self.angles;
        input = [-1, 1];
        multiplier = 0;
        var_e2dda8ff32bb022 = (input[0], input[1], 0);
        var_e2dda8ff32bb022 = length(var_e2dda8ff32bb022);
        var_5eb5724f78d37c4c = math::factor_value(var_848e35f763ce65b0, var_d5e6310914396ac3, var_e2dda8ff32bb022);
        var_d296b0eaf4a6b00f[0] = math::lerp(var_d296b0eaf4a6b00f[0], input[0], var_5eb5724f78d37c4c);
        var_d296b0eaf4a6b00f[1] = math::lerp(var_d296b0eaf4a6b00f[1], input[1], var_5eb5724f78d37c4c);
        if (currentangles[0] > 0 && var_d296b0eaf4a6b00f[0] < 0) {
            var_13a3fd6ddfa8548f = 1 - math::normalize_value(maxpitch * var_440ebeeb83bd05a8, maxpitch, currentangles[0]);
        } else if (currentangles[0] < 0 && var_d296b0eaf4a6b00f[0] > 0) {
            var_13a3fd6ddfa8548f = math::normalize_value(minpitch, minpitch * var_440ebeeb83bd05a8, currentangles[0]);
        } else {
            var_13a3fd6ddfa8548f = 1;
        }
        if (currentangles[1] > og_angles[1] && var_d296b0eaf4a6b00f[1] < 0) {
            var_8366082d034c6132 = 1 - math::normalize_value(maxyaw - var_cb6680317be1e374 * var_75eb1524afeb7f2b, maxyaw, currentangles[1]);
        } else if (currentangles[1] < og_angles[1] && var_d296b0eaf4a6b00f[1] > 0) {
            var_8366082d034c6132 = math::normalize_value(minyaw, minyaw + var_cb6680317be1e374 * var_75eb1524afeb7f2b, currentangles[1]);
        } else {
            var_8366082d034c6132 = 1;
        }
        var_9210ceace4810322 = var_d296b0eaf4a6b00f[1] * -1;
        var_181570543b8da6f7 = currentangles[1] + var_2fca29730a69ee8a * var_9210ceace4810322 * var_8366082d034c6132;
        if (var_181570543b8da6f7 > og_angles[1]) {
            multiplier = math::normalized_float_smooth_out(math::normalize_value(og_angles[1], maxyaw, var_181570543b8da6f7)) * -1;
        }
        if (var_181570543b8da6f7 < og_angles[1]) {
            multiplier = 1 - math::normalized_float_smooth_in(math::normalize_value(minyaw, og_angles[1], var_181570543b8da6f7));
        }
        var_a810b9620521c338 = input[1];
        var_d7f62313ffe99d1f = og_angles[2] + var_594240552b896878 * multiplier;
        maxroll *= multiplier;
        var_181570543b8da6f7 = clamp(var_181570543b8da6f7, minyaw, maxyaw);
        var_74eedd477f94f3a3 = var_d296b0eaf4a6b00f[0] * -1;
        var_6bf51480c3252112 = currentangles[0] + var_e47ae22ec47fcedb * var_74eedd477f94f3a3 * var_13a3fd6ddfa8548f;
        var_bc4b977758b3324e = minpitch;
        var_2f22df6828a1bcb0 = maxpitch;
        var_6bf51480c3252112 = clamp(var_6bf51480c3252112, var_bc4b977758b3324e, var_2f22df6828a1bcb0);
        var_6612315290576b0f = (var_6bf51480c3252112, var_181570543b8da6f7, var_d7f62313ffe99d1f);
        var_122923b7fd027a6f = length(var_6612315290576b0f - self.angles);
        var_122923b7fd027a6f = math::normalize_value(0, 1.5, var_122923b7fd027a6f);
        var_4d8cd161a8eaadc2 = math::factor_value(0, 0.105, var_122923b7fd027a6f);
        rumble = math::factor_value(0, 0.08, var_122923b7fd027a6f);
        volume = math::factor_value(0, 0.2, var_122923b7fd027a6f);
        height = 1 - rumble;
        height *= 1000;
        self rotateto(var_6612315290576b0f, 2);
        var_1b9b8daf429dd199 = self.origin + anglestoforward(self.angles) * 12 + anglestoup(self.angles) * -55 + (0, 0, 3);
        wait 2;
    }
}

