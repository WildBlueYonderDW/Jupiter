// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_2583ee5680cf4736;
#using script_860bfdfe82326e3;
#using script_639bf783929acf9b;
#using scripts\mp\equipment\c4.gsc;

#namespace doorbuy;

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x491
// Size: 0xc
function init_doorbuy() {
    level thread function_7d7811a152066077();
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a4
// Size: 0x6d
function function_7d7811a152066077() {
    level.var_4de493999935f442 = [];
    content_manager::register_script("doorbuy", &function_6d0912117e9a9e3);
    wait(0.1);
    mapdestinations = utility::getstructarray("content_destination", "variantname");
    if (isdefined(mapdestinations) && mapdestinations.size > 0) {
        level thread function_272932835d23225c(mapdestinations[0]);
    }
    level thread function_233b115afbbdb524();
    /#
        level thread function_67ce357c2e2478d7();
    #/
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x518
// Size: 0xd3
function function_272932835d23225c(destination) {
    foreach (location in destination.locations) {
        doorbuy_instance = location.instances["doorbuy"];
        if (isdefined(doorbuy_instance)) {
            foreach (instance in doorbuy_instance.versions) {
                content_manager::spawn_instance(instance);
            }
        }
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f2
// Size: 0x8e
function function_233b115afbbdb524() {
    var_37f334c1f5b39c65 = getentarray("zombie_door", "targetname");
    foreach (t_doorbuy in var_37f334c1f5b39c65) {
        instance = utility::getstruct(t_doorbuy.target, "targetname");
        t_doorbuy doorbuy_init(instance, 1);
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x687
// Size: 0x7f
function private function_6d0912117e9a9e3(instance) {
    var_25ad4528af3906ce = instance.contentgroups["doorbuy_trigger"];
    if (isarray(var_25ad4528af3906ce)) {
        foreach (var_c318cd3a7e81533a in var_25ad4528af3906ce) {
            var_c318cd3a7e81533a doorbuy_init(instance);
        }
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x70d
// Size: 0x962
function private doorbuy_init(instance, var_9c58267a9b1f2155) {
    a_doors = [];
    self.instance = instance;
    if (isdefined(self.script_modelname)) {
        door = content_manager::spawn_script_model(self, self.script_modelname, 1);
        door.n_open_time = self.script_timeout;
        door.var_7f70bb16ff4511bd = self.script_soundalias;
        a_doors = utility::array_add(a_doors, door);
        if (isent(door)) {
            if (door isscriptable()) {
                /#
                    assertex(door getscriptablehaspart("base"), "Doorbuy scriptable at " + door.origin + " needs to have a part named base");
                #/
                /#
                    assertex(door getscriptableparthasstate("base", "closed"), "Doorbuy scriptable at " + door.origin + " needs to have a base part with a 'closed' state");
                #/
                /#
                    assertex(door getscriptableparthasstate("base", "opening"), "Doorbuy scriptable at " + door.origin + " needs to have a base part with an 'opening' state");
                #/
                door setscriptablepartstate("base", "closed");
            } else if (isdefined(self.target2)) {
                var_d264bcb6d4a095a4 = utility::getstruct(self.target2, "targetname");
                door.var_a162751895346133 = var_d264bcb6d4a095a4.origin;
                door.var_a9b4e017df447bad = var_d264bcb6d4a095a4.angles;
            }
        }
        doorbuy_container = self;
        interact_location = door;
    } else {
        var_a4e265944c0fffe7 = utility::getstructarray(self.target2, "targetname");
        a_doors = [];
        if (isarray(var_a4e265944c0fffe7)) {
            foreach (s_door_loc in var_a4e265944c0fffe7) {
                if (!isdefined(s_door_loc.door)) {
                    s_door_loc.door = content_manager::spawn_script_model(instance, s_door_loc.script_modelname, 1, undefined, s_door_loc.origin);
                    s_door_loc.door.angles = s_door_loc.angles;
                    s_door_loc.door.target = s_door_loc.target;
                    s_door_loc.door.script_delete = s_door_loc.script_delete;
                    s_door_loc.door.n_open_time = utility::default_to(s_door_loc.script_timeout, self.script_timeout);
                    s_door_loc.door.var_7f70bb16ff4511bd = utility::default_to(s_door_loc.script_soundalias, self.script_soundalias);
                }
                a_doors = utility::array_add(a_doors, s_door_loc.door);
            }
        }
        if (isdefined(self.target2)) {
            var_5407d2589480cb66 = getscriptablearray(self.target2, "targetname");
            a_doors = utility::array_combine_unique(a_doors, var_5407d2589480cb66);
            var_ec583846f1cb5c0c = getentarray(self.target2, "targetname");
            a_doors = utility::array_combine_unique(a_doors, var_ec583846f1cb5c0c);
        }
        foreach (door in a_doors) {
            if (isent(door)) {
                if (door isscriptable()) {
                    /#
                        assertex(door getscriptablehaspart("base"), "Doorbuy scriptable at " + door.origin + " needs to have a part named base");
                    #/
                    /#
                        assertex(door getscriptableparthasstate("base", "closed"), "Doorbuy scriptable at " + door.origin + " needs to have a base part with a 'closed' state");
                    #/
                    /#
                        assertex(door getscriptableparthasstate("base", "opening"), "Doorbuy scriptable at " + door.origin + " needs to have a base part with an 'opening' state");
                    #/
                    door setscriptablepartstate("base", "closed");
                } else if (isdefined(door.target)) {
                    var_d264bcb6d4a095a4 = utility::getstruct(door.target, "targetname");
                    door.var_a162751895346133 = var_d264bcb6d4a095a4.origin;
                    door.var_a9b4e017df447bad = var_d264bcb6d4a095a4.angles;
                    if (isdefined(var_d264bcb6d4a095a4.target)) {
                        door.var_ccc321cb92e1d1d0 = getent(var_d264bcb6d4a095a4.target, "targetname");
                        if (isdefined(door.var_ccc321cb92e1d1d0)) {
                            door.var_ccc321cb92e1d1d0 notsolid();
                            door.var_ccc321cb92e1d1d0 connectpaths();
                        }
                    }
                } else if (isdefined(door.target2)) {
                    var_d264bcb6d4a095a4 = utility::getstruct(door.target2, "targetname");
                    door.var_a162751895346133 = var_d264bcb6d4a095a4.origin;
                    door.var_a9b4e017df447bad = var_d264bcb6d4a095a4.angles;
                }
                door.n_open_time = utility::default_to(door.n_open_time, door.script_timeout);
                door.var_7f70bb16ff4511bd = utility::default_to(door.var_7f70bb16ff4511bd, door.script_soundalias);
            }
        }
        if (istrue(var_9c58267a9b1f2155)) {
            interact_location = self;
            var_7aeee20648fcd230 = distance(self getpointinbounds(1, 1, 1), self getpointinbounds(-1, -1, -1));
            self.radius = var_7aeee20648fcd230;
        } else {
            interact_location = self.origin;
        }
    }
    self.radius = utility::default_to(self.radius, 40);
    self.script_cost = utility::default_to(self.script_cost, 1000);
    self.script_currency = utility::default_to(self.script_currency, "essence");
    if (function_be31d2b54e616fb7()) {
        str_hint = "SHARED_HINTSTRINGS/DOORBUY_POWER_HINT";
    } else {
        str_hint = function_eeb8c278274b96c3();
    }
    self.interact = interaction::register_interact(interact_location, self.radius, &doorbuy_used, str_hint, self.script_cost);
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "barrier_unpurchaseable_trigger") {
        self.interact setcursorhint("HINT_NOBUTTON");
    }
    if (function_be31d2b54e616fb7()) {
        self.interact sethintinoperable(1);
        self.interact setcursorhint("HINT_NOBUTTON");
    }
    level.var_4de493999935f442 = utility::array_add(level.var_4de493999935f442, self);
    self.interact.var_9c58267a9b1f2155 = var_9c58267a9b1f2155;
    if (isdefined(self.script_tag) && self.interact tagexists(self.script_tag)) {
        self.interact sethinttag(self.script_tag);
    } else if (self.interact tagexists("tag_hint")) {
        self.interact sethinttag("tag_hint");
    }
    self.interact.s_doorbuy = self;
    self.interact.doors = a_doors;
    minimap_icon = "cp_mp_doorbuy_minimap";
    if (function_be31d2b54e616fb7()) {
        minimap_icon = "cp_mp_power_door_minimap";
    }
    foreach (door in a_doors) {
        door.a_interacts = utility::default_to(door.a_interacts, []);
        door.a_interacts = utility::function_6d6af8144a5131f1(door.a_interacts, self.interact);
        if (door isscriptable()) {
            continue;
        }
        if (!isdefined(door.var_35e7c712de6487f6) && !utility::is_equal(door.script_noteworthy, "no_minimap")) {
            door.var_35e7c712de6487f6 = spawnscriptable(minimap_icon, door.origin, door.angles);
        }
    }
    if (isvector(interact_location) || istrue(var_9c58267a9b1f2155)) {
        self.interact.script_delete = 1;
        self.interact.b_is_trigger = 1;
    }
    thread function_e9c313af43b8ffa6();
    if (isdefined(level.var_180851032aeb2782)) {
        self thread [[ level.var_180851032aeb2782 ]]();
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1076
// Size: 0xa9
function private function_eeb8c278274b96c3() {
    if (isdefined(self.script_noteworthy)) {
        switch (self.script_noteworthy) {
        case #"hash_279cf0389419e022":
            str_hint = "SHARED_HINTSTRINGS/DOORBUY_BARRIER_LOCK_HINT";
            break;
        case #"hash_fe4be2d2f966a37d":
            str_hint = "SHARED_HINTSTRINGS/DOORBUY_BARRIER_HINT_ESSENCE";
            break;
        case #"hash_12c639a20c74c99a":
            str_hint = "SHARED_HINTSTRINGS/DOORBUY_AETHER_CHARGE_HINT_ESSENCE";
            break;
        default:
            str_hint = "SHARED_HINTSTRINGS/DOORBUY_HINT_ESSENCE";
            break;
        }
    } else if (self.script_currency == "essence") {
        str_hint = "SHARED_HINTSTRINGS/DOORBUY_HINT_ESSENCE";
    } else {
        str_hint = "SHARED_HINTSTRINGS/DOORBUY_HINT";
    }
    return str_hint;
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1127
// Size: 0x36f
function doorbuy_used(player) {
    if (isdefined(self.s_doorbuy.script_noteworthy) && self.s_doorbuy.script_noteworthy == "barrier_unpurchaseable_trigger") {
        return;
    }
    if (self.s_doorbuy function_be31d2b54e616fb7()) {
        if (!utility::flag(self.s_doorbuy.script_power) && !istrue(level.var_bbbe3abb95817b83)) {
            return;
        }
    }
    if (isdefined(player) && isdefined(self.s_doorbuy.script_currency) && isdefined(self.s_doorbuy.script_cost)) {
        if (!player currency::attempt_purchase(self.s_doorbuy.script_currency, self.s_doorbuy.script_cost, 1)) {
            player playsoundtoplayer("ui_zm_core_door_purchase_deny", player);
            return;
        }
    }
    if (isplayer(player)) {
        player playsoundtoplayer("ui_zm_core_door_purchase_success", player);
    }
    if (isarray(self.doors)) {
        self.doors = utility::array_removeundefined(self.doors);
        foreach (door in self.doors) {
            door thread open_doorbuy();
        }
    }
    if (isdefined(self.s_doorbuy.script_flag_set)) {
        var_b9249169199027bb = strtok(self.s_doorbuy.script_flag_set, " ");
        foreach (flag in var_b9249169199027bb) {
            utility::flag_set(flag);
        }
    }
    level notify("door_opened", self);
    if (isdefined(self.s_doorbuy.script_noteworthy) && self.s_doorbuy.script_noteworthy == "aether_charge_doorbuy") {
        self.s_doorbuy thread function_1071fb611dd3d29c();
    }
    if (isdefined(self.s_doorbuy.instance)) {
        var_25ad4528af3906ce = self.s_doorbuy.instance.contentgroups["doorbuy_trigger"];
        if (isarray(var_25ad4528af3906ce)) {
            foreach (var_c318cd3a7e81533a in var_25ad4528af3906ce) {
                if (isdefined(var_c318cd3a7e81533a.interact) && var_c318cd3a7e81533a.interact != self && istrue(var_c318cd3a7e81533a.interact.b_is_trigger)) {
                    var_c318cd3a7e81533a.interact delete();
                }
            }
        }
    }
    waitframe();
    if (isdefined(self)) {
        if (istrue(self.script_delete)) {
            self delete();
            return;
        }
        self makeunusable();
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149d
// Size: 0x26c
function open_doorbuy() {
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.var_e585f40be16294d9)) {
        return;
    }
    self endon("death");
    if (isdefined(self.script_label)) {
        if (self.script_label == "wait_for_bomb") {
            wait(1);
        }
        if (self.script_label == "doorbuy_zipline_doors") {
            self setmodel("t10_zm_energy_barrier_05_green");
        }
    }
    self.var_e585f40be16294d9 = 1;
    self notify("doorbuy_opening");
    self connectpaths();
    if (isdefined(self.var_35e7c712de6487f6)) {
        self.var_35e7c712de6487f6 freescriptable();
    }
    if (isarray(self.a_interacts)) {
        foreach (interact in self.a_interacts) {
            if (isdefined(interact)) {
                interact makeunusable();
            }
        }
    }
    if (self isscriptable()) {
        self setscriptablepartstate("base", "opening");
        if (istrue(self.script_delete)) {
            self freescriptable();
        }
        return;
    }
    if (isdefined(self.script_noteworthy) && self.script_noteworthy == "trig_rumble_mobile_barrier") {
        self delete();
        return;
    }
    n_time = utility::default_to(self.n_open_time, 0);
    n_time = clamp(n_time, 0, 999);
    if (self.classname != "script_brushmodel") {
        if (isdefined(self.var_7f70bb16ff4511bd)) {
            self playsound(self.var_7f70bb16ff4511bd);
        }
    }
    self notsolid();
    if (n_time > 0) {
        if (isdefined(self.var_a162751895346133)) {
            self moveto(self.var_a162751895346133, n_time);
            if (isdefined(self.var_a9b4e017df447bad)) {
                self rotateto(self.var_a9b4e017df447bad, n_time);
            }
            self waittill("movedone");
            if (isdefined(self.var_ccc321cb92e1d1d0)) {
                self.var_ccc321cb92e1d1d0 solid();
                self.var_ccc321cb92e1d1d0 disconnectpaths();
            }
            self disconnectpaths();
        } else {
            self movez(-150, n_time);
            self waittill("movedone");
            self delete();
        }
        if (istrue(self.script_delete)) {
            self delete();
        }
        return;
    }
    self delete();
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1710
// Size: 0x85
function function_bfd5db9911f7056b() {
    power_doors = [];
    foreach (doorbuy in level.var_4de493999935f442) {
        if (doorbuy function_be31d2b54e616fb7()) {
            power_doors = utility::array_combine(power_doors, doorbuy.interact.doors);
        }
    }
    return power_doors;
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x179d
// Size: 0x70
function function_be31d2b54e616fb7() {
    var_e93d7bb6a32245f0 = isdefined(self.script_power) && issubstr(self.script_power, "power");
    var_1b8234fcdeb31e41 = isdefined(self.script_type) && (self.script_type == "power_open" || self.script_type == "power_transform");
    return var_e93d7bb6a32245f0 || var_1b8234fcdeb31e41;
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1815
// Size: 0xf3
function function_1071fb611dd3d29c() {
    level endon("game_ended");
    for (i = 0; i < level.players.size; i++) {
        if (isarray(level.players[i].c4s)) {
            foreach (c4 in level.players[i].c4s) {
                if (distance_2d_squared(c4.origin, self.origin) < 1280 && abs(c4.origin[2] - self.origin[2]) < 640) {
                    c4 thread function_db6ccc8e1166190c();
                }
            }
        }
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190f
// Size: 0x14
function function_db6ccc8e1166190c() {
    level endon("game_ended");
    wait(1);
    scripts/mp/equipment/c4::sweepc4();
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x192a
// Size: 0x3c
function function_b92412ffa0393ddc(func) {
    if (!isdefined(self.var_142cbdd8a88f8259)) {
        self.var_142cbdd8a88f8259 = [];
    }
    self.var_142cbdd8a88f8259 = utility::function_6d6af8144a5131f1(self.var_142cbdd8a88f8259, func);
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x196d
// Size: 0x12a
function trigger_power(b_state, var_df15b645595483e) {
    doors = function_bfd5db9911f7056b();
    var_27c8a0347a3bbcb7 = !isdefined(var_df15b645595483e);
    foreach (door in doors) {
        var_f0b0324cf67d6487 = isdefined(door.script_int) && isdefined(var_df15b645595483e) && door.script_int == var_df15b645595483e;
        if (!var_f0b0324cf67d6487 && !var_27c8a0347a3bbcb7) {
            continue;
        }
        /#
            assert(isdefined(door.var_142cbdd8a88f8259), "No power function is defined for this power door.");
        #/
        foreach (func in door.var_142cbdd8a88f8259) {
            door thread [[ func ]](b_state);
        }
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a9e
// Size: 0x19
function private function_395efcf15256ee0a(var_76c5a85ca21a69b9) {
    if (istrue(var_76c5a85ca21a69b9)) {
        thread open_doorbuy();
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1abe
// Size: 0xe3
function private function_596802105bfa5a98(var_76c5a85ca21a69b9) {
    if (istrue(var_76c5a85ca21a69b9)) {
        foreach (interact in self.a_interacts) {
            str_hint = interact function_eeb8c278274b96c3();
            interact interaction::function_c2efffe46a3f99d2(str_hint, interact.script_cost);
            interact sethintinoperable(0);
            interact setcursorhint("HINT_BUTTON");
            if (!utility::is_equal(self.script_noteworthy, "no_minimap")) {
                self.var_35e7c712de6487f6 freescriptable();
                self.var_35e7c712de6487f6 = spawnscriptable("cp_mp_doorbuy_minimap", self.origin, self.angles);
            }
        }
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ba8
// Size: 0x116
function private function_e9c313af43b8ffa6() {
    door_type = self.script_type;
    if (!isdefined(door_type)) {
        if (function_be31d2b54e616fb7()) {
            door_type = "power_open";
        } else {
            return;
        }
    }
    switch (door_type) {
    case #"hash_40cb59b986cd76c7":
        foreach (door in self.interact.doors) {
            door function_b92412ffa0393ddc(&function_395efcf15256ee0a);
        }
        break;
    case #"hash_8ad550d7a39a5a2d":
        foreach (door in self.interact.doors) {
            door function_b92412ffa0393ddc(&function_596802105bfa5a98);
        }
        break;
    }
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc5
// Size: 0x87
function function_a7ca20ea38e7dd83() {
    level.var_bbbe3abb95817b83 = 1;
    foreach (s_doorbuy in level.var_4de493999935f442) {
        if (isdefined(s_doorbuy.interact)) {
            s_doorbuy.interact thread doorbuy_used();
        }
    }
    level.var_bbbe3abb95817b83 = undefined;
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d53
// Size: 0x47
function private function_67ce357c2e2478d7() {
    /#
        function_6e7290c8ee4f558b(" ");
        function_a9a864379a098ad6("power_transform", "<unknown string>", &function_6a0e53758c9edf, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a7ca20ea38e7dd83);
        function_fe953f000498048f();
    #/
}

// Namespace doorbuy / namespace_80b02d6a2f011786
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1da1
// Size: 0x661
function private function_6a0e53758c9edf() {
    /#
        var_39239d1f90650b = (0, 0, 4);
        var_e33953429ed350f = 0.25;
        while (true) {
            foreach (s_doorbuy in level.var_4de493999935f442) {
                if (!isdefined(s_doorbuy.interact)) {
                    continue;
                }
                var_d8b783bf56b63a71 = "<unknown string>";
                if (isdefined(s_doorbuy.script_tag) && s_doorbuy.interact tagexists(s_doorbuy.script_tag)) {
                    v_position = s_doorbuy.interact gettagorigin(s_doorbuy.script_tag);
                    var_d8b783bf56b63a71 = s_doorbuy.script_tag;
                } else if (s_doorbuy.interact tagexists("<unknown string>")) {
                    v_position = s_doorbuy.interact gettagorigin("<unknown string>", 1);
                    var_d8b783bf56b63a71 = "<unknown string>";
                } else {
                    v_position = s_doorbuy.interact.origin;
                }
                if (istrue(s_doorbuy.interact.var_9c58267a9b1f2155)) {
                    level thread utility::draw_entity_bounds(s_doorbuy.interact, 0.05);
                } else {
                    utility::draw_circle(v_position, s_doorbuy.interact.var_10a09b4e9dcdf2ed, (0, 0, 1), 1, 0, 1);
                }
                print3d(v_position, "<unknown string>" + s_doorbuy.script_currency, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b, "<unknown string>" + s_doorbuy.script_cost, (0, 1, 0), 1, var_e33953429ed350f);
                var_3c6719c8aa252447 = "<unknown string>";
                var_f884de9f009c09b4 = "<unknown string>";
                if (isdefined(s_doorbuy.script_flag_set)) {
                    var_b9249169199027bb = strtok(s_doorbuy.script_flag_set, "<unknown string>");
                    foreach (str_flag in var_b9249169199027bb) {
                        var_3c6719c8aa252447 = var_3c6719c8aa252447 + str_flag + "<unknown string>";
                    }
                    if (isdefined(level.zone_manager) && isarray(level.zone_manager.defs)) {
                        foreach (zone_def in level.zone_manager.defs) {
                            if (isarray(zone_def.adjacent_zones)) {
                                foreach (str_zone, var_5b7050cf7b40f6de in zone_def.adjacent_zones) {
                                    if (isarray(var_5b7050cf7b40f6de.flags)) {
                                        foreach (str_flag in var_5b7050cf7b40f6de.flags) {
                                            if (utility::array_contains(var_b9249169199027bb, str_flag)) {
                                                var_f884de9f009c09b4 = var_f884de9f009c09b4 + str_zone + "<unknown string>";
                                                break;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                print3d(v_position - var_39239d1f90650b * 2, "<unknown string>" + var_3c6719c8aa252447, (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 3, "<unknown string>" + var_f884de9f009c09b4, (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 4, "<unknown string>" + utility::default_to(s_doorbuy.script_power, "<unknown string>"), (0, 1, 0), 1, 0.25);
                if (istrue(s_doorbuy.interact.b_is_trigger)) {
                    var_ab9799ccaf563cab = "<unknown string>";
                    var_d8b783bf56b63a71 = "<unknown string>";
                } else {
                    var_ab9799ccaf563cab = "<unknown string>";
                    var_d8b783bf56b63a71 = "<unknown string>" + var_d8b783bf56b63a71 + "<unknown string>";
                }
                print3d(v_position - var_39239d1f90650b * 5, "<unknown string>" + var_ab9799ccaf563cab + var_d8b783bf56b63a71, (0, 1, 0), 1, 0.25);
                if (isarray(s_doorbuy.interact.doors)) {
                    s_doorbuy.interact.doors = utility::array_removeundefined(s_doorbuy.interact.doors);
                    foreach (door in s_doorbuy.interact.doors) {
                        line(v_position, door.origin, (0, 0, 1));
                        sphere(door.origin, 10, (0, 0, 1));
                        if (door isscriptable()) {
                            print3d(door.origin, "<unknown string>", (0, 1, 0), 1, 0.25);
                            continue;
                        }
                        print3d(door.origin, "<unknown string>", (0, 1, 0), 1, 0.25);
                    }
                }
            }
            waitframe();
        }
    #/
}

