// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_2583ee5680cf4736;
#using script_860bfdfe82326e3;
#using script_639bf783929acf9b;
#using scripts\mp\equipment\c4.gsc;

#namespace doorbuy;

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x491
// Size: 0xc
function function_cbbfa08aa26b64b0() {
    level thread function_7d7811a152066077();
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a4
// Size: 0x6d
function function_7d7811a152066077() {
    level.var_4de493999935f442 = [];
    namespace_4e16584f2211900a::function_72f3dd0512f43c96("doorbuy", &function_6d0912117e9a9e3);
    wait(0.1);
    var_e10b8f561af1621c = utility::getstructarray("content_destination", "variantname");
    if (isdefined(var_e10b8f561af1621c) && var_e10b8f561af1621c.size > 0) {
        level thread function_272932835d23225c(var_e10b8f561af1621c[0]);
    }
    level thread function_233b115afbbdb524();
    /#
        level thread function_67ce357c2e2478d7();
    #/
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x518
// Size: 0xd3
function function_272932835d23225c(destination) {
    foreach (location in destination.locations) {
        var_acb8d9335873584f = location.instances["doorbuy"];
        if (isdefined(var_acb8d9335873584f)) {
            foreach (instance in var_acb8d9335873584f.var_67b2b78e28eaa758) {
                namespace_4e16584f2211900a::function_7e2984b7610f3616(instance);
            }
        }
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f2
// Size: 0x8e
function function_233b115afbbdb524() {
    var_37f334c1f5b39c65 = getentarray("zombie_door", "targetname");
    foreach (var_f9cce06008cc220 in var_37f334c1f5b39c65) {
        instance = utility::getstruct(var_f9cce06008cc220.target, "targetname");
        var_f9cce06008cc220 function_a476b135626d5e76(instance, 1);
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x687
// Size: 0x7f
function private function_6d0912117e9a9e3(instance) {
    var_25ad4528af3906ce = instance.var_305e36cbb51f88ce["doorbuy_trigger"];
    if (isarray(var_25ad4528af3906ce)) {
        foreach (var_c318cd3a7e81533a in var_25ad4528af3906ce) {
            var_c318cd3a7e81533a function_a476b135626d5e76(instance);
        }
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x70d
// Size: 0x962
function private function_a476b135626d5e76(instance, var_9c58267a9b1f2155) {
    a_doors = [];
    self.instance = instance;
    if (isdefined(self.script_modelname)) {
        door = namespace_4e16584f2211900a::spawn_script_model(self, self.script_modelname, 1);
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
        var_8edc8ea9e853259b = self;
        var_5820f9f37c14b3fb = door;
    } else {
        var_a4e265944c0fffe7 = utility::getstructarray(self.target2, "targetname");
        a_doors = [];
        if (isarray(var_a4e265944c0fffe7)) {
            foreach (var_b503646c4e6bc6ba in var_a4e265944c0fffe7) {
                if (!isdefined(var_b503646c4e6bc6ba.door)) {
                    var_b503646c4e6bc6ba.door = namespace_4e16584f2211900a::spawn_script_model(instance, var_b503646c4e6bc6ba.script_modelname, 1, undefined, var_b503646c4e6bc6ba.origin);
                    var_b503646c4e6bc6ba.door.angles = var_b503646c4e6bc6ba.angles;
                    var_b503646c4e6bc6ba.door.target = var_b503646c4e6bc6ba.target;
                    var_b503646c4e6bc6ba.door.script_delete = var_b503646c4e6bc6ba.script_delete;
                    var_b503646c4e6bc6ba.door.n_open_time = utility::function_53c4c53197386572(var_b503646c4e6bc6ba.script_timeout, self.script_timeout);
                    var_b503646c4e6bc6ba.door.var_7f70bb16ff4511bd = utility::function_53c4c53197386572(var_b503646c4e6bc6ba.script_soundalias, self.script_soundalias);
                }
                a_doors = utility::array_add(a_doors, var_b503646c4e6bc6ba.door);
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
                door.n_open_time = utility::function_53c4c53197386572(door.n_open_time, door.script_timeout);
                door.var_7f70bb16ff4511bd = utility::function_53c4c53197386572(door.var_7f70bb16ff4511bd, door.script_soundalias);
            }
        }
        if (istrue(var_9c58267a9b1f2155)) {
            var_5820f9f37c14b3fb = self;
            var_7aeee20648fcd230 = distance(self getpointinbounds(1, 1, 1), self getpointinbounds(-1, -1, -1));
            self.radius = var_7aeee20648fcd230;
        } else {
            var_5820f9f37c14b3fb = self.origin;
        }
    }
    self.radius = utility::function_53c4c53197386572(self.radius, 40);
    self.var_3b948686580354ea = utility::function_53c4c53197386572(self.var_3b948686580354ea, 1000);
    self.var_1d5d5ebcae9ec180 = utility::function_53c4c53197386572(self.var_1d5d5ebcae9ec180, "essence");
    if (function_be31d2b54e616fb7()) {
        str_hint = "SHARED_HINTSTRINGS/DOORBUY_POWER_HINT";
    } else {
        str_hint = function_eeb8c278274b96c3();
    }
    self.interact = interaction::function_90472496b91b94b3(var_5820f9f37c14b3fb, self.radius, &function_c5324ba82e8b2de1, str_hint, self.var_3b948686580354ea);
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
    self.interact.var_fb92b63798596049 = self;
    self.interact.doors = a_doors;
    var_fa59ebb74f949608 = "cp_mp_doorbuy_minimap";
    if (function_be31d2b54e616fb7()) {
        var_fa59ebb74f949608 = "cp_mp_power_door_minimap";
    }
    foreach (door in a_doors) {
        door.var_6f8b7332800315bc = utility::function_53c4c53197386572(door.var_6f8b7332800315bc, []);
        door.var_6f8b7332800315bc = utility::function_6d6af8144a5131f1(door.var_6f8b7332800315bc, self.interact);
        if (door isscriptable()) {
            continue;
        }
        if (!isdefined(door.var_35e7c712de6487f6) && !utility::is_equal(door.script_noteworthy, "no_minimap")) {
            door.var_35e7c712de6487f6 = spawnscriptable(var_fa59ebb74f949608, door.origin, door.angles);
        }
    }
    if (isvector(var_5820f9f37c14b3fb) || istrue(var_9c58267a9b1f2155)) {
        self.interact.script_delete = 1;
        self.interact.b_is_trigger = 1;
    }
    thread function_e9c313af43b8ffa6();
    if (isdefined(level.var_180851032aeb2782)) {
        self thread [[ level.var_180851032aeb2782 ]]();
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
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
    } else if (self.var_1d5d5ebcae9ec180 == "essence") {
        str_hint = "SHARED_HINTSTRINGS/DOORBUY_HINT_ESSENCE";
    } else {
        str_hint = "SHARED_HINTSTRINGS/DOORBUY_HINT";
    }
    return str_hint;
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1127
// Size: 0x36f
function function_c5324ba82e8b2de1(player) {
    if (isdefined(self.var_fb92b63798596049.script_noteworthy) && self.var_fb92b63798596049.script_noteworthy == "barrier_unpurchaseable_trigger") {
        return;
    }
    if (self.var_fb92b63798596049 function_be31d2b54e616fb7()) {
        if (!utility::flag(self.var_fb92b63798596049.var_14364fdc7626f464) && !istrue(level.var_bbbe3abb95817b83)) {
            return;
        }
    }
    if (isdefined(player) && isdefined(self.var_fb92b63798596049.var_1d5d5ebcae9ec180) && isdefined(self.var_fb92b63798596049.var_3b948686580354ea)) {
        if (!player currency::function_301addb53c1df990(self.var_fb92b63798596049.var_1d5d5ebcae9ec180, self.var_fb92b63798596049.var_3b948686580354ea, 1)) {
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
            door thread function_1725880cd3db2cfa();
        }
    }
    if (isdefined(self.var_fb92b63798596049.script_flag_set)) {
        var_b9249169199027bb = strtok(self.var_fb92b63798596049.script_flag_set, " ");
        foreach (flag in var_b9249169199027bb) {
            utility::flag_set(flag);
        }
    }
    level notify("door_opened", self);
    if (isdefined(self.var_fb92b63798596049.script_noteworthy) && self.var_fb92b63798596049.script_noteworthy == "aether_charge_doorbuy") {
        self.var_fb92b63798596049 thread function_1071fb611dd3d29c();
    }
    if (isdefined(self.var_fb92b63798596049.instance)) {
        var_25ad4528af3906ce = self.var_fb92b63798596049.instance.var_305e36cbb51f88ce["doorbuy_trigger"];
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
        } else {
            self makeunusable();
        }
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149d
// Size: 0x26c
function function_1725880cd3db2cfa() {
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
    if (isarray(self.var_6f8b7332800315bc)) {
        foreach (interact in self.var_6f8b7332800315bc) {
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
    } else if (isdefined(self.script_noteworthy) && self.script_noteworthy == "trig_rumble_mobile_barrier") {
        self delete();
    } else {
        n_time = utility::function_53c4c53197386572(self.n_open_time, 0);
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
        } else {
            self delete();
        }
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1710
// Size: 0x85
function function_bfd5db9911f7056b() {
    var_760b4f7a74318114 = [];
    foreach (doorbuy in level.var_4de493999935f442) {
        if (doorbuy function_be31d2b54e616fb7()) {
            var_760b4f7a74318114 = utility::array_combine(var_760b4f7a74318114, doorbuy.interact.doors);
        }
    }
    return var_760b4f7a74318114;
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x179d
// Size: 0x70
function function_be31d2b54e616fb7() {
    var_e93d7bb6a32245f0 = isdefined(self.var_14364fdc7626f464) && issubstr(self.var_14364fdc7626f464, "power");
    var_1b8234fcdeb31e41 = isdefined(self.script_type) && (self.script_type == "power_open" || self.script_type == "power_transform");
    return var_e93d7bb6a32245f0 || var_1b8234fcdeb31e41;
}

// Namespace doorbuy/namespace_80b02d6a2f011786
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

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190f
// Size: 0x14
function function_db6ccc8e1166190c() {
    level endon("game_ended");
    wait(1);
    namespace_7381a1f17171d16c::sweepc4();
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x192a
// Size: 0x3c
function function_b92412ffa0393ddc(func) {
    if (!isdefined(self.var_142cbdd8a88f8259)) {
        self.var_142cbdd8a88f8259 = [];
    }
    self.var_142cbdd8a88f8259 = utility::function_6d6af8144a5131f1(self.var_142cbdd8a88f8259, func);
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x196d
// Size: 0x12a
function function_46d60a2bb682dcf1(var_3aa0162eb497c8a7, var_df15b645595483e) {
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
            door thread [[ func ]](var_3aa0162eb497c8a7);
        }
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a9e
// Size: 0x19
function private function_395efcf15256ee0a(var_76c5a85ca21a69b9) {
    if (istrue(var_76c5a85ca21a69b9)) {
        thread function_1725880cd3db2cfa();
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1abe
// Size: 0xe3
function private function_596802105bfa5a98(var_76c5a85ca21a69b9) {
    if (istrue(var_76c5a85ca21a69b9)) {
        foreach (interact in self.var_6f8b7332800315bc) {
            str_hint = interact function_eeb8c278274b96c3();
            interact interaction::function_c2efffe46a3f99d2(str_hint, interact.var_3b948686580354ea);
            interact sethintinoperable(0);
            interact setcursorhint("HINT_BUTTON");
            if (!utility::is_equal(self.script_noteworthy, "no_minimap")) {
                self.var_35e7c712de6487f6 freescriptable();
                self.var_35e7c712de6487f6 = spawnscriptable("cp_mp_doorbuy_minimap", self.origin, self.angles);
            }
        }
    }
}

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ba8
// Size: 0x116
function private function_e9c313af43b8ffa6() {
    var_61c9babc97d83d76 = self.script_type;
    if (!isdefined(var_61c9babc97d83d76)) {
        if (function_be31d2b54e616fb7()) {
            var_61c9babc97d83d76 = "power_open";
        } else {
            return;
        }
    }
    switch (var_61c9babc97d83d76) {
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

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc5
// Size: 0x87
function function_a7ca20ea38e7dd83() {
    level.var_bbbe3abb95817b83 = 1;
    foreach (var_fb92b63798596049 in level.var_4de493999935f442) {
        if (isdefined(var_fb92b63798596049.interact)) {
            var_fb92b63798596049.interact thread function_c5324ba82e8b2de1();
        }
    }
    level.var_bbbe3abb95817b83 = undefined;
}

// Namespace doorbuy/namespace_80b02d6a2f011786
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

// Namespace doorbuy/namespace_80b02d6a2f011786
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1da1
// Size: 0x661
function private function_6a0e53758c9edf() {
    /#
        var_39239d1f90650b = (0, 0, 4);
        var_e33953429ed350f = 0.25;
        while (1) {
            foreach (var_fb92b63798596049 in level.var_4de493999935f442) {
                if (!isdefined(var_fb92b63798596049.interact)) {
                    continue;
                }
                var_d8b783bf56b63a71 = "<unknown string>";
                if (isdefined(var_fb92b63798596049.script_tag) && var_fb92b63798596049.interact tagexists(var_fb92b63798596049.script_tag)) {
                    v_position = var_fb92b63798596049.interact gettagorigin(var_fb92b63798596049.script_tag);
                    var_d8b783bf56b63a71 = var_fb92b63798596049.script_tag;
                } else if (var_fb92b63798596049.interact tagexists("<unknown string>")) {
                    v_position = var_fb92b63798596049.interact gettagorigin("<unknown string>", 1);
                    var_d8b783bf56b63a71 = "<unknown string>";
                } else {
                    v_position = var_fb92b63798596049.interact.origin;
                }
                if (istrue(var_fb92b63798596049.interact.var_9c58267a9b1f2155)) {
                    level thread utility::draw_entity_bounds(var_fb92b63798596049.interact, 0.05);
                } else {
                    utility::draw_circle(v_position, var_fb92b63798596049.interact.var_10a09b4e9dcdf2ed, (0, 0, 1), 1, 0, 1);
                }
                print3d(v_position, "<unknown string>" + var_fb92b63798596049.var_1d5d5ebcae9ec180, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b, "<unknown string>" + var_fb92b63798596049.var_3b948686580354ea, (0, 1, 0), 1, var_e33953429ed350f);
                var_3c6719c8aa252447 = "<unknown string>";
                var_f884de9f009c09b4 = "<unknown string>";
                if (isdefined(var_fb92b63798596049.script_flag_set)) {
                    var_b9249169199027bb = strtok(var_fb92b63798596049.script_flag_set, "<unknown string>");
                    foreach (str_flag in var_b9249169199027bb) {
                        var_3c6719c8aa252447 = var_3c6719c8aa252447 + str_flag + "<unknown string>";
                    }
                    if (isdefined(level.var_c7f768e38c48aa33) && isarray(level.var_c7f768e38c48aa33.var_818d39728aa369e1)) {
                        foreach (var_a5fc55802cf2b8d3 in level.var_c7f768e38c48aa33.var_818d39728aa369e1) {
                            if (isarray(var_a5fc55802cf2b8d3.adjacent_zones)) {
                                foreach (str_zone, var_5b7050cf7b40f6de in var_a5fc55802cf2b8d3.adjacent_zones) {
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
                print3d(v_position - var_39239d1f90650b * 4, "<unknown string>" + utility::function_53c4c53197386572(var_fb92b63798596049.var_14364fdc7626f464, "<unknown string>"), (0, 1, 0), 1, 0.25);
                if (istrue(var_fb92b63798596049.interact.b_is_trigger)) {
                    var_ab9799ccaf563cab = "<unknown string>";
                    var_d8b783bf56b63a71 = "<unknown string>";
                } else {
                    var_ab9799ccaf563cab = "<unknown string>";
                    var_d8b783bf56b63a71 = "<unknown string>" + var_d8b783bf56b63a71 + "<unknown string>";
                }
                print3d(v_position - var_39239d1f90650b * 5, "<unknown string>" + var_ab9799ccaf563cab + var_d8b783bf56b63a71, (0, 1, 0), 1, 0.25);
                if (isarray(var_fb92b63798596049.interact.doors)) {
                    var_fb92b63798596049.interact.doors = utility::array_removeundefined(var_fb92b63798596049.interact.doors);
                    foreach (door in var_fb92b63798596049.interact.doors) {
                        line(v_position, door.origin, (0, 0, 1));
                        sphere(door.origin, 10, (0, 0, 1));
                        if (door isscriptable()) {
                            print3d(door.origin, "<unknown string>", (0, 1, 0), 1, 0.25);
                        } else {
                            print3d(door.origin, "<unknown string>", (0, 1, 0), 1, 0.25);
                        }
                    }
                }
            }
            waitframe();
        }
    #/
}

