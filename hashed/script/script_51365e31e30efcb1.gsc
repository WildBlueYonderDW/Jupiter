// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_2583ee5680cf4736;
#using script_639bf783929acf9b;
#using script_3a4480ba1c5664d0;
#using script_16ea1b94f0f381b3;
#using script_7e4d332e911e1b90;
#using script_38eb8f4be20d54f4;
#using script_398835140857d740;
#using script_860bfdfe82326e3;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;

#namespace perk_machines;

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52d
// Size: 0x80
function function_c349718d60cc262b() {
    /#
        if (function_5ec3518dfd1490af(1 | 64 | 2 | 4 | 8 | 16 | 32)) {
            return;
        }
    #/
    namespace_4164bc931714b00b::function_72f3dd0512f43c96("perk_machine", &function_203543d2ee9dcaf3);
    namespace_4164bc931714b00b::function_72f3dd0512f43c96("perk_machine_choice", &function_9da5ba88150e778f);
    function_b6cbc57468ea596b();
    if (!istrue(level.var_1a2b600a06ec21f4.var_7746f48b0ed07126)) {
        level thread function_7af59e607ac4bb14();
    } else {
        callback::add("ob_content_process_create_script", &function_7af59e607ac4bb14);
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b4
// Size: 0x12
function function_ecf921d010c33dea() {
    return namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"hash_6818f77cd99b8fa1");
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce
// Size: 0x95
function function_b6cbc57468ea596b() {
    level._custom_perks["specialty_choice"] = spawnstruct();
    level._custom_perks["specialty_choice"].cost = function_53c4c53197386572(get_perk_machine_cost("specialty_choice"), 300);
    level._custom_perks["specialty_choice"].var_1df6de077e30f8c2 = function_53c4c53197386572(function_bc4d94fa05ac7078("specialty_choice"), "essence");
    level._custom_perks["specialty_choice"].hint_string = "SHARED_HINTSTRINGS/PERK_MACHINE_WUNDERFIZZ_USE";
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66a
// Size: 0x8a
function function_7af59e607ac4bb14(params) {
    level endon("game_ended");
    waittillframeend();
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&perk_choice_purchase);
    var_89a48fee7588a0ac = getstructarray("content_destination", "variantname");
    foreach (destination in var_89a48fee7588a0ac) {
        level thread function_b6cefb59989d14c(destination);
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fb
// Size: 0x159
function function_b6cefb59989d14c(destination, var_1df6de077e30f8c2) {
    foreach (location in destination.locations) {
        var_24c0882a3b85c79f = location.instances["perk_machine"];
        if (isdefined(var_24c0882a3b85c79f)) {
            foreach (instance in var_24c0882a3b85c79f.var_67b2b78e28eaa758) {
                namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
            }
        }
        var_b34c518c4df088eb = location.instances["perk_machine_choice"];
        if (isdefined(var_b34c518c4df088eb)) {
            foreach (instance in var_b34c518c4df088eb.var_67b2b78e28eaa758) {
                instance.var_1d5d5ebcae9ec180 = var_1df6de077e30f8c2;
                namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
            }
        }
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b
// Size: 0x245
function function_948391d32c2e5823(instance) {
    perk = function_53c4c53197386572(self.script_noteworthy, "talent_juggernog");
    /#
        if (!isdefined(self.script_noteworthy)) {
            println("HINT_BUTTON" + self.origin + "<unknown string>");
        }
    #/
    /#
        assertex(isdefined(level._custom_perks[perk]), "Perk " + perk + " is not registered.");
    #/
    self.var_e89a9a6a3475bd0a = function_53c4c53197386572(level._custom_perks[perk].var_e89a9a6a3475bd0a, "t10_zm_machine_juggernog");
    var_2f9342e9d127fe5d = function_53c4c53197386572(level._custom_perks[perk].var_6e91b48935b6d44f, self.var_e89a9a6a3475bd0a);
    self.var_a3266878acd43bb3 = spawnscriptable(var_2f9342e9d127fe5d, self.origin, self.angles);
    self.var_1d5d5ebcae9ec180 = function_53c4c53197386572(self.var_1d5d5ebcae9ec180, function_bc4d94fa05ac7078(perk));
    self.radius = function_53c4c53197386572(self.radius, 64);
    self.var_3b948686580354ea = function_53c4c53197386572(self.var_3b948686580354ea, level._custom_perks[perk].cost);
    self.var_a3266878acd43bb3.interact = function_32645103f7520635(self.var_a3266878acd43bb3, &function_544d06d1d36ed577);
    self.var_a3266878acd43bb3.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_b92f7075e8fd3081);
    self.var_a3266878acd43bb3 function_4c7967371b16c7f3(self.var_a3266878acd43bb3.interact);
    if (self.var_a3266878acd43bb3 getscriptablehaspart("use")) {
        self.var_a3266878acd43bb3 setscriptablepartstate("use", "default");
    }
    self.var_a3266878acd43bb3.interact.var_a2738a1d42906829 = self;
    self.var_a3266878acd43bb3 thread perk_machine_think(perk, self.var_a3266878acd43bb3.interact);
    self.var_a3266878acd43bb3 thread spare_change();
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaa7
// Size: 0x76
function private function_203543d2ee9dcaf3(instance) {
    spawn_points = instance.var_305e36cbb51f88ce["perk_machine_spawn"];
    foreach (point in spawn_points) {
        point function_948391d32c2e5823(instance);
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb24
// Size: 0x353
function function_c224859356dbfd3d() {
    level endon("game_ended");
    if (getdvarint(@"hash_74cacae425805743", 0) > 0) {
        return undefined;
    }
    if (!isdefined(level.var_8241e0d86017df29)) {
        return;
    }
    var_6c26dc18308753c2 = [];
    foreach (key, perk in level._custom_perks) {
        if (key != "specialty_choice") {
            var_6c26dc18308753c2 = function_6d6af8144a5131f1(var_6c26dc18308753c2, perk);
        }
    }
    var_74dade39e02d8fee = [];
    var_3c3122af5c02bd7 = getstructarray("content_struct", "variantname");
    foreach (struct in var_3c3122af5c02bd7) {
        if (isdefined(struct.content_key) && struct.content_key == "perk_machine_region_spawn") {
            var_74dade39e02d8fee = array_add(var_74dade39e02d8fee, struct);
        }
    }
    if (isdefined(level.var_c383b967aa7e551b)) {
        var_74dade39e02d8fee = [[ level.var_c383b967aa7e551b ]]("perk", var_74dade39e02d8fee);
    } else {
        var_74dade39e02d8fee = array_randomize(var_74dade39e02d8fee);
    }
    var_aefc5436dfe3990 = [];
    foreach (spawn_point in var_74dade39e02d8fee) {
        var_988cd9a9c749ee11 = [[ level.var_8241e0d86017df29 ]](spawn_point.origin);
        if (var_988cd9a9c749ee11 == "difficulty_easy") {
            var_aefc5436dfe3990[var_aefc5436dfe3990.size] = spawn_point;
        }
    }
    foreach (spawn_point in var_74dade39e02d8fee) {
        var_988cd9a9c749ee11 = [[ level.var_8241e0d86017df29 ]](spawn_point.origin);
        if (var_988cd9a9c749ee11 != "difficulty_easy") {
            var_aefc5436dfe3990[var_aefc5436dfe3990.size] = spawn_point;
        }
    }
    var_d8343331f9203ec2 = array_randomize(arraycopy(var_6c26dc18308753c2));
    foreach (spawn_point in var_aefc5436dfe3990) {
        var_aba669eb2d762cff = array_get_first_item(var_d8343331f9203ec2);
        perk_name = var_aba669eb2d762cff.var_e3d5b979024de96;
        var_d8343331f9203ec2 = array_remove(var_d8343331f9203ec2, var_aba669eb2d762cff);
        if (!isdefined(perk_name) || !isdefined(level._custom_perks[perk_name])) {
            continue;
        }
        spawn_point.script_noteworthy = perk_name;
        spawn_point function_948391d32c2e5823();
        /#
            if (getdvarint(@"hash_219f76f29e4d14ce", 0) == 1) {
                level thread function_306940dddbeb1537(spawn_point);
            }
        #/
        if (var_d8343331f9203ec2.size < 1) {
            var_d8343331f9203ec2 = array_randomize(arraycopy(var_6c26dc18308753c2));
        }
    }
    callback::callback("ob_perks_create_script_done");
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe7e
// Size: 0x58
function private function_306940dddbeb1537(spawn_point) {
    /#
        level endon("<unknown string>");
        while (isdefined(spawn_point.script_noteworthy)) {
            sphere(spawn_point.origin, 32);
            print3d(spawn_point.origin, spawn_point.script_noteworthy);
            waitframe();
        }
    #/
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xedd
// Size: 0x80
function private function_9da5ba88150e778f(instance) {
    spawn_points = instance.var_305e36cbb51f88ce["perk_machine_choice_spawn"];
    if (isarray(spawn_points)) {
        foreach (point in spawn_points) {
            point thread function_584ef0be51af00df(instance);
        }
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf64
// Size: 0x1cb
function private function_b92f7075e8fd3081(usable, player) {
    if (isdefined(player) && isdefined(usable)) {
        perk = usable.script_notify;
        str_key = function_53c4c53197386572(usable.script_notify, "talent_juggernog");
        if (usable getscriptablepartstate("base") == "power_off") {
            return {string:"SHARED_HINTSTRINGS/NEED_POWER", type:"HINT_NOBUTTON"};
        } else if (istrue(level.var_7671231718df0382)) {
            return {string:"", type:"HINT_NOICON"};
        } else if (istrue(player.interactions_disabled)) {
            return {string:"", type:"HINT_NOICON"};
        } else if (player has_perk(level._custom_perks[perk].var_e3d5b979024de96)) {
            return {string:"", type:"HINT_NOICON"};
        } else {
            var_18b5eb8564522fcb = player function_b1e24c0eaeadfac7();
            hint_string = namespace_3c37cb17ade254d::ter_op(player function_bcc79745d547a99c(function_bc4d94fa05ac7078(perk), var_18b5eb8564522fcb), level._custom_perks[str_key].hint_string, level._custom_perks[str_key].var_2e1ef6ec4d3bd5bb);
            return {params:[0:var_18b5eb8564522fcb], string:hint_string, type:"HINT_BUTTON"};
        }
    }
    return {string:"", type:"HINT_NOICON"};
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1137
// Size: 0x1c3
function function_544d06d1d36ed577(player) {
    perk = self.script_notify;
    /#
        assertex(isdefined(level._custom_perks[perk]), "Perk " + perk + " is not registered.");
    #/
    var_a2738a1d42906829 = self.var_a2738a1d42906829;
    if (isdefined(player) && isdefined(var_a2738a1d42906829.var_1d5d5ebcae9ec180)) {
        if (player has_perk(level._custom_perks[perk].var_e3d5b979024de96)) {
            return;
        }
        if (istrue(level.var_7671231718df0382)) {
            return;
        }
        if (istrue(player.interactions_disabled)) {
            return;
        }
        if (!player namespace_7dfc6454a70f3f39::function_301addb53c1df990(var_a2738a1d42906829.var_1d5d5ebcae9ec180, player function_b1e24c0eaeadfac7(), 1, undefined, #"perk", perk)) {
            return;
        }
        var_a3266878acd43bb3 = var_a2738a1d42906829.var_a3266878acd43bb3;
        if (var_a3266878acd43bb3 getscriptablehaspart("use")) {
            if (var_a3266878acd43bb3 getscriptablepartstate("use") == "default") {
                var_a3266878acd43bb3 setscriptablepartstate("use", "purchase");
            }
        }
        gesture = function_53c4c53197386572(level._custom_perks[perk].perk_bottle_weapon, "cer_zm_vm_ges_001");
        player thread function_fe9f92094d839eaf(gesture);
        thread function_578601bd71a362c8(perk);
        params = spawnstruct();
        params.perk_machine = self;
        player callback::callback("zm_perk_machine_used", params);
        var_fd5c3b861dd421d4 = spawnstruct();
        var_fd5c3b861dd421d4.perkref = perk;
        player callback::callback("zm_perk_purchased", var_fd5c3b861dd421d4);
        player give_perk(perk, 1);
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1301
// Size: 0x167
function perk_machine_think(str_key, interact) {
    /#
        assertex(isdefined(str_key), "script_noteworthy not set for perk machine.");
    #/
    str_endon = str_key + "_power_thread_end";
    level endon(str_endon);
    self endon(str_endon);
    str_notify = str_key + "_power_on";
    power_flag = "power_on";
    var_d3ad2dc5ad2d4ce1 = 0;
    var_67aef9f8f6e33e53 = isdefined(self.var_a2738a1d42906829.script_int) ? 1 : 0;
    while (1) {
        self setscriptablepartstate("base", "power_off");
        self.script_notify = str_key;
        self.b_keep_when_turned_off = 1;
        var_c5f973f78b2d3fa = get_perk_machine_start_state(str_key);
        if (!var_d3ad2dc5ad2d4ce1 && var_c5f973f78b2d3fa) {
            waitframe();
        } else if (var_67aef9f8f6e33e53) {
            level flag_wait(power_flag + self.var_a2738a1d42906829.script_int);
        } else {
            level flag_wait(power_flag);
        }
        function_b7b11dcefd51d18f(str_key, interact);
        level notify(str_notify);
        var_d3ad2dc5ad2d4ce1 = 1;
        if (var_67aef9f8f6e33e53) {
            level flag_waitopen(power_flag + self.var_a2738a1d42906829.script_int);
        } else {
            if (!level flag_exist(power_flag)) {
                return;
            }
            level flag_waitopen(power_flag);
        }
        function_4c7967371b16c7f3(interact);
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146f
// Size: 0x3d
function get_perk_machine_start_state(perk) {
    if (istrue(level.vending_machines_powered_on_at_start)) {
        return 1;
    }
    if (isdefined(level.var_ab3f1eda83f38495) && istrue(level.var_ab3f1eda83f38495[perk])) {
        return 1;
    }
    return 0;
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b4
// Size: 0x25
function function_4c7967371b16c7f3(interact) {
    self notify("endPerkJingleWatcher");
    self setscriptablepartstate("base", "power_off");
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e0
// Size: 0x2e
function function_b7b11dcefd51d18f(str_key, interact) {
    thread function_b9232d78e96ab157(str_key);
    self setscriptablepartstate("base", "power_activate");
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1515
// Size: 0x2e
function function_c882eef34c5e389b(interact) {
    self notify("endPerkJingleWatcher");
    self setscriptablepartstate("base", "power_off");
    interact sethintinoperable(1);
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154a
// Size: 0x38
function function_af4a04f18b0a937(str_key, interact) {
    interact sethintinoperable(0);
    thread function_b9232d78e96ab157(str_key, 1);
    self setscriptablepartstate("base", "power_activate");
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1589
// Size: 0x113
function function_359eb1acd4585386(usable, player) {
    if (isdefined(player) && isdefined(usable)) {
        if (usable getscriptablepartstate("base") == "power_off") {
            return {string:"SHARED_HINTSTRINGS/NEED_POWER", type:"HINT_NOBUTTON"};
        } else if (istrue(player.interactions_disabled)) {
            return {string:"", type:"HINT_NOICON"};
        } else {
            str_key = function_53c4c53197386572(usable.script_notify, "talent_juggernog");
            return {params:[0:level._custom_perks[str_key].cost], string:level._custom_perks[str_key].hint_string, type:"HINT_BUTTON"};
        }
    }
    return {string:"", type:"HINT_NOICON"};
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a4
// Size: 0x5f
function spare_change() {
    offsetvec = vectornormalize(anglestoforward(self.angles)) * 20;
    trigger = spawn("noent_volume_trigger_rotatable_radius", self.origin + offsetvec, 0, 64, 64);
    trigger.var_e0208c224411853a = self;
    trigger thread check_for_change();
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170a
// Size: 0xe7
function check_for_change() {
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        if (!isdefined(player.inlaststand)) {
            player.inlaststand = 0;
        }
        if (isplayer(player) && player getstance() == "prone" && !player.inlaststand) {
            params = spawnstruct();
            params.scoreevent = #"hash_8449a69d670baf6e";
            player callback::callback("zombie_score_event", params);
            if (self.var_e0208c224411853a getscriptablehaspart("sparechange")) {
                self.var_e0208c224411853a setscriptablepartstate("sparechange", "activate");
            }
            player playrumbleonentity("damage_light");
            break;
        }
        wait(0.1);
    }
    self delete();
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f8
// Size: 0xd5
function function_b9232d78e96ab157(var_8686b40485143989, var_95427d8098dd59a1) {
    if (!isdefined(var_95427d8098dd59a1)) {
        var_95427d8098dd59a1 = 0;
    }
    self endon("death");
    self endon("endPerkJingleWatcher");
    while (1) {
        wait(randomintrange(90, 180));
        if (self getscriptablehaspart("music")) {
            if (self getscriptablepartstate("music") == "off") {
                players = namespace_2b1145f62aa835b8::function_883458a342af3041(self.origin, 1250);
                if (!isdefined(players) || players.size < 1) {
                    continue;
                }
                if (var_95427d8098dd59a1) {
                    var_273d9353f8f2f553 = function_7a2aaa4a09a4d250(level.var_a2e80fb79bc0de74);
                    self setscriptablepartstate("music", var_273d9353f8f2f553 + "_jingle");
                } else {
                    self setscriptablepartstate("music", var_8686b40485143989 + "_jingle");
                }
            }
        }
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d4
// Size: 0x48
function function_578601bd71a362c8(var_8686b40485143989) {
    self endon("death");
    if (self getscriptablehaspart("music")) {
        if (self getscriptablepartstate("music") == "off") {
            self setscriptablepartstate("music", var_8686b40485143989 + "_stinger");
        }
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1923
// Size: 0x261
function function_584ef0be51af00df(instance) {
    if (getdvarint(@"hash_74cacae425805743", 0) > 0) {
        return undefined;
    }
    flag_wait("StartGameTypeCallbackFinished");
    var_1036048ad7fae159 = level.var_a1ad2758fcbd2f5e["specialty_wunderfizz"];
    var_953b250010c4fc20 = "t10_zm_machine_wunderfizz";
    var_2f463322f2ae7afc = "t10_zm_machine_wunderfizz_fxanim";
    if (isdefined(var_1036048ad7fae159)) {
        var_953b250010c4fc20 = function_53c4c53197386572(var_1036048ad7fae159.var_50ff10282e5fb08f, "t10_zm_machine_wunderfizz");
        var_2f463322f2ae7afc = function_53c4c53197386572(var_1036048ad7fae159.var_c70f3f3a7f26b274, "t10_zm_machine_wunderfizz_fxanim");
    }
    self.var_e89a9a6a3475bd0a = function_53c4c53197386572(self.script_noteworthy, var_953b250010c4fc20);
    self.var_a3266878acd43bb3 = namespace_4164bc931714b00b::spawn_script_model(self, var_2f463322f2ae7afc, 1, 1);
    self.var_1d5d5ebcae9ec180 = function_53c4c53197386572(instance.var_1d5d5ebcae9ec180, "essence");
    self.radius = function_53c4c53197386572(self.radius, 64);
    self.var_3b948686580354ea = level._custom_perks["specialty_choice"].cost;
    self.var_a3266878acd43bb3.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_a3266878acd43bb3, self.radius, &function_bc46233a2d861c6f);
    self.var_a3266878acd43bb3.interact setusefov(180);
    self.var_a3266878acd43bb3.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_359eb1acd4585386);
    self.var_a3266878acd43bb3 function_c882eef34c5e389b(self.var_a3266878acd43bb3.interact);
    if (self.var_a3266878acd43bb3 getscriptablehaspart("use")) {
        self.var_a3266878acd43bb3 setscriptablepartstate("use", "default");
    }
    if (self.var_a3266878acd43bb3 tagexists("tag_hint")) {
        self.var_a3266878acd43bb3 sethinttag("tag_hint");
    }
    self.var_a3266878acd43bb3.interact.var_a2738a1d42906829 = self;
    self.var_a3266878acd43bb3 thread function_d24f7f1b9f196edc(self.var_a3266878acd43bb3.interact);
    self.var_a3266878acd43bb3 thread spare_change();
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8b
// Size: 0x181
function function_d24f7f1b9f196edc(interact) {
    str_key = "specialty_choice";
    str_endon = str_key + "_power_thread_end";
    level endon(str_endon);
    self endon(str_endon);
    str_notify = str_key + "_power_on";
    power_flag = "power_on";
    var_d3ad2dc5ad2d4ce1 = 0;
    var_f08be12e08d353d1 = self isscriptable() ? 1 : 0;
    var_67aef9f8f6e33e53 = isdefined(self.var_a2738a1d42906829.script_int) ? 1 : 0;
    while (1) {
        self setscriptablepartstate("base", "power_off");
        self solid();
        self.script_notify = str_key;
        self.b_keep_when_turned_off = 1;
        var_c5f973f78b2d3fa = get_perk_machine_start_state(str_key);
        if (!var_d3ad2dc5ad2d4ce1 && var_c5f973f78b2d3fa) {
            waitframe();
        } else if (var_67aef9f8f6e33e53) {
            level flag_wait(power_flag + self.var_a2738a1d42906829.script_int);
        } else {
            level flag_wait(power_flag);
        }
        function_af4a04f18b0a937(str_key, interact);
        level notify(str_notify);
        var_d3ad2dc5ad2d4ce1 = 1;
        if (var_67aef9f8f6e33e53) {
            level flag_waitopen(power_flag + self.var_a2738a1d42906829.script_int);
        } else {
            if (!level flag_exist(power_flag)) {
                return;
            }
            level flag_waitopen(power_flag);
        }
        function_c882eef34c5e389b(interact);
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d13
// Size: 0x5e
function function_bc46233a2d861c6f(player) {
    if (isdefined(player) && istrue(player.interactions_disabled)) {
        return;
    }
    self.var_a2738a1d42906829.var_c80acd5b1945a70f = player;
    player.var_bc2162598ffb02f5 = self.var_a2738a1d42906829;
    player thread function_ece8e97b705baa7e(self.var_a2738a1d42906829);
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d78
// Size: 0x24f
function perk_choice_purchase(channel, var_441c8eadb8f193ab) {
    if (isdefined(var_441c8eadb8f193ab)) {
        var_441c8eadb8f193ab = var_441c8eadb8f193ab - 1;
        if (channel == "perk_choice_purchase") {
            s_menu = function_ecf921d010c33dea();
            if (!isdefined(s_menu)) {
                return;
            }
            var_b83a817904c64a0b = function_47a5564594564627();
            var_c3eb7dafd2328539 = function_ad6e85c9533ac466();
            if (isarray(var_c3eb7dafd2328539)) {
                var_b83a817904c64a0b = array_remove_array(var_b83a817904c64a0b, var_c3eb7dafd2328539);
            }
            item = namespace_7bf99ef58659a6f1::function_904f24ea774b8f6f(#"hash_6818f77cd99b8fa1", var_441c8eadb8f193ab);
            if (!isdefined(item.var_cb325ddb4a764623) || !array_contains(var_b83a817904c64a0b, item.var_cb325ddb4a764623)) {
                return;
            }
            if (!istrue(function_6b2b78660b18dad9(var_441c8eadb8f193ab, self))) {
                self setclientomnvar(s_menu.var_8b8931f97eef184, 3);
                self setclientomnvar(s_menu.var_fd0ea8a834fa0398, gettime());
                return;
            }
            gesture = function_53c4c53197386572(level._custom_perks[item.var_cb325ddb4a764623].perk_bottle_weapon, "cer_zm_vm_ges_001");
            thread function_fe9f92094d839eaf(gesture);
            self playsoundtoplayer("ui_zm_core_purchase_success", self);
            params = spawnstruct();
            params.perk_machine = self;
            callback::callback("zm_perk_machine_used", params);
            give_perk(item.var_cb325ddb4a764623);
            var_fd5c3b861dd421d4 = spawnstruct();
            var_fd5c3b861dd421d4.perkref = item.var_cb325ddb4a764623;
            callback::callback("zm_perk_purchased", var_fd5c3b861dd421d4);
            if (isdefined(self.var_bc2162598ffb02f5)) {
                if (isdefined(self.var_bc2162598ffb02f5.var_a3266878acd43bb3)) {
                    self.var_bc2162598ffb02f5.var_a3266878acd43bb3 thread function_578601bd71a362c8(item.var_cb325ddb4a764623);
                }
            }
            self setclientomnvar(s_menu.var_8b8931f97eef184, 1);
            self setclientomnvar(s_menu.var_fd0ea8a834fa0398, gettime());
            self notify("wunderfizz_purchase");
        } else if (namespace_7bf99ef58659a6f1::function_5c9b6f1c3c67dd97(#"hash_6818f77cd99b8fa1", channel)) {
            self.var_9dd6c300aac05ba7 = 1;
        }
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fce
// Size: 0x8b
function function_6b2b78660b18dad9(var_441c8eadb8f193ab, player) {
    cost = 0;
    currency = "essence";
    item = namespace_7bf99ef58659a6f1::function_904f24ea774b8f6f(#"hash_6818f77cd99b8fa1", var_441c8eadb8f193ab);
    if (isdefined(player) && isdefined(item)) {
        cost = player function_b1e24c0eaeadfac7();
        currency = item.currency;
    }
    return namespace_7dfc6454a70f3f39::function_301addb53c1df990(currency, cost, 1, undefined, #"perk", item.var_cb325ddb4a764623);
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2061
// Size: 0x85
function function_ece8e97b705baa7e(var_a2738a1d42906829) {
    self endon("death_or_disconnect");
    self endon("end_open_perk_choice_menu");
    s_menu = function_ecf921d010c33dea();
    if (!isdefined(s_menu)) {
        return;
    }
    var_bf1eb50af72af = function_53c4c53197386572(s_menu.id, -1);
    self setclientomnvar("ui_purchasemenu_id", var_bf1eb50af72af);
    self setclientomnvar(s_menu.var_c7ffb2549ca8ab4b, gettime());
    thread function_a9620a0e00513b98(var_a2738a1d42906829);
    thread function_86ea6001c8038726(var_a2738a1d42906829);
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ed
// Size: 0x164
function function_a9620a0e00513b98(var_a2738a1d42906829) {
    self notify("opened_perk_choice_menu");
    self endon("opened_perk_choice_menu");
    self endon("disconnect");
    s_menu = function_ecf921d010c33dea();
    if (!isdefined(s_menu)) {
        return;
    }
    machine = var_a2738a1d42906829.var_a3266878acd43bb3;
    wait(0.75);
    var_cad20162f5a22ba4 = distance2d(machine.origin, self.origin);
    v_start = self.origin;
    self.var_9dd6c300aac05ba7 = undefined;
    while (isdefined(machine) && isalive(self) && !istrue(self.inlaststand) && (distance2d(machine.origin, self.origin) <= var_cad20162f5a22ba4 || distance2d(self.origin, machine.origin) < 32)) {
        if (!isdefined(machine) || self stancebuttonpressed() || istrue(self.var_9dd6c300aac05ba7)) {
            break;
        }
        waitframe();
    }
    if (isdefined(self)) {
        self.var_9dd6c300aac05ba7 = undefined;
        self setclientomnvar(s_menu.var_8b8931f97eef184, 2);
        self setclientomnvar(s_menu.var_fd0ea8a834fa0398, gettime());
        self.var_a2738a1d42906829 = undefined;
        self notify("end_open_perk_choice_menu");
    }
}

// Namespace perk_machines/namespace_36f4db9147a8fdd1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2258
// Size: 0x83
function function_86ea6001c8038726(var_a2738a1d42906829) {
    self notify("opened_perk_choice_purchase_watcher");
    self endon("opened_perk_choice_purchase_watcher");
    self endon("end_open_perk_choice_menu");
    self endon("disconnect");
    var_a3266878acd43bb3 = var_a2738a1d42906829.var_a3266878acd43bb3;
    while (1) {
        self waittill("wunderfizz_purchase");
        if (var_a3266878acd43bb3 getscriptablehaspart("use")) {
            if (var_a3266878acd43bb3 getscriptablepartstate("use") == "default") {
                var_a3266878acd43bb3 setscriptablepartstate("use", "purchase");
            }
        }
        waitframe();
    }
}

