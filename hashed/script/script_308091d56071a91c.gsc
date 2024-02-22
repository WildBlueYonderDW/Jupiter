// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\ai.gsc;
#using script_72a196b6c7df2f38;
#using script_784c8c4f3e5f8686;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\common\vehicle.gsc;

#namespace scene;

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0
// Size: 0xef
function function_6cd499378aadcad8() {
    /#
        setdvarifuninitialized(@"hash_559926a6436db818", "<unknown string>");
        setdvarifuninitialized(@"hash_1aa832f211c5245e", 0);
        setdvarifuninitialized(@"hash_e4eb2639f407d43d", 0);
        setdvarifuninitialized(@"hash_143b0dff4afbd1d3", 0);
        setdvarifuninitialized(@"hash_71fb5222b333d146", "<unknown string>");
        setdvarifuninitialized(@"hash_54fd90073299424e", 0);
        setdvarifuninitialized(@"hash_f98fc73c88850645", 0);
        setdvarifuninitialized(@"hash_d0761d5c3f9e3bf", 0);
        setdvarifuninitialized(@"hash_373ad6363da1c230", (0, 0, 0));
        setdvarifuninitialized(@"hash_eab41865eb0e96ea", (0, 0, 0));
        setdvarifuninitialized(@"hash_7dda2ca8e979b1b2", 0);
        setdvarifuninitialized(@"hash_b279d32f047f16db", 0);
        level thread function_7953b5d502d2edc();
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a6
// Size: 0xdb
function private function_475cdb01202582a1() {
    /#
        if (!getdvarint(@"hash_7dda2ca8e979b1b2", 0)) {
            return;
        }
        var_5aaf7c7163c04623 = self;
        /#
            assert(isstruct(var_5aaf7c7163c04623.var_84b542bb7490bea7));
        #/
        if (isdefined(level.scene.var_24d6c261e5a746c4)) {
            level.scene.var_24d6c261e5a746c4.var_b7a4d5490ee3c584 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
        }
        var_5aaf7c7163c04623.var_84b542bb7490bea7.var_37f1237a57fc6e5d = level.scene.var_24d6c261e5a746c4;
        var_5aaf7c7163c04623.var_84b542bb7490bea7.var_b7a4d5490ee3c584 = undefined;
        level.scene.var_24d6c261e5a746c4 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x288
// Size: 0x106
function private function_86051e11e7b7a98e() {
    /#
        if (!getdvarint(@"hash_7dda2ca8e979b1b2", 0)) {
            return;
        }
        var_5aaf7c7163c04623 = self;
        /#
            assert(isstruct(var_5aaf7c7163c04623.var_84b542bb7490bea7));
        #/
        if (isdefined(var_5aaf7c7163c04623.var_84b542bb7490bea7.var_b7a4d5490ee3c584)) {
            var_5aaf7c7163c04623.var_84b542bb7490bea7.var_b7a4d5490ee3c584.var_37f1237a57fc6e5d = var_5aaf7c7163c04623.var_84b542bb7490bea7.var_37f1237a57fc6e5d;
        }
        if (is_equal(level.scene.var_24d6c261e5a746c4, var_5aaf7c7163c04623.var_84b542bb7490bea7)) {
            level.scene.var_24d6c261e5a746c4 = var_5aaf7c7163c04623.var_84b542bb7490bea7.var_37f1237a57fc6e5d;
        }
        var_5aaf7c7163c04623.var_84b542bb7490bea7.var_b7a4d5490ee3c584 = undefined;
        var_5aaf7c7163c04623.var_84b542bb7490bea7.var_37f1237a57fc6e5d = undefined;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x395
// Size: 0x125
function private function_7953b5d502d2edc() {
    /#
        while (!isdefined(level.player) || !isdefined(level.scene)) {
            waitframe();
        }
        wait(0.5);
        level.scene.debug_player = level.player;
        level.scene.debug_player thread function_5759a29120b54c79("<unknown string>");
        level.scene.debug_player thread function_5759a29120b54c79("<unknown string>");
        level.scene.debug_player thread function_5759a29120b54c79("<unknown string>");
        level.scene.debug_player thread function_5759a29120b54c79("<unknown string>");
        function_35eda8020e32f5c0();
        function_1191a68610545006();
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_259e5f65a65e7a4a, 0, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &scene_menu, 0, 2);
        function_fe953f000498048f();
        level thread function_7c896b815539ac80();
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4c1
// Size: 0xce
function private function_1191a68610545006() {
    /#
        var_82701a2a9f269ecf = [];
        foreach (s_scene in level.var_a0b4eb1703be349a) {
            if (function_bb946c981c3bc3e9(s_scene.var_8ac77218f7a34e3e) && !istrue(s_scene.var_cb890cd9a86235d2)) {
                if (isdefined(var_82701a2a9f269ecf[s_scene.var_8ac77218f7a34e3e])) {
                    var_82701a2a9f269ecf[s_scene.var_8ac77218f7a34e3e]++;
                } else {
                    var_82701a2a9f269ecf[s_scene.var_8ac77218f7a34e3e] = 1;
                }
                s_scene.var_39852edf15442735 = var_82701a2a9f269ecf[s_scene.var_8ac77218f7a34e3e];
            }
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x596
// Size: 0x8c
function private function_bb946c981c3bc3e9(str_scene_name) {
    /#
        n_count = 0;
        foreach (s_scene in level.var_a0b4eb1703be349a) {
            if (is_equal(s_scene.var_8ac77218f7a34e3e, str_scene_name)) {
                n_count++;
            }
        }
        if (n_count > 1) {
            return 1;
        }
        return 0;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x629
// Size: 0x3f
function private function_7c896b815539ac80() {
    /#
        while (1) {
            waitframe();
            if (!getdvarint(@"hash_e4eb2639f407d43d", 0) && !getdvarint(@"hash_7dda2ca8e979b1b2", 0)) {
                continue;
            }
            function_b0f35d29939ca41d();
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x66f
// Size: 0x30b
function private function_b0f35d29939ca41d() {
    /#
        var_2435d1a36692e090 = 0;
        var_56d245a981c75bbf = 0;
        var_b9c3011993532d28 = 0;
        var_bbcbd163ab318b80 = 0;
        walk = level.scene.var_24d6c261e5a746c4;
        if (isdefined(level.var_a1fa0d703a31ee73)) {
            var_bbcbd163ab318b80 = level.var_a1fa0d703a31ee73.size;
        }
        roots = [];
        while (isdefined(walk)) {
            var_2435d1a36692e090++;
            if (getdvarint(@"hash_7dda2ca8e979b1b2", 0)) {
                roots[roots.size] = spawnstruct();
                roots[roots.size - 1].var_5aaf7c7163c04623 = walk.var_5aaf7c7163c04623;
            }
            scenescriptbundle = walk.var_5aaf7c7163c04623 function_6a6ec88abab6a723();
            var_3e8e5769a9b84c64 = scenescriptbundle function_d1338e27a26ecaeb();
            var_7982f8c1472e445d = scenescriptbundle function_291cd2f1089d3a94();
            if (getdvarint(@"hash_7dda2ca8e979b1b2", 0)) {
                roots[roots.size - 1].var_3e8e5769a9b84c64 = var_3e8e5769a9b84c64;
                roots[roots.size - 1].var_7982f8c1472e445d = var_7982f8c1472e445d;
            }
            var_b9c3011993532d28 = var_b9c3011993532d28 + var_3e8e5769a9b84c64;
            var_56d245a981c75bbf = var_56d245a981c75bbf + var_7982f8c1472e445d;
            walk = walk.var_37f1237a57fc6e5d;
        }
        if (getdvarint(@"hash_7dda2ca8e979b1b2", 0)) {
            roots = array_sort_with_func(roots, &function_a726872ed3f8991c);
            foreach (root in roots) {
                state = root.var_5aaf7c7163c04623 get_state();
                var_cea01711b178edb6 = "<unknown string>" + int(root.var_5aaf7c7163c04623.origin[0]) + "<unknown string>" + int(root.var_5aaf7c7163c04623.origin[1]) + "<unknown string>" + int(root.var_5aaf7c7163c04623.origin[2]) + "<unknown string>";
                var_3378306339a5aa51 = isdefined(state) ? state : "<unknown string>";
                print(root.var_5aaf7c7163c04623.var_8ac77218f7a34e3e + "<unknown string>" + var_3378306339a5aa51 + "<unknown string>" + var_cea01711b178edb6 + "<unknown string>" + root.var_3e8e5769a9b84c64 + "<unknown string>" + root.var_7982f8c1472e445d);
            }
        }
        setdvar(@"hash_7dda2ca8e979b1b2", 0);
        printtoscreen2d(50, 60, "<unknown string>" + var_2435d1a36692e090 + "<unknown string>" + var_b9c3011993532d28 + "<unknown string>" + var_56d245a981c75bbf + "<unknown string>" + var_bbcbd163ab318b80, (1, 1, 1), 1);
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x981
// Size: 0x49
function private function_a726872ed3f8991c(a, b) {
    /#
        return stricmp(a.var_5aaf7c7163c04623.var_8ac77218f7a34e3e, b.var_5aaf7c7163c04623.var_8ac77218f7a34e3e) < 0;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9d1
// Size: 0x135
function private function_35eda8020e32f5c0() {
    /#
        var_20fee085e968ff25 = getscriptbundlenames("<unknown string>");
        foreach (var_3032d30b52922730 in var_20fee085e968ff25) {
            s_scenedef = getscriptbundle(var_3032d30b52922730);
            str_scene_name = strtok(function_3c8848a3a11b2553(var_3032d30b52922730), "<unknown string>");
            str_scene_name = str_scene_name[1];
            if (!array_contains(level.var_f99b1d319e65854c, str_scene_name)) {
                level.var_f99b1d319e65854c = function_6d6af8144a5131f1(level.var_f99b1d319e65854c, str_scene_name);
                s_scene = spawnstruct();
                s_scene.var_8ac77218f7a34e3e = str_scene_name;
                s_scene.origin = (0, 0, 0);
                s_scene.angles = (0, 0, 0);
                s_scene.var_cb890cd9a86235d2 = 1;
                level.var_a0b4eb1703be349a = function_6d6af8144a5131f1(level.var_a0b4eb1703be349a, s_scene);
            }
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb0d
// Size: 0x56
function private function_259e5f65a65e7a4a(params) {
    /#
        if (isdefined(params[0]) && params[0] == "<unknown string>" || !flag("<unknown string>")) {
            flag_set("<unknown string>");
            level thread function_1a6063b0e34ec373();
        } else {
            flag_clear("<unknown string>");
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb6a
// Size: 0x550
function private function_1a6063b0e34ec373(params) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        var_a16d4962e4996f7 = (0.8, 0.8, 0);
        var_d67003533dc77764 = (0.8, 0, 0.8);
        while (flag("<unknown string>")) {
            foreach (s_scene in level.var_a0b4eb1703be349a) {
                var_97e88c04cc05cbbd = s_scene get_state();
                a_ents = s_scene function_3f8173e45076d687();
                str_scene_name = isdefined(s_scene.var_39852edf15442735) ? s_scene.var_8ac77218f7a34e3e + "<unknown string>" + s_scene.var_39852edf15442735 : s_scene.var_8ac77218f7a34e3e;
                print3d(s_scene.origin, "<unknown string>" + str_scene_name, (0.8, 0, 0.8), 0.8, 0.3);
                print3d(s_scene.origin + (0, 0, -5), "<unknown string>" + var_97e88c04cc05cbbd, (0.8, 0, 0.8), 0.8, 0.3);
                foreach (ent in a_ents) {
                    if (!isdefined(ent)) {
                        continue;
                    }
                    var_214d924f4e137244 = ent.var_214d924f4e137244;
                    str_anim = undefined;
                    if (isdefined(var_214d924f4e137244)) {
                        str_anim = var_214d924f4e137244.var_77c99123aefe423b;
                    }
                    if (isdefined(ent.var_7c6c008ca46286b0)) {
                        str_name = ent.var_7c6c008ca46286b0.animname;
                    } else {
                        str_name = ent.animname;
                    }
                    if (isdefined(str_anim) && isdefined(str_name)) {
                        str_type = ent function_e61fb9c68ca391c0();
                        var_fef94c1af0da7262 = "<unknown string>";
                        str_extra_info = "<unknown string>";
                        var_b8016ad28a74c8ba = function_53c4c53197386572(getanimlength(str_anim), 0);
                        if (isplayer(ent)) {
                            player_rig = function_53c4c53197386572(level.player_rig, ent.var_7c6c008ca46286b0);
                            if (isdefined(player_rig)) {
                                var_8f5cd7d0a9d1ed15 = function_53c4c53197386572(player_rig getanimtime(str_anim), 0);
                                var_a7ffb7e10e570a37 = var_8f5cd7d0a9d1ed15 * var_b8016ad28a74c8ba;
                            } else {
                                continue;
                            }
                        } else if (ent namespace_dbbb37eb352edf96::isvehicle() || isai(ent) || utility::issp()) {
                            if (isagent(ent) && isdefined(ent.var_b65a7211c663d3ed)) {
                                var_8f5cd7d0a9d1ed15 = ent aigetanimtime("<unknown string>", ent.var_b65a7211c663d3ed);
                            } else {
                                var_8f5cd7d0a9d1ed15 = function_53c4c53197386572(ent getanimtime(str_anim), 0);
                            }
                            var_a7ffb7e10e570a37 = var_8f5cd7d0a9d1ed15 * var_b8016ad28a74c8ba;
                        } else {
                            var_8f5cd7d0a9d1ed15 = 0;
                            var_a7ffb7e10e570a37 = 0;
                        }
                        var_335e78b3a74cad37 = var_b8016ad28a74c8ba * 30;
                        var_2e13d0ea5f29252f = int(var_8f5cd7d0a9d1ed15 * var_335e78b3a74cad37);
                        str_extra_info = "<unknown string>" + var_a7ffb7e10e570a37 + "<unknown string>" + var_b8016ad28a74c8ba + "<unknown string>" + var_2e13d0ea5f29252f + "<unknown string>" + var_335e78b3a74cad37 + "<unknown string>";
                        var_3fbeadb96e8ca187 = getanimname(str_anim);
                        if (function_73e183e02834309d(var_3fbeadb96e8ca187)) {
                            var_3fbeadb96e8ca187 = function_3c8848a3a11b2553(var_3fbeadb96e8ca187);
                        }
                        if (function_8581f011ce975a6(str_anim)) {
                            var_fef94c1af0da7262 = "<unknown string>" + var_3fbeadb96e8ca187;
                        } else {
                            var_fef94c1af0da7262 = "<unknown string>" + var_3fbeadb96e8ca187;
                        }
                        var_b6e6ba17ec8331f4 = ent.origin - (0, 0, 15);
                        print3d(var_b6e6ba17ec8331f4, "<unknown string>" + ent getentitynumber() + str_type + "<unknown string>" + (isdefined(str_name) ? "<unknown string>" + ent getentitynumber() : str_name), (0.8, 0.8, 0), 0.8, 0.3);
                        print3d(var_b6e6ba17ec8331f4 - (0, 0, 5), var_fef94c1af0da7262, (0.8, 0.8, 0), 0.8, 0.3);
                        print3d(var_b6e6ba17ec8331f4 - (0, 0, 11), str_extra_info, (0.8, 0.8, 0), 0.8, 0.3);
                        ent render_tag("<unknown string>");
                        ent render_tag("<unknown string>");
                        ent render_tag("<unknown string>");
                        ent render_tag("<unknown string>");
                        ent render_tag("<unknown string>");
                        ent render_tag("<unknown string>");
                        ent render_tag("<unknown string>");
                        ent render_tag("<unknown string>", "<unknown string>");
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x10c1
// Size: 0x8d
function private render_tag(str_tag, str_label, b_recorder_only) {
    /#
        str_label = function_53c4c53197386572(str_label, str_tag);
        v_centroid = self getcentroid();
        v_tag_org = self gettagorigin(str_tag, 1);
        if (isdefined(v_tag_org)) {
            v_tag_ang = self gettagangles(str_tag);
            anim_origin_render(v_tag_org, v_tag_ang, 2, str_label);
            line(v_centroid, v_tag_org, (0.3, 0.3, 0.3), 1.25, 1);
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1155
// Size: 0xea
function private anim_origin_render(org, angles, line_length, str_label) {
    /#
        if (isdefined(org) && isdefined(angles)) {
            line_length = function_53c4c53197386572(line_length, 6);
            originendpoint = org + anglestoforward(angles) * line_length;
            originrightpoint = org + anglestoright(angles) * -1 * line_length;
            originuppoint = org + anglestoup(angles) * line_length;
            line(org, originendpoint, (1, 0, 0));
            line(org, originrightpoint, (0, 1, 0));
            line(org, originuppoint, (0, 0, 1));
            if (isdefined(str_label)) {
                print3d(org, str_label, (1, 0.5, 1), 2.5, 0.05);
            }
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1246
// Size: 0x76
function private function_e61fb9c68ca391c0() {
    /#
        str_text = "<unknown string>";
        if (isactor(self) || isagent(self)) {
            str_text = "<unknown string>";
        } else if (isplayer(self)) {
            str_text = "<unknown string>";
        } else if (isdefined(self.vehiclename)) {
            str_text = "<unknown string>";
        } else {
            str_text = "<unknown string>" + self.classname + "<unknown string>";
        }
        return str_text;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12c3
// Size: 0xc2e
function display_scene_menu(var_8e2d937d4bb36011) {
    /#
        str_type = "<unknown string>";
        level notify("<unknown string>");
        level endon("<unknown string>");
        waittillframeend();
        names = [];
        b_shot_menu = 0;
        s_scene = undefined;
        if (isstring(var_8e2d937d4bb36011)) {
            s_scene = function_58e23a3be918ec3f(var_8e2d937d4bb36011);
            names = array_combine(names, s_scene function_8a37fe423de2b9db());
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            str_title = var_8e2d937d4bb36011 + "<unknown string>";
            b_shot_menu = 1;
            selected = function_53c4c53197386572(level.scene_menu_shot_index, 0);
        } else {
            if (flag("<unknown string>")) {
                println("<unknown string>" + str_type + "<unknown string>");
            }
            var_4ba13583548f921e = 1;
            foreach (s_scene in level.var_a0b4eb1703be349a) {
                str_scenedef = s_scene.var_8ac77218f7a34e3e;
                s_scenedef = getscriptbundle("<unknown string>" + str_scenedef);
                var_642a2c2acddcda83 = isdefined(s_scene.var_39852edf15442735) ? str_scenedef + "<unknown string>" + s_scene.var_39852edf15442735 : str_scenedef;
                if (flag("<unknown string>")) {
                    if (s_scene get_state() == "<unknown string>") {
                        names[names.size] = var_642a2c2acddcda83;
                        println("<unknown string>" + str_type + "<unknown string>" + var_4ba13583548f921e + "<unknown string>" + str_scenedef);
                        var_4ba13583548f921e++;
                    }
                } else {
                    names[names.size] = var_642a2c2acddcda83;
                }
            }
            if (flag("<unknown string>")) {
                println("<unknown string>" + str_type + "<unknown string>");
            }
            names = utility::alphabetize(names);
            foreach (str_scene_name in names) {
                var_5afff4c88013f6bd = getsubstr(str_scene_name, 0, 4);
                if (var_5afff4c88013f6bd == "<unknown string>") {
                    names = array_remove(names, str_scene_name);
                    names = array_insert(names, str_scene_name, 0);
                }
            }
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names = array_insert(names, "<unknown string>", 0);
            names = array_insert(names, "<unknown string>", 0);
            str_title = str_type + "<unknown string>";
            selected = function_53c4c53197386572(level.scene_menu_index, 0);
        }
        if (selected > names.size - 1) {
            selected = 0;
        }
        up_pressed = 0;
        down_pressed = 0;
        held = 0;
        var_f98bd61d8515551 = gettime();
        while (flag("<unknown string>")) {
            if (!isdefined(level.scene.debug_player)) {
                level.scene.debug_player = level.players[0];
                waitframe();
                continue;
            }
            if (b_shot_menu) {
                if (isdefined(level.last_scene_state) && isdefined(level.last_scene_state[var_8e2d937d4bb36011])) {
                    str_title = var_8e2d937d4bb36011 + "<unknown string>" + level.last_scene_state[var_8e2d937d4bb36011] + "<unknown string>";
                }
            }
            scene_list_settext(names, selected, str_title, b_shot_menu, 1);
            currenttime = gettime();
            var_46113f7d64b32239 = 10;
            if (currenttime < var_f98bd61d8515551) {
                var_46113f7d64b32239 = 0;
            }
            if (!up_pressed) {
                if (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
                    up_pressed = 1;
                    selected--;
                    while (!isdefined(names[selected]) || names[selected] == "<unknown string>") {
                        selected--;
                        if (selected < 0) {
                            selected = names.size - 1;
                        } else if (selected >= names.size) {
                            selected = 0;
                        }
                    }
                }
            } else if (level.scene.debug_player function_ed160eec4d1b0619("<unknown string>") || level.scene.debug_player function_ed160eec4d1b0619("<unknown string>")) {
                held = 1;
                selected = selected - var_46113f7d64b32239;
            } else if (!level.scene.debug_player buttonpressed("<unknown string>") && !level.scene.debug_player buttonpressed("<unknown string>")) {
                held = 0;
                up_pressed = 0;
            }
            if (!down_pressed) {
                if (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
                    down_pressed = 1;
                    selected++;
                    while (!isdefined(names[selected]) || names[selected] == "<unknown string>") {
                        selected++;
                        if (selected < 0) {
                            selected = names.size - 1;
                        } else if (selected >= names.size) {
                            selected = 0;
                        }
                    }
                }
            } else if (level.scene.debug_player function_ed160eec4d1b0619("<unknown string>") || level.scene.debug_player function_ed160eec4d1b0619("<unknown string>")) {
                held = 1;
                selected = selected + var_46113f7d64b32239;
            } else if (!level.scene.debug_player buttonpressed("<unknown string>") && !level.scene.debug_player buttonpressed("<unknown string>")) {
                held = 0;
                down_pressed = 0;
            }
            if (held) {
                if (selected < 0) {
                    selected = 0;
                } else if (selected >= names.size) {
                    selected = names.size - 1;
                }
            } else if (selected < 0) {
                selected = names.size - 1;
            } else if (selected >= names.size) {
                selected = 0;
            }
            if (held && var_46113f7d64b32239 == 10) {
                var_f98bd61d8515551 = gettime() + 500;
            }
            if (names[selected] != "<unknown string>" && names[selected] != "<unknown string>" && !b_shot_menu) {
                s_scene = function_58e23a3be918ec3f(names[selected]);
            }
            if (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
                if (b_shot_menu) {
                    while (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
                        waitframe();
                    }
                    level.scene_menu_shot_index = selected;
                    level thread display_scene_menu();
                } else {
                    level.scene_menu_index = selected;
                    var_6a0645b23db85dcf = "<unknown string>" + function_f28fd66285fa2c9(@"hash_559926a6436db818") + "<unknown string>";
                    adddebugcommand(var_6a0645b23db85dcf);
                    return;
                }
            }
            if (names[selected] != "<unknown string>" && names[selected] != "<unknown string>" && !b_shot_menu && isdefined(s_scene)) {
                if (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
                    level.scene.debug_player setorigin(s_scene.origin);
                    while (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
                        waitframe();
                    }
                } else if (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
                    level.scene.debug_player setorigin(s_scene.origin);
                    while (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
                        waitframe();
                    }
                }
            }
            if (b_shot_menu && (function_90157e16d9b18a9d() || function_6a0b118cb67914b8()) && isdefined(var_8e2d937d4bb36011) && array_contains(s_scene function_8a37fe423de2b9db(), names[selected])) {
                if (function_90157e16d9b18a9d()) {
                    a_str_shot_names = s_scene function_8a37fe423de2b9db();
                    var_4af252be7b7e9615 = [];
                    var_b10f292029388b03 = 0;
                    foreach (str_shot_name in a_str_shot_names) {
                        if (str_shot_name != names[selected] && !var_b10f292029388b03) {
                            continue;
                        }
                        var_b10f292029388b03 = 1;
                        var_4af252be7b7e9615[var_4af252be7b7e9615.size] = str_shot_name;
                    }
                    s_scene thread play(undefined, var_4af252be7b7e9615);
                } else if (function_6a0b118cb67914b8()) {
                    s_scene thread init(undefined, names[selected]);
                }
                while (function_6a0b118cb67914b8() || function_90157e16d9b18a9d()) {
                    waitframe();
                }
            } else if (function_e4ca8661daaa7f0e() && isdefined(names[selected])) {
                if (!b_shot_menu && names[selected] == "<unknown string>") {
                    if (flag("<unknown string>")) {
                        flag_clear("<unknown string>");
                    } else {
                        flag_set("<unknown string>");
                    }
                    while (function_e4ca8661daaa7f0e()) {
                        waitframe();
                    }
                    level thread display_scene_menu();
                } else if (!b_shot_menu) {
                    if (names[selected] == "<unknown string>") {
                        var_6a0645b23db85dcf = "<unknown string>" + function_f28fd66285fa2c9(@"hash_559926a6436db818") + "<unknown string>";
                        adddebugcommand(var_6a0645b23db85dcf);
                        return;
                    }
                } else if (b_shot_menu) {
                    if (istrue(s_scene.var_cb890cd9a86235d2)) {
                        s_scene.origin = getdvarvector(@"hash_373ad6363da1c230");
                        s_scene.angles = getdvarvector(@"hash_eab41865eb0e96ea");
                    }
                    if (names[selected] == "<unknown string>") {
                        level.scene_menu_shot_index = selected;
                        while (function_e4ca8661daaa7f0e()) {
                            waitframe();
                        }
                        level thread display_scene_menu();
                    } else if (names[selected] == "<unknown string>") {
                        s_scene thread stop();
                    } else if (names[selected] == "<unknown string>") {
                        s_scene thread cleanup(1);
                    } else if (names[selected] == "<unknown string>") {
                        s_scene thread init();
                    } else if (names[selected] == "<unknown string>") {
                        s_scene thread play();
                    } else if (names[selected] != "<unknown string>") {
                        s_scene thread play(undefined, names[selected]);
                    }
                }
                while (function_e4ca8661daaa7f0e() || function_90157e16d9b18a9d()) {
                    waitframe();
                }
                if (!b_shot_menu && names[selected] != "<unknown string>") {
                    level.scene_menu_index = selected;
                    level thread display_scene_menu(names[selected]);
                }
            }
            waitframe();
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1ef8
// Size: 0xd7
function private function_58e23a3be918ec3f(var_8e2d937d4bb36011) {
    /#
        var_80831c1ace77d57b = strtok(var_8e2d937d4bb36011, "<unknown string>");
        var_8e2d937d4bb36011 = var_80831c1ace77d57b[0];
        var_39852edf15442735 = var_80831c1ace77d57b[1];
        if (isdefined(var_39852edf15442735)) {
            var_39852edf15442735 = int(var_39852edf15442735);
        }
        s_scene = level.var_a0b4eb1703be349a[0];
        foreach (s_scene in level.var_a0b4eb1703be349a) {
            if (is_equal(var_8e2d937d4bb36011, s_scene.var_8ac77218f7a34e3e) && (!isdefined(var_39852edf15442735) || is_equal(var_39852edf15442735, s_scene.var_39852edf15442735))) {
                break;
            }
        }
        return s_scene;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1fd6
// Size: 0x123
function private scene_menu(params) {
    /#
        if (!flag("<unknown string>")) {
            flag_set("<unknown string>");
            level.scene.debug_player val::set("<unknown string>", "<unknown string>", 0);
            level.scene.debug_player val::set("<unknown string>", "<unknown string>", 0);
            level.scene.debug_player val::set("<unknown string>", "<unknown string>", 0);
            level thread display_scene_menu();
        } else {
            flag_clear("<unknown string>");
            level.scene.debug_player val::reset("<unknown string>", "<unknown string>");
            level.scene.debug_player val::reset("<unknown string>", "<unknown string>");
            level.scene.debug_player val::reset("<unknown string>", "<unknown string>");
            function_b7d145bff0acb42();
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x2100
// Size: 0x4a
function private scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_9a294debc8b593a8) {
    /#
        if (!flag("<unknown string>")) {
            thread _scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_9a294debc8b593a8);
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x2151
// Size: 0x364
function private _scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_9a294debc8b593a8) {
    /#
        if (!isdefined(var_9a294debc8b593a8)) {
            var_9a294debc8b593a8 = 1;
        }
        for (i = 0; i < var_9a294debc8b593a8; i++) {
            printtoscreen2d(150, 310, str_title, (1, 1, 1), 2.5);
            str_mode = "<unknown string>";
            switch (str_mode) {
            case #"hash_7038dec66d8275be":
                printtoscreen2d(150, 325, "<unknown string>", (1, 1, 1), 2.5);
                break;
            case #"hash_7da50739ef480ecb":
                break;
            case #"hash_8d4787dcb1802e22":
                break;
            case #"hash_d48d5b579a6c7c3":
                break;
            }
            for (i = 0; i < 16; i++) {
                index = i + n_selected - 5;
                if (isdefined(strings[index])) {
                    text = strings[index];
                } else {
                    text = "<unknown string>";
                }
                str_scene = text;
                if (isdefined(level.last_scene_state) && isdefined(level.last_scene_state[text])) {
                    text = text + "<unknown string>" + level.last_scene_state[text] + "<unknown string>";
                }
                if (i == 5) {
                    text = "<unknown string>" + text + "<unknown string>";
                    str_color = (0.8, 0.4, 0);
                } else if (str_scene != "<unknown string>") {
                    str_color = (0, 1, 0);
                } else {
                    str_color = (1, 1, 1);
                }
                printtoscreen2d(136, 400 + i * 30, text, str_color, 2.5);
            }
            if (b_shot_menu && !getdvarint(@"hash_303a3f39ecf974db", 0)) {
                if (!isdefined(level.scene.var_49da744408f4f28b)) {
                    level.scene.var_49da744408f4f28b = newhudelem();
                }
                level.scene.var_49da744408f4f28b.alignx = "<unknown string>";
                level.scene.var_49da744408f4f28b.x = 50;
                level.scene.var_49da744408f4f28b.y = 250;
                level.scene.var_49da744408f4f28b.fontscale = 1;
                level.scene.var_49da744408f4f28b.color = (1, 1, 1);
                var_86a3f727eee2600c = "<unknown string>";
                if (level.scene.debug_player usinggamepad()) {
                    var_86a3f727eee2600c = "<unknown string>";
                } else {
                    var_86a3f727eee2600c = "<unknown string>";
                }
                level.scene.var_49da744408f4f28b setdevtext(var_86a3f727eee2600c);
            } else {
                function_b7d145bff0acb42();
                printtoscreen2d(150, 410 + 480, "<unknown string>", (1, 1, 1), 2.5);
            }
            waitframe();
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x24bc
// Size: 0x36
function private function_b7d145bff0acb42() {
    /#
        if (isdefined(level.scene.var_49da744408f4f28b)) {
            level.scene.var_49da744408f4f28b destroy();
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x24f9
// Size: 0x6d
function private function_e4ca8661daaa7f0e() {
    /#
        if (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
            return 1;
        }
        return 0;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x256d
// Size: 0x4c
function private function_90157e16d9b18a9d() {
    /#
        if (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
            return 1;
        }
        return 0;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x25c0
// Size: 0x4c
function private function_6a0b118cb67914b8() {
    /#
        if (level.scene.debug_player buttonpressed("<unknown string>") || level.scene.debug_player buttonpressed("<unknown string>")) {
            return 1;
        }
        return 0;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2613
// Size: 0x2f
function private function_ed160eec4d1b0619(str_button) {
    /#
        if (getdvarint(@"hash_66d7268f08facc81", 0)) {
            return 0;
        }
        return self._holding_button[str_button];
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2649
// Size: 0xc9
function private function_5759a29120b54c79(str_button) {
    /#
        self endon("<unknown string>");
        self._holding_button = function_53c4c53197386572(self._holding_button, []);
        self._holding_button[str_button] = 0;
        time_started = 0;
        while (1) {
            if (!isdefined(self)) {
                return;
            }
            use_time = 250;
            if (self._holding_button[str_button]) {
                if (!self buttonpressed(str_button)) {
                    self._holding_button[str_button] = 0;
                }
            } else if (self buttonpressed(str_button)) {
                if (time_started == 0) {
                    time_started = gettime();
                }
                if (gettime() - time_started > use_time) {
                    self._holding_button[str_button] = 1;
                }
            } else if (time_started != 0) {
                time_started = 0;
            }
            waitframe();
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2719
// Size: 0x3a4
function function_c623b8e6e4b0a90(tag, size, duration, var_8d603f339dd0fd6a) {
    /#
        self endon("<unknown string>");
        self notify("<unknown string>" + tag);
        self endon("<unknown string>" + tag);
        starttime = gettime();
        if (!isdefined(level.var_545cde3d65ac0cc)) {
            level.var_545cde3d65ac0cc = [];
            level.var_545cde3d65ac0cc[level.var_545cde3d65ac0cc.size] = (1, 0, 0);
            level.var_545cde3d65ac0cc[level.var_545cde3d65ac0cc.size] = (0, 1, 0);
            level.var_545cde3d65ac0cc[level.var_545cde3d65ac0cc.size] = (0, 0, 1);
            level.var_545cde3d65ac0cc[level.var_545cde3d65ac0cc.size] = (1, 1, 0);
            level.var_545cde3d65ac0cc[level.var_545cde3d65ac0cc.size] = (0, 1, 1);
            level.var_545cde3d65ac0cc[level.var_545cde3d65ac0cc.size] = (1, 0, 1);
            level.var_efc719d27ab26877 = -1;
        }
        color = (1, 1, 1);
        var_8e12dbf68a65bfc9 = 0;
        if (!isdefined(var_8d603f339dd0fd6a)) {
            level.var_efc719d27ab26877 = (level.var_efc719d27ab26877 + 1) % level.var_545cde3d65ac0cc.size;
            color = level.var_545cde3d65ac0cc[level.var_efc719d27ab26877];
        } else {
            var_8e12dbf68a65bfc9 = var_8d603f339dd0fd6a * 1000;
        }
        start = gettime();
        while (1) {
            waitframe();
            origin = self.origin;
            angles = self.angles;
            if (var_8e12dbf68a65bfc9 > 0) {
                color = vectorlerp((0, 0, 0), (1, 1, 1), min(1, float(gettime() - start) / float(var_8e12dbf68a65bfc9)));
            }
            if (tag != "<unknown string>") {
                origin = self gettagorigin(tag, 0, 1, 0);
                angles = self gettagangles(tag, 0, 1, 0);
                print3d(origin + (0, 0, 1), tag, (1, 1, 1), 1, 0.15, 1, 1);
            } else if (isplayer(self)) {
                origin = self geteye();
                angles = self getplayerangles();
            } else {
                print3d(origin + (0, 0, 1), "<unknown string>", (1, 1, 1), 1, 0.15, 1, 1);
            }
            line(origin, origin + anglestoforward(angles) * size, color, 1, 0, duration);
            line(origin, origin + anglestoright(angles) * size, color * 0.75, 1, 0, duration);
            line(origin, origin + anglestoup(angles) * size, (1, 1, 1), 1, 0, duration);
            print3d(origin + (0, 0, 5), "<unknown string>" + self getentitynumber(), (1, 1, 1), 1, 0.25, 1, 1);
            print3d(origin + (0, 0, 10), "<unknown string>" + gettime() - starttime, (1, 1, 1), 1, 0.25, 1, 1);
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac4
// Size: 0xcf
function function_ce4b6d4d859ede39(var_214d924f4e137244, event, origin, angles) {
    /#
        if (!getdvarint(@"hash_143b0dff4afbd1d3", 0)) {
            return;
        }
        filter = getdvar(@"hash_71fb5222b333d146", "<unknown string>");
        if (filter != "<unknown string>" && !issubstr(tolower(filter), tolower(var_214d924f4e137244.var_9be58c68789faf5c function_aeb2b46911a5811d())) && !issubstr(tolower(var_214d924f4e137244.var_9be58c68789faf5c function_aeb2b46911a5811d()), tolower(filter)) && !issubstr(tolower(event), tolower(filter))) {
            return;
        }
        level thread function_baa34fb5707b7466(var_214d924f4e137244, event, origin, angles);
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2b9a
// Size: 0x651
function function_baa34fb5707b7466(var_214d924f4e137244, event, origin, angles) {
    /#
        /#
            assert(isdefined(var_214d924f4e137244));
        #/
        /#
            assert(isdefined(event));
        #/
        /#
            assert(isdefined(origin));
        #/
        /#
            assert(isdefined(angles));
        #/
        level notify("<unknown string>");
        level endon("<unknown string>");
        if (!isdefined(level.var_fb96551e5ea54b9)) {
            level.var_fb96551e5ea54b9 = [];
        }
        var_5d4692b1dc45738b = squared(5);
        duration = getdvarint(@"hash_143b0dff4afbd1d3", 0);
        scale = 0.25;
        step = 4;
        var_e9b46f9c997ad6f6 = undefined;
        foreach (eventlist in level.var_fb96551e5ea54b9) {
            if (distancesquared(eventlist.origin, origin) < var_5d4692b1dc45738b) {
                var_e9b46f9c997ad6f6 = eventlist;
                break;
            }
        }
        if (!isdefined(var_e9b46f9c997ad6f6)) {
            var_e9b46f9c997ad6f6 = spawnstruct();
            var_e9b46f9c997ad6f6.origin = origin;
            var_e9b46f9c997ad6f6.angles = angles;
            var_e9b46f9c997ad6f6.events = [];
            var_e9b46f9c997ad6f6.offset = (0, 0, 0);
            level.var_fb96551e5ea54b9[level.var_fb96551e5ea54b9.size] = var_e9b46f9c997ad6f6;
        }
        var_3f0a60a7b5e225fe = spawnstruct();
        var_3f0a60a7b5e225fe.objectname = var_214d924f4e137244.var_9be58c68789faf5c.var_cf0d4d8cc5ac99a4.name;
        var_3f0a60a7b5e225fe.var_77c99123aefe423b = var_214d924f4e137244.var_77c99123aefe423b;
        var_3f0a60a7b5e225fe.var_e25d1d189177a7c = var_214d924f4e137244.var_5aaf7c7163c04623.var_8ac77218f7a34e3e;
        var_3f0a60a7b5e225fe.event = event;
        var_3f0a60a7b5e225fe.origin = origin;
        var_3f0a60a7b5e225fe.angles = angles;
        var_3f0a60a7b5e225fe.time = gettime();
        var_e9b46f9c997ad6f6.events[var_e9b46f9c997ad6f6.events.size] = var_3f0a60a7b5e225fe;
        waitframe();
        foreach (eventlist in level.var_fb96551e5ea54b9) {
            var_c1338331e6e49a6d = undefined;
            var_1b36f968431506c3 = undefined;
            var_516341dd1409b1b3 = undefined;
            var_d220e1a6be73557a = undefined;
            offset = (0, 0, 0);
            for (i = 0; i < eventlist.events.size; i++) {
                event = eventlist.events[i];
                if (!isdefined(var_c1338331e6e49a6d) || var_c1338331e6e49a6d != event.origin || var_1b36f968431506c3 != event.angles) {
                    var_c1338331e6e49a6d = event.origin;
                    var_1b36f968431506c3 = event.angles;
                    axis = anglestoaxis(event.angles);
                    line(event.origin, event.origin + axis["<unknown string>"] * 10, (1, 0, 0), 1, 0, duration);
                    line(event.origin, event.origin + axis["<unknown string>"] * 10, (0, 1, 0), 1, 0, duration);
                    line(event.origin, event.origin + axis["<unknown string>"] * 10, (0, 0, 1), 1, 0, duration);
                }
                if (!isdefined(var_516341dd1409b1b3) || var_516341dd1409b1b3 != event.var_e25d1d189177a7c) {
                    var_516341dd1409b1b3 = event.var_e25d1d189177a7c;
                    print3d(eventlist.origin + offset, var_516341dd1409b1b3, (1, 1, 0), 1, scale, duration);
                    offset = offset + (0, 0, step);
                }
                if (!isdefined(var_d220e1a6be73557a) || var_d220e1a6be73557a != event.objectname) {
                    var_d220e1a6be73557a = event.objectname;
                    offset = offset + (0, 0, step * 0.5);
                    print3d(eventlist.origin + offset, var_d220e1a6be73557a, (0, 1, 1), 1, scale, duration);
                    offset = offset + (0, 0, step);
                }
                print3d(eventlist.origin + offset, event.event + "<unknown string>" + event.time + "<unknown string>", (1, 1, 1), 1, scale, duration);
                offset = offset + (0, 0, step);
                print3d(eventlist.origin + offset, "<unknown string>" + int(event.origin[0]) + "<unknown string>" + int(event.origin[1]) + "<unknown string>" + int(event.origin[2]), (1, 1, 1), 1, scale, duration);
                offset = offset + (0, 0, step);
                var_77c99123aefe423b = "<unknown string>";
                objectname = "<unknown string>";
                if (isdefined(event.var_77c99123aefe423b)) {
                    var_77c99123aefe423b = event.var_77c99123aefe423b;
                }
                if (isdefined(event.objectname)) {
                    objectname = event.objectname;
                }
                println("<unknown string>" + event.time + "<unknown string>" + event.event + "<unknown string>" + objectname);
            }
        }
        level.var_fb96551e5ea54b9 = undefined;
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31f2
// Size: 0xc4
function function_eeff9ce6b23bb906() {
    /#
        var_568f62a24b19c46d = self;
        var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
        var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
        foreach (var_56f4af8746a2d458, var_19a1a40cf0ff83b9 in var_568f62a24b19c46d.var_7038c2a13f1f5db8) {
            var_214d924f4e137244 = var_84b542bb7490bea7.var_214d924f4e137244[var_56f4af8746a2d458];
            if (isplayer(var_214d924f4e137244.entity)) {
                return var_214d924f4e137244.entity;
            }
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32bd
// Size: 0x38e
function function_d4cfde3fa9af7e5a(var_698da5af57b757e7) {
    /#
        var_568f62a24b19c46d = self;
        if (getdvarint(@"hash_f98fc73c88850645", 0)) {
            var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
            var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
            player = var_568f62a24b19c46d function_eeff9ce6b23bb906();
            if (!isdefined(player)) {
                return;
            }
            var_568f62a24b19c46d function_6b2bc344ea55f120();
            player.var_43996b501c46de7f[0] = newhudelem();
            player.var_43996b501c46de7f[1] = newhudelem();
            str_scene_name = function_53c4c53197386572(var_5aaf7c7163c04623.var_8ac77218f7a34e3e, "<unknown string>");
            str_shot_name = function_53c4c53197386572(var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle.shots[var_698da5af57b757e7].var_cf0d4d8cc5ac99a4.name, "<unknown string>");
            player.var_43996b501c46de7f[0].alignx = "<unknown string>";
            player.var_43996b501c46de7f[0].aligny = "<unknown string>";
            player.var_43996b501c46de7f[0].vertalign = "<unknown string>";
            player.var_43996b501c46de7f[0].horzalign = "<unknown string>";
            player.var_43996b501c46de7f[0].font = "<unknown string>";
            player.var_43996b501c46de7f[0].x = -20;
            player.var_43996b501c46de7f[0].y = -90;
            player.var_43996b501c46de7f[0].fontscale = 1;
            player.var_43996b501c46de7f[0].color = (0.6, 0.6, 0.6);
            player.var_43996b501c46de7f[1].alignx = "<unknown string>";
            player.var_43996b501c46de7f[1].aligny = "<unknown string>";
            player.var_43996b501c46de7f[1].vertalign = "<unknown string>";
            player.var_43996b501c46de7f[1].horzalign = "<unknown string>";
            player.var_43996b501c46de7f[1].font = "<unknown string>";
            player.var_43996b501c46de7f[1].x = -20;
            player.var_43996b501c46de7f[1].y = -70;
            player.var_43996b501c46de7f[1].fontscale = 1;
            player.var_43996b501c46de7f[1].color = (0.6, 0.6, 0.6);
            player.var_43996b501c46de7f[0] setdevtext("<unknown string>" + str_scene_name);
            if (isdefined(var_5aaf7c7163c04623.var_2f23edb971f368a6)) {
                var_1986da7fd17829a2 = "<unknown string>" + str_shot_name + "<unknown string>" + var_5aaf7c7163c04623.var_2f23edb971f368a6;
            } else {
                var_1986da7fd17829a2 = "<unknown string>" + str_shot_name;
            }
            player.var_43996b501c46de7f[1] setdevtext(var_1986da7fd17829a2);
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3652
// Size: 0xf4
function function_6b2bc344ea55f120() {
    /#
        var_568f62a24b19c46d = self;
        if (getdvarint(@"hash_f98fc73c88850645", 0)) {
            var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
            var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
            player = var_568f62a24b19c46d function_eeff9ce6b23bb906();
            if (!isdefined(player)) {
                return;
            }
            if (isarray(player.var_43996b501c46de7f)) {
                foreach (var_cd8195c935c24ccc in player.var_43996b501c46de7f) {
                    if (isdefined(var_cd8195c935c24ccc)) {
                        var_cd8195c935c24ccc destroy();
                    }
                }
                player.var_43996b501c46de7f = array_removeundefined(player.var_43996b501c46de7f);
            }
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x374d
// Size: 0x2d1
function function_ffae6ec92028ce08(var_51d2f645ad8afdaf, duration, cameras) {
    /#
        if (!isdefined(duration)) {
            duration = 5;
        }
        var_568f62a24b19c46d = self;
        player = undefined;
        if (getdvarint(@"hash_f98fc73c88850645", 0)) {
            var_5aaf7c7163c04623 = var_568f62a24b19c46d.var_5aaf7c7163c04623;
            var_84b542bb7490bea7 = var_5aaf7c7163c04623.var_84b542bb7490bea7;
            player = var_568f62a24b19c46d function_eeff9ce6b23bb906();
            if (!isdefined(player)) {
                return;
            }
            player function_7fb7bdf37cd47759();
            y = -35;
            player.var_7c8fce4c59afb3ae = [];
            str_scene_name = function_53c4c53197386572(var_5aaf7c7163c04623.var_8ac77218f7a34e3e, "<unknown string>");
            foreach (var_109ebf347b2f2ece, var_698da5af57b757e7 in var_51d2f645ad8afdaf) {
                hudelem = newhudelem();
                str_shot_name = function_53c4c53197386572(var_5aaf7c7163c04623.var_84b542bb7490bea7.scenescriptbundle.shots[var_698da5af57b757e7].var_cf0d4d8cc5ac99a4.name, "<unknown string>");
                hudelem.alignx = "<unknown string>";
                hudelem.aligny = "<unknown string>";
                hudelem.vertalign = "<unknown string>";
                hudelem.horzalign = "<unknown string>";
                hudelem.font = "<unknown string>";
                hudelem.x = -25;
                hudelem.y = y;
                hudelem.fontscale = 1;
                hudelem.color = (0, 0.6, 0);
                var_ccb2752573dddb31 = "<unknown string>";
                if (isdefined(cameras) && isdefined(cameras[var_109ebf347b2f2ece])) {
                    camerapos = cameras[var_109ebf347b2f2ece];
                    var_ccb2752573dddb31 = "<unknown string>" + int(camerapos[0]) + "<unknown string>" + int(camerapos[1]) + "<unknown string>" + int(camerapos[2]) + "<unknown string>";
                }
                hudelem setdevtext(var_ccb2752573dddb31 + "<unknown string>" + str_scene_name + "<unknown string>" + str_shot_name);
                y = y - 20;
                player.var_7c8fce4c59afb3ae[player.var_7c8fce4c59afb3ae.size] = hudelem;
            }
        }
        if (duration >= 0 && isdefined(player)) {
            player function_f9a207358d70923c(duration, "<unknown string>", &function_7fb7bdf37cd47759);
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a25
// Size: 0x88
function function_7fb7bdf37cd47759() {
    /#
        self notify("<unknown string>");
        if (!isdefined(self)) {
            return;
        }
        if (isarray(self.var_7c8fce4c59afb3ae)) {
            foreach (var_cd8195c935c24ccc in self.var_7c8fce4c59afb3ae) {
                if (isdefined(var_cd8195c935c24ccc)) {
                    var_cd8195c935c24ccc destroy();
                }
            }
            self.var_7c8fce4c59afb3ae = undefined;
        }
    #/
}

// Namespace scene/namespace_6068faad90cf91ee
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ab4
// Size: 0x7b
function function_2fbba7f29e8d78ce(var_56f4af8746a2d458, var_36ca2785f01c660c) {
    /#
        var_fdc8fd88a88422e5 = getdvarint(@"hash_3bc9bc279e3f772", 0);
        if (isdefined(var_36ca2785f01c660c)) {
            if (var_fdc8fd88a88422e5 && utility::is_equal(var_36ca2785f01c660c, level.players[0])) {
                if (var_fdc8fd88a88422e5 - 1 == var_56f4af8746a2d458) {
                    return 1;
                } else {
                    return 0;
                }
            }
        } else if (var_fdc8fd88a88422e5) {
            if (var_fdc8fd88a88422e5 - 1 == var_56f4af8746a2d458) {
                return 1;
            } else {
                return 0;
            }
        }
        return 0;
    #/
}

