// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_639bf783929acf9b;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_860bfdfe82326e3;
#using script_2583ee5680cf4736;
#using script_16ea1b94f0f381b3;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\outline.gsc;

#namespace magicbox;

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6f
// Size: 0x112
function init_magicbox(var_ab2f2c696f2e969d) {
    /#
        level thread function_9433af8de8931e12();
    #/
    level.var_7ba18baeafe91d4a = function_53c4c53197386572(function_86ff2975af8e08be(), "essence");
    level.var_c47fd110d46f3c63 = function_53c4c53197386572(function_51ff679cabccfcd0(), 950);
    level.var_76ca58710b7d7837 = [];
    level.var_c9c386cdb9fb8d5b = [];
    level.var_eb895aaca65f1d6f = [];
    level.var_553e4b68470902aa = [];
    level.var_fec5078e78eb7217 = 0;
    level.var_75e032c5035207fe = 0;
    level.var_ae1594cd076f2836 = [];
    namespace_4164bc931714b00b::function_72f3dd0512f43c96("magicbox", &function_5432ff3fb5bd59c9);
    if (!istrue(level.var_1a2b600a06ec21f4.var_7746f48b0ed07126)) {
        level thread function_8eda83df58e1a162();
    } else {
        callback::add("ob_content_process_create_script", &function_8eda83df58e1a162);
    }
    level thread setup_magicbox_weapons(var_ab2f2c696f2e969d);
    callback::add("on_round_end", &on_round_end);
    /#
        assertex(isdefined(level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1), "Create a magicbox bundle asset to use in this gamemode and add to gamemodebundle");
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb88
// Size: 0x162
function function_9433af8de8931e12() {
    /#
        flag_wait("beam");
        function_6e7290c8ee4f558b("game");
        function_a9a864379a098ad6("end_roulette_move", "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_UNCOMMON_SHARED", &function_7b5090b85561b747, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4dd640fcb2a0c79e);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_49b1a3d1fe2ab11f);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_8d554b62a88524e7);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_d5899f2536209f81);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_d5899f2536209f81);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_d5899f2536209f81);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_d5899f2536209f81);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_a611dfe6a478e045);
        var_bbdcc30a274b0882 = getscriptbundle("<unknown string>" + level.str_magicbox_weapon_itemspawnlist);
        function_69e55cbe67712bf1(var_bbdcc30a274b0882);
        var_d69c2e9355968734 = getscriptbundle("<unknown string>" + level.var_ed8526d7d2e56787);
        function_69e55cbe67712bf1(var_d69c2e9355968734);
        var_f03c09452a67a2f1 = getscriptbundle("<unknown string>" + level.var_2b71131620c6b678);
        function_69e55cbe67712bf1(var_f03c09452a67a2f1);
        function_fe953f000498048f();
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf1
// Size: 0x84
function function_d5899f2536209f81(params) {
    /#
        n_time_passed = int(params[0]);
        setdvar(@"hash_5b9243049e98ac25", n_time_passed);
        if (n_time_passed >= 0) {
            minutes = int(n_time_passed / 60);
            seconds = n_time_passed % 60;
            iprintlnbold("<unknown string>" + minutes + "<unknown string>" + seconds + "<unknown string>");
        } else {
            iprintlnbold("<unknown string>");
        }
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd7c
// Size: 0x12f
function function_69e55cbe67712bf1(s_bundle) {
    /#
        if (isarray(s_bundle.var_9fdd81c7fdbb8ed2)) {
            foreach (var_4e2011e509e7f90 in s_bundle.var_9fdd81c7fdbb8ed2) {
                function_b23a59dfb4ca49a1("<unknown string>" + var_4e2011e509e7f90.itemspawnentry, "<unknown string>" + var_4e2011e509e7f90.itemspawnentry, &function_a611dfe6a478e045);
            }
        }
        if (isarray(s_bundle.var_32997c3e205661c6)) {
            foreach (var_62afdcece0cc5168 in s_bundle.var_32997c3e205661c6) {
                var_3ecd2db331134b8c = getscriptbundle("<unknown string>" + var_62afdcece0cc5168.itemspawnlist);
                if (isdefined(var_3ecd2db331134b8c)) {
                    function_69e55cbe67712bf1(var_3ecd2db331134b8c);
                }
            }
        }
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb2
// Size: 0x5e
function function_a611dfe6a478e045(params) {
    /#
        if (params[0] == "<unknown string>") {
            setdvar(@"hash_5bf38da5a2eda0c8", "<unknown string>");
            iprintlnbold("<unknown string>");
        } else {
            setdvar(@"hash_5bf38da5a2eda0c8", params[0]);
            iprintlnbold("<unknown string>" + params[0]);
        }
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf17
// Size: 0xf5
function function_49b1a3d1fe2ab11f() {
    /#
        level.var_7b92ca8fe0fc2411 = !istrue(level.var_7b92ca8fe0fc2411);
        if (level.var_7b92ca8fe0fc2411) {
            iprintlnbold("<unknown string>");
        } else if (istrue(level.var_9a3999e1157b96b2)) {
            iprintlnbold("<unknown string>");
        } else {
            foreach (var_fd1731776426191b in level.var_eb895aaca65f1d6f) {
                if (!var_fd1731776426191b.var_75e032c5035207fe) {
                    iprintlnbold("<unknown string>" + function_6743ce9942654f5c() - var_fd1731776426191b.var_fec5078e78eb7217 + "<unknown string>");
                } else {
                    iprintlnbold("<unknown string>" + function_d26b24de82eb5022() - var_fd1731776426191b.var_fec5078e78eb7217 + "<unknown string>");
                }
            }
        }
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1013
// Size: 0x11
function function_4dd640fcb2a0c79e() {
    /#
        level.var_9a3999e1157b96b2 = 1;
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102b
// Size: 0x1e8
function function_8d554b62a88524e7() {
    /#
        foreach (var_fd1731776426191b in level.var_eb895aaca65f1d6f) {
            if (isdefined(var_fd1731776426191b.var_5ffec96411bd4f89) && istrue(var_fd1731776426191b.var_c6f3d3d676f3d960)) {
                origin = var_fd1731776426191b.var_5ffec96411bd4f89.origin;
                forward = anglestoforward(var_fd1731776426191b.var_5ffec96411bd4f89.angles);
                right = anglestoright(var_fd1731776426191b.var_5ffec96411bd4f89.angles);
                var_ed09029fce6fcf59 = vectortoangles(right);
                var_339fb15a89f134d7 = origin - 48 * right;
                foreach (player in level.players) {
                    entnum = player getentitynumber();
                    switch (entnum) {
                    case 0:
                        var_339fb15a89f134d7 = var_339fb15a89f134d7 + 16 * right;
                        break;
                    case 1:
                        var_339fb15a89f134d7 = var_339fb15a89f134d7 + 16 * forward;
                        break;
                    case 2:
                        var_339fb15a89f134d7 = var_339fb15a89f134d7 - 16 * right;
                        break;
                    case 3:
                        var_339fb15a89f134d7 = var_339fb15a89f134d7 - 16 * forward;
                        break;
                    default:
                        return;
                    }
                    player setorigin(var_339fb15a89f134d7);
                    player setplayerangles(var_ed09029fce6fcf59);
                }
                break;
            }
        }
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121a
// Size: 0x329
function function_8eda83df58e1a162(params) {
    level endon("game_ended");
    waittillframeend();
    var_89a48fee7588a0ac = getstructarray("content_destination", "variantname");
    foreach (destination in var_89a48fee7588a0ac) {
        function_7f4d7d96a3f25be(destination);
    }
    if (isdefined(level.var_c092c207acdfa48)) {
        function_c8563800655fa24f();
    }
    if (level.var_eb895aaca65f1d6f.size) {
        var_5d2f2f0ef7fb6d7c = getscriptbundle("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1);
        var_d43c12b812bbdd6c = var_5d2f2f0ef7fb6d7c.var_888e9af064e3f1c8;
        /#
            assertex(isdefined(var_d43c12b812bbdd6c), "Create a magicbox scaling bundle to use in " + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1);
        #/
        level.var_8c50d72d69eac351 = getscriptbundle("magicboxroundscaling:" + var_d43c12b812bbdd6c);
        totalweight = 0;
        foreach (s_item in level.var_8c50d72d69eac351.weaponclassweights) {
            totalweight = totalweight + s_item.weight;
            level.var_c9c386cdb9fb8d5b[s_item.weaponclass] = totalweight;
        }
        foreach (str_destination, var_eb895aaca65f1d6f in level.var_553e4b68470902aa) {
            foreach (var_e726ce05580d1f50 in var_eb895aaca65f1d6f) {
                var_e726ce05580d1f50.str_destination = str_destination;
                var_e726ce05580d1f50 function_5cc90fd8a70217c7();
            }
        }
        foreach (str_destination, var_eb895aaca65f1d6f in level.var_553e4b68470902aa) {
            var_6edc2e57e2ebbe05 = [];
            foreach (var_63bf58fa4c036940 in var_eb895aaca65f1d6f) {
                if (istrue(var_63bf58fa4c036940.script_start)) {
                    var_6edc2e57e2ebbe05 = function_6d6af8144a5131f1(var_6edc2e57e2ebbe05, var_63bf58fa4c036940);
                }
            }
            if (var_6edc2e57e2ebbe05.size > 0) {
                var_63bf58fa4c036940 = random(var_6edc2e57e2ebbe05);
            } else {
                var_63bf58fa4c036940 = random(var_eb895aaca65f1d6f);
            }
            var_63bf58fa4c036940 function_9086395d714ed8c5(1);
            var_63bf58fa4c036940.var_c6f3d3d676f3d960 = 1;
        }
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154a
// Size: 0x1bf
function setup_magicbox_weapons(var_ab2f2c696f2e969d) {
    if (isdefined(level.var_96c4059aa2eabfb8)) {
        var_ab2f2c696f2e969d = [];
        foreach (str_weapon_name, s_weapon in level.var_96c4059aa2eabfb8) {
            if (istrue(s_weapon.var_3c10e0c3769a17a6)) {
                if (getdvarint(@"hash_fc74f94143cf660f", 1)) {
                    var_ab2f2c696f2e969d[str_weapon_name] = isdefined(s_weapon.var_383608c7198f0f48) ? "tag_origin" : s_weapon.var_383608c7198f0f48;
                } else if (isdefined(s_weapon.var_383608c7198f0f48)) {
                    var_ab2f2c696f2e969d[str_weapon_name] = s_weapon.var_383608c7198f0f48;
                }
            }
        }
        level.str_magicbox_weapon_itemspawnlist = level.var_96c4059aa2eabfb8["magicbox_settings"].var_9a8c86f79a583c89;
        level.var_ed8526d7d2e56787 = level.var_96c4059aa2eabfb8["magicbox_settings"].var_c20d40efaeea2f37;
        level.var_2b71131620c6b678 = level.var_96c4059aa2eabfb8["magicbox_settings"].var_b47fbd87c991c558;
        function_e4f5deb03f4e035b();
    }
    /#
        if (!isdefined(var_ab2f2c696f2e969d)) {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    level.var_76ca58710b7d7837 = var_ab2f2c696f2e969d;
    foreach (str_weapon_name, var_1c1993ed40e39357 in level.var_76ca58710b7d7837) {
        /#
            assertex(isdefined(var_1c1993ed40e39357), "Make sure a magicbox weapon model is defined for weapon");
        #/
    }
    flag_set("setup_magicbox_weapons");
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1710
// Size: 0x162
function function_e4f5deb03f4e035b() {
    var_d69c2e9355968734 = getscriptbundle("itemspawnlist:" + level.var_96c4059aa2eabfb8["magicbox_settings"].var_c20d40efaeea2f37);
    var_f03c09452a67a2f1 = getscriptbundle("itemspawnlist:" + level.var_96c4059aa2eabfb8["magicbox_settings"].var_b47fbd87c991c558);
    if (isarray(var_d69c2e9355968734.var_9fdd81c7fdbb8ed2)) {
        foreach (var_4e2011e509e7f90 in var_d69c2e9355968734.var_9fdd81c7fdbb8ed2) {
            level.var_1d4462301ddfc945 = function_6d6af8144a5131f1(level.var_1d4462301ddfc945, var_4e2011e509e7f90.itemspawnentry);
        }
    }
    if (isarray(var_f03c09452a67a2f1.var_9fdd81c7fdbb8ed2)) {
        foreach (var_4e2011e509e7f90 in var_f03c09452a67a2f1.var_9fdd81c7fdbb8ed2) {
            level.var_37f2b532bd735471 = function_6d6af8144a5131f1(level.var_37f2b532bd735471, var_4e2011e509e7f90.itemspawnentry);
        }
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1879
// Size: 0xd3
function function_7f4d7d96a3f25be(destination) {
    foreach (location in destination.locations) {
        var_115107f15e106add = location.instances["magicbox"];
        if (isdefined(var_115107f15e106add)) {
            foreach (instance in var_115107f15e106add.var_67b2b78e28eaa758) {
                namespace_4164bc931714b00b::function_7e2984b7610f3616(instance);
            }
        }
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1953
// Size: 0x18c
function function_c8563800655fa24f() {
    var_74dade39e02d8fee = [];
    var_3c3122af5c02bd7 = getstructarray("content_struct", "variantname");
    foreach (struct in var_3c3122af5c02bd7) {
        if (isdefined(struct.content_key) && struct.content_key == "magicbox_spawn") {
            var_74dade39e02d8fee = function_6d6af8144a5131f1(var_74dade39e02d8fee, struct);
        }
    }
    if (isdefined(level.var_c383b967aa7e551b)) {
        var_74dade39e02d8fee = [[ level.var_c383b967aa7e551b ]]("magicbox", var_74dade39e02d8fee);
    }
    foreach (spawn_point in var_74dade39e02d8fee) {
        region = [[ level.var_c092c207acdfa48 ]](spawn_point.origin);
        if (isdefined(region)) {
            if (!isdefined(level.var_553e4b68470902aa[region])) {
                level.var_553e4b68470902aa[region] = [];
            }
            level.var_553e4b68470902aa[region] = function_6d6af8144a5131f1(level.var_553e4b68470902aa[region], spawn_point);
            level.var_eb895aaca65f1d6f = function_6d6af8144a5131f1(level.var_eb895aaca65f1d6f, spawn_point);
        }
    }
    callback::callback("ob_mysteryboxes_create_script_done");
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ae6
// Size: 0x82
function private function_5432ff3fb5bd59c9(instance) {
    var_ca1ded4b693c260d = instance.var_305e36cbb51f88ce["magicbox_spawn"];
    if (!isarray(var_ca1ded4b693c260d)) {
        return;
    }
    str_destination = instance.location.destination.targetname;
    level.var_eb895aaca65f1d6f = array_combine_unique(level.var_eb895aaca65f1d6f, var_ca1ded4b693c260d);
    level.var_553e4b68470902aa[str_destination] = var_ca1ded4b693c260d;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6f
// Size: 0x297
function function_5cc90fd8a70217c7() {
    s_bundle = getscriptbundle("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1);
    if (getdvar(@"hash_c54cb1665ac3afb6", "") != "") {
        self.var_c46b8c78447b3491 = getdvar(@"hash_c54cb1665ac3afb6");
    }
    if (!isdefined(self.var_5ffec96411bd4f89)) {
        if (isdefined(s_bundle.model) && !isdefined(self.var_c46b8c78447b3491)) {
            self.var_5ffec96411bd4f89 = namespace_4164bc931714b00b::spawn_script_model(self, s_bundle.model, 1, 1);
        } else {
            self.var_5ffec96411bd4f89 = spawnscriptable(self.var_c46b8c78447b3491, self.origin, self.angles);
        }
    }
    self.var_1d5d5ebcae9ec180 = function_53c4c53197386572(self.var_1d5d5ebcae9ec180, level.var_7ba18baeafe91d4a);
    self.radius = function_53c4c53197386572(self.radius, 80);
    self.var_3b948686580354ea = function_53c4c53197386572(self.var_3b948686580354ea, level.var_c47fd110d46f3c63);
    self.var_fec5078e78eb7217 = 0;
    self.var_75e032c5035207fe = 0;
    /#
        assertex(isdefined(s_bundle.var_83c1e0570238817) && isdefined(s_bundle.var_a98942d893386a40), "Add Use strings to the magicbox bundle for this mode");
    #/
    self.var_3d8b82bffbc735ca = s_bundle.var_83c1e0570238817;
    self.var_981915a1de2060a9 = s_bundle.var_a98942d893386a40;
    if (!isdefined(self.var_5ffec96411bd4f89.interact)) {
        self.var_5ffec96411bd4f89.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_5ffec96411bd4f89, self.radius, &function_93b6d9d9170876bd);
        self.var_5ffec96411bd4f89.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_6d88ee94fd62afcb);
        self.var_5ffec96411bd4f89.interact namespace_5775ad2badedbcaa::function_9a0883b5a0999dac();
        self.var_5ffec96411bd4f89.interact setusefov(80);
    }
    if (self.var_5ffec96411bd4f89.interact tagexists("tag_hint")) {
        self.var_5ffec96411bd4f89.interact sethinttag("tag_hint");
    }
    self.var_5ffec96411bd4f89.interact.var_fd1731776426191b = self;
    function_24439f3e75fdee96(1);
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0d
// Size: 0xdb
function function_24439f3e75fdee96(b_immediate, var_c28202badd40890a) {
    if (isdefined(self.var_5ffec96411bd4f89)) {
        while (istrue(self.var_5ffec96411bd4f89.interact.var_94f9155e68786798)) {
            waitframe();
        }
        self.var_5ffec96411bd4f89.interact function_dfb78b3e724ad620(0);
        self.var_c0a492297cea3070 = undefined;
        if (istrue(b_immediate)) {
            if (istrue(var_c28202badd40890a)) {
                self.var_5ffec96411bd4f89 setscriptablepartstate("audio_oneshots", "firesale_disappear");
            }
            self.var_5ffec96411bd4f89 setscriptablepartstate("base", "hide");
        } else {
            self.var_5ffec96411bd4f89 setscriptablepartstate("base", "leaving");
        }
        self.var_5ffec96411bd4f89 setscriptablepartstate("beam", "off");
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eef
// Size: 0xba
function function_9086395d714ed8c5(b_immediate, var_c28202badd40890a) {
    if (isdefined(self.var_5ffec96411bd4f89)) {
        self.var_c0a492297cea3070 = 1;
        if (istrue(b_immediate)) {
            self.var_5ffec96411bd4f89 setscriptablepartstate("base", "closed");
            self.var_5ffec96411bd4f89.interact function_450b2eac4388db55();
        } else {
            self.var_5ffec96411bd4f89 setscriptablepartstate("base", "arriving");
            self.var_5ffec96411bd4f89.interact delaythread(5, &function_450b2eac4388db55);
        }
        self.var_5ffec96411bd4f89 setscriptablepartstate("beam", "on");
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb0
// Size: 0x23
function function_450b2eac4388db55() {
    if (!self.var_fd1731776426191b ent_flag("magicbox_weapon_roulette_active")) {
        self function_dfb78b3e724ad620(1);
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fda
// Size: 0x14f
function private function_6d88ee94fd62afcb(usable, player) {
    if (isdefined(player) && isdefined(usable)) {
        if (istrue(player.interactions_disabled)) {
            return {string:"", type:"HINT_NOICON"};
        }
        if (isdefined(usable.interact) && isdefined(usable.interact.var_fd1731776426191b)) {
            magicbox = usable.interact.var_fd1731776426191b;
            if (player namespace_7dfc6454a70f3f39::function_bcc79745d547a99c(magicbox.var_1d5d5ebcae9ec180, magicbox.var_3b948686580354ea)) {
                return {params:[0:magicbox.var_3b948686580354ea], string:magicbox.var_3d8b82bffbc735ca, type:"HINT_BUTTON"};
            } else {
                return {params:[0:magicbox.var_3b948686580354ea], string:magicbox.var_981915a1de2060a9, type:"HINT_BUTTON"};
            }
        }
    }
    return {string:"", type:"HINT_NOICON"};
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2131
// Size: 0x1b0
function function_52706d80d64ea5f1() {
    level notify("end_firesale_start");
    level endon("end_firesale_start");
    foreach (var_fd1731776426191b in level.var_eb895aaca65f1d6f) {
        if (!isdefined(var_fd1731776426191b.var_9fb68e56512ada7)) {
            var_fd1731776426191b.var_9fb68e56512ada7 = var_fd1731776426191b.var_3b948686580354ea;
            var_fd1731776426191b.var_3b948686580354ea = function_53c4c53197386572(function_fd307a39427b77da(), 10);
        }
        if (!istrue(var_fd1731776426191b.var_c6f3d3d676f3d960) && !istrue(var_fd1731776426191b.var_c0a492297cea3070)) {
            var_fd1731776426191b function_9086395d714ed8c5();
        } else {
            if (flag("magicbox_moving")) {
                if (istrue(var_fd1731776426191b.var_c6f3d3d676f3d960)) {
                    var_fd1731776426191b.var_75e032c5035207fe--;
                }
                if (isdefined(var_fd1731776426191b.var_8a0892269455a613)) {
                    var_fd1731776426191b.var_8a0892269455a613 delete();
                }
                var_fd1731776426191b.var_5ffec96411bd4f89 function_16a74c4bdf403b54();
                var_fd1731776426191b function_9086395d714ed8c5(1);
            }
            var_fd1731776426191b.var_5ffec96411bd4f89.interact function_450b2eac4388db55();
        }
    }
    flag_clear("magicbox_moving");
    flag_waitopen("powerup_fire_sale_active");
    foreach (var_fd1731776426191b in level.var_eb895aaca65f1d6f) {
        var_fd1731776426191b thread function_556557bb00022522();
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22e8
// Size: 0x6b
function private function_556557bb00022522() {
    if (!istrue(self.var_c6f3d3d676f3d960)) {
        function_24439f3e75fdee96(1, 1);
    }
    if (isdefined(self.var_9fb68e56512ada7)) {
        self.var_3b948686580354ea = self.var_9fb68e56512ada7;
        self.var_9fb68e56512ada7 = undefined;
        if (istrue(self.var_c6f3d3d676f3d960)) {
            self.var_5ffec96411bd4f89.interact function_450b2eac4388db55();
        }
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235a
// Size: 0x9d
function function_201ddd270d6d9a83() {
    if (!soundexists("dx_ob_joav_oban_oann_abox")) {
        return;
    }
    wait(2);
    var_3a3f490c5e619a91 = getplayersinradius(self.var_8a0892269455a613.origin, 2500);
    foreach (player in var_3a3f490c5e619a91) {
        self.var_8a0892269455a613 playsoundtoplayer("dx_ob_joav_oban_oann_abox", player, self.var_8a0892269455a613);
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23fe
// Size: 0x2ea
function function_4a5f0f0f707bcc5d() {
    level endon("powerup_fire_sale_active");
    flag_set("magicbox_moving");
    self.var_75e032c5035207fe++;
    self.var_5ffec96411bd4f89.interact.var_94f9155e68786798 = undefined;
    self.var_5ffec96411bd4f89 setscriptablepartstate("audio_oneshots", "bunny_sound");
    thread function_201ddd270d6d9a83();
    if (!isdefined(level._effect["magic_box_bunny_fly_away_fx"])) {
        var_7b92ef6771bebe00 = function_6a36b14e6b79459("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1, "magicBoxJokerVFX");
        /#
            assertex(isdefined(var_7b92ef6771bebe00), "Define Magic Box Joker FX in magicbox bundle for this gamemode!");
        #/
        level._effect["magic_box_bunny_fly_away_fx"] = loadfx(var_7b92ef6771bebe00);
    }
    waitframe();
    playfxontag(getfx("magic_box_bunny_fly_away_fx"), self.var_8a0892269455a613, "tag_origin");
    wait(3);
    v_fly_away = self.var_5ffec96411bd4f89.origin + anglestoup(self.var_5ffec96411bd4f89.angles) * 500;
    self.var_8a0892269455a613 moveto(v_fly_away, 4, 3);
    self.var_8a0892269455a613 waittill("movedone");
    if (!isdefined(level._effect["magic_box_bunny_disappear_fx"])) {
        var_a1cd47a8cb48ce4e = function_6a36b14e6b79459("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1, "magicBoxJokerDisappearVFX");
        /#
            assertex(isdefined(var_a1cd47a8cb48ce4e), "Define Magic Box Joker Disappear FX in magicbox bundle for this gamemode!");
        #/
        level._effect["magic_box_bunny_disappear_fx"] = loadfx(var_a1cd47a8cb48ce4e);
    }
    playfx(getfx("magic_box_bunny_disappear_fx"), self.var_8a0892269455a613.origin);
    self.var_8a0892269455a613 delete();
    function_24439f3e75fdee96();
    while (self.var_5ffec96411bd4f89 getscriptablepartstate("base", 1) == "leaving") {
        waitframe();
    }
    self.var_c6f3d3d676f3d960 = undefined;
    function_24439f3e75fdee96(1);
    var_a622b13fece3a934 = 0;
    level.var_553e4b68470902aa[self.str_destination] = array_randomize(level.var_553e4b68470902aa[self.str_destination]);
    foreach (var_fd1731776426191b in level.var_553e4b68470902aa[self.str_destination]) {
        if (var_fd1731776426191b != self) {
            var_fd1731776426191b function_9086395d714ed8c5();
            var_fd1731776426191b.var_c6f3d3d676f3d960 = 1;
            var_a622b13fece3a934 = 1;
            break;
        }
    }
    if (!var_a622b13fece3a934) {
        thread function_8dc72235fa40c1b4();
    }
    flag_clear("magicbox_moving");
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ef
// Size: 0x18
function function_8dc72235fa40c1b4() {
    wait(60);
    function_9086395d714ed8c5();
    self.var_c6f3d3d676f3d960 = 1;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270e
// Size: 0xf6
function function_93b6d9d9170876bd(player) {
    if (istrue(player.interactions_disabled)) {
        return;
    }
    if (istrue(self.var_94f9155e68786798)) {
        return;
    }
    if (isdefined(player) && isdefined(self.var_fd1731776426191b.var_1d5d5ebcae9ec180) && isdefined(self.var_fd1731776426191b.var_3b948686580354ea)) {
        if (!player namespace_7dfc6454a70f3f39::function_301addb53c1df990(self.var_fd1731776426191b.var_1d5d5ebcae9ec180, self.var_fd1731776426191b.var_3b948686580354ea, undefined, undefined, #"magicbox")) {
            return;
        }
    }
    self.var_fd1731776426191b.var_c80acd5b1945a70f = player;
    self.var_fd1731776426191b.var_5ffec96411bd4f89 thread function_e8d7bcf1abd1c822();
    params = spawnstruct();
    params.player = player;
    player callback::callback("magicbox_used", params);
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x280b
// Size: 0x7b
function function_e8d7bcf1abd1c822() {
    self.interact.var_94f9155e68786798 = 1;
    if (!flag("powerup_fire_sale_active")) {
        level.var_fec5078e78eb7217++;
        self.interact.var_fd1731776426191b.var_fec5078e78eb7217++;
    }
    self setscriptablepartstate("base", "opening");
    self.interact.var_fd1731776426191b thread function_e4f1c5e85e0d69a();
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288d
// Size: 0x5a
function function_16a74c4bdf403b54() {
    self setscriptablepartstate("base", "closing");
    self.interact.var_fd1731776426191b.var_210f9a8a4da34e87 = undefined;
    wait(0.5);
    self.interact function_450b2eac4388db55();
    self.interact.var_94f9155e68786798 = undefined;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ee
// Size: 0x89b
function function_d97bbdb67211e6ba() {
    self.var_dccc9785667f380a = [];
    var_57a73c53c95d79e5 = 0;
    var_c620f98b221b77d6 = array_randomize(getarraykeys(level.var_76ca58710b7d7837));
    foreach (str_weapon_name in var_c620f98b221b77d6) {
        if (var_57a73c53c95d79e5 >= 10) {
            break;
        }
        if (!array_contains(self.var_dccc9785667f380a, str_weapon_name)) {
            var_57a73c53c95d79e5++;
            self.var_dccc9785667f380a = array_add(self.var_dccc9785667f380a, str_weapon_name);
        }
    }
    self.var_dccc9785667f380a = array_randomize(self.var_dccc9785667f380a);
    self.var_932dcc7dff19d39a = [];
    self.var_fa60bdabad7d1a75 = undefined;
    var_183bbba21dc5c47 = [];
    var_117b8742f174179e = 0;
    var_df6366ebfe8e16c7 = 0;
    var_50dcd25bcf5b6fdc = 0;
    var_50666b56c63f321e = 0;
    var_c4f19457334ae557 = 0;
    var_fc0761e3f7539c0b = 0;
    n_roll = randomfloat(100);
    /#
        var_7522bee60866b686 = getdvarint(@"hash_803f1e8bbe65ac37", -1);
        if (var_7522bee60866b686 != -1) {
            n_roll = var_7522bee60866b686;
        }
    #/
    n_round = namespace_53fc9ddbb516e6e1::function_560b2e700ce084a2(self.origin);
    n_time_passed = -1;
    if (issharedfuncdefined("game", "getTimePassed")) {
        n_time_passed = function_c89ed1840c8d0f0f([[ getsharedfunc("game", "getTimePassed") ]]());
    }
    /#
        if (getdvarint(@"hash_5b9243049e98ac25", -1) >= 0) {
            n_time_passed = getdvarint(@"hash_5b9243049e98ac25", -1);
        }
    #/
    var_5a238e6e9dd56b23 = 0;
    var_547881757ff394a8 = 0;
    if (istrue(level.var_8c50d72d69eac351.var_2035ab192b3f8f8d) && n_time_passed >= 0) {
        foreach (var_8c50d72d69eac351 in level.var_8c50d72d69eac351.var_9c98771061600087) {
            if (!isdefined(var_8c50d72d69eac351.var_37a9711c777c7ada)) {
                var_8c50d72d69eac351.var_37a9711c777c7ada = 0;
            }
            if (!isdefined(var_8c50d72d69eac351.var_427f7b86de2d5114)) {
                var_8c50d72d69eac351.var_427f7b86de2d5114 = 0;
            }
            if (n_time_passed >= var_8c50d72d69eac351.var_37a9711c777c7ada && n_time_passed <= var_8c50d72d69eac351.var_427f7b86de2d5114) {
                var_117b8742f174179e = 100 - (isdefined(var_8c50d72d69eac351.var_20726f0b47e2b140) ? 0 : var_8c50d72d69eac351.var_20726f0b47e2b140);
                var_df6366ebfe8e16c7 = var_117b8742f174179e - (isdefined(var_8c50d72d69eac351.var_160fc008dd7eafcd) ? 0 : var_8c50d72d69eac351.var_160fc008dd7eafcd);
                var_50dcd25bcf5b6fdc = isdefined(var_8c50d72d69eac351.var_df552013a06397a7) ? 0 : var_8c50d72d69eac351.var_df552013a06397a7;
                var_50666b56c63f321e = isdefined(var_8c50d72d69eac351.var_6730323d1814392d) ? 0 : var_8c50d72d69eac351.var_6730323d1814392d;
                var_c4f19457334ae557 = isdefined(var_8c50d72d69eac351.var_fad2a93afb064d98) ? 0 : var_8c50d72d69eac351.var_fad2a93afb064d98;
                var_fc0761e3f7539c0b = isdefined(var_8c50d72d69eac351.var_6c1142fa9b889116) ? 0 : var_8c50d72d69eac351.var_6c1142fa9b889116;
                var_547881757ff394a8 = 1;
                break;
            }
        }
    } else {
        foreach (var_8c50d72d69eac351 in level.var_8c50d72d69eac351.var_9c98771061600087) {
            if (n_round >= var_8c50d72d69eac351.var_dec47cab38a4b81 && n_round <= var_8c50d72d69eac351.var_7eaaaaaca93bb22b) {
                var_117b8742f174179e = 100 - (isdefined(var_8c50d72d69eac351.var_20726f0b47e2b140) ? 0 : var_8c50d72d69eac351.var_20726f0b47e2b140);
                var_df6366ebfe8e16c7 = var_117b8742f174179e - (isdefined(var_8c50d72d69eac351.var_160fc008dd7eafcd) ? 0 : var_8c50d72d69eac351.var_160fc008dd7eafcd);
                var_50dcd25bcf5b6fdc = isdefined(var_8c50d72d69eac351.var_df552013a06397a7) ? 0 : var_8c50d72d69eac351.var_df552013a06397a7;
                var_50666b56c63f321e = isdefined(var_8c50d72d69eac351.var_6730323d1814392d) ? 0 : var_8c50d72d69eac351.var_6730323d1814392d;
                var_c4f19457334ae557 = isdefined(var_8c50d72d69eac351.var_fad2a93afb064d98) ? 0 : var_8c50d72d69eac351.var_fad2a93afb064d98;
                var_fc0761e3f7539c0b = isdefined(var_8c50d72d69eac351.var_6c1142fa9b889116) ? 0 : var_8c50d72d69eac351.var_6c1142fa9b889116;
                var_5a238e6e9dd56b23 = 1;
                break;
            }
        }
    }
    /#
        assertex(var_5a238e6e9dd56b23 || var_547881757ff394a8, "Update magicboxroundscaling asset with a valid entry for round " + n_round + " or if using time-based scaling, elapsed time " + n_time_passed + " seconds");
    #/
    var_7074f76700c1b4f8 = 0;
    self.var_c2256c7c9fe9c264 = undefined;
    self.var_c0c46c301fee5917 = undefined;
    self.var_570e68e41b8ff9d9 = undefined;
    var_421f1da1a7cf188f = level.str_magicbox_weapon_itemspawnlist;
    if (n_roll >= var_117b8742f174179e) {
        var_421f1da1a7cf188f = level.var_ed8526d7d2e56787;
    } else if (n_roll >= var_df6366ebfe8e16c7 && !istrue(level.var_974a172904b6798c)) {
        var_421f1da1a7cf188f = level.var_2b71131620c6b678;
    } else {
        var_421f1da1a7cf188f = level.str_magicbox_weapon_itemspawnlist;
    }
    var_6fd21a56d5787ec2 = function_bc2f4857c90f5344(var_421f1da1a7cf188f, 1);
    self.var_79c38a575c9cdcbe = var_6fd21a56d5787ec2[0];
    var_aea01d24b0c20452 = getdvar(@"hash_5bf38da5a2eda0c8");
    if (isdefined(var_aea01d24b0c20452) && var_aea01d24b0c20452 != "") {
        self.var_79c38a575c9cdcbe = var_aea01d24b0c20452;
    }
    var_a41b3f4b1aaba46c = getscriptbundle("itemspawnentry:" + self.var_79c38a575c9cdcbe);
    for (var_747f59f41919885f = 0; self.var_c80acd5b1945a70f function_d5432d867711d5a(var_a41b3f4b1aaba46c) && var_747f59f41919885f < 10; var_747f59f41919885f++) {
        var_6fd21a56d5787ec2 = function_bc2f4857c90f5344(level.str_magicbox_weapon_itemspawnlist, 1);
        self.var_79c38a575c9cdcbe = var_6fd21a56d5787ec2[0];
        var_a41b3f4b1aaba46c = getscriptbundle("itemspawnentry:" + self.var_79c38a575c9cdcbe);
    }
    if (isdefined(level.var_1d4462301ddfc945) && array_contains(level.var_1d4462301ddfc945, self.var_79c38a575c9cdcbe)) {
        var_7074f76700c1b4f8 = 0;
        self.var_c2256c7c9fe9c264 = 1;
        self.var_c0c46c301fee5917 = undefined;
        self.var_570e68e41b8ff9d9 = "ultra";
        if (isdefined(var_a41b3f4b1aaba46c.var_386890528da51c45)) {
            var_6087f8d06710e7b9 = getscriptbundle(var_a41b3f4b1aaba46c.var_386890528da51c45);
            if (isdefined(var_6087f8d06710e7b9) && isdefined(var_6087f8d06710e7b9.var_644c50c3cc6c10a6)) {
                self.var_570e68e41b8ff9d9 = var_6087f8d06710e7b9.var_644c50c3cc6c10a6;
            }
        }
    } else if (isdefined(level.var_37f2b532bd735471) && array_contains(level.var_37f2b532bd735471, self.var_79c38a575c9cdcbe)) {
        var_7074f76700c1b4f8 = 0;
        self.var_c2256c7c9fe9c264 = undefined;
        self.var_c0c46c301fee5917 = 1;
        self.var_570e68e41b8ff9d9 = "ultra";
    } else {
        var_7074f76700c1b4f8 = 1;
        self.var_c2256c7c9fe9c264 = undefined;
        self.var_c0c46c301fee5917 = undefined;
    }
    if (var_7074f76700c1b4f8) {
        var_932592c588f4d2dc = var_df6366ebfe8e16c7 - var_fc0761e3f7539c0b;
        var_816b01c70ce53c28 = var_932592c588f4d2dc - var_c4f19457334ae557;
        var_bf0bbc120e6efb25 = var_816b01c70ce53c28 - var_50666b56c63f321e;
        var_744e83d213a15903 = var_bf0bbc120e6efb25 - var_50dcd25bcf5b6fdc;
        if (n_roll >= var_932592c588f4d2dc) {
            self.var_570e68e41b8ff9d9 = "orange";
            self.var_79c38a575c9cdcbe = self.var_79c38a575c9cdcbe + "_orange";
        } else if (n_roll >= var_816b01c70ce53c28) {
            self.var_570e68e41b8ff9d9 = "purple";
            self.var_79c38a575c9cdcbe = self.var_79c38a575c9cdcbe + "_purple";
        } else if (n_roll >= var_bf0bbc120e6efb25) {
            self.var_570e68e41b8ff9d9 = "blue";
            self.var_79c38a575c9cdcbe = self.var_79c38a575c9cdcbe + "_blue";
        } else {
            self.var_570e68e41b8ff9d9 = "green";
            self.var_79c38a575c9cdcbe = self.var_79c38a575c9cdcbe + "_green";
        }
    }
    /#
        if (isdefined(self.var_79c38a575c9cdcbe)) {
            println("<unknown string>" + self.var_79c38a575c9cdcbe);
        }
    #/
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3190
// Size: 0x195
function private function_d5432d867711d5a(var_a41b3f4b1aaba46c) {
    var_bb0b21ef996dd5cd = var_a41b3f4b1aaba46c.baseweapon;
    if (isdefined(var_bb0b21ef996dd5cd) && isdefined(self.primaryweapons)) {
        foreach (weapon in self.primaryweapons) {
            if (weapon.basename == var_bb0b21ef996dd5cd) {
                /#
                    println(self.name + "<unknown string>" + var_bb0b21ef996dd5cd + "<unknown string>");
                #/
                return 1;
            }
        }
    }
    var_edf725d742241f31 = var_a41b3f4b1aaba46c.ref;
    if (isdefined(self.streakdata) && isdefined(self.streakdata.streaks) && isdefined(var_edf725d742241f31)) {
        foreach (var_b744f79226553465 in self.streakdata.streaks) {
            if (var_b744f79226553465.streakname == var_edf725d742241f31 && var_b744f79226553465.available > 0) {
                /#
                    println(self.name + "<unknown string>" + var_edf725d742241f31 + "<unknown string>");
                #/
                return 1;
            }
        }
    }
    return 0;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x332d
// Size: 0xcd
function function_8c0d1d51b9a310b9() {
    /#
        assertex(isarray(level.var_c9c386cdb9fb8d5b) && level.var_c9c386cdb9fb8d5b.size, "Make sure at least one weapon class weight is defined in the magicboxroundscaling");
    #/
    range = randomfloat(1);
    range = range * 100;
    var_2aeedbed45b4b76c = 0;
    var_ec6fa13c50d488ec = "pistol";
    foreach (var_355839b15da0fdc0, var_24ca020343141dde in level.var_c9c386cdb9fb8d5b) {
        if (!isdefined(var_24ca020343141dde)) {
            continue;
        }
        if (range >= var_2aeedbed45b4b76c && range < var_24ca020343141dde) {
            var_ec6fa13c50d488ec = var_355839b15da0fdc0;
            break;
        }
        var_2aeedbed45b4b76c = var_24ca020343141dde;
    }
    return var_ec6fa13c50d488ec;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3402
// Size: 0x23
function function_e51e139834121ccb(player) {
    if (isplayer(player)) {
    }
    n_cycle_time = 5;
    return n_cycle_time;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342d
// Size: 0xee0
function function_e4f1c5e85e0d69a() {
    self.var_5ffec96411bd4f89.interact function_dfb78b3e724ad620(0);
    ent_flag_set("magicbox_weapon_roulette_active");
    function_d97bbdb67211e6ba();
    if (isarray(self.var_bae63994c188f916)) {
        foreach (var_97951e1263ed4a in self.var_bae63994c188f916) {
            if (isdefined(var_97951e1263ed4a)) {
                var_97951e1263ed4a delete();
            }
        }
    }
    self.var_bae63994c188f916 = [];
    self.var_bf292331654f1556 = [];
    level.var_ae1594cd076f2836 = array_removeundefined(level.var_ae1594cd076f2836);
    foreach (str_weapon_name in self.var_dccc9785667f380a) {
        if (getdvarint(@"hash_fc74f94143cf660f", 1) && isdefined(level.var_96c4059aa2eabfb8[str_weapon_name]) && isdefined(level.var_96c4059aa2eabfb8[str_weapon_name].weapon)) {
            var_97951e1263ed4a = function_c26e1057f3dfbc52(level.var_96c4059aa2eabfb8[str_weapon_name].weapon, self.origin - (0, 0, 30), self.angles);
        } else {
            var_2a4bbf2905825a1b = level.var_76ca58710b7d7837[str_weapon_name];
            var_97951e1263ed4a = utility::spawn_model(var_2a4bbf2905825a1b, self.origin - (0, 0, 30), self.angles);
        }
        self.var_bae63994c188f916 = array_add(self.var_bae63994c188f916, var_97951e1263ed4a);
        self.var_bf292331654f1556 = array_add(self.var_bf292331654f1556, 300);
        level.var_ae1594cd076f2836 = array_add(level.var_ae1594cd076f2836, var_97951e1263ed4a);
        if (self.var_bae63994c188f916.size >= 10 || level.var_ae1594cd076f2836.size >= 20) {
            break;
        }
    }
    n_cycle_time = function_e51e139834121ccb(self.var_c80acd5b1945a70f);
    var_bb83acd4e6ed6f43 = function_77b2927185ade6cf();
    var_fcf1dc7f731dcc73 = !isdefined(self.var_c2256c7c9fe9c264);
    if (!var_bb83acd4e6ed6f43) {
        var_a41b3f4b1aaba46c = getscriptbundle("itemspawnentry:" + self.var_79c38a575c9cdcbe);
        var_92fce7b1696254e3 = var_a41b3f4b1aaba46c.baseweapon;
        if (var_fcf1dc7f731dcc73) {
            var_4f74f0aef2b2a8bf = function_46e8a35ad122218e(var_a41b3f4b1aaba46c);
            weaponobj = namespace_e0ee43ef2dddadaa::buildweapon(var_92fce7b1696254e3, var_4f74f0aef2b2a8bf.attachments);
            if (isdefined(weaponobj)) {
                new_weapon = function_c26e1057f3dfbc52(weaponobj, self.origin - (0, 0, 35), self.angles);
            }
        }
    }
    var_db217c24c350bd55 = self.var_bae63994c188f916;
    if (isdefined(new_weapon)) {
        var_db217c24c350bd55 = array_combine([0:new_weapon], self.var_bae63994c188f916);
        self.var_bf292331654f1556 = array_combine(self.var_bf292331654f1556, [0:300]);
    }
    a_players = function_143526130b12b2b6(self.origin, 500);
    foreach (player in a_players) {
        if (isplayer(player)) {
            player utility::function_b110406ad4afce14(var_db217c24c350bd55, self.var_bf292331654f1556, n_cycle_time);
        }
    }
    var_55f85f037cf37814 = gettime() + function_a5b14435e3229bed(n_cycle_time);
    var_2d8870aac0ed74e0 = 0;
    var_b477de6a9df39992 = undefined;
    var_dd745f8ceaaf7933 = self.origin + (0, 0, 32);
    while (1) {
        if (gettime() >= var_55f85f037cf37814) {
            break;
        }
        self.str_weapon_name = self.var_dccc9785667f380a[var_2d8870aac0ed74e0];
        var_2a4bbf2905825a1b = level.var_76ca58710b7d7837[self.str_weapon_name];
        if (getdvarint(@"hash_fc74f94143cf660f", 1) && isdefined(level.var_96c4059aa2eabfb8[self.str_weapon_name]) && isdefined(level.var_96c4059aa2eabfb8[self.str_weapon_name].weapon)) {
            if (!isdefined(var_b477de6a9df39992)) {
                var_b477de6a9df39992 = 32 / n_cycle_time * 0.2 + 0.2;
            }
            if (isdefined(self.var_8a0892269455a613)) {
                v_origin = self.var_8a0892269455a613.origin;
                v_angles = self.var_8a0892269455a613.angles;
                self.var_8a0892269455a613 delete();
            } else {
                v_origin = self.origin + (0, 0, 4);
                v_angles = self.angles + (0, 180, 0);
            }
            self.var_8a0892269455a613 = function_c26e1057f3dfbc52(level.var_96c4059aa2eabfb8[self.str_weapon_name].weapon, v_origin, v_angles);
            self.var_8a0892269455a613 dontinterpolate();
            self.var_8a0892269455a613 movez(var_b477de6a9df39992, 0.2);
        } else if (isdefined(self.var_8a0892269455a613)) {
            self.var_8a0892269455a613 setmodel(var_2a4bbf2905825a1b);
        } else {
            self.var_8a0892269455a613 = namespace_4164bc931714b00b::spawn_script_model(self, var_2a4bbf2905825a1b, undefined, undefined, self.origin + (0, 0, 4));
            self.var_8a0892269455a613 dontinterpolate();
            self.var_8a0892269455a613.angles = self.var_8a0892269455a613.angles + (0, 180, 0);
            self.var_8a0892269455a613 movez(32, n_cycle_time);
        }
        var_2d8870aac0ed74e0 = (var_2d8870aac0ed74e0 + 1) % self.var_dccc9785667f380a.size;
        wait(0.2);
    }
    self.var_8a0892269455a613 notify("end_roulette_move");
    self.var_8a0892269455a613.origin = var_dd745f8ceaaf7933;
    foreach (var_97951e1263ed4a in self.var_bae63994c188f916) {
        var_97951e1263ed4a delete();
    }
    level.var_ae1594cd076f2836 = array_removeundefined(level.var_ae1594cd076f2836);
    self.var_bae63994c188f916 = undefined;
    self.var_bf292331654f1556 = undefined;
    if (flag("powerup_fire_sale_active") && var_bb83acd4e6ed6f43) {
        var_bb83acd4e6ed6f43 = 0;
        if (!isdefined(var_92fce7b1696254e3)) {
            var_a41b3f4b1aaba46c = getscriptbundle("itemspawnentry:" + self.var_79c38a575c9cdcbe);
            var_92fce7b1696254e3 = var_a41b3f4b1aaba46c.baseweapon;
            if (var_fcf1dc7f731dcc73) {
                var_4f74f0aef2b2a8bf = function_46e8a35ad122218e(var_a41b3f4b1aaba46c);
                weaponobj = namespace_e0ee43ef2dddadaa::buildweapon(var_92fce7b1696254e3, var_4f74f0aef2b2a8bf.attachments);
                if (isdefined(weaponobj)) {
                    if (isdefined(new_weapon)) {
                        new_weapon delete();
                    }
                    new_weapon = function_c26e1057f3dfbc52(weaponobj, self.origin - (0, 0, 35), self.angles);
                }
            }
        }
    }
    if (var_bb83acd4e6ed6f43) {
        self.var_2a4bbf2905825a1b = function_6a36b14e6b79459("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1, "magicboxjokermodel");
        if (getdvarint(@"hash_fc74f94143cf660f", 1)) {
            v_origin = self.var_8a0892269455a613.origin;
            v_angles = self.var_8a0892269455a613.angles;
            self.var_8a0892269455a613 delete();
            self.var_8a0892269455a613 = utility::spawn_model(self.var_2a4bbf2905825a1b, v_origin, v_angles);
        } else {
            self.var_8a0892269455a613 setmodel(self.var_2a4bbf2905825a1b);
        }
        self.var_8a0892269455a613 dontinterpolate();
        self.var_8a0892269455a613.angles = self.var_8a0892269455a613.angles + (0, -90, 0);
        self.var_867c493b6aa4f425 = 1;
        level.var_fec5078e78eb7217 = 0;
        self.var_fec5078e78eb7217 = 0;
        level.var_9a3999e1157b96b2 = undefined;
        if (isplayer(self.var_c80acd5b1945a70f)) {
            self.var_c80acd5b1945a70f namespace_7dfc6454a70f3f39::function_3036cef61495210f(self.var_1d5d5ebcae9ec180, self.var_3b948686580354ea);
        }
        ent_flag_clear("magicbox_weapon_roulette_active");
        function_4a5f0f0f707bcc5d();
    } else {
        if (var_fcf1dc7f731dcc73) {
            if (!isdefined(weaponobj)) {
                weaponobj = namespace_e0ee43ef2dddadaa::buildweapon(var_92fce7b1696254e3, var_4f74f0aef2b2a8bf.attachments);
            }
            if (isdefined(weaponobj)) {
                if (isdefined(new_weapon)) {
                    new_weapon dontinterpolate();
                    new_weapon.origin = self.var_8a0892269455a613.origin;
                    new_weapon.angles = self.var_8a0892269455a613.angles;
                } else {
                    new_weapon = function_c26e1057f3dfbc52(weaponobj, self.var_8a0892269455a613.origin, self.var_8a0892269455a613.angles);
                }
                if (isdefined(new_weapon)) {
                    self.var_8a0892269455a613 delete();
                    self.var_8a0892269455a613 = new_weapon;
                    self.var_8a0892269455a613.weaponobj = weaponobj;
                    self.var_8a0892269455a613.var_4f74f0aef2b2a8bf = var_4f74f0aef2b2a8bf;
                }
            }
        } else {
            self.var_8a0892269455a613 delete();
            self.var_8a0892269455a613 = namespace_4164bc931714b00b::spawn_script_model(self, var_a41b3f4b1aaba46c.worldmodel, undefined, undefined, self.origin + (0, 0, 30));
        }
        if (isdefined(var_a41b3f4b1aaba46c.ref)) {
            angleoffset = function_a937ca6de2a9bd6a(var_a41b3f4b1aaba46c.ref);
            if (isdefined(angleoffset)) {
                self.var_8a0892269455a613.angles = self.var_8a0892269455a613.angles + angleoffset;
            }
        }
        self.var_8a0892269455a613 show();
        self.var_8a0892269455a613.var_fd1731776426191b = self;
        self.var_8a0892269455a613.var_a41b3f4b1aaba46c = var_a41b3f4b1aaba46c;
        self.var_8a0892269455a613.str_weapon_name = var_a41b3f4b1aaba46c.baseweapon;
        if (!isdefined(self.var_8a0892269455a613.str_weapon_name)) {
            self.var_8a0892269455a613.str_weapon_name = var_a41b3f4b1aaba46c.fullweaponname;
        }
        self.var_8a0892269455a613.var_c2256c7c9fe9c264 = self.var_c2256c7c9fe9c264;
        self.var_8a0892269455a613.var_c0c46c301fee5917 = self.var_c0c46c301fee5917;
        self.var_8a0892269455a613.var_570e68e41b8ff9d9 = self.var_570e68e41b8ff9d9;
        if (isdefined(self.var_8a0892269455a613.var_570e68e41b8ff9d9)) {
            self.var_8a0892269455a613.var_190dff656871d0e0 = function_7fa5860a8e414317(self.var_8a0892269455a613.var_570e68e41b8ff9d9);
        } else {
            self.var_8a0892269455a613.var_570e68e41b8ff9d9 = "ultra";
        }
        var_7940ede26aadf270 = function_6723ddf7ee271958(self.var_8a0892269455a613.str_weapon_name, var_a41b3f4b1aaba46c);
        var_153392b2c3997dda = function_df75e34b6f908603(self.var_8a0892269455a613.var_570e68e41b8ff9d9);
        self.var_8a0892269455a613.var_2a4bbf2905825a1b = isdefined(var_a41b3f4b1aaba46c.worldmodel) ? "tag_origin" : var_a41b3f4b1aaba46c.worldmodel;
        self.var_8a0892269455a613 setmodel(self.var_8a0892269455a613.var_2a4bbf2905825a1b);
        var_740a60c08f19e63f = function_62d33a3eda193ce(self.var_8a0892269455a613.var_570e68e41b8ff9d9);
        self.var_8a0892269455a613.var_ece282a4bf464e00 = namespace_cbd3754a0c69cc63::outlineenableforall(self.var_8a0892269455a613, var_740a60c08f19e63f, "level_script");
        self.var_5ffec96411bd4f89 function_76a849c903b6174d(self.var_8a0892269455a613.var_570e68e41b8ff9d9);
        self.var_8a0892269455a613.interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(self.var_8a0892269455a613.origin, 64, &function_c6bcc8af70c669d6);
        self.var_8a0892269455a613.interact namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_7b2d9fabb5c06de2);
        self.var_8a0892269455a613.interact namespace_5775ad2badedbcaa::function_9a0883b5a0999dac();
        self.var_8a0892269455a613.interact setusefov(80);
        self.var_8a0892269455a613 notsolid();
        if (isplayer(self.var_c80acd5b1945a70f)) {
            self.var_8a0892269455a613.interact disableplayeruseforallplayers();
            self.var_8a0892269455a613.interact enableplayeruse(self.var_c80acd5b1945a70f);
        }
        self.var_8a0892269455a613.interact.var_8a0892269455a613 = self.var_8a0892269455a613;
        self.var_8a0892269455a613 movez(-32, 12, 6);
        self.var_8a0892269455a613 thread function_f3df4ac07d385cbb();
        self.var_8a0892269455a613.interact function_beb43989a331e2cb();
        if (isdefined(self.var_8a0892269455a613.interact)) {
            self.var_8a0892269455a613.interact delete();
        }
        if (isdefined(self.var_8a0892269455a613)) {
            self.var_8a0892269455a613 delete();
        }
        ent_flag_clear("magicbox_weapon_roulette_active");
        self.var_5ffec96411bd4f89 function_16a74c4bdf403b54();
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4314
// Size: 0x68
function function_6723ddf7ee271958(str_weapon_name, item) {
    var_7940ede26aadf270 = "SHARED_HINTSTRINGS/DEFAULT_WEAPON_WALLBUY_NAME";
    if (isdefined(item) && isdefined(item.titlestring)) {
        var_7940ede26aadf270 = item.titlestring;
    } else {
        weapon = makeweapon(str_weapon_name);
        var_7940ede26aadf270 = weapon.displayname;
    }
    return var_7940ede26aadf270;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4384
// Size: 0xdf
function function_7b2d9fabb5c06de2(usable, player) {
    if (player function_4ce554761d2246b1() && !istrue(usable.var_8a0892269455a613.var_c2256c7c9fe9c264)) {
        return {string:"SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_TERTIARY_DISABLED", type:"HINT_NOBUTTON"};
    }
    var_7940ede26aadf270 = function_6723ddf7ee271958(usable.var_8a0892269455a613.str_weapon_name, usable.var_8a0892269455a613.var_a41b3f4b1aaba46c);
    var_153392b2c3997dda = function_df75e34b6f908603(usable.var_8a0892269455a613.var_570e68e41b8ff9d9);
    return {params:[0:var_7940ede26aadf270], string:var_153392b2c3997dda, type:"HINT_NOICON"};
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x446b
// Size: 0x2c
function private function_4ce554761d2246b1() {
    if (isweapon(self.var_36940c335e7cc50c) && self getcurrentweapon() == self.var_36940c335e7cc50c) {
        return 1;
    }
    return 0;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x449f
// Size: 0x228
function function_c6bcc8af70c669d6(player) {
    var_8a0892269455a613 = self.var_8a0892269455a613;
    if (isplayer(player) && isplayer(var_8a0892269455a613.var_fd1731776426191b.var_c80acd5b1945a70f)) {
        if (!istrue(var_8a0892269455a613.var_fd1731776426191b.var_210f9a8a4da34e87) && player != var_8a0892269455a613.var_fd1731776426191b.var_c80acd5b1945a70f) {
            return;
        }
        if (player function_4ce554761d2246b1() && !istrue(var_8a0892269455a613.var_c2256c7c9fe9c264)) {
            return;
        }
    }
    var_636981592f381ebf = spawnstruct();
    var_a41b3f4b1aaba46c = var_8a0892269455a613.var_a41b3f4b1aaba46c;
    var_636981592f381ebf.weaponobj = var_8a0892269455a613.weaponobj;
    var_636981592f381ebf.var_4f74f0aef2b2a8bf = var_8a0892269455a613.var_4f74f0aef2b2a8bf;
    if (!istrue(var_8a0892269455a613.var_c2256c7c9fe9c264)) {
        weaponobj = var_636981592f381ebf.weaponobj;
        if (!isdefined(weaponobj)) {
            weaponobj = namespace_b4f2af6fa775d9b::function_777497d9d98fa0b8(var_a41b3f4b1aaba46c);
        }
        clipammo = weaponclipsize(weaponobj);
        stockammo = weaponmaxammo(weaponobj);
        var_636981592f381ebf.count = function_7209c8cd4b2e3afd(clipammo);
        var_636981592f381ebf.var_5a57e79ae8d5ae67 = stockammo;
    } else {
        var_636981592f381ebf.count = 1;
        var_636981592f381ebf.var_4ec444a18e7fc2c0 = 1;
    }
    var_72672cd81ec1093d = player function_7f6f62ba8dfd0da0(var_a41b3f4b1aaba46c, var_636981592f381ebf);
    if (isarray(var_72672cd81ec1093d) && isdefined(var_72672cd81ec1093d[1]) && isweapon(var_72672cd81ec1093d[1])) {
        var_72672cd81ec1093d = var_72672cd81ec1093d[1];
    }
    params = spawnstruct();
    params.objweapon = var_72672cd81ec1093d;
    params.itembundle = var_a41b3f4b1aaba46c;
    params.lootid = function_2c836ad05e5f634c(var_a41b3f4b1aaba46c.ref);
    player callback::callback("magicbox_purchase", params);
    var_8a0892269455a613 delete();
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46ce
// Size: 0x63
function function_6743ce9942654f5c() {
    var_5d2f2f0ef7fb6d7c = getscriptbundle("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1);
    if (isdefined(var_5d2f2f0ef7fb6d7c) && isdefined(var_5d2f2f0ef7fb6d7c.var_11cc16f2a143d3b5)) {
        return (var_5d2f2f0ef7fb6d7c.var_11cc16f2a143d3b5 + clamp(level.players.size, 1, 6));
    }
    return 5;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4739
// Size: 0x4f
function function_d26b24de82eb5022() {
    var_5d2f2f0ef7fb6d7c = getscriptbundle("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1);
    if (isdefined(var_5d2f2f0ef7fb6d7c) && isdefined(var_5d2f2f0ef7fb6d7c.var_d892f026355ed7a2)) {
        return var_5d2f2f0ef7fb6d7c.var_d892f026355ed7a2;
    }
    return 5;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4790
// Size: 0xf4
function function_87c4b368c1103687() {
    var_5d2f2f0ef7fb6d7c = getscriptbundle("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1);
    if (isdefined(var_5d2f2f0ef7fb6d7c) && isarray(var_5d2f2f0ef7fb6d7c.var_42d32d0c0d67cae2)) {
        foreach (var_558901289f85327a in var_5d2f2f0ef7fb6d7c.var_42d32d0c0d67cae2) {
            if (self.var_fec5078e78eb7217 >= var_558901289f85327a.var_23d245d466aa4bfb && self.var_fec5078e78eb7217 <= var_558901289f85327a.maxuses) {
                return utility::function_51d76700600cebe3(var_558901289f85327a.percentchance);
            }
        }
    }
    if (self.var_fec5078e78eb7217 <= function_d26b24de82eb5022()) {
        return 0;
    }
    return utility::function_51d76700600cebe3(40);
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x488c
// Size: 0xb8
function function_a937ca6de2a9bd6a(itemname) {
    var_1ca7c297d125d9e1 = function_6a36b14e6b79459("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1, "itemAngleStruct");
    if (isdefined(var_1ca7c297d125d9e1)) {
        foreach (var_f968bf4dd3759e3f in var_1ca7c297d125d9e1) {
            if (itemname == var_f968bf4dd3759e3f.itemname) {
                return (var_f968bf4dd3759e3f.pitch, var_f968bf4dd3759e3f.yaw, var_f968bf4dd3759e3f.roll);
            }
        }
    }
    return undefined;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x494c
// Size: 0x85
function function_77b2927185ade6cf() {
    if (istrue(level.var_7b92ca8fe0fc2411)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return 0;
    }
    if (istrue(level.var_9a3999e1157b96b2)) {
        return 1;
    }
    if (flag("powerup_fire_sale_active")) {
        return 0;
    }
    if (!self.var_75e032c5035207fe) {
        if (self.var_fec5078e78eb7217 >= function_6743ce9942654f5c()) {
            return 1;
        }
    } else if (self.var_fec5078e78eb7217 < function_d26b24de82eb5022()) {
        return 0;
    } else {
        return function_87c4b368c1103687();
    }
    return 0;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49d9
// Size: 0x11
function function_beb43989a331e2cb() {
    waittill_any_timeout_1(12, "picked_up_weapon");
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f1
// Size: 0x1f7
function function_f3df4ac07d385cbb() {
    self endon("death");
    if (level.players.size <= 1) {
        return;
    }
    var_1772144d363608ac = 2304;
    var_72126a2635db77cc = self.var_fd1731776426191b.var_c80acd5b1945a70f;
    while (isplayer(var_72126a2635db77cc) && istrue(self.var_fd1731776426191b.var_5ffec96411bd4f89.interact.var_94f9155e68786798)) {
        if (var_72126a2635db77cc ismeleeing() && distance2dsquared(var_72126a2635db77cc.origin, self.origin) < var_1772144d363608ac) {
            if (namespace_3c37cb17ade254d::within_fov(var_72126a2635db77cc.origin, var_72126a2635db77cc.angles, self.origin, cos(70))) {
                self.var_fd1731776426191b.var_210f9a8a4da34e87 = 1;
                self.var_fd1731776426191b.var_8a0892269455a613.interact enableplayeruseforallplayers();
                self.var_fd1731776426191b.var_5ffec96411bd4f89 setscriptablepartstate("audio_oneshots", "melee_share");
                if (!isdefined(level._effect["magic_box_shared_weapon_fx"])) {
                    var_3617462f49054487 = function_6a36b14e6b79459("magicbox:" + level.var_1a2b600a06ec21f4.var_40f32f76cc264dc1, "magicBoxSharedWeaponVFX");
                    /#
                        assertex(isdefined(var_3617462f49054487), "Define Magic Box Shared Weapon FX in magicbox bundle for this gamemode!");
                    #/
                    level._effect["magic_box_shared_weapon_fx"] = loadfx(var_3617462f49054487);
                }
                str_fx_tag = "j_gun";
                if (self.var_fd1731776426191b.var_8a0892269455a613 tagexists("tag_origin")) {
                    str_fx_tag = "tag_origin";
                }
                playfxontag(getfx("magic_box_shared_weapon_fx"), self.var_fd1731776426191b.var_8a0892269455a613, str_fx_tag);
                return;
            }
        }
        waitframe();
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bef
// Size: 0xc
function on_round_end(params) {
    
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c02
// Size: 0x15b
function function_76a849c903b6174d(var_36b9b6f484d3e746) {
    var_36b9b6f484d3e746 = function_53c4c53197386572(var_36b9b6f484d3e746, "none");
    switch (var_36b9b6f484d3e746) {
    case #"hash_883ff07272b4f9c":
    case #"hash_540f19f4cb02adc3":
        self setscriptablepartstate("base", "opened_uncommon");
        break;
    case #"hash_209fa8900070d83d":
    case #"hash_778bb52ecd08072d":
        self setscriptablepartstate("base", "opened_rare");
        break;
    case #"hash_598a30e44f53045f":
    case #"hash_95068103fe897bc8":
        self setscriptablepartstate("base", "opened_epic");
        break;
    case #"hash_35bb3bd014c77f4b":
    case #"hash_d6c98e710a88aa4a":
        self setscriptablepartstate("base", "opened_legendary");
        break;
    case #"hash_22aea56c1711fd5":
    case #"hash_2ac407c1cd5943a9":
    case #"hash_2bb18549e1e51286":
    case #"hash_8d39eb0f19bf9df3":
        self setscriptablepartstate("base", "opened_ultra");
        break;
    case #"hash_1393412d7401c646":
    case #"hash_6c4c3516ab5ce943":
    case #"hash_db653a4972b3c13b":
    case #"hash_f9bb0e989176d455":
        self setscriptablepartstate("base", "opened_default");
        break;
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d64
// Size: 0x164
function function_df75e34b6f908603(var_36b9b6f484d3e746, var_9d40b17c398849c6) {
    var_36b9b6f484d3e746 = function_53c4c53197386572(var_36b9b6f484d3e746, "none");
    var_9d40b17c398849c6 = function_53c4c53197386572(var_9d40b17c398849c6, 0);
    switch (var_36b9b6f484d3e746) {
    case #"hash_883ff07272b4f9c":
    case #"hash_540f19f4cb02adc3":
        if (var_9d40b17c398849c6) {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_UNCOMMON_SHARED";
        } else {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_UNCOMMON";
        }
        break;
    case #"hash_209fa8900070d83d":
    case #"hash_778bb52ecd08072d":
        if (var_9d40b17c398849c6) {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_RARE_SHARED";
        } else {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_RARE";
        }
        break;
    case #"hash_598a30e44f53045f":
    case #"hash_95068103fe897bc8":
        if (var_9d40b17c398849c6) {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_EPIC_SHARED";
        } else {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_EPIC";
        }
        break;
    case #"hash_35bb3bd014c77f4b":
    case #"hash_d6c98e710a88aa4a":
        if (var_9d40b17c398849c6) {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_LEGENDARY_SHARED";
        } else {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_LEGENDARY";
        }
        break;
    case #"hash_22aea56c1711fd5":
    case #"hash_1393412d7401c646":
    case #"hash_2ac407c1cd5943a9":
    case #"hash_2bb18549e1e51286":
    case #"hash_6c4c3516ab5ce943":
    case #"hash_8d39eb0f19bf9df3":
    case #"hash_db653a4972b3c13b":
    case #"hash_f9bb0e989176d455":
        if (var_9d40b17c398849c6) {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON_SHARED";
        } else {
            return "SHARED_HINTSTRINGS/MAGICBOX_GRAB_WEAPON";
        }
        break;
    }
    return 0;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ed0
// Size: 0x113
function function_62d33a3eda193ce(var_36b9b6f484d3e746) {
    var_36b9b6f484d3e746 = function_53c4c53197386572(var_36b9b6f484d3e746, "none");
    switch (var_36b9b6f484d3e746) {
    case #"hash_883ff07272b4f9c":
    case #"hash_540f19f4cb02adc3":
        return "outline_depth_green";
    case #"hash_209fa8900070d83d":
    case #"hash_778bb52ecd08072d":
        return "outline_depth_blue";
    case #"hash_598a30e44f53045f":
    case #"hash_95068103fe897bc8":
        return "outline_depth_purple";
    case #"hash_35bb3bd014c77f4b":
    case #"hash_d6c98e710a88aa4a":
        return "outline_depth_orange";
    case #"hash_22aea56c1711fd5":
    case #"hash_2ac407c1cd5943a9":
    case #"hash_2bb18549e1e51286":
    case #"hash_8d39eb0f19bf9df3":
        return "outline_depth_yellow";
    case #"hash_1393412d7401c646":
    case #"hash_6c4c3516ab5ce943":
    case #"hash_db653a4972b3c13b":
    case #"hash_f9bb0e989176d455":
    default:
        return "outline_depth_white";
        break;
    }
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fea
// Size: 0xbd
function function_7fa5860a8e414317(rarity) {
    num_attachments = 0;
    switch (rarity) {
    case #"hash_1393412d7401c646":
    case #"hash_db653a4972b3c13b":
        num_attachments = 1;
        break;
    case #"hash_883ff07272b4f9c":
    case #"hash_540f19f4cb02adc3":
        num_attachments = 2;
        break;
    case #"hash_209fa8900070d83d":
    case #"hash_778bb52ecd08072d":
        num_attachments = 3;
        break;
    case #"hash_598a30e44f53045f":
    case #"hash_95068103fe897bc8":
        num_attachments = 4;
        break;
    case #"hash_35bb3bd014c77f4b":
    case #"hash_d6c98e710a88aa4a":
        num_attachments = 5;
        break;
    }
    return num_attachments;
}

// Namespace magicbox/namespace_c6e8089e2a23087e
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x50af
// Size: 0x351
function private function_7b5090b85561b747() {
    /#
        var_39239d1f90650b = (0, 0, 4);
        var_e33953429ed350f = 0.25;
        while (1) {
            foreach (var_fd1731776426191b in level.var_eb895aaca65f1d6f) {
                if (!isdefined(var_fd1731776426191b.var_5ffec96411bd4f89)) {
                    continue;
                }
                if (!isdefined(var_fd1731776426191b.s_destination)) {
                    var_fd1731776426191b.s_destination = getstruct(var_fd1731776426191b.str_destination, "<unknown string>");
                }
                var_d8b783bf56b63a71 = "<unknown string>";
                if (var_fd1731776426191b.var_5ffec96411bd4f89.interact tagexists("<unknown string>")) {
                    v_position = var_fd1731776426191b.var_5ffec96411bd4f89.interact gettagorigin("<unknown string>");
                    var_d8b783bf56b63a71 = "<unknown string>";
                } else {
                    v_position = var_fd1731776426191b.var_5ffec96411bd4f89.interact.origin;
                }
                if (istrue(var_fd1731776426191b.var_c0a492297cea3070)) {
                    sphere(v_position, var_fd1731776426191b.var_5ffec96411bd4f89.interact.var_10a09b4e9dcdf2ed, (0, 1, 0));
                    if (isdefined(var_fd1731776426191b.s_destination)) {
                        line(v_position, var_fd1731776426191b.s_destination.origin, (0, 1, 0));
                    }
                } else {
                    sphere(v_position, var_fd1731776426191b.var_5ffec96411bd4f89.interact.var_10a09b4e9dcdf2ed, (1, 0, 0));
                    if (isdefined(var_fd1731776426191b.s_destination)) {
                        line(v_position, var_fd1731776426191b.s_destination.origin, (1, 0, 0));
                    }
                }
                print3d(v_position, "<unknown string>" + var_fd1731776426191b.var_1d5d5ebcae9ec180, (0, 1, 0), 1, var_e33953429ed350f);
                print3d(v_position - var_39239d1f90650b * 1, "<unknown string>" + ter_op(istrue(var_fd1731776426191b.var_c0a492297cea3070), "<unknown string>", "<unknown string>"), (0, 1, 0), 1, 0.25);
                print3d(v_position - var_39239d1f90650b * 2, "<unknown string>" + var_fd1731776426191b.str_destination, (0, 1, 0), 1, 0.25);
                if (istrue(var_fd1731776426191b.var_5ffec96411bd4f89.interact.b_is_trigger)) {
                    var_ab9799ccaf563cab = "<unknown string>";
                    var_d8b783bf56b63a71 = "<unknown string>";
                } else {
                    var_ab9799ccaf563cab = "<unknown string>";
                    var_d8b783bf56b63a71 = "<unknown string>" + var_d8b783bf56b63a71 + "<unknown string>";
                }
                print3d(v_position - var_39239d1f90650b * 3, "<unknown string>" + var_ab9799ccaf563cab + var_d8b783bf56b63a71, (0, 1, 0), 1, 0.25);
            }
            waitframe();
        }
    #/
}

