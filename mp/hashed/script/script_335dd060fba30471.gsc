#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_4eaf0d39dd04e26c;
#using script_3491e1b8d5574372;
#using script_46f1b15f3a7f2f08;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\common\lighting.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_b9066970e98b4e6;

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x998
// Size: 0x129
function main() {
    namespace_da6a716c283f009c::main();
    namespace_b7afbeeb864404dc::main();
    namespace_5f36ed7b59379fca::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_drivethru");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    scripts\cp_mp\utility\game_utility::registersmallmap();
    level thread function_31dc060e85f4a689();
    level thread function_1682cf22619a5e55();
    level thread fun_machine();
    level thread function_98d7d107ecc37654();
    level.var_b6a3186c09d2dd34 = getentarray("dcover_invalid", "targetname");
    precachemodel("jup_appliance_control_panel_graphic_button_green_01");
    precachemodel("jup_appliance_control_panel_graphic_button_01");
    precachemodel("jup_appliance_control_panel_graphic_button_01_off");
    precachemodel("jup_vfx_electronics_com_tv2_drivethru_01_static");
    precachemodel("jup_vfx_electronics_com_tv2_drivethru_01");
    precachemodel("jup_vfx_electronics_com_tv2_drivethru_02_static");
    precachemodel("jup_vfx_electronics_com_tv2_drivethru_02");
    level thread function_8dd0fecd1ff9c9ad();
    level thread function_cdefe9ef996be481();
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac9
// Size: 0x348
function fun_machine() {
    level.fun_machine = getent("fun_machine", "targetname");
    level.var_4a51442c0d858e07 = getent("speaker_sound_loc", "targetname");
    level.var_b499d9387eee3930 = getentarray(level.fun_machine.target, "targetname");
    var_71d17ed53a544dbe = getentarray("carousellights", "script_noteworthy");
    foreach (thing in level.var_b499d9387eee3930) {
        thing linkto(level.fun_machine);
    }
    foreach (thing in var_71d17ed53a544dbe) {
        thing linkto(level.fun_machine);
    }
    level.var_e9872142c2eace7 = getent("easter_egg_big_duck", "targetname");
    level.var_ec66cc51e59069d = getentarray("easter_egg_active_up_lights", "targetname");
    if (isdefined(level.var_ec66cc51e59069d)) {
        foreach (light in level.var_ec66cc51e59069d) {
            light linkto(level.var_e9872142c2eace7, "tag_origin");
        }
    }
    if (isdefined(level.var_e9872142c2eace7)) {
        level.var_e9872142c2eace7 linkto(level.fun_machine);
        level.var_e9872142c2eace7 hide();
    }
    var_afc12f05ce5a1eec = getbasegametype();
    if (var_afc12f05ce5a1eec == "hq") {
        var_28464693a2d3550c = getent("Carousel", "script_noteworthy");
        var_d16ed91a0de59551 = getentarray("hqloc", "targetname");
        foreach (site in var_d16ed91a0de59551) {
            if (site istouching(var_28464693a2d3550c)) {
                var_210b0bcbe41c5898 = getentarray(site.target, "targetname");
                site linkto(level.fun_machine);
                foreach (col in var_210b0bcbe41c5898) {
                    col linkto(level.fun_machine);
                }
            }
        }
    }
    scripts\cp_mp\utility\killstreak_utility::function_2c70bfb1b580e8e0(&function_40b13ec476b59230);
    wait 1;
    var_61a8e726ad4380da = 1;
    level.fun_machine thread function_d9f78a611c4686bb(var_61a8e726ad4380da);
    level.fun_machine thread function_bb96f5c1668f85a8(var_61a8e726ad4380da);
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe19
// Size: 0x33
function function_40b13ec476b59230(movingplatforment) {
    if (!isdefined(movingplatforment)) {
        return 0;
    }
    if (level.fun_machine == movingplatforment) {
        return 1;
    }
    return utility::array_contains(level.var_b499d9387eee3930, movingplatforment);
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe55
// Size: 0x1ce
function function_bb96f5c1668f85a8(state) {
    var_6a9897a35d61e4e6 = getstruct("fun_machine_button_interact", "targetname");
    button = getent("fun_machine_button", "targetname");
    var_99d9fd5e50f6716f = getstruct(button.target, "targetname");
    var_c48b2f68d8501bb2 = button.angles;
    var_4ee952c8b91aa5e7 = var_99d9fd5e50f6716f.angles;
    off_model = "jup_appliance_control_panel_graphic_button_01_off";
    var_898f403576ec49aa = "jup_appliance_control_panel_graphic_button_green_01";
    var_3aa9f27ae71e6c6a = "jup_appliance_control_panel_graphic_button_01";
    carousel_on_button = getent("carousel_on_button", "targetname");
    carousel_off_button = getent("carousel_off_button", "targetname");
    carousel_on_button setmodel(var_898f403576ec49aa);
    carousel_off_button setmodel(off_model);
    while (true) {
        var_d9d18399e818434a = scripts\mp\gameobjects::createhintobject(var_6a9897a35d61e4e6.origin, "HINT_BUTTON", undefined, %MP_JUP_DRIVETHRU/CAROUSEL_OFF_HINT);
        var_d9d18399e818434a waittill("trigger");
        var_d9d18399e818434a delete();
        button thread function_7fd2a8a6e2f337ab(var_4ee952c8b91aa5e7);
        thread function_77c5bd936b9b3a50();
        carousel_on_button setmodel(off_model);
        carousel_off_button setmodel(var_3aa9f27ae71e6c6a);
        var_61a8e726ad4380da = 0;
        wait 5;
        var_1f95735ed3bef0ac = scripts\mp\gameobjects::createhintobject(var_6a9897a35d61e4e6.origin, "HINT_BUTTON", undefined, %MP_JUP_DRIVETHRU/CAROUSEL_ON_HINT);
        var_1f95735ed3bef0ac waittill("trigger");
        var_1f95735ed3bef0ac delete();
        button thread function_7fd2a8a6e2f337ab(var_c48b2f68d8501bb2);
        var_61a8e726ad4380da = 1;
        thread function_d9f78a611c4686bb(var_61a8e726ad4380da);
        carousel_on_button setmodel(var_898f403576ec49aa);
        carousel_off_button setmodel(off_model);
        wait 5;
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x102b
// Size: 0x103
function function_d9f78a611c4686bb(state) {
    self endon("deactive");
    rotate_angle = 18;
    rotate_time = 1.75;
    level.var_86430c69d883dd69 = spawn_script_origin((86, 575, 799), (0, 0, 0));
    self playsound("carousel_motor_start");
    level.var_4a51442c0d858e07 playsound("amb_mp_drivethru_carousel_music_speaker_start");
    playsoundatpos((86, 575, 799), "amb_emt_drivethru_rotating_sign_start");
    self rotateyaw(rotate_angle, rotate_time, 1.5, 0.25);
    wait 1.75;
    self playloopsound("carousel_motor_loop");
    level.var_4a51442c0d858e07 playloopsound("amb_mp_drivethru_carousel_music_lp");
    if (isdefined(level.var_86430c69d883dd69)) {
        level.var_86430c69d883dd69 playloopsound("amb_emt_drivethru_rotating_sign_lp");
    }
    while (true) {
        self rotateyaw(rotate_angle, rotate_time);
        self waittill("rotatedone");
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1136
// Size: 0xac
function function_77c5bd936b9b3a50() {
    wait 1.75;
    self stoploopsound("carousel_motor_loop");
    level.var_4a51442c0d858e07 stoploopsound("amb_mp_drivethru_carousel_music_lp");
    if (isdefined(level.var_86430c69d883dd69)) {
        level.var_86430c69d883dd69 stoploopsound("amb_emt_drivethru_rotating_sign_lp");
        level.var_86430c69d883dd69 delete();
    }
    self playsound("carousel_motor_stop");
    level.var_4a51442c0d858e07 playsound("amb_mp_drivethru_carousel_music_speaker_stop");
    playsoundatpos((86, 575, 799), "amb_emt_drivethru_rotating_sign_stop");
    self notify("deactive");
    self rotateyaw(-0.75, 1, 0, 0.75);
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11ea
// Size: 0x24
function function_7fd2a8a6e2f337ab(angle) {
    self playsound("carousel_toggle_switch");
    self rotateto(angle, 0.25);
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1216
// Size: 0x40
function function_1682cf22619a5e55() {
    level waittill("infil_setup_complete");
    var_6120df12544987e8 = getent("static_infil_van", "targetname");
    if (gameflag("infil_will_run") && isdefined(var_6120df12544987e8)) {
        var_6120df12544987e8 hide();
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125e
// Size: 0x3d8
function function_98d7d107ecc37654() {
    sign_lights = getentarray("sign_lights", "targetname");
    sign_face_lights = getentarray("sign_face_lights", "targetname");
    foreach (light in sign_lights) {
        light thread scripts\common\lighting::function_70a9f70afd49dead(0.25, 0.25);
    }
    foreach (var_d59468dc21cc5cf in sign_face_lights) {
        var_d59468dc21cc5cf thread scripts\common\lighting::function_70a9f70afd49dead(0.25, 0.8);
    }
    while (true) {
        intensity = randomfloatrange(0.15, 0.2);
        var_4d3801966a2e47d1 = randomfloatrange(0.3, 0.35);
        time = randomfloatrange(4, 4.1);
        wait time;
        foreach (light in sign_lights) {
            light thread scripts\common\lighting::function_70a9f70afd49dead(0.1, intensity);
        }
        foreach (var_d59468dc21cc5cf in sign_face_lights) {
            var_d59468dc21cc5cf thread scripts\common\lighting::function_70a9f70afd49dead(0.1, var_4d3801966a2e47d1);
        }
        time = randomfloatrange(4, 4.1);
        wait time;
        foreach (light in sign_lights) {
            light thread scripts\common\lighting::function_70a9f70afd49dead(0.05, 0.25);
            playsoundatpos((-534, -287, 421), "amb_emt_funnys_sign_flicker");
        }
        foreach (var_d59468dc21cc5cf in sign_face_lights) {
            var_d59468dc21cc5cf thread scripts\common\lighting::function_70a9f70afd49dead(0.05, 0.8);
        }
        wait 0.25;
        foreach (light in sign_lights) {
            light thread scripts\common\lighting::function_70a9f70afd49dead(0.05, intensity);
        }
        foreach (var_d59468dc21cc5cf in sign_face_lights) {
            var_d59468dc21cc5cf thread scripts\common\lighting::function_70a9f70afd49dead(0.05, var_4d3801966a2e47d1);
        }
        wait 0.25;
        foreach (light in sign_lights) {
            light thread scripts\common\lighting::function_70a9f70afd49dead(0.025, 0.25);
        }
        foreach (var_d59468dc21cc5cf in sign_face_lights) {
            var_d59468dc21cc5cf thread scripts\common\lighting::function_70a9f70afd49dead(0.025, 0.8);
        }
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163e
// Size: 0x93
function function_cdefe9ef996be481() {
    var_23c4a8f2bad953e6 = "jup_vfx_electronics_com_tv2_drivethru_01";
    var_618a146d9b4a2777 = "jup_vfx_electronics_com_tv2_drivethru_01_static";
    var_5cd3f7504c46ffb = "jup_vfx_electronics_com_tv2_drivethru_02";
    var_44edae92f155630 = "jup_vfx_electronics_com_tv2_drivethru_02_static";
    pickup_room_tv = getent("pickup_room_tv", "targetname");
    break_room_tv = getent("break_room_tv", "targetname");
    waitframe();
    if (isdefined(pickup_room_tv)) {
        pickup_room_tv thread function_60f3ea12bac7b984(var_23c4a8f2bad953e6, var_618a146d9b4a2777);
    }
    if (isdefined(break_room_tv)) {
        break_room_tv thread function_60f3ea12bac7b984(var_5cd3f7504c46ffb, var_44edae92f155630);
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16d9
// Size: 0x95
function function_60f3ea12bac7b984(clear, static) {
    self playloopsound("amb_emt_cctv_monitor_static_lp");
    time = randomfloatrange(0.5, 3);
    wait time;
    while (true) {
        self setmodel(clear);
        self playsound("amb_emt_cctv_monitor_static_burst");
        self stoploopsound("amb_emt_cctv_monitor_static_lp");
        time = randomfloatrange(0.5, 3);
        wait time;
        self setmodel(static);
        self playloopsound("amb_emt_cctv_monitor_static_lp");
        time = randomfloatrange(0.5, 3);
        wait time;
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1776
// Size: 0x29c
function function_8dd0fecd1ff9c9ad() {
    flag_init("flag_easter_egg_trig_1");
    flag_init("flag_easter_egg_trig_2");
    flag_init("flag_easter_egg_trig_3");
    flag_init("flag_easter_egg_trig_4");
    waitframe();
    foreach (ent in level.var_b499d9387eee3930) {
        if (isdefined(ent.script_noteworthy)) {
            istrigger = ent.script_noteworthy == "easter_egg_trig_1" || ent.script_noteworthy == "easter_egg_trig_2" || ent.script_noteworthy == "easter_egg_trig_3" || ent.script_noteworthy == "easter_egg_trig_4";
            if (istrigger) {
                ent notsolid();
                ent thread function_28dc48f473b31f30();
            }
        }
    }
    var_ed2572655fc2d2c0 = getentarray("easter_egg_fries", "script_noteworthy");
    easter_egg_duck_loc = getstruct("easter_egg_duck_loc", "targetname");
    var_146cc960bad141d2 = getstructarray("eg_confetti_loc", "targetname");
    var_5a5e397611c21191 = getstruct("eg_roof_confetti_loc", "targetname");
    flag_wait_all("flag_easter_egg_trig_1", "flag_easter_egg_trig_2", "flag_easter_egg_trig_3", "flag_easter_egg_trig_4");
    foreach (var_ed8a4f03e8cb0394 in var_ed2572655fc2d2c0) {
        var_ed8a4f03e8cb0394 hide();
    }
    if (isdefined(level.var_e9872142c2eace7)) {
        level.var_e9872142c2eace7 show();
        playsoundatpos(level.var_e9872142c2eace7.origin, "mp_jup_bait_big_duck_appear");
        if (isdefined(var_146cc960bad141d2)) {
            foreach (loc in var_146cc960bad141d2) {
                playfx(getfx("carousel_confetti"), loc.origin);
            }
        }
        if (isdefined(var_5a5e397611c21191)) {
            playfx(getfx("roof_confetti"), var_5a5e397611c21191.origin);
        }
        thread function_ab40957f314a872b();
    }
    level notify("easter_egg_triggered");
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1a
// Size: 0x108
function function_28dc48f473b31f30() {
    level endon("easter_egg_triggered");
    while (true) {
        var_c22b3b81eaead8f = self getistouchingentities(level.players);
        if (!isdefined(var_c22b3b81eaead8f)) {
            iprintlnbold("flag_cleared");
            flag_clear("flag_" + self.script_noteworthy);
            return;
        }
        if (isarray(var_c22b3b81eaead8f)) {
            foreach (ent in var_c22b3b81eaead8f) {
                if (isplayer(ent)) {
                    flag_set("flag_" + self.script_noteworthy);
                    function_e9e8d0b6a3b254af(self, ent);
                }
            }
        } else if (isplayer(ent)) {
            flag_set("flag_" + self.script_noteworthy);
            function_e9e8d0b6a3b254af(self, ent);
        }
        flag_clear("flag_" + self.script_noteworthy);
        waitframe();
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2a
// Size: 0x36
function function_e9e8d0b6a3b254af(trig, player) {
    level endon("easter_egg_triggered");
    player endon("death");
    player endon("disconnect");
    while (player istouching(trig)) {
        waitframe();
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b69
// Size: 0x13c
function function_ab40957f314a872b() {
    easter_egg_base_lights = getentarray("easter_egg_base_lights", "targetname");
    easter_egg_up_lights = getentarray("easter_egg_up_lights", "targetname");
    waitframe();
    if (isdefined(easter_egg_base_lights)) {
        foreach (light in easter_egg_base_lights) {
            light thread scripts\common\lighting::function_70a9f70afd49dead(0, 0);
        }
    }
    if (isdefined(easter_egg_up_lights)) {
        foreach (light in easter_egg_up_lights) {
            light thread scripts\common\lighting::function_70a9f70afd49dead(0, 0);
        }
    }
    if (isdefined(level.var_ec66cc51e59069d)) {
        foreach (light in level.var_ec66cc51e59069d) {
            light thread scripts\common\lighting::function_70a9f70afd49dead(0.25, 4.62);
        }
    }
}

// Namespace namespace_b9066970e98b4e6 / namespace_9c3825889cf61349
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cad
// Size: 0x184
function function_31dc060e85f4a689() {
    level.var_69ce64f9d9c5dfb9 = 1;
    spawns = [];
    switch (getbasegametype()) {
    case #"hash_1a5d186c17c00d3c":
        break;
    case #"hash_a1313b745c17c07e":
        break;
    case #"hash_fa50b0f6bd82e972":
    case #"hash_fa50baf6bd82f930":
        break;
    case #"hash_2fcf99fb5dbdcffb":
    case #"hash_3a17de6e294210d2":
    case #"hash_515260130b210bff":
    case #"hash_7485fa6c474ec865":
    case #"hash_973d1db8b6644466":
    case #"hash_b0eb18371d980895":
    case #"hash_b9458959b10637f8":
    case #"hash_c3668076a0827ce0":
    case #"hash_dd5b900f435d3f36":
    case #"hash_ddd385f0a27d71bb":
    case #"hash_ea061d29bbd1f237":
    case #"hash_ec24570718a340f5":
        break;
    case #"hash_6efb0f59a62300fb":
    case #"hash_fa34c5f6bd6d4432":
        break;
    case #"hash_c51506c10984515":
    case #"hash_21eed743fb721f4a":
    case #"hash_31104ebc01bd9ba9":
    case #"hash_3696c16c262a0862":
    case #"hash_77eb1179a728005e":
    case #"hash_fa0ed9f6bd4f4e9a":
    case #"hash_fb5b5e6c07253005":
        break;
    case #"hash_f4a9126c03d3385b":
        break;
    }
    if (spawns.size > 0) {
        scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
    }
}

