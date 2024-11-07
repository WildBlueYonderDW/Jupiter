#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\sp\objectives.gsc;
#using scripts\sp\anim.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\sp\trigger.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\sp\player_rig.gsc;
#using scripts\engine\sp\utility.gsc;
#using script_5d265b4fca61f070;
#using scripts\sp\utility.gsc;
#using scripts\sp\spawner.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\values.gsc;
#using script_71c25d05786afae;
#using script_2fb125f33ae903e1;
#using scripts\aitypes\stealth.gsc;
#using script_241186ef69e7c746;
#using script_1edc53f892c6bfbc;
#using script_488d21b7496f0fa3;
#using script_1f0719e169da7fca;
#using script_124cf041343957be;
#using script_24f891686f6e6d8e;
#using scripts\sp\load.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\sp\player_death.gsc;
#using scripts\sp\player.gsc;
#using script_7e4d332e911e1b90;
#using script_3433ee6b63c7e243;
#using scripts\stealth\manager.gsc;
#using scripts\stealth\corpse.gsc;
#using scripts\sp\hud_util.gsc;
#using scripts\common\scene.gsc;
#using scripts\sp\door.gsc;
#using scripts\common\vehicle_code.gsc;

#namespace sp_jup_milbase;

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2af9
// Size: 0xed
function main() {
    namespace_4e8ee5abeb2bac82::main();
    namespace_3227e4a1918d2f2::main();
    namespace_fad40c80a9714961::main();
    namespace_abbbdacdbe0b9258::main();
    thread namespace_c8b8bddad47ea676::main();
    thread namespace_e843e932ce449bb8::main();
    precache();
    function_28c6b362e045f5a();
    level._effect["vfx_jup_milbase_gas_corrosion_body"] = loadfx("vfx/jup/level/cp_jup_milbase/vfx_jup_milbase_gas_corrosion_body.vfx");
    scripts\sp\load::main();
    setup_player();
    flag_init("introscreen_start_wait");
    add_global_spawn_function("axis", &scripts\stealth\utility::set_event_override, "cover_blown", &function_c5cda0586c28c781);
    function_5b115de73eb3a8fa();
    thread function_7b04f9efd0f27d16();
    thread function_b68f028fb680b364("danger_area");
    init_callbacks();
    function_4e647c514964da47(258);
    thread function_137fc90d1f21350c();
    thread function_ec0951b0a6df0d29();
    setglobalsoundcontext("jup_map", "military_base", 0);
    function_d49df7ef7cb4fca6("fake_locked_door_outside");
    thread function_753b47a94c444738();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bee
// Size: 0x47
function function_6991e9cd31b66a0b() {
    while (true) {
        wait 1;
        var_9449ebd019ef25c2 = function_2ce1c0a896e78e0e();
        if (var_9449ebd019ef25c2 == 1) {
            /#
                iprintln("<dev string:x1c>");
            #/
            continue;
        }
        /#
            iprintln("<dev string:x28>");
        #/
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3d
// Size: 0x79
function function_753b47a94c444738() {
    blocker = getent_or_struct("lobby_blocker", "targetname");
    if (!isdefined(blocker)) {
        return;
    }
    var_926e1dae1dfb0810 = blocker.origin;
    blocker.origin += (0, 0, -400);
    flag_wait("escape_sequence_start");
    blocker.origin = var_926e1dae1dfb0810;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cbe
// Size: 0xc6
function function_7b04f9efd0f27d16() {
    if (istrue(level.var_f5e3ffafbcf7a6ff)) {
        assertex(0, "Already running out of bounds logic!");
    }
    level.player thread function_92dcd6b1e8981e72();
    level.var_f5e3ffafbcf7a6ff = 1;
    level.player ent_flag_init("out_of_bounds");
    var_6cf27e73a7ffd43 = getentarray("OutOfBounds", "targetname");
    if (var_6cf27e73a7ffd43.size == 0) {
        iprintln("Trying to track out of bounds with no triggers! Mark out of bounds areas with an \"OutOfBounds\" targetname.");
        return;
    }
    foreach (trigger in var_6cf27e73a7ffd43) {
        trigger thread function_8f2ebae90f61cb99();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d8c
// Size: 0x2b
function function_a1cbeb0b29becc97() {
    assert(isdefined(self.owner), "No owner was assigned to self!");
    self.owner utility::delete_on_death(self);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dbf
// Size: 0x6d
function function_d49df7ef7cb4fca6(var_6e9bd38a6c033623) {
    doors = getstructarray(var_6e9bd38a6c033623, "targetname");
    foreach (door in doors) {
        door thread function_3fc03acc08ced508(door);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e34
// Size: 0x5c
function function_3fc03acc08ced508(door) {
    door scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 6), %SP_JUP_MILBASE/DOOR_LOCKED, 45, 150, 50, 1);
    door waittill("trigger");
    playsoundatpos(door.origin, "sfx_door_locked");
    wait 0.3;
    door thread function_3fc03acc08ced508(door);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e98
// Size: 0xcf
function function_b68f028fb680b364(var_c669ff93d4f17a15) {
    flag_clear("in_bad_volume");
    level endon("game_ended");
    level endon("obj_yuri_completed");
    var_81400c0847fbf32f = getentarray(var_c669ff93d4f17a15, "targetname");
    while (true) {
        if (level.player is_touching_any(var_81400c0847fbf32f)) {
            if (!flag("in_bad_volume")) {
                thread function_19bbfec60a22a2be();
            }
            flag_clear("exited_bad_volume");
            flag_set("in_bad_volume");
            /#
                iprintln(var_c669ff93d4f17a15);
            #/
        } else if (flag("in_bad_volume")) {
            flag_clear("in_bad_volume");
            flag_set("exited_bad_volume");
            wait 0.25;
            flag_clear("exited_bad_volume");
        }
        wait 0.5;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f6f
// Size: 0x62
function function_19bbfec60a22a2be() {
    wait 2;
    if (flag("in_bad_volume")) {
        function_1c1b9d33706c152d(level.player, "gunshot");
        function_4e647c514964da47(261, 1);
        flag_set("flag_alarm");
        function_dc042011cd0bf02a("panic");
    }
    wait 3;
    if (flag("in_bad_volume")) {
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fd9
// Size: 0x23a
function function_8f2ebae90f61cb99() {
    var_15cc484efdd3a380 = 5;
    self endon("entitydeleted");
    if (isdefined(self.target)) {
        self.failtrigger = getent(self.target, "targetname");
        if (isdefined(self.failtrigger)) {
            self.failtrigger.owner = self;
            self.failtrigger thread function_a1cbeb0b29becc97();
        }
    }
    if (isdefined(self.script_noteworthy)) {
        level.player ent_flag_init("oob_" + self.script_noteworthy);
        thread function_dd4fa73410df3269();
    }
    while (true) {
        while (!level.player istouching(self)) {
            waitframe();
        }
        if (isdefined(self.failtrigger)) {
            self.failtrigger childthread outofbounds_failthread();
        }
        setomnvar("ui_out_of_bounds_countdown", 1);
        var_9aa63484ba2a4363 = gettime();
        level.player ent_flag_set("out_of_bounds");
        if (isdefined(self.script_noteworthy) && level.player ent_flag_exist("oob_" + self.script_noteworthy)) {
            level.player ent_flag_set("oob_" + self.script_noteworthy);
        }
        while (level.player istouching(self)) {
            if (time_has_passed(var_9aa63484ba2a4363, var_15cc484efdd3a380)) {
                setomnvar("ui_out_of_bounds_countdown", 0);
                scripts\sp\player_death::set_custom_death_quote(29);
                missionfailedwrapper();
            } else if (time_has_passed(var_9aa63484ba2a4363, 2)) {
            }
            waitframe();
        }
        setomnvar("ui_out_of_bounds_countdown", 0);
        if (isdefined(self.failtrigger)) {
            self.failtrigger notify("stop_failthread");
        }
        level.player ent_flag_clear("out_of_bounds");
        if (isdefined(self.script_noteworthy) && level.player ent_flag_exist("oob_" + self.script_noteworthy)) {
            level.player ent_flag_clear("oob_" + self.script_noteworthy);
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x321b
// Size: 0x137
function function_4e647c514964da47(val, var_581f5e80ee2656b1, var_1d4d9a41b85d4ccd) {
    if (flag("flag_alarm")) {
        return;
    }
    if (function_eac0cd99c9c6d8ee() == "spotted") {
        return;
    }
    if (!isdefined(level.var_17f2ee0c3c3ba460)) {
        level.var_17f2ee0c3c3ba460 = [];
    }
    if (!isdefined(var_581f5e80ee2656b1)) {
        var_581f5e80ee2656b1 = 0;
    }
    if (!isdefined(var_1d4d9a41b85d4ccd)) {
        var_1d4d9a41b85d4ccd = 0;
    }
    if (var_581f5e80ee2656b1) {
        level.var_17f2ee0c3c3ba460 = [];
    }
    if (!array_contains(level.var_17f2ee0c3c3ba460, val)) {
        level.var_17f2ee0c3c3ba460 = array_add(level.var_17f2ee0c3c3ba460, val);
    } else if (var_1d4d9a41b85d4ccd) {
        excludearray = [val];
        level.var_17f2ee0c3c3ba460 = array_exclude(level.var_17f2ee0c3c3ba460, excludearray);
    }
    if (flag("escape_sequence_start")) {
        level.var_17f2ee0c3c3ba460 = [259, 262];
    }
    if (level.var_17f2ee0c3c3ba460.size == 0) {
        level.var_17f2ee0c3c3ba460 = [260];
    }
    randomindex = random(level.var_17f2ee0c3c3ba460);
    scripts\sp\player_death::set_custom_death_quote(randomindex);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x335a
// Size: 0x34
function outofbounds_failthread() {
    self endon("death");
    self endon("stop_failthread");
    self waittill("trigger");
    setomnvar("ui_out_of_bounds_countdown", 0);
    scripts\sp\player_death::set_custom_death_quote(29);
    missionfailedwrapper();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3396
// Size: 0x16
function function_92dcd6b1e8981e72() {
    self waittill("death");
    setomnvar("ui_out_of_bounds_countdown", 0);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33b4
// Size: 0x43
function function_dd4fa73410df3269() {
    noteworthy = self.script_noteworthy;
    self waittill("entitydeleted");
    if (level.player ent_flag("oob_" + noteworthy)) {
        setomnvar("ui_out_of_bounds_countdown", 0);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33ff
// Size: 0xb6
function function_28c6b362e045f5a() {
    set_default_start("intro_infil");
    add_start("intro_infil", &intro_start, &intro_main, undefined, &intro_catchup);
    add_start("post_infil", &function_94a97fd91078ba34, &function_aa5913936600bb65, undefined, &function_2e5925ffc2c1737a);
    add_start("intel_arrive", &intel_start, &function_33d7eed79ffa5599, undefined, &function_7475a44642a257d6);
    add_start("pre_yuri", &function_da60a79285185f2a, &function_2147ed99a835751b, undefined, &function_841d952fccce2360);
    add_start("escape", &escape_start, &escape_main, undefined, &escape_catchup);
    add_start("reach_roof", &function_4dce195f40ae6080, &function_c491ef4666deb499, undefined, &function_6da48ae496824cd6);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34bd
// Size: 0x1d
function function_222bef19da9c23a4() {
    var_8ab9551cc453a28d = getstruct("marker_intel", "targetname");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34e2
// Size: 0xc8
function precache() {
    precachemodel("body_c_jup_sp_enemy_rusgeneral_02");
    precachemodel("head_c_jup_sp_enemy_rusgeneral_02");
    precachemodel("jup_headgear_military_cap_flat");
    precachemodel("electronics_keycard_office_01");
    precacheshader("hud_icon_conceal_weapon");
    precacheshader("hud_icon_equip_weapon");
    precachestring(%SP_JUP_MILBASE/OPENDOOR);
    precachestring(%SP_JUP_MILBASE/NEEDKEYCARD);
    precachestring(%SP_JUP_MILBASE/PICKUPKEYCARD);
    precachestring(%SP_JUP_MILBASE/OBJ_1_MILBASE);
    precachestring(%SP_JUP_MILBASE/OBJ_2_MILBASE);
    precachestring(%SP_JUP_MILBASE/OBJ_3_MILBASE);
    precachestring(%SP_JUP_MILBASE/OBJ_4_MILBASE);
    precachestring(%SP_JUP_MILBASE/OBJ_5_MILBASE);
    add_hint_string("holster_weapon", %SP_JUP_MILBASE/HOLSTER_WEAPON_HINT, &function_2ce1c0a896e78e0e);
    add_hint_string("draw_weapon", %SP_JUP_MILBASE/DRAW_WEAPON_HINT, &function_12b98953a00d3c28);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35b2
// Size: 0x10c
function setup_player() {
    function_7d89f98164b6df3d("vm_c_jup_sp_hero_laswell_bdu");
    level.player function_c4ec7d985422ce24("vb_c_jup_sp_hero_laswell_bdu");
    var_2f7136cf6c5b1b14 = ["frag", "throwingknife"];
    offhandprecache(var_2f7136cf6c5b1b14);
    startweapon = make_weapon("iw9_pi_golf17_sp_milbase", ["silencer01_pi"]);
    level.player give_weapon(startweapon);
    level.player switchtoweapon(startweapon);
    function_af55b7e6ea92f36f("iw9_gunless");
    level.player give_offhand("throwingknife", 3);
    level.player setentitysoundcontext("gender", "female", 0);
    thread function_de5ae0c94d33b9c8();
    level.player.disabletakecoverwarning = 1;
    level.player scripts\sp\player::set_player_max_health(40);
    level.player scripts\sp\player::scale_player_death_shield_duration(0.1);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36c6
// Size: 0x44
function function_49a7092b12114f4f(flag) {
    if (flag == 1) {
        movespeed = 85;
    } else {
        movespeed = 150;
    }
    player_speed_set(movespeed, 0.5);
    level.player allowsupersprint(!flag);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3712
// Size: 0x6b
function function_7d89f98164b6df3d(viewmodel, legmodel, var_1305d75b7bc7546a) {
    if (isdefined(viewmodel)) {
        level.player setviewmodel(viewmodel);
    }
    level.player utility::function_c4ec7d985422ce24(viewmodel);
    if (isdefined(legmodel)) {
        level.player setlegsmodel(legmodel);
    }
    if (isdefined(var_1305d75b7bc7546a)) {
        level.player setshadowmodel(var_1305d75b7bc7546a);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3785
// Size: 0x87
function function_32e404a8ecad92e4(start, obj, description, position, entity, zoffset) {
    if (level.start_point == start) {
        scripts\engine\sp\objectives::objective_add(obj, "current");
        if (isdefined(description)) {
            scripts\engine\sp\objectives::objective_update(obj, undefined, undefined, description);
        }
        if (isdefined(position)) {
            function_8f9c11fb706dc43a(obj, undefined, position);
        }
        if (isdefined(entity)) {
            objective_entity(obj, "" + entity getentitynumber(), entity);
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3814
// Size: 0xc5
function objective_entity(var_442990ad4662ab82, var_7071f791abc13812, entity) {
    objectiveindex = scripts\engine\sp\objectives::_objective_getindexforname(var_442990ad4662ab82);
    if (array_contains(level.objective_array[objectiveindex].locations, var_7071f791abc13812)) {
        return;
    }
    if (level.var_bd0073f0d926bb38 islinked()) {
        level.var_bd0073f0d926bb38 unlink();
    }
    level.var_bd0073f0d926bb38 linkto(entity, "tag_origin", (0, 0, 0), (0, 0, 0));
    scripts\engine\sp\objectives::objective_add_location_entity(var_442990ad4662ab82, var_7071f791abc13812, entity);
    if (isai(entity)) {
        scripts\engine\sp\objectives::objective_set_z_offset(var_442990ad4662ab82, 70);
        return;
    }
    scripts\engine\sp\objectives::objective_set_z_offset(var_442990ad4662ab82, 0);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x38e1
// Size: 0x63
function function_8f9c11fb706dc43a(var_442990ad4662ab82, var_9033cf0f49602ae6, objorigin) {
    if (level.var_bd0073f0d926bb38 islinked()) {
        level.var_bd0073f0d926bb38 unlink();
    }
    level.var_bd0073f0d926bb38.origin = objorigin;
    scripts\engine\sp\objectives::objective_add_location_position(var_442990ad4662ab82, var_9033cf0f49602ae6, objorigin);
    scripts\engine\sp\objectives::objective_set_z_offset(var_442990ad4662ab82, 0);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x394c
// Size: 0x12c
function function_6adcd56881467a22() {
    level endon("game_ended");
    i_time = 0;
    testval = 0;
    while (true) {
        var_615bb17aa1ddaeaa = getaiarrayinradius(level.player.origin, 1000);
        var_b275ff95259a26b6 = 0;
        foreach (ai in var_615bb17aa1ddaeaa) {
            if (ai.alertlevel == "combat") {
                var_b275ff95259a26b6++;
            }
        }
        if (var_b275ff95259a26b6 >= 1) {
            testval++;
            if (testval >= 20) {
                function_4e647c514964da47(260);
                break;
            }
        } else {
            testval = 0;
        }
        if (flag("obj_keycard_completed")) {
            /#
                iprintln(string(i_time));
            #/
            if (i_time <= 90) {
                level.player function_6a369480dbaf1090("jup_sp_oldhabitsdiehard");
            }
            break;
        }
        wait 0.1;
        i_time += 0.1;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a80
// Size: 0x97
function function_4e3ca6dd571fca4f(var_f82c8f3d4dddd1f5) {
    foreach (civ in var_f82c8f3d4dddd1f5) {
        civ.radius = 80;
        civ function_a2101943e5c4fc94(160, 0, 500);
        civ function_b661b022700ba72f("only_reactions", 0);
        civ.animname = "soldier";
        civ thread function_913c139144f7643e();
        civ thread function_8bf385621c6c99ab();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b1f
// Size: 0x64
function function_71587415d8be3a63() {
    civs = level.civ_intel;
    foreach (civ in civs) {
        civ function_b661b022700ba72f("systemic", 0);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b8b
// Size: 0xc1
function function_913c139144f7643e() {
    self endon("death");
    level endon("game_ended");
    wait randomfloat(8);
    while (true) {
        civstate = self function_455d48e71a3ee628();
        if (civstate == "cower") {
            flag_set("flag_alarm");
            function_dc042011cd0bf02a("panic");
            function_1c1b9d33706c152d(level.player, "gunshot");
        } else if (flag("flag_alarm")) {
            self function_a2101943e5c4fc94(400, 0, 500);
        } else {
            val = function_2ce1c0a896e78e0e();
            if (!val) {
                self function_a2101943e5c4fc94(400, 0, 500);
            } else {
                self function_a2101943e5c4fc94(80, 0, 200);
            }
        }
        wait 0.5;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c54
// Size: 0x75
function function_70555648130c4861(var_f82c8f3d4dddd1f5, var_42656418ffc1da3f) {
    foreach (civ in var_f82c8f3d4dddd1f5) {
        civ.radius = 30;
        civ thread function_e45d278809961483(var_42656418ffc1da3f);
        civ thread function_8bf385621c6c99ab();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd1
// Size: 0x142
function function_e22486c4f973154e() {
    if (!isdefined(self)) {
        return;
    }
    self endon("death");
    self function_b661b022700ba72f("script", 1);
    self.goalradius = 32;
    self.disablearrivals = 1;
    self function_d5cda8a759cc36bc("scared");
    if (isdefined(self.script_wait_min)) {
        wait self.script_wait_min;
    }
    self function_d5cda8a759cc36bc("flee");
    struct = getstruct(self.target, "targetname");
    while (isdefined(struct)) {
        self setgoalpos(struct.origin);
        self waittill("goal");
        if (isdefined(struct.target)) {
            struct = getstruct(struct.target, "targetname");
        } else {
            self function_d5cda8a759cc36bc("cower");
        }
        if (!isdefined(level.var_cbc9529c2be75444)) {
            waitframe();
            continue;
        }
        checkdist = distancesquared(self.origin, level.var_cbc9529c2be75444);
        if (checkdist < 22500) {
            self.forcelongdeath = 1;
            self dodamage(self.health + 1, self.origin, self, undefined, "MOD_RADIATION");
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1b
// Size: 0x211
function function_e45d278809961483(var_42656418ffc1da3f) {
    if (!isdefined(self)) {
        return;
    }
    self endon("death");
    self function_b661b022700ba72f("script", 1);
    self function_a2101943e5c4fc94(50, 0, 50);
    utility::demeanor_override("frantic");
    waitframe();
    self.goalradius = 32;
    self.disablearrivals = 1;
    self.disableexits = 1;
    self.ignoreall = 1;
    self function_d5cda8a759cc36bc("flee");
    set_movement_speed(300);
    struct = getstruct(self.target, "targetname");
    while (isdefined(struct) && isalive(self)) {
        self.fixednode = 1;
        self waittill("goal");
        if (isdefined(struct.script_flag_set)) {
            flag_wait(struct.script_flag_set);
            self.fixednode = 0;
        } else {
            self.fixednode = 0;
        }
        if (isdefined(struct.target)) {
            struct = getstruct(struct.target, "targetname");
        } else if (distancesquared(struct.origin, self.origin) < 1600) {
            if (struct.script_noteworthy == "delete") {
                self delete();
            } else if (struct.script_noteworthy == "kill") {
                self.forcelongdeath = 1;
                waitframe();
                self dodamage(self.health + 1, self.origin, self, undefined, "MOD_RADIATION");
            }
        }
        if (!isdefined(level.var_cbc9529c2be75444)) {
            waitframe();
            continue;
        }
        checkdist = distancesquared(self.origin, level.var_cbc9529c2be75444);
        if (checkdist < 22500) {
            self.forcelongdeath = 1;
            self dodamage(self.health + 1, self.origin, self, undefined, "MOD_RADIATION");
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4034
// Size: 0x1b
function function_50b4e768ff38899d() {
    level endon("scene_skipped");
    wait 5;
    flag_set("milbase_spawn_first_wave");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4057
// Size: 0x470
function function_fb3d1ed4bd60933b() {
    thread function_50b4e768ff38899d();
    flag_wait_any("milbase_spawn_first_wave", "scene_skipped");
    flag_set("milbase_spawn_first_wave");
    flag_set("milbase_spawn_vehicles");
    thread function_8078bf362782d5da();
    level.var_d918d6c3b8727ef6 = array_spawn_targetname("upper_civilians", 1, 1);
    thread function_4e3ca6dd571fca4f(level.var_d918d6c3b8727ef6);
    thread function_b6108624d05f4b8a(level.var_d918d6c3b8727ef6);
    level.var_d20a1d0978b11835 = array_spawn_targetname("barracks_civilians", 1, 1);
    thread function_4e3ca6dd571fca4f(level.var_d20a1d0978b11835);
    thread function_b6108624d05f4b8a(level.var_d20a1d0978b11835);
    level.var_842583262417aadf = function_3160b8745f256da8("initialspawn_soldiers");
    level.var_e8027a2623fbe240 = function_3160b8745f256da8("jltv4_crew");
    thread function_b6108624d05f4b8a(level.var_842583262417aadf);
    thread function_b6108624d05f4b8a(level.var_e8027a2623fbe240);
    foreach (ai in level.var_842583262417aadf) {
        ai add_damage_function(&function_11c28c4ded17c83e);
    }
    thread function_35aa3612a8801255();
    thread function_cd29f00dfb61d477();
    level.vehicles = [];
    level.var_d4ce7a272ba5d4b0 = spawn_vehicle_from_targetname_and_drive("jltvmg_patrol");
    level.var_d4ce7a272ba5d4b0 childthread function_7ad17ea21fe5e725("tag_seat_wm_0", "iw9_mp_veh_jltv_seat_0_idle");
    level.var_d4ce7a272ba5d4b0 childthread function_1b43b0bcf17d2544();
    thread namespace_c8b8bddad47ea676::function_66a0d36521eddcc4();
    var_d8e4a7294c6dd2cf = getent("first_jltv", "targetname");
    if (isdefined(var_d8e4a7294c6dd2cf) && isdefined(level.var_d4ce7a272ba5d4b0)) {
        var_d8e4a7294c6dd2cf.origin = level.var_d4ce7a272ba5d4b0.origin + (0, 0, 0);
        var_d8e4a7294c6dd2cf.angles = level.var_d4ce7a272ba5d4b0.angles + (0, 105, 0);
        var_d8e4a7294c6dd2cf enablelinkto();
        var_d8e4a7294c6dd2cf linkto(level.var_d4ce7a272ba5d4b0);
        level.var_d4ce7a272ba5d4b0 thread function_ce0ec9f260494203("first_jltv", "jltv_pass");
    }
    level.var_d4ce7a272ba5d4b0 thread function_efdaa03bfc25c1a0(12, 12, 8);
    level.var_890c3bde4b1b2f97 = spawn_vehicle_from_targetname_and_drive("heli_spawner_01");
    thread namespace_c8b8bddad47ea676::function_9c57b7b223b3a9e0();
    thread function_dd20f64ccd327c1f();
    level.var_a7eb2624fdb259e6 = spawn_vehicle_from_targetname_and_drive("jltvmg_patrol2");
    if (isdefined(level.var_a7eb2624fdb259e6)) {
        level.var_a7eb2624fdb259e6 childthread function_7ad17ea21fe5e725("tag_seat_wm_0", "iw9_mp_veh_jltv_seat_0_idle");
    }
    if (isdefined(level.var_a7eb2624fdb259e6)) {
        level.var_a7eb2624fdb259e6 childthread function_8a474f3ae16c3e69(0, -1);
    }
    level.vehicles[level.vehicles.size] = level.var_a7eb2624fdb259e6;
    all_ai = getaiarray();
    foreach (ai in all_ai) {
        ai setlookatentity(level.player, 0);
        ai function_f51ff412609193b9(1, "script");
    }
    thread function_d232a26a146eed38();
    thread function_4fb6c81d40937664(3, 3, "flag_alarm", &function_1bfd820c3689d206);
    thread function_586349f90915861f();
    flag_wait("intel_reached");
    thread function_db48d270f21badb0();
    thread function_c26f9aa1dbaa52d7();
    thread function_31b4e8af8fe3564a(level.var_d5bbd81395a0a261);
    wait 0.1;
    level.ai_entourage = function_3160b8745f256da8("ai_entourage");
    level.civ_intel = array_spawn_targetname("civ_intel", 1, 1);
    function_4e3ca6dd571fca4f(level.civ_intel);
    thread function_b6108624d05f4b8a(level.ai_entourage);
    thread function_b6108624d05f4b8a(level.civ_intel);
    wait 0.1;
    thread function_be972306d6fd602e("officer_meet_1");
    thread function_be972306d6fd602e("officer_meet_3");
    flag_wait("officer_dead");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44cf
// Size: 0x51
function function_c26f9aa1dbaa52d7() {
    var_3ca809a7bdc95834 = getentarray("kill_room", "targetname");
    while (true) {
        wait 0.25;
        if (level.player is_touching_any(var_3ca809a7bdc95834)) {
            thread function_31b4e8af8fe3564a(level.var_73d1e0244e4157e1);
            break;
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4528
// Size: 0x63
function function_ce0ec9f260494203(var_eaad182af1b91884, var_5e9c6d43ce0d5f51) {
    level endon(var_5e9c6d43ce0d5f51);
    add_damage_function(&function_b1b22c5bac27f30);
    trigger_wait_targetname(var_eaad182af1b91884);
    /#
        iprintln("<dev string:x33>");
    #/
    function_4e647c514964da47(265, 1);
    thread function_33c23797c51fb50d();
    childthread function_8a474f3ae16c3e69(0, -0.6);
    thread function_b68f028fb680b364(var_eaad182af1b91884);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x4593
// Size: 0x86
function function_b1b22c5bac27f30(damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon) {
    self endon("death");
    if (isplayer(attacker)) {
        flag_set("flag_alarm");
        childthread function_8a474f3ae16c3e69(0, -0.6);
        thread function_33c23797c51fb50d();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4621
// Size: 0x99
function function_33c23797c51fb50d() {
    switch (self.targetname) {
    case #"hash_6e693d48c24e303b":
        soundalias = "veh9_mil_lnd_cargo_truck_horn";
        var_d8f62f55db7468b1 = "tag_hood";
        /#
            iprintln("<dev string:x42>");
        #/
        function_57d8f7f2faddc1e8(soundalias, var_d8f62f55db7468b1);
        break;
    case #"hash_80965785c2199de0":
        soundalias = "veh9_mil_lnd_jltv_horn";
        var_d8f62f55db7468b1 = "tag_engine_fx";
        /#
            iprintln("<dev string:x4d>");
        #/
        function_57d8f7f2faddc1e8(soundalias, var_d8f62f55db7468b1);
        break;
    default:
        break;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46c2
// Size: 0x2e
function function_57d8f7f2faddc1e8(soundalias, var_d8f62f55db7468b1) {
    /#
        iprintln(self.targetname);
    #/
    play_sound_on_tag(soundalias, var_d8f62f55db7468b1);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46f8
// Size: 0x328
function function_cd29f00dfb61d477() {
    spawner = getent("jltvmg_patrol4", "targetname");
    spawner.origin += (0, 0, 175);
    level.var_a7eb2824fdb25e4c = spawn_vehicle_from_targetname_and_drive("jltvmg_patrol4");
    level.var_a7eb2824fdb25e4c childthread function_7ad17ea21fe5e725("tag_seat_wm_0", "iw9_mp_veh_jltv_seat_0_idle");
    level.var_a7eb2824fdb25e4c thread function_1b43b0bcf17d2544();
    level.var_a7eb2824fdb25e4c add_damage_function(&function_b1b22c5bac27f30);
    var_d8e4a7294c6dd2cf = getent("fourth_jltv", "targetname");
    if (isdefined(var_d8e4a7294c6dd2cf) && isdefined(level.var_a7eb2824fdb25e4c)) {
        var_d8e4a7294c6dd2cf.origin = level.var_a7eb2824fdb25e4c.origin + (0, 0, 0);
        var_d8e4a7294c6dd2cf.angles = level.var_a7eb2824fdb25e4c.angles + (0, 45, 0);
        var_d8e4a7294c6dd2cf enablelinkto();
        var_d8e4a7294c6dd2cf linkto(level.var_a7eb2824fdb25e4c);
        level.var_a7eb2824fdb25e4c thread function_ce0ec9f260494203("fourth_jltv", "obj_yuri_completed");
    }
    wait 0.1;
    thread function_b95aedaf10c7a714();
    level.var_a7eb2824fdb25e4c.origin += (0, 0, 125);
    level.var_a7eb2824fdb25e4c vehicle_setspeed(0);
    wait 7;
    level.var_a7eb2824fdb25e4c childthread function_8a474f3ae16c3e69(12, 0.3);
    thread namespace_c8b8bddad47ea676::function_f14533e453bdebd3();
    wait 4.5;
    level.var_a7eb2824fdb25e4c childthread function_8a474f3ae16c3e69(0, -0.3);
    flag_wait("ai_wave_1");
    wait 5;
    wait 16;
    level.var_a7eb2824fdb25e4c childthread function_8a474f3ae16c3e69(12, 0.3);
    thread namespace_c8b8bddad47ea676::function_f14534e453bdee06();
    flag_wait("jltv4_arrive");
    wait 1.5;
    level.var_a7eb2824fdb25e4c childthread function_8a474f3ae16c3e69(0, -0.3);
    wait 7;
    flag_wait("spawn_small_heli");
    level.var_a7eb2824fdb25e4c childthread function_8a474f3ae16c3e69(12, 0.3);
    thread namespace_c8b8bddad47ea676::function_f14535e453bdf039();
    flag_wait("jltv4_stop");
    thread function_b68f028fb680b364("danger_area_hill");
    if (flag("intel_reached")) {
        level.var_a7eb2824fdb25e4c thread function_72ac79ec5b67a150();
        return;
    }
    level.var_a7eb2824fdb25e4c childthread function_8a474f3ae16c3e69(0, -0.3);
    wait 2.5;
    flag_wait("officer_exit");
    level.var_a7eb2824fdb25e4c childthread function_8a474f3ae16c3e69(12, 0.3);
    thread namespace_c8b8bddad47ea676::function_f14536e453bdf26c();
    flag_wait("jltv4_park");
    level.var_a7eb2824fdb25e4c childthread function_8a474f3ae16c3e69(0, -0.3);
    flag_set("wave_1_finish");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a28
// Size: 0x32
function function_b95aedaf10c7a714() {
    trigger_wait_targetname("trigger_ai_wave_1");
    flag_wait("flag_keycard_stop");
    flag_set("jltv4_leave");
    flag_set("ai_wave_1");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a62
// Size: 0x5e
function function_72ac79ec5b67a150() {
    self endon("death");
    level.var_a7eb2824fdb25e4c thread function_8a474f3ae16c3e69(12, 0.3);
    thread namespace_c8b8bddad47ea676::function_f14536e453bdf26c();
    wait 2;
    flag_wait("jltv4_park");
    level.var_a7eb2824fdb25e4c thread function_8a474f3ae16c3e69(0, -0.3);
    flag_set("wave_1_finish");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac8
// Size: 0x395
function function_d210697d56e2f91a() {
    flag_wait("escape_sequence_start");
    level.var_d9eed51586a56f09 = array_spawn_targetname("civ_intel_escape1", 1, 1);
    function_70555648130c4861(level.var_d9eed51586a56f09, 1);
    foreach (civ in level.var_d9eed51586a56f09) {
        civ.maystumble = 0;
        civ enableavoidance(0, 0);
        civ.pushable = 0;
        civ.ignoreall = 1;
        civ.reacttobulletchance = 0;
    }
    level.var_edadd9571dd39ec1 = array_spawn_targetname("civ_intel_escape2", 1, 1);
    function_70555648130c4861(level.var_edadd9571dd39ec1, 1);
    foreach (civ in level.var_edadd9571dd39ec1) {
        civ enableavoidance(0, 0);
        civ.pushable = 0;
        civ.maystumble = 0;
        civ.reacttobulletchance = 0;
    }
    trigger_wait_targetname("gas_1");
    flag_set("move_civ_1");
    trigger_wait_targetname("gas_3");
    flag_set("move_civ_2");
    struct_array = getstructarray("extra_gas_second_floor", "targetname");
    if (struct_array.size > 0) {
        foreach (struct in struct_array) {
            var_f465860fc8f9473 = playfx(getfx("vfx_jup_milbase_greenout_gas"), struct.origin);
        }
    }
    trigger_wait_targetname("gas_5");
    level.var_edadd8571dd39c8e = spawn_targetname("civ_intel_escape3", 1);
    animnode = getstruct("animnode_escape3", "targetname");
    if (isdefined(animnode)) {
        waitframe();
        level.var_edadd8571dd39c8e.animname = "prisoner01";
        level.var_edadd8571dd39c8e setanimtree();
        waitframe();
        animnode thread anim_first_frame_solo(level.var_edadd8571dd39c8e, "zom_core_death_run_5");
        trigger_wait_targetname("gas_flee_spawn");
        thread function_b7263128b30b3b8b();
        level.var_edadd8571dd39c8e.deathfunction = &function_ce450b9957138bd5;
        level.var_edadd8571dd39c8e setcandamage(0);
        if (isdefined(level.var_edadd8571dd39c8e.headmodel)) {
            level.var_edadd8571dd39c8e detach(level.var_edadd8571dd39c8e.headmodel);
        }
        level.var_edadd8571dd39c8e.headmodel = "head_c_jup_enemy_pmc_soldier_v02";
        level.var_edadd8571dd39c8e attach(level.var_edadd8571dd39c8e.headmodel, "", 1);
        animnode thread anim_single_solo(level.var_edadd8571dd39c8e, "zom_core_death_run_5");
        wait 1;
        level.var_edadd8571dd39c8e thread function_ce450b9957138bd5();
        wait 0.9;
        utility::exploder("gas_flat_face_vig_blow");
    }
    thread function_b6c57652a881c82d();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e65
// Size: 0x78
function function_3160b8745f256da8(groupname) {
    aiarray = array_spawn_targetname(groupname, 1, 1);
    foreach (ai in aiarray) {
        ai function_fb61cea1f26aea07();
        ai.var_1a479cad9c3adbb1 = 0;
    }
    return aiarray;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee6
// Size: 0x32
function function_b6108624d05f4b8a(array) {
    level endon("obj_yuri_completed");
    level endon("flag_dont_autosave");
    waittill_any_ents_array(array, "damage");
    flag_set("flag_dont_autosave");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f20
// Size: 0xc9
function function_35aa3612a8801255(array) {
    level endon("game_ended");
    while (true) {
        sorted = sortbydistance(getaiarray(), level.player.origin);
        var_d3ca5633099d51c8 = [sorted[0], sorted[1], sorted[2]];
        foreach (ai in var_d3ca5633099d51c8) {
            if (isdefined(ai) && ai getthreatsight(level.player) > 0) {
                function_cf05aa10a12bd83f(ai);
            }
            waitframe();
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff1
// Size: 0x1a
function function_b7263128b30b3b8b() {
    playsoundatpos((6468, 46978, 1264), "jup_mlb_escape_runner_death");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5013
// Size: 0x1a
function function_b7263228b30b3dbe() {
    playsoundatpos((6611, 47123, 1552), "jup_mlb_escape_door_open_01");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5035
// Size: 0x2
function function_ed101e981cd25dce() {
    
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x503f
// Size: 0xec
function function_fb61cea1f26aea07() {
    self.dropweapon = 0;
    thread function_1b707b8e6005fa1f();
    self setlookatentity(level.player);
    self function_f51ff412609193b9(1, "script");
    self.animname = "soldier";
    self function_d493e7fe15e5eaf4("sp_milbase_template");
    self setanimlookatranges(-45, 45, -160, 160);
    currentweapon = namespace_f87a4b6569ce73b2::getaicurrentweapon();
    currentweaponname = getcompleteweaponname(currentweapon);
    var_a7bc8ce6ab75d51e = weaponclass(currentweapon);
    thread function_ac9deafe1d369e7e();
    switch (weaponclass(currentweapon)) {
    case #"hash_719417cb1de832b6":
        self setoverridearchetype("weapon", "guard_02", 1);
        namespace_223959d3e5206cfb::placeweaponon(self.sidearm, "thigh");
        thread function_d1492860d3b0847a();
    default:
        break;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x5133
// Size: 0x147
function function_11c28c4ded17c83e(damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon) {
    if (flag("obj_yuri_completed")) {
        return;
    }
    if (isplayer(attacker)) {
        function_1c1b9d33706c152d(level.player, "gunshot");
        var_e4b43c62b1bde1ca = array_combine(level.var_d918d6c3b8727ef6, level.var_d20a1d0978b11835, level.civ_intel);
        foreach (civ in var_e4b43c62b1bde1ca) {
            if (!isdefined(civ.origin)) {
                continue;
            }
            distcheck = distance2d(self.origin, civ.origin);
            if (distcheck <= 600) {
                civ function_b661b022700ba72f("script", 1);
                civ function_d5cda8a759cc36bc("cower");
            }
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5282
// Size: 0x27
function function_f40ba3f58b2bd043() {
    wait 0.1;
    self.stealth.funcs["event_combat"] = &function_58b26153c4e6ea7c;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52b1
// Size: 0x38
function function_ac9deafe1d369e7e() {
    self endon("death");
    while (true) {
        if (self.var_fe5ebefa740c7106 == 3) {
            self setlookatentity();
            self function_f51ff412609193b9(0);
            break;
        }
        wait 0.25;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52f1
// Size: 0x4d
function function_d1492860d3b0847a() {
    holster = spawn_model("parts_jup_holster_plastichigh");
    holster linkto(self, "tag_pistol_offset", (4, 0, 0), (-25, 95, -115));
    waitframe();
    holster linkto(self, "j_hiptwist_ri");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5346
// Size: 0xa7
function function_1b707b8e6005fa1f() {
    self endon("death");
    self waittill("stealth_combat");
    waitframe();
    while (true) {
        distsqrd = distancesquared(self.origin, level.player.origin);
        if (distsqrd <= 1000000) {
            var_622f8d6774a5ba2f = sighttracepassed(self geteye(), level.player geteye(), 0, self, level.player);
            if (var_622f8d6774a5ba2f) {
                self.goalradius = 64;
                self setgoalpos(self.origin);
                break;
            }
        }
        wait 1;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53f5
// Size: 0x88
function function_82f04242fab0ccb0() {
    switch (self.var_fe5ebefa740c7106) {
    case 1:
        self.var_72c1658ae76b34ce = 1000;
    case 0:
    case 2:
    case 3:
        dist = distancesquared(self.origin, level.player.origin);
        if (dist <= 160000) {
        }
        break;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5485
// Size: 0xcc
function function_de5ae0c94d33b9c8() {
    level endon("game_ended");
    level.player endon("death");
    var_e94eed96ff4445ea = getent("debug_outofworld", "targetname");
    while (isdefined(var_e94eed96ff4445ea)) {
        var_e94eed96ff4445ea waittill("trigger", ent);
        if (isplayer(ent) && (ent isnoclip() || ent isufo())) {
            wait 0.1;
            continue;
        }
        /#
            assertmsg("<dev string:x57>" + ent.origin);
            iprintlnbold("<dev string:x57>" + ent.origin);
        #/
        if (isplayer(ent) || isai(ent) || ent scripts\common\vehicle::isvehicle()) {
            ent kill();
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5559
// Size: 0x335
function function_d232a26a146eed38() {
    trigger_wait_targetname("trig_truck_littlebird");
    level.var_abbbfc0c038f47fb = array_spawn_targetname("comms_civilians", 1, 1);
    function_4e3ca6dd571fca4f(level.var_abbbfc0c038f47fb);
    thread function_b6108624d05f4b8a(level.var_abbbfc0c038f47fb);
    level.var_ab5fc0a6530c880a = function_3160b8745f256da8("road_soldiers");
    thread function_b6108624d05f4b8a(level.var_ab5fc0a6530c880a);
    foreach (ai in level.var_ab5fc0a6530c880a) {
        ai add_damage_function(&function_11c28c4ded17c83e);
    }
    trigger_wait_targetname("first_intersection");
    flag_set("ai_hill_turn_around");
    thread function_31b4e8af8fe3564a(level.var_d918d6c3b8727ef6);
    level.ai_hangar = function_3160b8745f256da8("ai_hangar");
    level.var_d5bbd81395a0a261 = array_spawn_targetname("hangar_civilians", 1, 1);
    thread function_b6108624d05f4b8a(level.ai_hangar);
    thread function_b6108624d05f4b8a(level.var_d5bbd81395a0a261);
    function_4e3ca6dd571fca4f(level.var_d5bbd81395a0a261);
    level.var_22f47c1b055d8f1d = array_spawn_targetname("maintenance_civilians", 1, 1);
    function_4e3ca6dd571fca4f(level.var_22f47c1b055d8f1d);
    thread function_b6108624d05f4b8a(level.var_22f47c1b055d8f1d);
    trigger_wait_targetname("heli_small_spawn");
    thread function_31b4e8af8fe3564a(level.var_d20a1d0978b11835);
    thread function_31b4e8af8fe3564a(level.var_abbbfc0c038f47fb);
    wait 0.1;
    level.var_dab7b135254bf27d = function_3160b8745f256da8("alley_soldiers");
    foreach (ai in level.var_dab7b135254bf27d) {
        ai add_damage_function(&function_11c28c4ded17c83e);
    }
    level.var_73d1e0244e4157e1 = array_spawn_targetname("motorpool_civilians", 1, 1);
    function_4e3ca6dd571fca4f(level.var_73d1e0244e4157e1);
    thread function_b6108624d05f4b8a(level.var_dab7b135254bf27d);
    thread function_b6108624d05f4b8a(level.var_73d1e0244e4157e1);
    wait 0.1;
    var_8d3bb4b610f852b5 = getentarray("lobby_guard", "script_noteworthy");
    foreach (guard in var_8d3bb4b610f852b5) {
        guard setmodel("body_c_jup_sp_enemy_kastovsoldier_01");
        guard add_damage_function(&function_11c28c4ded17c83e);
    }
    flag_wait("intel_reached");
    thread function_31b4e8af8fe3564a(level.var_22f47c1b055d8f1d);
    thread function_31b4e8af8fe3564a(level.var_e8027a2623fbe240);
    thread function_31b4e8af8fe3564a(level.var_842583262417aadf);
    flag_wait("jltv4_park");
    thread function_b68f028fb680b364("danger_area_admin");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5896
// Size: 0x6d
function function_db48d270f21badb0() {
    level endon("game_ended");
    flag_wait("officer_door_open");
    flag_clear("intel_door_close");
    flag_set("intel_door_open");
    flag_wait_all("officer_door_close", "entourage_exit_1", "entourage_exit_2");
    flag_set("intel_door_close");
    flag_clear("intel_door_open");
    wait 2;
    flag_set("initial_door_close");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x590b
// Size: 0x8a
function function_be972306d6fd602e(stringname) {
    soldier = getent(stringname, "script_noteworthy", 1);
    soldier endon("death");
    var_3ca809a7bdc95834 = getentarray("kill_room", "targetname");
    while (true) {
        wait 0.25;
        if (soldier is_touching_any(var_3ca809a7bdc95834)) {
            soldier.var_1a479cad9c3adbb1 = 1;
            soldier.var_36023fdce648d2ea = 1;
            soldier.var_c3b6984b9532af5b = 1;
            break;
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x599d
// Size: 0x45
function function_f4438b59d3fbd131() {
    function_49a7092b12114f4f(0);
    utility::exploder("gas_cloud");
    level.player thread namespace_abbbdacdbe0b9258::lights_flicker();
    thread function_6b4e8374db3201cf();
    wait 0.5;
    thread function_7287fe752c7043bc();
    thread function_8a7729a732f490d3();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59ea
// Size: 0x16
function function_801a0bd71fc25e37() {
    level.player playsound("sfx_air_raid_siren");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a08
// Size: 0x16
function function_b1aba3670f3702f() {
    level.player playsound("sfx_rocket_first_explosion_impact");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a26
// Size: 0x16
function function_b1abb3670f37262() {
    level.player playsound("sfx_rocket_second_explosion_impact");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a44
// Size: 0x6f
function function_65195945547662e() {
    level.var_10bfcd5f3ebb610a = getentarray("sfx_alarm_location", "targetname");
    foreach (item in level.var_10bfcd5f3ebb610a) {
        item playloopsound("sfx_alarm");
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5abb
// Size: 0xce
function function_b10738080c75edcf() {
    var_ffa49f3895024e2b = getstruct("gas_start", "targetname");
    level.var_53a974c179182d5b = spawn_model("head_hero_laswell", var_ffa49f3895024e2b.origin, var_ffa49f3895024e2b.angles);
    thread function_2eedf65d354b77a7();
    var_d2d01c0b98c15e0 = var_ffa49f3895024e2b get_linked_structs();
    foreach (item in var_d2d01c0b98c15e0) {
        level.var_53a974c179182d5b moveto(item.origin, 5, 0, 0);
        wait 35;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b91
// Size: 0x3e
function function_2eedf65d354b77a7() {
    while (true) {
        /#
            sphere(level.var_53a974c179182d5b.origin, 200, (0, 1, 0), 0, 10);
        #/
        wait 0.5;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bd7
// Size: 0x32
function function_7287fe752c7043bc() {
    enemies = getaiarray("bad_guys");
    enemies = array_removedead_or_dying(enemies, 1);
    if (enemies.size > 0) {
        thread function_31b4e8af8fe3564a(enemies);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c11
// Size: 0x72
function function_8a7729a732f490d3() {
    function_21d2d80a6e9afd6a(level.var_d4ce7a272ba5d4b0);
    function_21d2d80a6e9afd6a(level.var_a7eb2624fdb259e6);
    function_21d2d80a6e9afd6a(level.var_a7eb2824fdb25e4c);
    function_21d2d80a6e9afd6a(level.var_da38302e01d23b97);
    function_21d2d80a6e9afd6a(level.var_bbcd9a2e01592bdf);
    function_21d2d80a6e9afd6a(level.var_890c3bde4b1b2f97);
    function_21d2d80a6e9afd6a(level.var_70f9bab4bde29399);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c8b
// Size: 0x1a3
function function_dd20f64ccd327c1f() {
    level.var_da38302e01d23b97 = spawn_vehicle_from_targetname_and_drive("cargo_truck");
    level.var_da38302e01d23b97 vehicle_setspeed(0);
    level.var_da38302e01d23b97 childthread function_7ad17ea21fe5e725("tag_seat_wm_0", "iw9_mp_veh_jltv_seat_0_idle");
    level.var_da38302e01d23b97 thread function_38cfdcddc037ce41();
    level.var_da38302e01d23b97 childthread function_1b43b0bcf17d2544();
    level.var_da38302e01d23b97 add_damage_function(&function_b1b22c5bac27f30);
    thread function_3608218eb6655a54();
    flag_wait_all("flag_truck", "jltv_pass");
    flag_set("gate_1_open");
    wait 3;
    level.var_da38302e01d23b97 childthread function_8a474f3ae16c3e69(12, 0.6);
    thread function_c5c8a9620e45915c();
    thread namespace_c8b8bddad47ea676::cargo_truck();
    level.var_da38302e01d23b97 thread function_efdaa03bfc25c1a0(12, 12, 8, "jltv_pass2");
    level.vehicles[level.vehicles.size] = level.var_da38302e01d23b97;
    level.var_bbcd9a2e01592bdf = spawn_vehicle_from_targetname_and_drive("cargo_truck2");
    level.var_bbcd9a2e01592bdf childthread function_7ad17ea21fe5e725("tag_seat_wm_0", "iw9_mp_veh_jltv_seat_0_idle");
    level.var_bbcd9a2e01592bdf thread function_38cfdcddc037ce41();
    level.var_bbcd9a2e01592bdf add_damage_function(&function_b1b22c5bac27f30);
    thread namespace_c8b8bddad47ea676::cargo_truck2();
    flag_wait("truck2_brakes");
    level.var_bbcd9a2e01592bdf childthread function_8a474f3ae16c3e69(0, -0.275);
    flag_wait("cargo_go");
    wait 0.5;
    flag_clear("cargo_go");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e36
// Size: 0x51
function function_c5c8a9620e45915c() {
    wait 8;
    level.var_a7eb2624fdb259e6 childthread function_8a474f3ae16c3e69(12, 0.8);
    thread namespace_c8b8bddad47ea676::function_66a0d66521ede35d();
    flag_set("gate_2_open");
    wait 2;
    level.var_da38302e01d23b97 childthread function_8a474f3ae16c3e69(0, -0.3);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5e8f
// Size: 0xa1
function function_a4b07311e3759ef3(var_a59b8386f8f28e0, var_3af249ad9d1f17b0, var_689d382ed277d7f6, uptime) {
    var_e2a842de589a0b63 = getent(var_a59b8386f8f28e0, "targetname");
    var_1baeb8f646bac8da = var_e2a842de589a0b63.angles;
    var_e2a842de589a0b63 rotateto(var_3af249ad9d1f17b0, 1.5, 0.25, 0.25);
    wait 1.5;
    flag_wait(var_689d382ed277d7f6);
    var_e2a842de589a0b63 rotateto(var_1baeb8f646bac8da, 1.5, 0.25, 0.25);
    wait uptime;
    flag_clear(var_689d382ed277d7f6);
    thread function_a4b07311e3759ef3(var_a59b8386f8f28e0, var_3af249ad9d1f17b0, var_689d382ed277d7f6, uptime);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f38
// Size: 0x6c
function function_3608218eb6655a54() {
    trigger_wait_targetname("heli_small_spawn");
    flag_set("spawn_small_heli");
    level.var_70f9bab4bde29399 = spawn_vehicle_from_targetname_and_drive("heli_spawner_02");
    level.var_70f9bab4bde29399 childthread function_7ad17ea21fe5e725("tag_seat_0", "iw9_veh_heli_medium_seat_0_idle_search01");
    level.var_70f9bab4bde29399 childthread function_7ad17ea21fe5e725("tag_seat_1", "iw9_veh_heli_medium_seat_1_idle_search01");
    thread namespace_c8b8bddad47ea676::function_9c57bab223b3b079();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fac
// Size: 0x96
function function_c09ebcf15ac6aab4() {
    var_6250227c49003ac = level.var_70f9bab4bde29399.target;
    var_2b47d6e3cf73d4d8 = level.var_70f9bab4bde29399.veh_throttle;
    level.var_70f9bab4bde29399.target = undefined;
    level.var_70f9bab4bde29399.veh_throttle = 0;
    wait 15;
    level.var_70f9bab4bde29399.target = var_6250227c49003ac;
    level.var_70f9bab4bde29399.veh_throttle = var_2b47d6e3cf73d4d8;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x604a
// Size: 0xb0
function function_dfbfe8ab37f6812e(speed, acceleration, deceleration) {
    level.player endon("death");
    self endon("explode");
    self endon("death");
    self vehicle_setspeed(0);
    vehiclespeed = default_to(speed, 12);
    var_2f8d4de32759ee0f = default_to(acceleration, 12);
    var_9f1b337fc69e5614 = default_to(deceleration, 8);
    while (true) {
        if (flag("jltv1_clear")) {
            break;
        }
        wait 1;
    }
    self vehicle_setspeed(vehiclespeed, var_2f8d4de32759ee0f, var_9f1b337fc69e5614);
    thread function_7f1a9c43113121f9(12, 12, 8);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6102
// Size: 0x2
function function_4380ce742d375bba() {
    
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x610c
// Size: 0x1d2
function function_c6c78ce9aa0b2e23() {
    level endon("game_ended");
    level endon("obj_keycard_completed");
    flag_wait("intel_reached");
    wait 0.5;
    level.officer = spawn_targetname("officer_1", 1);
    level.officer function_fb61cea1f26aea07();
    level.officer.var_c3b6984b9532af5b = 1;
    wait 0.5;
    thread intro_start();
    level.officer setmodel("body_c_jup_sp_enemy_rusgeneral_02");
    level.officer waittill("death");
    if (!flag("officer_exit")) {
        flag_set("flag_alarm");
        function_1c1b9d33706c152d(level.player, "gunshot");
        return;
    }
    flag_set("officer_dead");
    var_a477fde229a30d33 = getstruct("obj_keycard_1", "targetname");
    var_a477fde229a30d33.origin = level.officer.origin;
    var_487edcf330fe5383 = spawn("script_model", var_a477fde229a30d33.origin);
    objective_update("get_keycard", undefined, var_a477fde229a30d33.origin, undefined, undefined, undefined, 20);
    wait 1.5;
    var_487edcf330fe5383 setmodel("electronics_keycard_office_01");
    level thread function_1815cc87725ae2e6();
    var_a477fde229a30d33 scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 8), %SP_JUP_MILBASE/PICKUPKEYCARD, 360, 250, 80, 1);
    var_a477fde229a30d33 waittill("trigger");
    level.player forceplaygestureviewmodel("ges_swipe");
    wait 0.4;
    thread namespace_c8b8bddad47ea676::function_8d5f368f1a68af0b();
    var_a477fde229a30d33 thread remove_cursor_hint();
    var_487edcf330fe5383 hide();
    flag_set("obj_keycard_completed");
    level thread function_dd37afb56087641b();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x62e6
// Size: 0x216
function function_5a8c688fd630ffa4(var_187ca6294706fd8f, var_115dcdedff2184d6, var_b71c09ad692b8e12, var_b05814d686f885a2, var_25d16e35a7bbbd73) {
    if (isdefined(var_25d16e35a7bbbd73) && var_25d16e35a7bbbd73) {
        level endon("escape_sequence_start");
    }
    if (var_b05814d686f885a2 == 1) {
        flag_wait_any(var_115dcdedff2184d6, "flag_alarm");
    } else {
        flag_wait(var_115dcdedff2184d6);
    }
    flag_set("door_in_progress");
    var_321fb010ac1ecfe = getentarray(var_187ca6294706fd8f, "targetname");
    foreach (obj in var_321fb010ac1ecfe) {
        obj.var_295832d2fc0e963c = obj.origin;
        if (isdefined(obj.target)) {
            targetposition = getstruct(obj.target, "targetname");
            targetposition.origin = (targetposition.origin[0], targetposition.origin[1], obj.origin[2]);
            obj moveto(targetposition.origin, 2);
            obj playsoundonmovingent("sfx_sliding_doors_open");
        }
    }
    wait 2.5;
    while (flag("flag_alarm")) {
        wait 2.5;
        iprintln("flag alarm+obj_yuri");
    }
    flag_wait(var_b71c09ad692b8e12);
    foreach (obj in var_321fb010ac1ecfe) {
        obj moveto(obj.var_295832d2fc0e963c, 2);
        obj playsoundonmovingent("sfx_sliding_doors_close");
    }
    wait 2.5;
    flag_clear("door_in_progress");
    thread function_5a8c688fd630ffa4(var_187ca6294706fd8f, var_115dcdedff2184d6, var_b71c09ad692b8e12, var_b05814d686f885a2, var_25d16e35a7bbbd73);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6504
// Size: 0x3f
function function_5b121077bff87c25() {
    while (flag("door_in_progress")) {
        /#
            iprintln("<dev string:xce>");
        #/
        flag_clear("flag_alarm");
        flag_set("intel_door_close");
        wait 3;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x654b
// Size: 0x184
function function_da40363e22107634(var_187ca6294706fd8f) {
    level endon("obj_yuri_completed");
    var_25afa3313a8c068e = getstruct(var_187ca6294706fd8f, "targetname");
    if (var_187ca6294706fd8f == "intel_door_reader_1") {
        animnode = getstruct("keycard_1_animnode", "targetname");
    }
    if (var_187ca6294706fd8f == "intel_door_reader_2") {
        animnode = getstruct("keycard_2_animnode", "targetname");
    }
    if (!flag("obj_keycard_completed")) {
        var_25afa3313a8c068e scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 6), %SP_JUP_MILBASE/NEEDKEYCARD, 45, 250, 80, 1, undefined, undefined, undefined, undefined, undefined, undefined, 45, 45);
        flag_wait("obj_keycard_completed");
        /#
            printtoscreen2d(500, 500, "<dev string:xdf>", (1, 0.8, 0.5), 1, 3);
        #/
    }
    var_25afa3313a8c068e thread remove_cursor_hint();
    wait 0.1;
    var_25afa3313a8c068e scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 6), %SP_JUP_MILBASE/OPENDOOR, 45, 250, 80, 1, undefined, undefined, undefined, undefined, undefined, undefined, 45, 45);
    var_25afa3313a8c068e thread function_ef0ea3d10f3572af(var_25afa3313a8c068e);
    while (true) {
        if (flag("door_in_progress")) {
            waitframe();
        }
        if (flag("5")) {
            waitframe();
        }
        var_25afa3313a8c068e waittill("trigger");
        if (flag("flag_alarm")) {
            break;
        }
        if (flag("hat_seq_active")) {
            waitframe();
            continue;
        }
        var_25afa3313a8c068e thread remove_cursor_hint();
        thread function_11479c235d751f6c(var_25afa3313a8c068e, animnode, var_187ca6294706fd8f);
        break;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x66d7
// Size: 0xce
function function_11479c235d751f6c(var_25afa3313a8c068e, animnode, var_187ca6294706fd8f) {
    if (flag("hat_seq_active")) {
        return;
    }
    flag_set("keycard_anim_active");
    function_aac3eef1f98468ad();
    rig = animnode link_player_to_rig("keycard_interact", "stand", 1, 0.3, 1, 0, 0, 0, 0);
    animnode anim_single_solo(rig, "keycard_interact");
    animnode unlink_player_from_rig();
    flag_clear("keycard_anim_active");
    function_a639551b77005a8a();
    flag_clear("intel_door_close");
    flag_set("intel_door_open");
    wait 5;
    flag_set("intel_door_close");
    flag_clear("intel_door_open");
    thread function_da40363e22107634(var_187ca6294706fd8f);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67ad
// Size: 0x25
function function_ef0ea3d10f3572af(var_8b007ea558727834) {
    flag_wait_any("flag_alarm", "escape_sequence_start");
    var_8b007ea558727834 thread remove_cursor_hint();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67da
// Size: 0x64
function function_aac3eef1f98468ad() {
    level.player lerpfovscalefactor(0, 0.5);
    level.player.var_f296f7e55b9e9150 = getdvarint(@"hash_b38fcf293d1e91a8");
    level.player modifybasefov(level.player.var_f296f7e55b9e9150, 0.5);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6846
// Size: 0x1b
function function_a639551b77005a8a() {
    level.player lerpfovscalefactor(1, 2.5);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6869
// Size: 0x19a
function function_ec0951b0a6df0d29() {
    level endon("game_ended");
    level endon("gas_begins");
    trigger_wait_targetname("trig_doorway_entrance");
    flag_set("hat_seq_active");
    tagname = "TAG_ACCESSORY_LEFT";
    level.hat = spawn_model("jup_headgear_military_cap_flat");
    level.hat linktoplayerview(level.player, tagname, (-4.5, -2, 2), (5, 0, -30));
    level.hat hide();
    if (!flag("flag_alarm")) {
        level.player disableoffhandweapons();
        if (function_12b98953a00d3c28()) {
            level.player.var_899b3dd3160215 = level.player getcurrentprimaryweapon();
            level.player.var_8da87ae2137cc1f1 = level.player getweaponslistprimaries();
            level.player giveweapon(level.player.var_3054d3f1da9b4d10, 0, 0, 0, 1);
            level.player switchtoweapon(level.player.var_3054d3f1da9b4d10);
        }
        level.player forceplaygestureviewmodel("vm_ges_remove_cap");
        wait 0.8;
        level.hat show();
        wait 1;
        level.hat hide();
        flag_clear("hat_seq_active");
        level.player enableoffhandweapons();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a0b
// Size: 0xba
function function_6af8e144c296c583() {
    level endon("game_ended");
    level endon("obj_yuri_completed");
    level endon("flag_alarm");
    var_7672d192033a606 = getstruct("obj_yuri_meet", "targetname");
    var_7672d192033a606 scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 0), %SP_JUP_MILBASE/OPENDOOR);
    var_7672d192033a606 waittill("trigger");
    while (true) {
        if (function_eac0cd99c9c6d8ee() == "spotted") {
            waitframe();
        }
        if (flag("flag_alarm")) {
            waitframe();
        }
        var_7672d192033a606 thread remove_cursor_hint();
        if (flag("door_in_progress")) {
            thread function_5b121077bff87c25();
        }
        flag_set("obj_yuri_completed");
        flag_set("intel_door_close");
        level notify("obj_yuri_completed");
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6acd
// Size: 0x182
function function_dc042011cd0bf02a(type) {
    level notify("level_setting_stealth_ranges");
    level endon("level_setting_stealth_ranges");
    while (!isdefined(level.stealth)) {
        waitframe();
    }
    if (!flag_exist("stealth_ranges_initialized")) {
        thread function_fb457f7cdf0ac39e();
    }
    wait 0.5;
    switch (type) {
    case #"hash_7038dec66d8275be":
        function_71a28a935629a941("milbase_disguised_eventlist");
        break;
    case #"hash_fec408e3f7407354":
        function_71a28a935629a941("milbase_eventlist");
        break;
    case #"hash_334c896e25dc8345":
        level.event_distances["spotted"]["explosion"] = 200;
        level.event_distances["hidden"]["explosion"] = 200;
        level.event_distances["spotted"]["grenade_ping"] = 200;
        level.event_distances["hidden"]["grenade_ping"] = 200;
        level.event_distances["spotted"]["gunshot"] = 200;
        level.event_distances["hidden"]["gunshot"] = 200;
        level.event_distances["spotted"]["bottle_impact"] = 800;
        level.event_distances["hidden"]["bottle_impact"] = 800;
        scripts\stealth\manager::set_custom_distances(level.event_distances);
        break;
    default:
        assertmsg("set_stealth_ranges( type ) - invalid type specified");
        break;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6c57
// Size: 0x155
function function_4fb6c81d40937664(var_f272ecf871e7f201, refresh_rate, var_3f336fa020545ada, var_26275c1f781c854f) {
    level endon("game_ended");
    if (!isdefined(var_f272ecf871e7f201)) {
        var_f272ecf871e7f201 = 3;
    }
    if (!isdefined(refresh_rate)) {
        refresh_rate = 3;
    }
    if (!isdefined(var_3f336fa020545ada)) {
        var_3f336fa020545ada = "ai_combat_active";
    }
    var_9fbdf075370ff370 = isdefined(var_26275c1f781c854f) && isfunction(var_26275c1f781c854f);
    flag_init(var_3f336fa020545ada);
    while (true) {
        wait refresh_rate;
        enemies = getaiarray("bad_guys");
        enemies = array_removedead_or_dying(enemies, 1);
        incombat = 0;
        foreach (ai in enemies) {
            if (ai.alertlevel == "combat" || ai.alertlevel == "alert" || ai.alertlevel == "hunt") {
                incombat++;
                if (incombat > var_f272ecf871e7f201) {
                    break;
                }
            }
        }
        if (incombat >= var_f272ecf871e7f201) {
            flag_set(var_3f336fa020545ada);
            if (var_9fbdf075370ff370) {
                [[ var_26275c1f781c854f ]]();
            }
            continue;
        }
        flag_clear(var_3f336fa020545ada);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6db4
// Size: 0xe8
function function_586349f90915861f() {
    level endon("obj_yuri_completed");
    level endon("escape_sequence_start");
    level endon("game_ended");
    flag_wait("flag_alarm");
    function_dc042011cd0bf02a("panic");
    thread function_e2b92ebf9b44588();
    wait 2;
    function_1c1b9d33706c152d(level.player, "gunshot");
    thread function_40d69f3a2e99e81d();
    wait 3;
    enemies = getaiarray();
    while (1 && !flag("escape_sequence_start")) {
        enemies = array_removedead_or_dying(enemies);
        foreach (enemy in enemies) {
            function_3ecfaa32d3b8fe63(enemy);
        }
        wait randomfloatrange(0.5, 1.2);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ea4
// Size: 0x1b
function function_e2b92ebf9b44588() {
    level endon("game_ended");
    wait 10;
    flag_set("game_over");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ec7
// Size: 0x36
function function_40d69f3a2e99e81d() {
    level.var_9ac22470b732d013 = spawn("script_origin", (5624, 47970, 1965));
    level.var_9ac22470b732d013 playloopsound("emt_milbase_red_alert_lp_dry");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f05
// Size: 0x2
function function_1bfd820c3689d206() {
    
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f0f
// Size: 0x54
function function_e4168cc8ab2ed319(group_name, func) {
    self.skipbloodpool = 1;
    self function_f51ff412609193b9(1, "script");
    self.diequietly = 1;
    self.var_f543095c3ca1b743 = 1;
    self.var_72c1658ae76b34ce = 32;
    function_5c93b070d3ec64ee();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f6b
// Size: 0x77
function function_5c93b070d3ec64ee() {
    var_58f6fbb047b4497c = self gettagangles("j_helmet", 1, 1);
    var_dbd70c40d1472ac6 = self gettagorigin("j_helmet", 1, 1);
    hat = spawn_model("jup_headgear_military_cap_flat", var_dbd70c40d1472ac6 + (0, 0, 0), var_58f6fbb047b4497c + (0, 0, 0));
    hat linkto(self, "j_helmet");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fea
// Size: 0x52
function function_c5cda0586c28c781(event) {
    level.player endon("death");
    self endon("death");
    waitframe();
    function_d02f2011fc113e3c(self);
    self aieventlistenerevent("attack", level.player, level.player.origin);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7044
// Size: 0x123
function function_fb457f7cdf0ac39e() {
    while (!isdefined(level.stealth)) {
        waitframe();
    }
    setomnvar("ai_fulllight", 0.005);
    setomnvar("ai_nolight", 0.0013);
    hiddenranges["prone"] = 4000;
    hiddenranges["crouch"] = 4000;
    hiddenranges["stand"] = 4000;
    spottedranges["prone"] = 4000;
    spottedranges["crouch"] = 4000;
    spottedranges["stand"] = 4000;
    scripts\stealth\utility::set_detect_ranges(hiddenranges, spottedranges);
    function_aa5574c6f1714df1(24);
    level.stealth.override_damage_auto_range = 240;
    level.stealth.override_damage_sight_range = 1800;
    function_71a28a935629a941("milbase_disguised_eventlist");
    function_8368f8fe908ce8be(500);
    corpseranges = [];
    corpseranges["sight_dist"] = 1000;
    corpseranges["detect_dist"] = 600;
    corpseranges["found_dist"] = 100;
    corpseranges["shadow_dist"] = 100;
    scripts\stealth\corpse::set_corpse_ranges(corpseranges);
    flag_set("stealth_ranges_initialized");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x716f
// Size: 0xd3
function function_58b26153c4e6ea7c(event) {
    distancecheck = distance(self.origin, event.origin);
    if (distancecheck <= 300) {
        if (self cansee(event.entity)) {
            return false;
        }
    }
    distancecheck = distance(self.origin, level.player.origin);
    if (distancecheck <= 300) {
        if (self cansee(level.player)) {
            return false;
        }
    }
    var_622f8d6774a5ba2f = ifcanseeplayer(self, level.player);
    if (var_622f8d6774a5ba2f) {
        return false;
    }
    if (self.var_fe5ebefa740c7106 == 2) {
        return false;
    }
    self [[ self.fnsetstealthstate ]]("investigate", event);
    return true;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x724b
// Size: 0x213
function function_5e2fc817faedc9ad(type) {
    level endon("game_ended");
    switch (type) {
    case #"hash_798773f4ebc050d0":
        function_3b992a66c2e901bb(level.player, 1);
        function_ed9b1ddd2ec82dab(level.player, 0);
        break;
    case #"hash_719417cb1de832b6":
    case #"hash_900cb96c552c5e8e":
        function_4e647c514964da47(257, 1);
        function_3b992a66c2e901bb(level.player, 0);
        function_ed9b1ddd2ec82dab(level.player, 0);
        break;
    case #"hash_23fc4a96a50031a":
        function_3b992a66c2e901bb(level.player, 0);
        function_ed9b1ddd2ec82dab(level.player, 0);
        break;
    case #"hash_924e034e98c9dc46":
    case #"hash_ceb3b5150f04b677":
        function_4e647c514964da47(260, 1);
        function_3b992a66c2e901bb(level.player, 0);
        function_ed9b1ddd2ec82dab(level.player, 1);
        break;
    case #"hash_f91ce75a81ea18ba":
        break;
    case #"hash_fec408e3f7407354":
        break;
    case #"hash_cf0b0fe8e6a12ec1":
        function_3b992a66c2e901bb(level.player, 0);
        function_ed9b1ddd2ec82dab(level.player, 0);
        function_4e647c514964da47(258, 1);
        break;
    case #"hash_9e02cd4a0f3ca981":
        function_3b992a66c2e901bb(level.player, 0);
        function_ed9b1ddd2ec82dab(level.player, 0);
        function_4e647c514964da47(258, 1);
        break;
    case #"hash_d43e72e3783b7333":
        function_3b992a66c2e901bb(level.player, 0);
        function_ed9b1ddd2ec82dab(level.player, 0);
        function_4e647c514964da47(258, 1);
        break;
    case #"hash_4e5cc67672ba498b":
        function_3b992a66c2e901bb(level.player, 0);
        function_ed9b1ddd2ec82dab(level.player, 0);
        function_4e647c514964da47(256, 1);
        break;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7466
// Size: 0x1fb
function function_4e03610e7e75a10() {
    currentwait = 0.25;
    level endon("obj_yuri_completed");
    level endon("game_ended");
    while (true) {
        wait currentwait;
        if (flag("clipboard_held")) {
            function_5e2fc817faedc9ad("blending");
            thread function_dc042011cd0bf02a("default");
            continue;
        }
        if (flag("flag_alarm")) {
            function_5e2fc817faedc9ad("alarm");
            thread function_dc042011cd0bf02a("default");
            currentwait = 1;
            continue;
        }
        if (level.player ishanging() || level.player ismantling()) {
            function_5e2fc817faedc9ad("mantling");
            thread function_dc042011cd0bf02a("default");
            currentwait = 2;
            continue;
        }
        if (level.player issprinting()) {
            function_5e2fc817faedc9ad("sprinting");
            thread function_dc042011cd0bf02a("default");
            currentwait = 2;
            continue;
        }
        if (level.player isthrowinggrenade()) {
            function_5e2fc817faedc9ad("combat");
            thread function_dc042011cd0bf02a("default");
            currentwait = 2;
            continue;
        }
        if (level.player isjumping()) {
            function_5e2fc817faedc9ad("jumping");
            thread function_dc042011cd0bf02a("default");
            currentwait = 2;
            continue;
        }
        if (level.player ismeleeing()) {
            function_5e2fc817faedc9ad("combat");
            thread function_dc042011cd0bf02a("default");
            currentwait = 2;
            continue;
        }
        if (flag("in_bad_volume")) {
            function_5e2fc817faedc9ad("badvolume");
            thread function_dc042011cd0bf02a("default");
            currentwait = 2;
            continue;
        }
        var_4262b8bc463ca9ac = level.player.currentweapon.classname;
        function_5e2fc817faedc9ad(var_4262b8bc463ca9ac);
        thread function_dc042011cd0bf02a("default");
        currentwait = 0.25;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7669
// Size: 0x294
function ifcanseeplayer(soldier, player) {
    if (!isdefined(player)) {
        return false;
    }
    if (istrue(player.ignoreme)) {
        return false;
    }
    var_b72bdf4ad529c791 = isplayer(player);
    dist = distance(player.origin, soldier.origin);
    var_3497d6ac3151641c = istrue(soldier.damaged);
    var_9540d52e669b0713 = 1;
    playervelocity = player getvelocity();
    var_a8f6a48be8f34c73 = length(playervelocity);
    if (var_a8f6a48be8f34c73 < 128) {
        var_9540d52e669b0713 = 0.75;
    } else if (var_a8f6a48be8f34c73 < 200 || var_b72bdf4ad529c791 && player.perk_data["stealth_velocity_override"]) {
        var_9540d52e669b0713 = 1;
    } else {
        var_9540d52e669b0713 = 1.25;
    }
    if (dist > 1500 * var_9540d52e669b0713) {
        return false;
    }
    can_see = soldier cansee(player);
    if (can_see) {
        infov = within_fov(soldier geteye(), soldier getplayerangles(1), player.origin + (0, 0, 40), 0.258819);
        if (!infov) {
            return false;
        }
        passed = sighttracepassed(soldier geteye(), player geteye(), 0, soldier, var_3497d6ac3151641c);
        if (!passed) {
            return false;
        }
        contents = scripts\engine\trace::create_solid_ai_contents(1);
        if (!ray_trace_passed(soldier geteye(), player geteye(), soldier, contents)) {
            return false;
        }
        var_5b94f282f7c090c5 = math::get_dot(soldier.origin, anglestoforward(soldier.angles), player.origin);
        var_9540d52e669b0713 = 1;
        if (var_5b94f282f7c090c5 >= 0.573576) {
            var_9540d52e669b0713 -= 0.34;
        }
        if (var_3497d6ac3151641c) {
            var_9540d52e669b0713 -= 0.34;
        }
        stance = player getstance();
        if (dist <= int(350 / var_9540d52e669b0713)) {
            if (stance == "prone") {
                return false;
            }
            return true;
        } else if (dist <= int(500 / var_9540d52e669b0713)) {
            if (stance == "prone") {
                return false;
            }
            return true;
        } else if (dist <= int(950 / var_9540d52e669b0713)) {
            if (stance == "prone" || stance == "crouch") {
                return false;
            }
            return true;
        }
    }
    return false;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7906
// Size: 0x1a
function function_d7a529e51d930f30() {
    trigger_wait_targetname("trig_truck_littlebird");
    flag_set("flag_truck");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7928
// Size: 0x9f
function function_8a474f3ae16c3e69(var_8c980356e1c9ea5b, var_392276d409f49d3c, var_81cce29a43e6689) {
    level endon("death");
    if (!isalive(self)) {
        return;
    }
    var_aa13dcdda08434c5 = self vehicle_getspeed();
    while (true) {
        wait 0.1;
        var_aa13dcdda08434c5 += var_392276d409f49d3c;
        if (var_8c980356e1c9ea5b == 0) {
            if (var_aa13dcdda08434c5 <= 0) {
                self vehicle_setspeed(0);
                if (isdefined(var_81cce29a43e6689)) {
                    flag_set(var_81cce29a43e6689);
                }
                break;
            }
        } else if (var_aa13dcdda08434c5 >= var_8c980356e1c9ea5b) {
            self vehicle_setspeed(var_8c980356e1c9ea5b);
            if (isdefined(var_81cce29a43e6689)) {
                flag_set(var_81cce29a43e6689);
            }
            break;
        }
        self vehicle_setspeed(var_aa13dcdda08434c5);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x79cf
// Size: 0x133
function function_7ad17ea21fe5e725(var_889b0844cce57db2, var_ca63f6010fe1fe52) {
    self endon("game_ended");
    self endon("death");
    var_7556f3e1bb0846bc = ["head_sc_m_androsov_bg", "head_sc_m_cueto_civ", "head_sc_m_shapiro", "head_sc_m_montano_bg", "head_sc_m_kamalov_bg"];
    var_ba9fcb4b59367a96 = self gettagorigin(var_889b0844cce57db2);
    var_f8d94f2f4b5e51ae = self gettagangles(var_889b0844cce57db2);
    actor = spawn_model("body_c_jup_sp_enemy_kastovsoldier_03", var_ba9fcb4b59367a96, var_f8d94f2f4b5e51ae);
    actor linkto(self);
    if (isdefined(actor.headmodel)) {
        actor detach(actor.headmodel);
    }
    actor.headmodel = random(var_7556f3e1bb0846bc);
    actor attach(actor.headmodel, "", 1);
    actor.animname = "prisoner01";
    actor setanimtree();
    thread delete_on_death(actor);
    while (true) {
        var_ba9fcb4b59367a96 = undefined;
        var_ba9fcb4b59367a96 = self gettagorigin(var_889b0844cce57db2);
        if (!isdefined(var_ba9fcb4b59367a96)) {
            break;
        }
        anim_single_solo(actor, var_ca63f6010fe1fe52, var_889b0844cce57db2);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7b0a
// Size: 0x120
function function_338942fc809e15f5(var_a7caa469eb10d77d, var_ca63f6010fe1fe52, endflag) {
    level endon("death");
    var_7556f3e1bb0846bc = ["head_sc_m_androsov_bg", "head_sc_m_cueto_civ", "head_sc_m_shapiro", "head_sc_m_montano_bg", "head_sc_m_kamalov_bg"];
    var_ba9fcb4b59367a96 = var_a7caa469eb10d77d.origin;
    var_f8d94f2f4b5e51ae = var_a7caa469eb10d77d.angles;
    actor = spawn_model("body_c_jup_sp_enemy_kastovsoldier_03", var_ba9fcb4b59367a96, var_f8d94f2f4b5e51ae);
    if (isdefined(actor.headmodel)) {
        actor detach(actor.headmodel);
    }
    actor.headmodel = random(var_7556f3e1bb0846bc);
    actor attach(actor.headmodel, "", 1);
    actor.animname = "prisoner01";
    actor setanimtree();
    var_a7caa469eb10d77d childthread anim_loop_solo(actor, var_ca63f6010fe1fe52);
    flag_wait(endflag);
    actor delete();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c32
// Size: 0xf1
function function_8078bf362782d5da() {
    soldier = getstruct("fake_ai_booth1", "targetname");
    thread function_338942fc809e15f5(soldier, "jup_interaction_patrol_tablet_inventory_loop_01", "officer_exit");
    soldier = getstruct("fake_ai_booth2", "targetname");
    thread function_338942fc809e15f5(soldier, "jup_interaction_patrol_tablet_inventory_loop_02", "officer_exit");
    soldier = getstruct("fake_ai_booth3", "targetname");
    thread function_338942fc809e15f5(soldier, "jup_interaction_patrol_tablet_inventory_loop_03", "officer_exit");
    soldier = getstruct("fake_ai_booth4", "targetname");
    if (!isdefined(soldier)) {
        return;
    }
    thread function_338942fc809e15f5(soldier, "jup_interaction_patrol_tablet_inventory_loop_01", "officer_exit");
    soldier = getstruct("fake_ai_booth5", "targetname");
    thread function_338942fc809e15f5(soldier, "jup_interaction_patrol_tablet_inventory_loop_02", "officer_exit");
    soldier = getstruct("fake_ai_booth6", "targetname");
    thread function_338942fc809e15f5(soldier, "jup_interaction_patrol_tablet_inventory_loop_03", "officer_exit");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d2b
// Size: 0x624
function function_6b4e8374db3201cf() {
    flag_wait("obj_yuri_completed");
    thread function_f3e127f410865078();
    thread function_41d1aee51e1eb349("struct_victim_01", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_stand_death_short_02"], "vfx_jup_milbase_character_gas_vig", "j_spinelower");
    thread function_41d1aee51e1eb349("struct_victim_03", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_jup_che_door_panic_death_b_in_2", "deadciv_scene_jup_che_door_panic_death_b_out_2"]);
    thread function_41d1aee51e1eb349("struct_victim_02", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_jup_che_door_panic_death_b_in_3", "deadciv_scene_jup_che_door_panic_death_b_out_3"]);
    thread function_41d1aee51e1eb349("struct_victim_22", "body_c_jup_sp_enemy_kastovsoldier_03", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_run_death_short_01"], "vfx_jup_milbase_character_gas_vig", "j_spinelower");
    thread function_41d1aee51e1eb349("struct_victim_23", "body_c_jup_sp_enemy_kastovsoldier_03", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_run_death_short_02"], "vfx_jup_milbase_character_gas_vig", "j_spinelower");
    thread function_41d1aee51e1eb349("struct_victim_24", "body_c_jup_sp_enemy_kastovsoldier_02", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_stand_death_short_06"], "vfx_jup_milbase_character_gas_vig", "j_spinelower");
    utility::exploder("glass_crack");
    utility::exploder("gas_door");
    utility::exploder("sparks_lobby");
    utility::exploder("gas_corridor_1st_floor");
    thread function_39550ddb2299e2e0(2.2);
    flag_wait("gas_1");
    thread function_41d1aee51e1eb349("struct_victim_07", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_jup_che_door_panic_death_a_in_1", "deadciv_scene_jup_che_door_panic_death_a_out_1"]);
    thread function_41d1aee51e1eb349("struct_victim_21", "body_c_jup_sp_enemy_kastovsoldier_03", "head_sc_m_androsov_bg", "prisoner01", ["deadciv_scene_jup_che_door_panic_death_b_out_3"]);
    thread function_41d1aee51e1eb349("struct_victim_20", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_cueto_civ", "prisoner01", ["deadciv_scene_jup_che_door_panic_death_b_in_2", "deadciv_scene_jup_che_door_panic_death_b_out_2"]);
    thread function_41d1aee51e1eb349("struct_victim_05", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_kamalov_bg", "prisoner01", ["deadciv_scene_stand_death_short_05"]);
    thread function_41d1aee51e1eb349("struct_victim_25", "body_c_jup_sp_enemy_kastovsoldier_03", "head_sc_m_shapiro", "prisoner01", ["deadciv_scene_stand_death_short_08"]);
    thread function_41d1aee51e1eb349("struct_victim_26", "body_c_jup_sp_enemy_kastovsoldier_02", "head_sc_m_colvin_civ", "prisoner01", ["deadciv_scene_stand_death_short_06"]);
    thread function_41d1aee51e1eb349("struct_victim_27", "body_c_jup_sp_enemy_kastovsoldier_02", "head_sc_m_montano_bg", "prisoner01", ["deadciv_scene_stand_death_short_07"]);
    utility::exploder("gas_office_2");
    utility::exploder("sparks_corridor_1st_floor");
    trigger_wait_targetname("spawn_civ2");
    thread function_41d1aee51e1eb349("struct_victim_19", "body_c_jup_sp_enemy_kastovsoldier_02", "head_sc_m_rosas_bg", "prisoner01", ["deadciv_scene_stand_death_short_05"]);
    thread function_41d1aee51e1eb349("struct_victim_18", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_thorp_bg", "prisoner01", ["deadciv_scene_stand_death_short_01"]);
    thread function_41d1aee51e1eb349("struct_victim_17", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_sharipov_nohair", "prisoner01", ["deadciv_scene_stand_death_short_03"]);
    thread function_41d1aee51e1eb349("struct_victim_28", "body_c_jup_sp_enemy_kastovsoldier_03", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_stand_death_short_07"]);
    thread function_41d1aee51e1eb349("struct_victim_29", "body_c_jup_sp_enemy_kastovsoldier_02", "head_sc_m_androsov_bg", "prisoner01", ["deadciv_scene_stand_death_short_08"]);
    thread function_41d1aee51e1eb349("struct_victim_04", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_cueto_civ", "prisoner01", ["deadciv_scene_jup_che_door_panic_death_b_in_3", "deadciv_scene_jup_che_door_panic_death_b_out_2"]);
    thread function_41d1aee51e1eb349("struct_victim_09", "body_c_jup_sp_enemy_kastovsoldier_03", "head_sc_m_kamalov_bg", "prisoner01", ["deadciv_scene_stand_death_short_04"]);
    thread function_41d1aee51e1eb349("struct_victim_08", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_shapiro", "prisoner01", ["deadciv_scene_stand_death_short_02"]);
    thread function_41d1aee51e1eb349("struct_victim_30", "body_c_jup_sp_enemy_kastovsoldier_02", "head_sc_m_colvin_civ", "prisoner01", ["deadciv_scene_stand_death_short_07"]);
    flag_wait("gas_4");
    flag_set("flag_lasthallway_trigger");
    utility::exploder("gas_1st_floor_stairwell");
    utility::exploder("gas_corridor_2nd_floor_hallway");
    thread function_41d1aee51e1eb349("struct_victim_11", "body_c_jup_sp_enemy_kastovsoldier_02", "head_sc_m_rosas_bg", "prisoner01", ["deadciv_scene_run_death_long_03"]);
    thread function_41d1aee51e1eb349("struct_victim_10", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_thorp_bg", "prisoner01", ["deadciv_scene_run_death_long_02"]);
    thread function_41d1aee51e1eb349("struct_victim_12", "body_c_jup_sp_enemy_kastovsoldier_03", "head_sc_m_sharipov_nohair", "prisoner01", ["deadciv_scene_run_death_short_01"]);
    thread function_41d1aee51e1eb349("struct_victim_13", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_ramirez_no_hair", "prisoner01", ["deadciv_scene_run_death_short_02"]);
    trigger_wait_targetname("trigger_door_window_vignette");
    thread function_41d1aee51e1eb349("struct_victim_31", "body_c_jup_sp_enemy_kastovsoldier_01", "head_c_jup_enemy_pmc_soldier_v02", "prisoner01", ["deadciv_scene_jup_che_door_panic_death_b_in_1", "deadciv_scene_jup_che_door_panic_death_b_out_1"]);
    utility::exploder("guy_bashing_door_vig");
    utility::exploder("gas_corridor_2nd_floor");
    trigger_wait_targetname("vol_ladder");
    flag_set("player_on_ladder");
    trigger_wait_targetname("spawn_4th_floor");
    utility::exploder("gas_4th_floor_room");
    utility::exploder("sparks_4th_floor_room");
    utility::exploder("sparks_4nd_floor_stairwell");
    utility::exploder("gas_corridor_4th_floor");
    thread function_41d1aee51e1eb349("struct_victim_35", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_androsov_bg", "prisoner01", ["deadciv_scene_stand_death_short_03"]);
    wait 1;
    thread function_41d1aee51e1eb349("struct_victim_32", "body_c_jup_sp_enemy_kastovsoldier_01", "head_sc_m_cueto_civ", "prisoner01", ["deadciv_scene_stand_death_short_05"]);
    thread function_41d1aee51e1eb349("struct_victim_34", "body_c_jup_sp_enemy_kastovsoldier_03", "head_sc_m_shapiro", "prisoner01", ["deadciv_scene_jup_che_door_panic_death_b_in_3", "deadciv_scene_jup_che_door_panic_death_b_out_3"]);
    flag_wait("gas_9");
    wait 1;
    utility::exploder("gas_4nd_floor_stairwell");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8357
// Size: 0x16d
function function_f3e127f410865078() {
    flag_wait("gas_9");
    utility::exploder("roof_gas");
    utility::exploder("gas_5th_floor_vent");
    utility::exploder("roof_gas_preroll");
    utility::exploder("gas_cloud_2");
    utility::stop_exploder("ash_screen");
    var_c11df6725967bb5f = getstructarray("extra_gas_roof_struct", "targetname");
    if (var_c11df6725967bb5f.size != 0) {
        foreach (var_ee9ca75d46efdc3b in var_c11df6725967bb5f) {
            var_ee9ca75d46efdc3b.var_f465860fc8f9473 = spawn_tag_origin(var_ee9ca75d46efdc3b.origin, var_ee9ca75d46efdc3b.angles);
            var_29151229786d655e = playfxontag(getfx("vfx_jup_milbase_ambient_gas_lrg"), var_ee9ca75d46efdc3b.var_f465860fc8f9473, "tag_origin");
        }
        trigger_wait("heli_exfil", "targetname");
        foreach (var_ee9ca75d46efdc3b in var_c11df6725967bb5f) {
            stopfxontag(getfx("vfx_jup_milbase_ambient_gas_lrg"), var_ee9ca75d46efdc3b.var_f465860fc8f9473, "tag_origin");
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x84cc
// Size: 0x205
function function_41d1aee51e1eb349(structname, var_4f0b67db0284401a, var_984357ecc006a19c, animname, animarray, gas_fx, fx_tag, fx_delay) {
    struct = getstruct(structname, "targetname");
    actor = spawn_model(var_4f0b67db0284401a, struct.origin, struct.angles);
    headorigin = actor gettagorigin("j_spine4");
    var_ce13cdd14f070f9f = actor gettagangles("j_spine4");
    if (isdefined(var_984357ecc006a19c)) {
        if (isdefined(actor.headmodel)) {
            actor detach(actor.headmodel);
        }
        actor.headmodel = var_984357ecc006a19c;
        actor attach(actor.headmodel, "", 1);
    }
    actor.animname = animname;
    actor setanimtree();
    model = spawn("script_model", (0, 0, 0));
    model setmodel("weapon_wm_ar_kilo433_brprop_nophys");
    model linkto(actor, "tag_weapon_right", (0, 0, 0), (0, 0, 0));
    if (isdefined(gas_fx)) {
        if (!isdefined(fx_tag)) {
            fx_tag = "tag_origin";
        }
        if (isdefined(fx_delay)) {
            childthread function_f00cf9f69c806c0e(fx_delay, actor, gas_fx, fx_tag);
        } else {
            playfxontag(getfx(gas_fx), actor, fx_tag);
        }
    }
    foreach (var_422d35dd347c8233 in animarray) {
        struct anim_single_solo(actor, var_422d35dd347c8233);
    }
    thread function_e8e5d930e0f830c7(actor);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x86d9
// Size: 0x3f
function function_f00cf9f69c806c0e(fx_delay, actor, gas_fx, fx_tag) {
    wait fx_delay;
    playfxontag(getfx(gas_fx), actor, fx_tag);
    iprintlnbold("delayed fx playing");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8720
// Size: 0x9a
function function_39550ddb2299e2e0(var_da2a461be7462284) {
    level endon("game_ended");
    level.player endon("death");
    wait var_da2a461be7462284;
    thread function_63b4dddac6f892d5("pdl_emitter_floor_start", "pdl_emitter_floor_end", 25, 0, undefined);
    thread function_63b4dddac6f892d5("pdl_emitter_ceiling_start", "pdl_emitter_ceiling_end", 24, 0, undefined);
    thread function_63b4dddac6f892d5("pdl_emitter_left_start_1", "pdl_emitter_left_end_1", 5, 0, &function_9cb3a7ec5239c1fd);
    thread function_63b4dddac6f892d5("pdl_emitter_right_start_1", "pdl_emitter_right_end_1", 5, 0, &function_1fdd88d7b13d27b6);
    thread function_63b4dddac6f892d5("pdl_emitter_ceiling_start_2", "pdl_emitter_ceiling_end_2", 8, 18, undefined);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87c2
// Size: 0x18
function function_9cb3a7ec5239c1fd() {
    thread function_63b4dddac6f892d5("pdl_emitter_left_start_2", "pdl_emitter_left_end_2", 20, 0, undefined);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87e2
// Size: 0x18
function function_1fdd88d7b13d27b6() {
    thread function_63b4dddac6f892d5("pdl_emitter_right_start_2", "pdl_emitter_right_end_2", 20, 0, undefined);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x8802
// Size: 0x43d
function function_63b4dddac6f892d5(startname, var_aab96aded7dd68b5, durationsec, initialwait, var_ee891efe2d5177b7) {
    level endon("game_ended");
    level.player endon("death");
    if (isnumber(initialwait) && initialwait > 0) {
        wait initialwait;
    }
    var_722d65f48df14725 = 18;
    var_5fcb7c734dcefb57 = 1;
    var_5c0ee27851c8666d = 5;
    var_e159375c2ed495ce = 10;
    var_abdd814ba6fce678 = 40;
    mindamage = 2;
    maxdamage = 10;
    assert(durationsec > 0);
    startnodes = getstructarray(startname, "targetname");
    var_a80f02e353b14323 = getstructarray(var_aab96aded7dd68b5, "targetname");
    if (!isdefined(startnodes) || !isdefined(var_a80f02e353b14323)) {
        return;
    }
    assert(startnodes.size == 2);
    assert(var_a80f02e353b14323.size == 2);
    if (vectordot(startnodes[0].origin - startnodes[1].origin, var_a80f02e353b14323[0].origin - var_a80f02e353b14323[1].origin) < 0) {
        temp = var_a80f02e353b14323[0];
        var_a80f02e353b14323[0] = var_a80f02e353b14323[1];
        var_a80f02e353b14323[1] = temp;
    }
    var_3b5899cc502d9b8f = distance(startnodes[0].origin, startnodes[1].origin);
    var_8a22afaf7ea4662e = distance(var_a80f02e353b14323[0].origin, var_a80f02e353b14323[1].origin);
    var_ee7d8b3a90bd3b0e = (startnodes[1].origin - startnodes[0].origin) / var_3b5899cc502d9b8f;
    var_d0e6178be82021a1 = (var_a80f02e353b14323[1].origin - var_a80f02e353b14323[0].origin) / var_8a22afaf7ea4662e;
    var_b9319e4f6cc8716b = 0;
    spheres = [];
    while (var_b9319e4f6cc8716b < var_3b5899cc502d9b8f) {
        t = var_b9319e4f6cc8716b / var_3b5899cc502d9b8f;
        var_1af3b4abfbd3c0c2 = startnodes[0].origin + var_ee7d8b3a90bd3b0e * var_b9319e4f6cc8716b;
        var_228616a5fc8719ed = var_a80f02e353b14323[0].origin + var_d0e6178be82021a1 * t * var_8a22afaf7ea4662e;
        movedirection = var_228616a5fc8719ed - var_1af3b4abfbd3c0c2;
        newsphere = spawnstruct();
        newsphere.startradius = randomfloatrange(var_5fcb7c734dcefb57, var_5c0ee27851c8666d);
        newsphere.endradius = randomfloatrange(var_e159375c2ed495ce, var_abdd814ba6fce678);
        newsphere.startpos = startnodes[0].origin + var_ee7d8b3a90bd3b0e * var_b9319e4f6cc8716b;
        newsphere.endpos = newsphere.startpos + movedirection;
        spheres[spheres.size] = newsphere;
        var_b9319e4f6cc8716b += var_722d65f48df14725;
    }
    durationms = durationsec * 1000;
    starttime = gettime();
    endtime = starttime + durationms;
    currtime = starttime;
    while (currtime < endtime) {
        t = clamp((currtime - starttime) / durationms, 0, 1);
        for (i = 0; i < spheres.size; i++) {
            var_c31b9b1a2020044 = spheres[i];
            radius = lerp(var_c31b9b1a2020044.startradius, var_c31b9b1a2020044.endradius, t);
            position = lerp(var_c31b9b1a2020044.startpos, var_c31b9b1a2020044.endpos, t);
            level.player radiusdamage(position, radius, maxdamage, mindamage, level.player, "MOD_FALLING", undefined, 1, 0, 1);
            /#
            #/
        }
        currtime = gettime();
        waitframe();
    }
    if (isfunction(var_ee891efe2d5177b7)) {
        [[ var_ee891efe2d5177b7 ]]();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8c47
// Size: 0x351
function function_d1c357e5ae9b993b(var_ba92715e1a26f24e, radius, var_2cc485fe64608e0d) {
    utility::exploder("gas_office_1");
    utility::exploder("ash_screen");
    utility::exploder("gas_lobby");
    level endon("milbase_exfil_start");
    if (!isnumber(var_ba92715e1a26f24e) || !isnumber(radius) || !isfunction(var_2cc485fe64608e0d)) {
        assertmsg("start_killer_gas_movement - invalid parameters");
        return;
    }
    level.var_d221d113fd7ca144 = spawnstruct();
    level.var_d221d113fd7ca144.nodes = [];
    level.var_d221d113fd7ca144.damagearray = [];
    level.var_d221d113fd7ca144.var_81be2ca02005f4e0 = var_2cc485fe64608e0d;
    level.var_d221d113fd7ca144.totalduration = var_ba92715e1a26f24e * 1000;
    level.var_d221d113fd7ca144.timestarted = gettime();
    level.var_d221d113fd7ca144.radius = radius;
    rootnode = getstruct("gas_start", "targetname");
    if (!isdefined(rootnode)) {
        assertmsg("start_killer_gas_movement - gas_start not found");
        return;
    }
    level.var_d221d113fd7ca144.nodes[0] = rootnode;
    currentnode = rootnode;
    totaldist = 0;
    while (isdefined(currentnode.target)) {
        nextnode = getstruct(currentnode.target, "targetname");
        if (!isdefined(nextnode)) {
            assertmsg("start_killer_gas_movement - " + currentnode.target + " not found");
            return;
        }
        level.var_d221d113fd7ca144.nodes[level.var_d221d113fd7ca144.nodes.size] = nextnode;
        currentnode.var_9eb9e52b1dcd019d = length(nextnode.origin - currentnode.origin);
        totaldist += currentnode.var_9eb9e52b1dcd019d;
        currentnode = nextnode;
    }
    if (totaldist <= 0) {
        assertmsg("start_killer_gas_movement - 0 distance traveled is a bad thing");
        return;
    }
    currdist = 0;
    for (i = 0; i < level.var_d221d113fd7ca144.nodes.size - 1; i++) {
        level.var_d221d113fd7ca144.nodes[i].var_2d8d86f94387b7c0 = currdist / totaldist;
        currdist += level.var_d221d113fd7ca144.nodes[i].var_9eb9e52b1dcd019d;
        level.var_d221d113fd7ca144.nodes[i].tend = currdist / totaldist;
    }
    level.currentnode = level.var_d221d113fd7ca144.nodes[0];
    for (i = 1; i < level.var_d221d113fd7ca144.nodes.size - 1; i++) {
        var_a23cebb011c6d52f = "gas_" + string(i);
        level thread function_12225bddb3bd705a(var_a23cebb011c6d52f);
    }
    thread function_2779242d73d39f38();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8fa0
// Size: 0x4e
function function_12225bddb3bd705a(var_a23cebb011c6d52f) {
    level endon("game_ended");
    level endon("milbase_exfil_start");
    gastrigger = get_target_ent(var_a23cebb011c6d52f);
    if (!isdefined(gastrigger)) {
        /#
            iprintln("<dev string:xf1>");
        #/
    }
    trigger_wait_targetname(var_a23cebb011c6d52f);
    flag_set(var_a23cebb011c6d52f);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ff6
// Size: 0x493
function function_2779242d73d39f38() {
    level endon("game_ended");
    level endon("milbase_exfil_start");
    previoustime = level.var_d221d113fd7ca144.timestarted;
    i = 1;
    var_ffa49f3895024e2b = getstruct("gas_start", "targetname");
    var_8e45451037ca5ed5 = spawn_tag_origin(var_ffa49f3895024e2b.origin);
    gas_fx = playfxontag(getfx("vfx_jup_milbase_dynamic_gas"), var_8e45451037ca5ed5, "tag_origin");
    var_f6aeb082aa97df3e = playfxontag(getfx("vfx_jup_milbase_ambient_gas_lrg"), var_8e45451037ca5ed5, "tag_origin");
    level.var_5923e15028b34238 = spawn_tag_origin(var_8e45451037ca5ed5.origin);
    level.var_5923e15028b34238 linkto(var_8e45451037ca5ed5, "tag_origin", (0, 0, 50), (0, 0, 0));
    level notify("gas_begins");
    level.var_cbc9529c2be75444 = var_ffa49f3895024e2b.origin;
    thread gas_backfill();
    while (i < level.var_d221d113fd7ca144.nodes.size) {
        curr = level.var_d221d113fd7ca144.nodes[i - 1];
        next = level.var_d221d113fd7ca144.nodes[i];
        var_85fedbcca7e83ac4 = float(gettime() - previoustime) / float(level.var_d221d113fd7ca144.totalduration);
        while (var_85fedbcca7e83ac4 >= curr.tend) {
            i += 1;
            curr = level.var_d221d113fd7ca144.nodes[i - 1];
            next = level.var_d221d113fd7ca144.nodes[i];
            if (!isdefined(next)) {
                break;
            }
            var_15f3873556578cd6 = gettime() - previoustime;
            previoustime = gettime();
            var_a23cebb011c6d52f = "gas_" + string(i);
            wait_for_flag_or_timeout(var_a23cebb011c6d52f, 5);
            timedifference = gettime() - previoustime;
            previoustime = timedifference + previoustime - var_15f3873556578cd6;
        }
        if (var_85fedbcca7e83ac4 >= 1 || !isdefined(curr.var_2d8d86f94387b7c0) || !isdefined(curr.tend)) {
            break;
        }
        offset = (0, 0, 100);
        var_417558b00197c3fe = clamp((var_85fedbcca7e83ac4 - curr.var_2d8d86f94387b7c0) / (curr.tend - curr.var_2d8d86f94387b7c0), 0, 1);
        if (isdefined(level.var_cbc9529c2be75444)) {
            var_4c7e5383ddb18f75 = distancesquared(level.player.origin, level.var_cbc9529c2be75444);
        } else {
            var_4c7e5383ddb18f75 = 40000;
        }
        if (var_4c7e5383ddb18f75 > squared(450)) {
            var_5e6ce37bb5c4acd9 = 300;
        } else if (var_4c7e5383ddb18f75 > squared(300)) {
            var_5e6ce37bb5c4acd9 = 200;
        } else {
            var_5e6ce37bb5c4acd9 = 90;
        }
        var_9051a863f000c9f3 = next.origin;
        var_8a00cbc4790c244b = distance(var_8e45451037ca5ed5.origin, var_9051a863f000c9f3);
        time = var_8a00cbc4790c244b / var_5e6ce37bb5c4acd9;
        var_8e45451037ca5ed5 moveto(var_9051a863f000c9f3 + offset, time);
        level.var_cbc9529c2be75444 = var_8e45451037ca5ed5.origin - offset;
        /#
            sphere(level.var_cbc9529c2be75444, level.var_d221d113fd7ca144.radius);
            sphere(level.var_5923e15028b34238.origin, 50);
        #/
        victims = function_143526130b12b2b6(level.var_cbc9529c2be75444, level.var_d221d113fd7ca144.radius);
        foreach (victim in victims) {
            [[ level.var_d221d113fd7ca144.var_81be2ca02005f4e0 ]](victim, level.var_cbc9529c2be75444);
        }
        waitframe();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9491
// Size: 0x7d
function gas_backfill() {
    var_af23f10ac4202c68 = getentarray("gas_backfill", "targetname");
    flag_wait("start_yuri_elevator_scene");
    foreach (area in var_af23f10ac4202c68) {
        area thread function_f18b1e8b2c89bd30(area.script_noteworthy);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9516
// Size: 0x24a
function function_f18b1e8b2c89bd30(flag) {
    while (!level.var_5923e15028b34238 istouching(self)) {
        waitframe();
    }
    while (level.var_5923e15028b34238 istouching(self)) {
        waitframe();
    }
    wait 1;
    if (isdefined(self.target)) {
        var_dcbec0adc5c68ae8 = getstructarray(self.target, "targetname");
        foreach (location in var_dcbec0adc5c68ae8) {
            gas_fx = playfx(getfx("vfx_jup_milbase_greenout_gas"), location.origin);
        }
    } else {
        gas_fx = playfx(getfx("vfx_jup_milbase_greenout_gas"), self.origin);
    }
    while (true) {
        if (level.player istouching(self) && isdefined(level.player.currentweapon) && !level.player isswitchingweapon() && !level.Laswell function_754c9897f3b89964()) {
            waitframe();
            if (isalive(level.player) && !level.player isswitchingweapon() && !level.player isonladder() && !istrue(level.player.var_9d0f7bdbf533acdc)) {
                level.player playgestureviewmodel("iw9_ges_gas_cough_long", undefined, 1, 0.5, 0);
            }
            thread function_430ffe8d0fc6dd89();
            level.player dodamage(25, level.player.origin, level.player, undefined, "MOD_RADIATION");
            wait 1;
        } else if (level.player istouching(self) && level.Laswell function_754c9897f3b89964()) {
            level.player dodamage(25, level.player.origin, level.player, undefined, "MOD_RADIATION");
            wait 1;
        }
        waitframe();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9768
// Size: 0x78
function function_f07b10f41f8e20f5(victim, var_8dbfe54926288d78) {
    if (!isalive(victim)) {
        return;
    }
    if (victim != level.player) {
        function_7c056844333ddb9d(victim);
    }
    level.var_d221d113fd7ca144.damagearray = [level.player];
    /#
        iprintln("<dev string:x103>" + victim.classname + "<dev string:x112>");
    #/
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97e8
// Size: 0xb5
function function_ec24c68335d91973() {
    level endon("milbase_exfil_start");
    for (i = 0; true; i = 0) {
        wait 0.5;
        var_4c7e5383ddb18f75 = distancesquared(level.player.origin, level.var_cbc9529c2be75444);
        if (flag("gas_10")) {
            waitframe();
            continue;
        }
        if (var_4c7e5383ddb18f75 < 22500) {
            if (i > 1.5) {
                level.player dodamage(5, level.player.origin, level.player, undefined, "MOD_RADIATION");
            }
            i += 0.5;
            continue;
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98a5
// Size: 0x305
function function_8a55d7eda2fa007e() {
    self endon("death");
    self endon("end_gas_effects");
    var_fe313ba44098efd4 = getentarray("end_run_trigger", "targetname");
    wait 1;
    thread function_fdc8e4c891ba0513();
    while (true) {
        if (flag("exfil_startpoint")) {
            break;
        }
        if (isdefined(level.var_cbc9529c2be75444)) {
            var_4c7e5383ddb18f75 = distancesquared(self.origin, level.var_cbc9529c2be75444);
        } else {
            var_4c7e5383ddb18f75 = 1000;
        }
        if (self isswitchingweapon() || !isdefined(level.player.currentweapon)) {
            wait 1;
        } else if (flag("flag_coughing_gesture_for_vo")) {
            wait 1.5;
            if (!self isswitchingweapon() && isdefined(level.player.currentweapon)) {
                level.player playgestureviewmodel("iw9_ges_gas_cough_long", undefined, 1, 0.5, 0);
            }
            flag_clear("flag_coughing_gesture_for_vo");
        } else if (level.Laswell function_754c9897f3b89964() || flag("flag_sprinting_stopped") || self isonladder()) {
            foreach (trig in var_fe313ba44098efd4) {
                if (self istouching(trig)) {
                    wait 1;
                    level.player dodamage(1, level.player.origin, level.player, undefined, "MOD_RADIATION");
                }
            }
            waitframe();
        } else if (var_4c7e5383ddb18f75 < 40000) {
            thread function_430ffe8d0fc6dd89();
            level.player playgestureviewmodel("iw9_ges_gas_cough_long", undefined, 1, 0.5, 0);
            wait 3;
        } else if (var_fe313ba44098efd4.size > 0) {
            foreach (trig in var_fe313ba44098efd4) {
                if (self istouching(trig)) {
                    thread function_430ffe8d0fc6dd89();
                    level.player playgestureviewmodel("iw9_ges_gas_cough_long", undefined, 1, 0.5, 0);
                    wait 1;
                    level.player dodamage(1, level.player.origin, level.player, undefined, "MOD_RADIATION");
                    wait 1;
                    level.player dodamage(1, level.player.origin, level.player, undefined, "MOD_RADIATION");
                    wait 1;
                    level.player dodamage(1, level.player.origin, level.player, undefined, "MOD_RADIATION");
                }
            }
        }
        waitframe();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bb2
// Size: 0x2f
function function_fdc8e4c891ba0513() {
    self endon("death");
    while (true) {
        if (self isgestureplaying()) {
            self allowreload(0);
        } else {
            self allowreload(1);
        }
        waitframe();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9be9
// Size: 0xad
function function_af55b7e6ea92f36f(var_3054d3f1da9b4d10) {
    level.player.var_5d9dfcce4467b1e9 = 1;
    level.player.var_3054d3f1da9b4d10 = make_weapon(var_3054d3f1da9b4d10);
    level.player thread actionslotoverride(4, "hud_icon_conceal_weapon", undefined, &function_b3da5a140f52f491);
    level.player.var_8f3beb00f228fcc5 = "actionslot" + 4;
    level.player thread function_454160abbe2a7e72();
    level.player.var_db8bccaf7400c28d = 0;
    level.player thread function_b1ae5247e34b2fba();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c9e
// Size: 0x1ff
function function_b1ae5247e34b2fba() {
    level.player.var_c92d4e70abb067d = make_weapon("jup_me_fists_milbase");
    self endon("death");
    level.var_f0bf3ab1ef46bc5c = 0;
    while (true) {
        var_ff99c4fde1caa810 = level.player getnormalizedmovement(0.2, 0.1);
        var_bd837da502678594 = var_ff99c4fde1caa810[0];
        var_df78441a978e79e3 = var_ff99c4fde1caa810[1];
        if (self issprinting() && function_2ce1c0a896e78e0e() && !level.var_f0bf3ab1ef46bc5c) {
            give_weapon(level.player.var_c92d4e70abb067d, 0, 0, 0, 1);
            self switchtoweapon(level.player.var_c92d4e70abb067d);
            level.var_f0bf3ab1ef46bc5c = 1;
            level.player allowsupersprint(0);
        } else if (self isthrowinggrenade() || self function_55965d2ca2ada688()) {
            waitframe();
        } else if (function_e4e2baa7c800aa78() || self ismeleeing()) {
            waitframe();
        } else if (self issprinting() && function_2ce1c0a896e78e0e() && level.var_f0bf3ab1ef46bc5c) {
            waitframe();
        } else if (self issprinting() && level.var_f0bf3ab1ef46bc5c && !level.player.var_db8bccaf7400c28d) {
            waitframe();
        } else if (!self issprinting() && level.var_f0bf3ab1ef46bc5c) {
            flag_set("flag_sprinting_stopped");
            self switchtoweaponimmediate(level.player.var_3054d3f1da9b4d10);
            wait 0.25;
            take_weapon(level.player.var_c92d4e70abb067d);
            level.var_f0bf3ab1ef46bc5c = 0;
            level.player allowsupersprint(1);
            wait 0.25;
            flag_clear("flag_sprinting_stopped");
        }
        waitframe();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ea5
// Size: 0x24d
function function_b3da5a140f52f491() {
    self endon("death");
    if (flag("flag_dungeon_intro_complete") == 0) {
        return;
    }
    if (istrue(level.player.in_melee_death)) {
        return;
    }
    if (flag("keycard_anim_active")) {
        return;
    }
    if (flag("hat_seq_active")) {
        return;
    }
    if (istrue(level.player.var_9d0f7bdbf533acdc)) {
        return;
    }
    if (!level.player.var_5d9dfcce4467b1e9 || function_e4e2baa7c800aa78()) {
        return;
    }
    if (level.var_f0bf3ab1ef46bc5c) {
        wait 0.1;
    }
    level.player.var_9d0f7bdbf533acdc = 1;
    if (!function_2ce1c0a896e78e0e()) {
        self.var_899b3dd3160215 = self getcurrentprimaryweapon();
        self.var_8da87ae2137cc1f1 = self getweaponslistprimaries();
        self giveweapon(self.var_3054d3f1da9b4d10, 0, 0, 0, 1);
        self switchtoweapon(self.var_3054d3f1da9b4d10);
        if (isdefined(self.var_83cbb07fffb16598)) {
            self [[ self.var_83cbb07fffb16598 ]]();
        }
        val::set("holster", "weapon_switch", 0);
        level.player.var_db8bccaf7400c28d = 1;
        self allowmountside(0);
        self allowmounttop(0);
        self setweaponhudiconoverride("actionslot" + 4, "hud_icon_equip_weapon");
        flag_set("player_has_holstered");
    } else {
        self takeweapon(self.var_3054d3f1da9b4d10);
        self takeweapon(level.player.var_c92d4e70abb067d);
        level.var_f0bf3ab1ef46bc5c = 0;
        self switchtoweapon(self.var_899b3dd3160215);
        if (isdefined(self.var_f3ef94dd433632b6)) {
            self [[ self.var_f3ef94dd433632b6 ]]();
        }
        val::reset_all("holster");
        level.player.var_db8bccaf7400c28d = 0;
        self allowmountside(1);
        self allowmounttop(1);
        self setweaponhudiconoverride("actionslot" + 4, "hud_icon_conceal_weapon");
    }
    level.player setclientomnvar("ui_is_weapon_holstered", function_2ce1c0a896e78e0e());
    wait 0.5;
    level.player.var_9d0f7bdbf533acdc = 0;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0fa
// Size: 0xb3
function function_454160abbe2a7e72() {
    self endon("death");
    flag_wait("flag_listen_for_swap_weapon");
    self notifyonplayercommand("notify_draw_weapon", "+weapnext");
    self notifyonplayercommand("notify_draw_weapon", "+weapprev");
    self notifyonplayercommand("notify_draw_weapon", "selectweapon1");
    self notifyonplayercommand("notify_draw_weapon", "selectweapon2");
    self notifyonplayercommand("notify_draw_weapon", "selectweapon3");
    while (true) {
        self waittill("notify_draw_weapon");
        if (level.player.var_db8bccaf7400c28d) {
            if (self isthrowinggrenade() || self function_55965d2ca2ada688()) {
                waitframe();
            } else {
                thread function_b3da5a140f52f491();
            }
            continue;
        }
        waitframe();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1b5
// Size: 0x64
function function_e4e2baa7c800aa78() {
    if (flag("disable_equip_offhands")) {
        return true;
    }
    if (level.player isonladder()) {
        return true;
    }
    if (level.player isjumping()) {
        return true;
    }
    if (level.player ismantling()) {
        return true;
    }
    if (level.player ishanging()) {
        return true;
    }
    return false;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa222
// Size: 0x37
function function_2ce1c0a896e78e0e() {
    if (level.var_f0bf3ab1ef46bc5c) {
        return 1;
    }
    return level.player getcurrentweapon() == level.player.var_3054d3f1da9b4d10;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa261
// Size: 0x24
function function_12b98953a00d3c28() {
    return level.player getcurrentweapon() != level.player.var_3054d3f1da9b4d10;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa28e
// Size: 0x95
function intro_start() {
    if (flag("keycards_initialized")) {
        return;
    }
    thread function_fb3d1ed4bd60933b();
    thread function_4e03610e7e75a10();
    thread function_d7a529e51d930f30();
    thread function_407322f1ab736e46();
    thread function_5a8c688fd630ffa4("intel_door_front", "intel_door_open", "intel_door_close", 1, 1);
    thread function_5a8c688fd630ffa4("intel_door_hall", "obj_yuri_completed", "bogus", 0, 0);
    thread function_da40363e22107634("intel_door_reader_1");
    thread function_ec0951b0a6df0d29();
    thread function_da40363e22107634("intel_door_reader_2");
    flag_set("keycards_initialized");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa32b
// Size: 0x2d
function function_1902dbd5331d1a31() {
    level endon("game_ended");
    level endon("intel_reached");
    flag_wait_all("spawn_small_heli", "gate_2_open");
    function_5ce9fded3c956567("test");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa360
// Size: 0x70
function function_5b115de73eb3a8fa() {
    add_extra_autosave_check("milbase_spotted", &function_199fa9b009a3e36e, "player spotted");
    add_extra_autosave_check("milbase_badvol", &function_a16e41343db1c9de, "player in bad volume");
    add_extra_autosave_check("milbase_alarm", &function_a007dcc9f9e63826, "alarm active");
    add_extra_autosave_check("milbase_idlestate", &function_843fee6340125c30, "AI out of idle state");
    add_extra_autosave_check("milbase_noautosave", &function_820b76d8a2fbac0, "flag noautosave");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa3d8
// Size: 0x2f
function function_5ce9fded3c956567(str) {
    if (flag("flag_dont_autosave")) {
        return;
    }
    if (!isdefined(str)) {
        str = "null";
    }
    thread autosave_by_name(str);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa40f
// Size: 0x14
function function_199fa9b009a3e36e() {
    if (function_eac0cd99c9c6d8ee() == "spotted") {
        return false;
    }
    return true;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa42c
// Size: 0x14
function function_a16e41343db1c9de() {
    if (flag("in_bad_volume")) {
        return false;
    }
    return true;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa449
// Size: 0x14
function function_a007dcc9f9e63826() {
    if (flag("flag_alarm")) {
        return false;
    }
    return true;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa466
// Size: 0x14
function function_820b76d8a2fbac0() {
    if (flag("flag_dont_autosave")) {
        return false;
    }
    return true;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa483
// Size: 0x6c
function function_843fee6340125c30() {
    aiarray = getaiarray("axis");
    foreach (guy in aiarray) {
        if (guy.var_fe5ebefa740c7106 != 0) {
            return false;
        }
    }
    return true;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa4f8
// Size: 0x19f
function intro_main() {
    blima = getent("exfil_blima_prop", "targetname");
    blima hide();
    play_intro();
    function_5ce9fded3c956567();
    flag_set("flag_listen_for_swap_weapon");
    thread function_6adcd56881467a22();
    thread function_e82d9012bd936c42();
    thread function_1902dbd5331d1a31();
    thread function_a4b07311e3759ef3("gate_arm_1", (0, 45, 0), "gate_1_open", 12);
    thread function_a4b07311e3759ef3("gate_arm_2", (0, 225, 0), "gate_2_open", 4);
    thread function_7dce9ffbc368f443("clipboard_02", "BLEND IN 02: Pick up clipboard", "Put down clipboard", (0, -20, 0));
    thread function_7dce9ffbc368f443("clipboard_03", "BLEND IN 03: Pick up clipboard", "Put down clipboard", (-16, 10, 0));
    thread function_7dce9ffbc368f443("clipboard_04", "BLEND IN 04: Pick up clipboard", "Put down clipboard", (-18, 10, 0));
    var_8ab9551cc453a28d = getstruct("marker_intel", "targetname");
    function_e18920c0717c1b4e(1);
    objective_add("reach_intel", "current", var_8ab9551cc453a28d.origin, %SP_JUP_MILBASE/OBJ_1_MILBASE, undefined, "icon_waypoint_objective_general", undefined, 1);
    flag_wait("show_intel_objective");
    wait 3;
    thread function_b26ad6615e6cf8ce(undefined, "show_intel_done");
    thread function_7ac596aa0d27af7();
    thread function_9eaeaa27414d176c();
    flag_wait("intel_reached");
    objective_remove("reach_intel");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa69f
// Size: 0x14
function function_9eaeaa27414d176c() {
    wait 9;
    flag_set("show_intel_done");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa6bb
// Size: 0xa6
function function_ed94bfd550813593() {
    level.var_b8b81eea2637d5b6 = spawn("script_model", level.player.origin + (0, 0, 60));
    level.var_b8b81eea2637d5b6 utility::make_weapon_model("iw9_ar_mcbravo_sp", ["ammo_blk", "bar_ar_light_p08|1", "grip_vertshort03|1", "iw9_selectsemi", "lasercyl_ads01|2", "mag_ar_heavy_p08|1", "pgrip_ar2_p08", "rec_mcbravo|1", "reflex07_tall|1", "stock_ar_tactical_p08|2"]);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa769
// Size: 0x2d
function function_407322f1ab736e46() {
    level endon("game_ended");
    level endon("intel_reached");
    trigger_wait("intel_complex_entrance", "targetname");
    flag_set("intel_reached");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa79e
// Size: 0xa0
function function_7ac596aa0d27af7() {
    flag_wait("spawn_small_heli");
    var_8ab9551cc453a28d = getstruct("admin_entrance_marker", "targetname");
    level.player setclientomnvar("ui_show_objectives", 0);
    wait 0.1;
    objective_set_position("reach_intel", var_8ab9551cc453a28d.origin + (0, 0, 40));
    wait 0.1;
    level.player setclientomnvar("ui_show_objectives", 1);
    wait 7.5;
    level.player setclientomnvar("ui_show_objectives", 0);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa846
// Size: 0x14
function function_4b2404091da9401a() {
    wait 5;
    flag_set("updateintel");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa862
// Size: 0x39
function intro_catchup() {
    intro_start();
    flag_set("milbase_spawn_first_wave");
    flag_set("milbase_spawn_vehicles");
    flag_set("flag_dungeon_intro_complete");
    flag_set("flag_listen_for_swap_weapon");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa8a3
// Size: 0xb9
function function_94a97fd91078ba34() {
    set_start_location("intro_infil", [level.player]);
    blima = getent("exfil_blima_prop", "targetname");
    blima hide();
    thread function_e82d9012bd936c42();
    thread function_1902dbd5331d1a31();
    thread function_7dce9ffbc368f443("clipboard_02", "BLEND IN 02: Pick up clipboard", "Put down clipboard", (0, -20, 0));
    thread function_7dce9ffbc368f443("clipboard_03", "BLEND IN 03: Pick up clipboard", "Put down clipboard", (-16, 10, 0));
    thread function_7dce9ffbc368f443("clipboard_04", "BLEND IN 04: Pick up clipboard", "Put down clipboard", (-18, 10, 0));
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa964
// Size: 0xa
function function_aa5913936600bb65() {
    thread intro_start();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa976
// Size: 0xe
function function_2e5925ffc2c1737a() {
    flag_set("intel_reached");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa98c
// Size: 0x40
function function_c67e8871d2817b30(anim_org) {
    flag_set("intro_anim_started");
    flag_set("flag_dungeon_intro_complete");
    function_1ae8f046dee579e0(0);
    level.player lerpfovscalefactor(1, 0);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9d4
// Size: 0xf9
function play_intro() {
    level endon("scene_skipped");
    thread function_cc514f4104398f38(&function_c67e8871d2817b30);
    function_1ae8f046dee579e0(1);
    scripts\sp\hud_util::fade_out(0);
    thread function_ce974eb72a6cd103();
    waitframe();
    level.player.var_f296f7e55b9e9150 = getdvarint(@"hash_b38fcf293d1e91a8");
    setsaveddvar(@"auto_sprint_enabled", 0);
    function_174dacfd80716a10(1);
    scripts\sp\anim::letterbox_enable(1, 0);
    flag_set("intro_anim_started");
    thread function_35b9ded36a8bcce1();
    anim_org = utility::getstruct("milbase_infil", "targetname");
    anim_org thread function_33009440fd696f91(undefined, undefined, "jup_milbase_infil");
    thread function_c627979396df497c();
    scripts\sp\hud_util::fade_in(3);
    anim_org waittill("scene_complete");
    function_174dacfd80716a10(0);
    function_1ae8f046dee579e0(0);
    level.player scripts\sp\utility::userskip_stop();
    flag_set("flag_dungeon_intro_complete");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaad5
// Size: 0x10
function function_35b9ded36a8bcce1() {
    wait 1;
    setmusicstate("mx_base_infil");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaaed
// Size: 0x62
function function_c627979396df497c() {
    struct = getstruct("infil_player_start_location", "targetname");
    if (isdefined(struct)) {
        struct.origin += (3, -5, 0);
        set_start_location([struct], [level.player]);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xab57
// Size: 0x48
function function_33009440fd696f91(existingentities, shotnames, scriptbundlename, var_f7ab585bff4b110, var_198fc279325346db) {
    level.var_1bef5b5c71f97d2b = self;
    scripts\common\scene::play(existingentities, shotnames, scriptbundlename, var_f7ab585bff4b110);
    self notify("scene_complete");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaba7
// Size: 0x53
function function_7ec46428e15d50b1() {
    level.player scripts\common\values::reset_all("player_rig");
    level.player stopanimscripted();
    level.player castshadows();
    level.player hidelegsandshadow();
    level.player unlink();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac02
// Size: 0x14c
function function_cc514f4104398f38(var_6b3bd87d12cded0f) {
    userskipped = level.player scripts\sp\utility::userskip_wait();
    if (!userskipped) {
        return;
    }
    flag_set("scene_skipped");
    thread scripts\sp\hud_util::fade_out(0);
    delaythread(0.1, &scripts\sp\hud_util::fade_in, 2);
    level.player stopsounds();
    level.player stopxcam();
    if (isdefined(level.var_1bef5b5c71f97d2b)) {
        level.var_1bef5b5c71f97d2b scripts\common\scene::stop();
    }
    function_7ec46428e15d50b1();
    if (isdefined(self.hidehudenabled) && self.hidehudenabled > 0) {
        level.player utility::hidehuddisable();
    }
    level.player val::reset_all("scene_shot");
    level.player allowfire(1);
    level.player function_3671ec427c125cb(0);
    level.player disablephysicaldepthoffieldscripting();
    thread namespace_abbbdacdbe0b9258::function_26280fbed5700639();
    hidecinematicletterboxing(2, 0);
    visionsetnaked("", 30);
    level.player clearcinematicmotionoverride();
    function_174dacfd80716a10(0);
    if (isdefined(var_6b3bd87d12cded0f)) {
        [[ var_6b3bd87d12cded0f ]](level.var_1bef5b5c71f97d2b);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad56
// Size: 0x136
function function_1410e3831b90c464() {
    level.player.var_f296f7e55b9e9150 = getdvarint(@"hash_b38fcf293d1e91a8");
    var_bed95e3fd3342b1 = getent_or_struct("yuri_door_clip", "targetname");
    if (isdefined(var_bed95e3fd3342b1)) {
        var_bed95e3fd3342b1.origin += (0, 0, -200);
    }
    setsaveddvar(@"auto_sprint_enabled", 1);
    thread function_7287fe752c7043bc();
    thread function_8a7729a732f490d3();
    thread function_f1dbebdb41e4698b();
    scripts\sp\anim::letterbox_enable(1, 1.5);
    thread function_ccef587867eebcd1();
    thread function_d235722812a0e074();
    thread function_6986135196d61336();
    thread function_80d102c29266ca79();
    anim_org = utility::getstruct("jup_milbase_yuri_animnode", "targetname");
    anim_org thread function_2e58afadada9990c();
    level thread function_c28214f4a163fb1e();
    anim_org scripts\common\scene::play(undefined, "shot_010");
    flag_set("flag_hide_gun");
    function_28e3974653fdc037("sp_jup_milbase_cine_yuri");
    anim_org scripts\common\scene::play(undefined, "shot_160");
    thread namespace_abbbdacdbe0b9258::function_26280fbed5700639();
    scripts\sp\anim::letterbox_enable(0, 1.5);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae94
// Size: 0x16
function function_c28214f4a163fb1e() {
    flag_wait("flag_show_viewmodel");
    function_174dacfd80716a10(0);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaeb2
// Size: 0x91
function function_2e58afadada9990c() {
    flag_wait("lgt_cine_scene_starts");
    actor = scene::get_entity("laswell");
    model = spawn("script_model", actor.origin);
    model setmodel("jup_misc_prop_golf17_silenced");
    model linkto(actor, "tag_weapon_right", (-11, -0.25, 0), (0, 0, 0));
    model show();
    flag_wait("flag_hide_gun");
    model hide();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaf4b
// Size: 0x43
function function_ba2baabe6401f3a4() {
    while (true) {
        wait 1;
        var_edec2e09fa851ba0 = getent("door_prop", "targetname");
        if (isdefined(var_edec2e09fa851ba0)) {
            /#
                iprintlnbold(var_edec2e09fa851ba0.angles);
            #/
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaf96
// Size: 0x19
function function_ccef587867eebcd1() {
    wait 0.75;
    function_174dacfd80716a10(1);
    thread namespace_c8b8bddad47ea676::function_8868b1102543bfc3();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xafb7
// Size: 0x10
function function_d235722812a0e074() {
    wait 109.5;
    thread function_801a0bd71fc25e37();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xafcf
// Size: 0x2c
function function_6986135196d61336() {
    flag_wait("flag_start_explosions");
    thread function_b1aba3670f3702f();
    wait 5.1;
    thread function_b1abb3670f37262();
    thread function_65195945547662e();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb003
// Size: 0xca
function function_80d102c29266ca79() {
    wait 1;
    anim_org = utility::getstruct("jup_milbase_yuri_animnode", "targetname");
    flag_wait("start_yuri_elevator_scene");
    actor = anim_org scene::get_entity("laswell");
    placement = utility::getstruct("laswell_yuri_exit", "targetname");
    var_2038020a554e9982 = spawnstruct();
    var_2038020a554e9982.origin = actor.origin + (0, 0, 0.455);
    var_2038020a554e9982.angles = (0, 91.1, 0);
    set_start_location([var_2038020a554e9982], [level.player]);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0d5
// Size: 0x24
function intel_start() {
    set_start_location("playerstart_intel", [level.player]);
    thread function_9bf25cd21b7a9b81();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb101
// Size: 0x137
function function_33d7eed79ffa5599() {
    var_8ab9551cc453a28d = getstruct("marker_intel", "targetname");
    thread function_4b7e52e81d89c1ad();
    thread function_afe9dac3bfce866a();
    thread intro_start();
    thread function_c6c78ce9aa0b2e23();
    thread function_ebdf0510b065605c();
    flag_wait("officer_exit");
    objective_add("get_keycard", "current", level.officer.origin, %SP_JUP_MILBASE/OBJ_2_MILBASE, undefined, "icon_waypoint_objective_general", 100, 1, 0, 1);
    objective_add_location_entity("get_keycard", "officer_location", level.officer);
    flag_wait("initial_door_close");
    wait 1.5;
    flag_wait("obj_keycard_completed");
    thread function_99c33e66f58bd719();
    objective_remove("get_keycard");
    var_8ab9551cc453a28d = getstruct("intel_door_reader_1", "targetname");
    wait 1.5;
    objective_add("enter_intel", "current", var_8ab9551cc453a28d.origin, %SP_JUP_MILBASE/OBJ_3_MILBASE, undefined, "icon_waypoint_objective_general", 12, 1, 0, 1);
    wait 1.5;
    flag_wait("ready_for_yuri");
    objective_remove("enter_intel");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb240
// Size: 0x15
function function_ebdf0510b065605c() {
    flag_wait("flag_enter_courtyard");
    function_5ce9fded3c956567();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb25d
// Size: 0x41
function function_afe9dac3bfce866a() {
    level endon("obj_keycard_completed");
    level endon("game_ended");
    trigger_wait("trig_doorway_entrance", "targetname");
    flag_set("flag_alarm");
    function_1c1b9d33706c152d(level.player, "gunshot");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2a6
// Size: 0x26
function function_99c33e66f58bd719() {
    level endon("ready_for_yuri");
    trigger_wait("trig_doorway_entrance", "targetname");
    flag_set("ready_for_yuri");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2d4
// Size: 0x1a
function function_7475a44642a257d6() {
    flag_set("obj_keycard_completed");
    flag_set("ready_for_yuri");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2f6
// Size: 0x3a
function function_da60a79285185f2a() {
    set_start_location("playerstart_yuri", [level.player]);
    wait 0.5;
    thread function_7287fe752c7043bc();
    thread function_8a7729a732f490d3();
    thread function_2cb05800600029e8();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb338
// Size: 0xcf
function function_2147ed99a835751b() {
    thread function_6af8e144c296c583();
    var_8ab9551cc453a28d = getstruct("obj_yuri_meet", "targetname");
    objective_add("meet_yuri", "current", var_8ab9551cc453a28d.origin, %SP_JUP_MILBASE/OBJ_4_MILBASE, undefined, "icon_waypoint_objective_general", 12, 1, 0, 1);
    wait 0.75;
    thread function_b26ad6615e6cf8ce(undefined, "obj_yuri_completed");
    flag_wait("obj_yuri_completed");
    objective_remove("meet_yuri");
    if (flag("flag_alarm")) {
        return;
    }
    thread function_31b4e8af8fe3564a(level.civ_intel);
    flag_clear("flag_dont_autosave");
    function_5ce9fded3c956567();
    function_1410e3831b90c464();
    thread namespace_c8b8bddad47ea676::function_e7d14c9764d93d0f();
    flag_set("start_yuri_elevator_scene");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb40f
// Size: 0x1a
function function_841d952fccce2360() {
    flag_set("obj_yuri_completed");
    flag_set("start_yuri_elevator_scene");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb431
// Size: 0xe3
function escape_start() {
    placement = utility::getstruct("laswell_yuri_exit", "targetname");
    var_2038020a554e9982 = spawnstruct();
    var_2038020a554e9982.origin = placement.origin;
    var_2038020a554e9982.angles = (0, 80, 0);
    set_start_location([var_2038020a554e9982], [level.player]);
    thread namespace_abbbdacdbe0b9258::function_d108c22e1bc35518();
    thread function_2cb05800600029e8();
    thread function_f1dbebdb41e4698b();
    flag_set("start_yuri_elevator");
    flag_set("start_yuri_elevator_scene");
    var_edec2e09fa851ba0 = getent("door_prop", "targetname");
    var_edec2e09fa851ba0 rotateby((0, 90, 0), 0.01);
    thread function_c28214f4a163fb1e();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb51c
// Size: 0x303
function escape_main() {
    level thread function_12225bddb3bd705a("gas_1");
    level thread function_12225bddb3bd705a("gas_2");
    level thread function_12225bddb3bd705a("gas_10");
    thread function_d210697d56e2f91a();
    function_4e647c514964da47(259, 1);
    function_4e647c514964da47(262);
    flag_set("escape_sequence_start");
    thread function_5c3f69b4fbba70d2();
    thread function_d83675af26c6b634();
    thread namespace_c8b8bddad47ea676::function_2a601799e4831973();
    level notify("escape_sequence_start");
    var_bed95e3fd3342b1 = getent_or_struct("yuri_door_clip", "targetname");
    var_bed95e3fd3342b1.origin += (0, 0, -200);
    var_14436adea7437625 = level.player getammocount("throwingknife");
    startweapon = make_weapon("iw9_pi_golf17_sp_milbase", ["silencer01_pi"]);
    level.player hideviewmodel();
    level.player utility::hidehudenable();
    level.player allowsprint(0);
    level.player freezecontrols(0);
    level.player enableweapons();
    waitframe();
    if (level.player hasweapon(startweapon)) {
        level.player switchtoweaponimmediate(startweapon);
    }
    if (var_14436adea7437625 >= 1) {
        level.player give_offhand("throwingknife", var_14436adea7437625);
    }
    wait 0.5;
    if (function_12b98953a00d3c28()) {
        level.player thread function_b3da5a140f52f491();
        wait 0.5;
        level.player allowsprint(1);
        level.player utility::hidehuddisable();
    }
    flag_set("flag_show_viewmodel");
    function_5ce9fded3c956567();
    waitframe();
    function_f4438b59d3fbd131();
    var_8ab9551cc453a28d = getstruct("roof_door_marker", "targetname");
    objective_add("reach_roof", "current", var_8ab9551cc453a28d.origin, %SP_JUP_MILBASE/OBJ_5_MILBASE, undefined, "icon_waypoint_objective_general", undefined, 1, 0, 1);
    thread function_98f6bac101d6c35f();
    wait 1;
    thread function_d1c357e5ae9b993b(45, 150, &function_f07b10f41f8e20f5);
    thread function_ec24c68335d91973();
    level.player thread function_8a55d7eda2fa007e();
    thread function_99048828f621b4f0();
    thread function_b10ccd42435b04f2();
    function_d49df7ef7cb4fca6("fake_locked_door");
    thread function_4d26558966fa5182();
    flag_wait("start_heli_exfil");
    objective_remove("reach_roof");
    var_8ab9551cc453a28d = getstruct("chopper_exfil_marker", "targetname");
    objective_add("in_chopper", "current", var_8ab9551cc453a28d.origin, %SP_JUP_MILBASE/OBJ_6_MILBASE, undefined, "icon_waypoint_objective_general", undefined, 1, 0, 1);
    flag_wait("chopper_reached");
    objective_remove("in_chopper");
    flag_set("milbase_exfil_start");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb827
// Size: 0xd
function function_5c3f69b4fbba70d2() {
    setmusicstate("mx_base_yuri");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb83c
// Size: 0xb
function function_535d1365be9efc12(victim) {
    
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb84f
// Size: 0x1f
function function_98f6bac101d6c35f() {
    trigger_wait("heli_exfil", "targetname");
    flag_set("chopper_reached");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb876
// Size: 0xe
function escape_catchup() {
    flag_set("obj_yuri_completed");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb88c
// Size: 0x60
function function_4d26558966fa5182() {
    flag_wait("run_to_heli");
    thread function_1e63bef848d05f65();
    wait 7;
    while (!flag("chopper_reached")) {
        level.player dodamage(25, level.player.origin, level.player, undefined, "MOD_RADIATION");
        wait 1;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8f4
// Size: 0xbd
function function_1e63bef848d05f65() {
    level.player endon("end_gas_effects");
    var_fe313ba44098efd4 = getentarray("end_run_trigger", "targetname");
    while (true) {
        foreach (trig in var_fe313ba44098efd4) {
            if (level.player istouching(trig)) {
                level.player dodamage(30, level.player.origin, level.player, undefined, "MOD_RADIATION");
                wait 1;
            }
        }
        waitframe();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9b9
// Size: 0x7f
function function_4dce195f40ae6080() {
    set_start_location("playerstart_exfil", [level.player]);
    thread function_98f6bac101d6c35f();
    thread function_f3e127f410865078();
    flag_set("exfil_startpoint");
    flag_set("gas_9");
    flag_set("exfil_trigger_touched");
    thread function_b10ccd42435b04f2();
    thread function_4d26558966fa5182();
    level.player thread function_8a55d7eda2fa007e();
    level thread function_12225bddb3bd705a("gas_10");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba40
// Size: 0xa
function function_c491ef4666deb499() {
    thread function_99048828f621b4f0();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba52
// Size: 0xd
function function_87451c0371a2fc32() {
    setmusicstate("mx_base_yuri_end");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba67
// Size: 0x2
function function_6da48ae496824cd6() {
    
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba71
// Size: 0x1a
function function_99048828f621b4f0() {
    trigger_wait_targetname("trigger_heli incoming");
    flag_set("exfil_trigger_touched");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba93
// Size: 0x24
function function_de410ccccca132dd() {
    level endon("chopper_reached");
    placement = utility::getstruct("milbase_exfil_eyepos", "targetname");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbabf
// Size: 0x2b6
function function_f1dbebdb41e4698b() {
    doors = getentarray("elevator_door", "targetname");
    flag_wait("start_yuri_elevator");
    flag_clear("gas_1");
    flag_clear("gas_2");
    flag_clear("gas_3");
    foreach (door in doors) {
        door.original_pos = door.origin;
        open_pos = getstruct(door.target, "targetname");
        door moveto(open_pos.origin, 0.01);
        playsoundatpos((5651, 47916, 1096), "jup_mlb_escape_elevator_01");
    }
    struct = getstruct("yuri_fakeactor", "targetname");
    actor = spawn_model("body_c_jup_sp_hero_yuri_urban", struct.origin, struct.angles);
    headorigin = actor gettagorigin("j_spine4");
    var_ce13cdd14f070f9f = actor gettagangles("j_spine4");
    if (isdefined(actor.headmodel)) {
        actor detach(actor.headmodel);
    }
    actor.headmodel = "c_jup_head_hero_yuri";
    actor attach(actor.headmodel, "", 1);
    actor.animname = "prisoner01";
    actor setanimtree();
    model = spawn("script_model", (0, 0, 0));
    model setmodel("weapon_wm_ar_kilo433_brprop_nophys");
    model linkto(actor, "tag_weapon_right", (0, 0, 0), (0, 0, 0));
    struct thread anim_single_solo(actor, "jup_interaction_patrol_door_turn_knob_loop");
    flag_wait("start_yuri_elevator_scene");
    wait 1;
    struct thread anim_single_solo(actor, "jup_interaction_patrol_door_turn_knob_end");
    foreach (door in doors) {
        door moveto(door.original_pos, 1.25, 0.5, 0.5);
    }
    wait 2;
    actor delete();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd7d
// Size: 0x1c0
function function_b10ccd42435b04f2() {
    animnode = getstruct("jup_milbase_exfil", "targetname");
    blima = getent("exfil_blima_prop", "targetname");
    blima show();
    trigger_wait_targetname("trigger_heli incoming");
    thread namespace_c8b8bddad47ea676::function_19813e462cbab96c();
    blima hidepart("tag_main_rotor_blade_01");
    blima hidepart("tag_main_rotor_blade_02");
    blima hidepart("tag_main_rotor_blade_03");
    blima hidepart("tag_main_rotor_blade_04");
    blima hidepart("tag_tail_rotor_blade_01");
    blima hidepart("tag_tail_rotor_blade_02");
    blima hidepart("tag_tail_rotor_blade_03");
    blima hidepart("tag_tail_rotor_blade_04");
    thread utility::exploder("heli_land");
    thread function_fb4d3f10b10f2765();
    flag_wait("start_heli_exfil");
    shots = ["shot_heli_exfil_in"];
    thread function_1f1bb79211613edd(blima);
    thread namespace_c8b8bddad47ea676::function_d832a8c5ebdf4139();
    animnode scripts\common\scene::play(undefined, shots, undefined);
    shots = ["shot_heli_idle"];
    animnode thread scripts\common\scene::play(undefined, shots);
    trigger_wait("heli_exfil", "targetname");
    thread namespace_c8b8bddad47ea676::function_a8ee3f549e9967e3();
    level.player notify("end_gas_effects");
    thread function_87451c0371a2fc32();
    level.player.var_f296f7e55b9e9150 = getdvarint(@"hash_b38fcf293d1e91a8");
    function_174dacfd80716a10(1);
    scripts\sp\anim::letterbox_enable(1, 1.5);
    flag_set("chopper_reached");
    shots = ["shot_010", "shot_020", "shot_030"];
    animnode scripts\common\scene::play(undefined, shots);
    utility::nextmission();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf45
// Size: 0x39
function function_1f1bb79211613edd(blima) {
    blima setlookattext("Nik", %SP_JUP_MILBASE/YANKEE7);
    flag_wait("chopper_reached");
    blima setlookattext(" ", %);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbf86
// Size: 0x1a
function function_7a570604c17d1ff0() {
    flag_wait("gas_10");
    scripts\common\scene::function_bc521bee52fde214(1);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfa8
// Size: 0x4c
function function_fb4d3f10b10f2765() {
    door = scripts\sp\door::get_interactive_door("final_door");
    while (!door scripts\sp\door::function_bb083055639abcf3()) {
        waitframe();
    }
    movespeed = 90;
    player_speed_set(movespeed, 0.25);
    flag_set("start_heli_exfil");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbffc
// Size: 0x7d
function function_b6c57652a881c82d() {
    door = scripts\sp\door::get_interactive_door("4th_floor_death_door");
    flag_wait("gas_8");
    thread function_41d1aee51e1eb349("struct_victim_33", "body_c_jup_sp_enemy_kastovsoldier_02", "head_c_jup_enemy_pmc_soldier_v02", "prisoner01", ["zom_core_death_run_1"], "vfx_jup_milbase_character_gas_vig", "j_spinelower");
    exploder("gas_vig_blow");
    wait 0.25;
    thread function_b7263228b30b3dbe();
    door thread scripts\sp\door::door_open_completely(undefined, 0.3);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc081
// Size: 0x147
function function_c1cadb469d19553c() {
    flag_wait("exfil_trigger_touched");
    utility::exploder("heli_land");
    placement = utility::getstruct("milbase_exfil_eyepos", "targetname");
    anim_org = spawnstruct();
    anim_org.origin = placement.origin;
    anim_org.angles = (0, 315, 0);
    /#
        printtoscreen2d(100, 100, "<dev string:x11f>", (1, 0.8, 0.5), 0.5, 30);
    #/
    flag_wait("chopper_reached");
    anim_org scripts\common\scene::stop();
    level.player.var_f296f7e55b9e9150 = getdvarint(@"hash_b38fcf293d1e91a8");
    function_174dacfd80716a10(1);
    scripts\sp\anim::letterbox_enable(1, 1.5);
    placement = utility::getstruct("milbase_exfil_eyepos", "targetname");
    anim_org = spawnstruct();
    anim_org.origin = placement.origin;
    anim_org.angles = (0, 315, 0);
    anim_org scripts\common\scene::play(undefined, undefined, "jup_milbase_exfil");
    utility::nextmission();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc1d0
// Size: 0xdf
function function_d83675af26c6b634() {
    var_a14a78177828c533 = (6172, 48111, 1096);
    var_70f94b40e1f52156 = (6256, 47646, 1096);
    var_4e2a5e6a2c995a = (6703, 47163, 1096);
    var_caec16fd67e3a39b = (6950, 47057, 1096);
    var_6f6c02eec5e60d07 = (6339, 46857, 1276);
    var_c95291a7d682a251 = (6586, 46994, 1552);
    var_438752b1d78fdf54 = (6612, 47348, 1552);
    utility::play_loopsound_in_space("jup_mlb_escape_crowd_lp_01", var_a14a78177828c533);
    utility::play_loopsound_in_space("jup_mlb_escape_crowd_lp_02", var_caec16fd67e3a39b);
    utility::play_loopsound_in_space("jup_mlb_escape_single_lp_01", var_6f6c02eec5e60d07);
    utility::play_loopsound_in_space("jup_mlb_escape_single_lp_04", var_438752b1d78fdf54);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc2b7
// Size: 0x25
function function_ce974eb72a6cd103() {
    flag_wait_any("intro_anim_started", "flag_dungeon_intro_complete");
    wait 1.5;
    flag_set("introscreen_start_wait");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc2e4
// Size: 0xb3
function function_e6583b77266834a8(bool) {
    player = level.player;
    registered = "milbase";
    if (bool) {
        player setstance("stand", 1, 1, 1);
        player val::set(registered, "freezecontrols", 1);
        player val::set(registered, "cinematic_motion", 0);
        player val::set(registered, "weapon", 0);
        player val::set(registered, "damage", 0);
        player val::set(registered, "breath_system", 0);
        player val::set(registered, "show_weapon_hud", 0);
        player cleardamageindicators();
        return;
    }
    player val::reset_all(registered);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc39f
// Size: 0x49
function function_174dacfd80716a10(bool, var_20259eb1c3e06bb6) {
    if (bool) {
        function_e6583b77266834a8(1);
        level.player hideviewmodel();
        return;
    }
    function_e6583b77266834a8(0);
    level.player showviewmodel();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3f0
// Size: 0x78
function function_31b4e8af8fe3564a(enemies) {
    if (!isdefined(enemies)) {
        return;
    }
    foreach (enemy in enemies) {
        if (isalive(enemy)) {
            enemy notify("self_cleanup");
            enemy.diequietly = 1;
            enemy delete();
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc470
// Size: 0x17
function function_21d2d80a6e9afd6a(vehicle) {
    if (isdefined(vehicle)) {
        vehicle delete();
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc48f
// Size: 0xa7
function function_7dce9ffbc368f443(var_27542e3c37d911ee, var_5f42ac273c57f382, var_5ab3f4c456246edf, offsetpos) {
    var_d7b44cb498fdacdb = getstruct(var_27542e3c37d911ee + "_player", "targetname");
    var_d349e85506abebac = getstruct(var_27542e3c37d911ee + "_view", "targetname");
    var_d37e0a3cbf7cca3 = getent(var_27542e3c37d911ee + "_placed", "targetname");
    var_f8a5b48922b20cf6 = getent(var_27542e3c37d911ee + "_held", "targetname");
    var_f8a5b48922b20cf6 hide();
    var_d37e0a3cbf7cca3 hide();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc53e
// Size: 0x9e
function function_7a355e84fdac2267(object) {
    level endon(!"clipboard_held");
    wait 0.7;
    var_77098c76e7f0d4fa = object.origin;
    var_77098b76e7f0d2c7 = object.origin - (0, 0, 2);
    while (flag("clipboard_held")) {
        object moveto(var_77098b76e7f0d2c7, 0.7, 0.1, 0.1);
        wait 0.5;
        object moveto(var_77098c76e7f0d4fa, 0.7, 0.1, 0.1);
        wait 0.5;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc5e4
// Size: 0xd6
function function_d62f6ad4647f5fe1(var_1d6aa90a9f946bbe, var_5f42ac273c57f382, var_5ab3f4c456246edf, viewtarget, offsetpos) {
    var_c6d85fd89bfca52c = getstruct(var_1d6aa90a9f946bbe, "targetname");
    var_c6d85fd89bfca52c scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 4), var_5f42ac273c57f382, 360, 250, 80);
    var_c6d85fd89bfca52c waittill("trigger");
    level.player thread function_3029f5e4bbc0397d(offsetpos, viewtarget, 1, 35, 35, 15, 20, 1);
    wait 1;
    var_c6d85fd89bfca52c scripts\sp\player\cursor_hint::create_cursor_hint(undefined, (0, 0, 4), var_5ab3f4c456246edf, 360, 500, 300);
    var_c6d85fd89bfca52c waittill("trigger");
    level.player unlink();
    wait 1;
    thread function_d62f6ad4647f5fe1(var_1d6aa90a9f946bbe, var_5f42ac273c57f382, var_5ab3f4c456246edf, viewtarget);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc6c2
// Size: 0x10a
function get_point_in_local_ent_space(var_df845bfef23f16ce, offset) {
    var_5d6805ef12f78ae7 = var_df845bfef23f16ce.origin;
    var_616a6ecc2c2a4eb0 = anglestoup(var_df845bfef23f16ce.angles);
    var_66b10616a68f00f9 = anglestoleft(var_df845bfef23f16ce.angles);
    var_b842cc1147bdb416 = anglestoforward(var_df845bfef23f16ce.angles);
    newx = offset[0] * var_b842cc1147bdb416[0] + offset[1] * var_66b10616a68f00f9[0] + offset[2] * var_616a6ecc2c2a4eb0[0] + var_5d6805ef12f78ae7[0];
    newy = offset[0] * var_b842cc1147bdb416[1] + offset[1] * var_66b10616a68f00f9[1] + offset[2] * var_616a6ecc2c2a4eb0[1] + var_5d6805ef12f78ae7[1];
    newz = offset[0] * var_b842cc1147bdb416[2] + offset[1] * var_66b10616a68f00f9[2] + offset[2] * var_616a6ecc2c2a4eb0[2] + var_5d6805ef12f78ae7[2];
    newpos = (newx, newy, newz);
    return newpos;
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xc7d5
// Size: 0x169
function function_3029f5e4bbc0397d(offsetpos, viewtarget, var_c668dc5430e3f768, var_c5603ca2cdf40107, var_b36d9c2e29de55b6, var_f788ba9a333c757, var_fa0a1beb651ed293, var_a17db9b8373ca6bd, var_dbe269f3b6799cb4, var_3b6451bc8c0344ba) {
    var_17764a5442f14d73 = spawn("script_model", var_c668dc5430e3f768.origin);
    forward = get_point_in_local_ent_space(var_17764a5442f14d73, offsetpos);
    self.rig = spawn_anim_model("player_rig", forward, viewtarget.angles);
    self.rig hide();
    assert(isdefined(self.rig));
    var_dbe269f3b6799cb4 = default_to(var_dbe269f3b6799cb4, 1);
    var_3b6451bc8c0344ba = default_to(var_3b6451bc8c0344ba, 1);
    self playerlinktoblend(self.rig, "tag_player", 0.75, 0.2, 0.2);
    wait 0.75;
    self playerlinktodelta(self.rig, "tag_player", var_c5603ca2cdf40107, var_b36d9c2e29de55b6, var_f788ba9a333c757, var_fa0a1beb651ed293, var_a17db9b8373ca6bd);
    if (var_3b6451bc8c0344ba) {
        self setplayerangles(self.rig gettagangles("tag_player"));
    }
    if (var_dbe269f3b6799cb4) {
        self.rig hide();
        return;
    }
    self.rig show();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc946
// Size: 0x48
function function_b26010c485af57a5() {
    if (flag("player_has_holstered") == 0) {
        display_hint("holster_weapon", 10);
        while (true) {
            if (function_12b98953a00d3c28() == 0) {
                function_55f59c2fe542a1de();
                flag_set("concealed_weapon");
                return;
            }
            waitframe();
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc996
// Size: 0x5f
function function_4b7e52e81d89c1ad() {
    level endon("obj_keycard_completed");
    var_3ca809a7bdc95834 = getentarray("kill_room", "targetname");
    while (true) {
        if (level.player is_touching_any(var_3ca809a7bdc95834)) {
            flag_set("in_kill_room");
        } else {
            flag_clear("in_kill_room");
        }
        wait 0.5;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc9fd
// Size: 0xe9
function function_44b982d001b9b294(endflag) {
    level endon(endflag);
    level.officer endon("death");
    var_3ca809a7bdc95834 = getentarray("kill_room", "targetname");
    while (function_2ce1c0a896e78e0e()) {
        if (flag("in_kill_room")) {
            distcheck = distance2d(level.player.origin, level.officer.origin);
            if (distcheck <= 400) {
                var_622f8d6774a5ba2f = sighttracepassed(level.player geteye(), level.officer geteye(), 0, level.officer, level.player);
                if (var_622f8d6774a5ba2f) {
                    display_hint("draw_weapon", 10);
                    break;
                }
            }
        }
        wait 0.5;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xcaee
// Size: 0x11e
function function_97a9929eaaa096a1(var_56d319a7d100e05e, var_dae0e19c928e74bb, var_ce4b47e2a63b34d2, var_62d0861609a93c98) {
    level endon(var_56d319a7d100e05e);
    if (isdefined(var_ce4b47e2a63b34d2)) {
        thread function_b5b029728bc43e6b(var_56d319a7d100e05e, var_ce4b47e2a63b34d2);
    }
    var_caabe63c8c3d7e44 = 0;
    while (true) {
        var_caabe63c8c3d7e44 = within_fov(level.player.origin + (0, 0, 40), level.player getplayerangles(1), var_dae0e19c928e74bb.origin + (0, 0, 40), 0.258819);
        if (!var_caabe63c8c3d7e44) {
            wait 0.2;
            continue;
        }
        var_622f8d6774a5ba2f = sighttracepassed(level.player.origin + (0, 0, 40), var_dae0e19c928e74bb.origin + (0, 0, 40), 0, var_dae0e19c928e74bb, level.player);
        if (var_622f8d6774a5ba2f) {
            level thread [[ var_62d0861609a93c98 ]]();
            flag_set(var_56d319a7d100e05e);
            return;
        }
        wait 0.2;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcc14
// Size: 0x20
function function_b5b029728bc43e6b(var_56d319a7d100e05e, var_ce4b47e2a63b34d2) {
    level endon(var_56d319a7d100e05e);
    wait var_ce4b47e2a63b34d2;
    flag_set(var_56d319a7d100e05e);
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc3c
// Size: 0x91
function function_e82d9012bd936c42() {
    level endon("game_ended");
    function_9eaa4caf3c05202d();
    wait 0.25;
    function_155fe87f0d1ac7b();
    thread function_b26010c485af57a5();
    flag_wait("vo_intro_complete");
    wait 1.25;
    flag_set("show_intel_objective");
    wait 1;
    function_cd1c141856757c32();
    flag_set("show_intel_vo_finished");
    thread function_c5425b5ce819b3d2();
    flag_wait("spawn_small_heli");
    function_f2ffae8c74f88dde();
    thread function_b02ccd95322149d7();
    flag_wait("intel_reached");
    level thread function_9bf25cd21b7a9b81();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xccd5
// Size: 0xeb
function function_9bf25cd21b7a9b81() {
    level endon("game_ended");
    function_9eaa4caf3c05202d();
    thread function_58a7b31864e94877();
    function_5729a6df7fd10f13();
    flag_wait("officer_exit");
    thread function_97a9929eaaa096a1("saw_Officer", level.officer, 10, &function_39a46d271fddf188);
    flag_wait("saw_Officer");
    thread function_b44816c5f8d6f767();
    flag_wait("officer_1_in");
    function_5ce9fded3c956567("officer_breakoff");
    wait 1;
    flag_set("officer_breakoff");
    flag_wait("officer_dead");
    function_4f631b41706e6270();
    flag_wait("obj_keycard_completed");
    thread function_e692710140d25bdf();
    function_2474b6ab7ddebaab();
    flag_wait("ready_for_yuri");
    function_4330f0ff1be9a2b();
    thread function_3f9c9aafcd751ff1();
    flag_wait("obj_yuri_completed");
    function_b8d0983186d43b3e();
    level thread function_2cb05800600029e8();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdc8
// Size: 0xb9
function function_2cb05800600029e8() {
    level endon("game_ended");
    function_9eaa4caf3c05202d();
    flag_wait("escape_sequence_start");
    wait 0.5;
    level thread function_411a0c6ed1de7ae4();
    flag_set("flag_coughing_gesture_for_vo");
    function_50e88508a1b3a727();
    flag_wait("vo_stairwell");
    function_ab947789152120e2();
    thread function_5752c30310012c2f();
    flag_wait("vo_gas_5");
    function_29efd9f9273328c6();
    flag_wait("vo_gas_6");
    thread function_10066217f1e7ea88();
    flag_wait("vo_gas_7");
    function_c535089281bbdef1();
    flag_wait("vo_gas_9");
    function_c92fb4892b0d25eb();
    flag_wait("start_heli_exfil");
    function_67cc8ceb8dbc7061();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xce89
// Size: 0xc9
function private function_411a0c6ed1de7ae4() {
    level endon("game_ended");
    trigger_wait_targetname("gas_4");
    flag_set("vo_gas_4");
    trigger_wait_targetname("vol_stairwell");
    flag_set("vo_stairwell");
    trigger_wait_targetname("gas_5");
    flag_set("vo_gas_5");
    trigger_wait_targetname("gas_6");
    flag_set("vo_gas_6");
    trigger_wait_targetname("gas_7");
    flag_set("vo_gas_7");
    trigger_wait_targetname("gas_8");
    flag_set("vo_gas_8");
    trigger_wait_targetname("gas_9");
    flag_set("vo_gas_9");
    trigger_wait_targetname("gas_10");
    flag_set("vo_gas_10");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcf5a
// Size: 0x248
function function_b44816c5f8d6f767() {
    level endon("officer_dead");
    thread function_346fa52676920c09();
    thread function_9dfdd6a6e617ab0d();
    flag_wait("officer_1_in");
    thread function_44b982d001b9b294("officer_1_out");
    thread function_97a9929eaaa096a1("vo_officer_1_in", level.officer, 10, &function_36cd5a85f290c8ef);
    flag_wait("vo_officer_1_in");
    flag_wait("officer_1_out");
    thread function_9dfdd4a6e617a6a7();
    thread function_97a9929eaaa096a1("vo_officer_1_out", level.officer, 10, &function_6b8d9f94b222d874);
    flag_wait("vo_officer_1_out");
    flag_wait("officer_2_in");
    thread function_44b982d001b9b294("officer_2_out");
    thread function_97a9929eaaa096a1("vo_officer_2_in", level.officer, 10, &function_7e4c38a3be37d1cc);
    flag_wait("vo_officer_2_in");
    flag_wait("officer_2_out");
    thread function_97a9929eaaa096a1("vo_officer_2_out", level.officer, 10, &function_a480481b1742edf9);
    flag_wait("vo_officer_2_out");
    flag_wait("officer_3_in");
    thread function_44b982d001b9b294("officer_3_out");
    thread function_97a9929eaaa096a1("vo_officer_3_in", level.officer, 10, &function_e2a19ab98e3473a1);
    flag_wait("vo_officer_3_in");
    flag_wait("officer_3_out");
    thread function_97a9929eaaa096a1("vo_officer_3_out", level.officer, 5, &function_481f27137efdcb82);
    flag_wait("vo_officer_3_out");
    flag_clear("officer_1_in");
    flag_clear("officer_1_out");
    flag_clear("officer_2_in");
    flag_clear("officer_2_out");
    flag_clear("officer_3_in");
    flag_clear("officer_3_out");
    flag_clear("vo_officer_1_in");
    flag_clear("vo_officer_1_out");
    flag_clear("vo_officer_2_in");
    flag_clear("vo_officer_2_out");
    flag_clear("vo_officer_3_in");
    flag_clear("vo_officer_3_out");
    level.vo.var_38c66843ef1f9b5c = istrue(level.vo.var_38c66843ef1f9b5c) == 0;
    thread function_b44816c5f8d6f767();
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1aa
// Size: 0x13
function function_58a7b31864e94877() {
    wait 5;
    setmusicstate("mx_base_intel");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1c5
// Size: 0xd
function function_e692710140d25bdf() {
    stopmusicstate("mx_base_intel");
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1da
// Size: 0x43
function function_38cfdcddc037ce41() {
    self endon("death");
    scripts\common\vehicle_code::function_c2b5282b537a56bc();
    level.player waittill("death", attacker);
    if (isdefined(attacker) && attacker == self) {
        function_4e647c514964da47(265, 1);
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd225
// Size: 0x7b
function function_1b43b0bcf17d2544() {
    self endon("death");
    while (true) {
        waitframe();
        if (level.player istouching(self)) {
            var_f31b6411dcf0a783 = self vehicle_getspeed();
            if (var_f31b6411dcf0a783 >= 6) {
                childthread function_8a474f3ae16c3e69(0, -0.6);
                if (!flag("flag_alarm")) {
                    thread function_33c23797c51fb50d();
                    function_4e647c514964da47(265, 1);
                    flag_set("flag_alarm");
                }
                break;
            }
        }
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd2a8
// Size: 0xcf
function function_c9c5021c6773ad89(inflictor) {
    forward = anglestoforward(inflictor.angles);
    moving = inflictor vehicle_getvelocity();
    between = math::anglebetweenvectors(forward, moving);
    movingforward = undefined;
    if (between < 45) {
        movingforward = 1;
    } else if (between > 135) {
        movingforward = 0;
    } else {
        return 0;
    }
    localorigin = coordtransformtranspose(level.player.origin, inflictor.origin, inflictor.angles);
    if (movingforward && localorigin[0] < 30) {
        return 1;
    }
    if (!movingforward && localorigin[0] > -30) {
        return 1;
    }
}

// Namespace sp_jup_milbase / namespace_cbf91a7e4a02d7fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd37f
// Size: 0x2b
function function_137fc90d1f21350c() {
    level endon("game_ended");
    level.player waittill("death", attacker);
    function_d3e99bb6a731a507();
}

