#using script_19163c4e4e504a5e;
#using script_53f4e6352b0b2425;
#using script_6bf6c8e2e1fdccaa;
#using scripts\common\createfx;
#using scripts\common\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace snd_debug;

/#

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa0
    // Size: 0x12e
    function function_28988b4602b0b747() {
        assertex(isstruct(level.snd), "<dev string:x1c>");
        level thread function_8ca9d22363543a7c();
        snd_dvar(@"scr_levelnotify", "<dev string:x35>", &function_b83d783133dfe70e);
        snd_dvar(@"hash_52b4c8d3c40cfc34", "<dev string:x35>", &function_6ab031022bbfafc4);
        snd_dvar(@"hash_e5b570e920b9c1fd", "<dev string:x35>", &function_81cfa2421a94112d);
        snd_dvar(@"hash_6db29b2f497ade76", "<dev string:x35>", &function_81cfa2421a94112d);
        snd_dvar(@"hash_2fa2b5d1e7614a6a", "<dev string:x35>", &function_9cf4deebf02226fa);
        snd_dvar(@"hash_571a72fc6a9a2647", "<dev string:x35>", &function_18b9b79a8d7942f7);
        snd_dvar(@"hash_fcb782f301399045", "<dev string:x36>", &function_dcc6800a8a5a0355);
        snd_dvar(@"hash_71610eca5056387", "<dev string:x36>", &function_34f703fbbeea4237);
        snd_dvar(@"hash_46eb4af73fff2413", "<dev string:x35>", &function_6629f0a213a0183);
        snd_dvar(@"hash_ba43c6fa400869e0", "<dev string:x35>", &function_9003e74ec81bae70);
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1d6
    // Size: 0x85
    function private function_610a4d42e1bd79b6(linenum) {
        var_bdb648436473d142 = level.snd.debug.hud_y;
        var_4abd463c3a5d6022 = function_d8bcdde57d13f7fc();
        var_b835ae2157a354ac = var_4abd463c3a5d6022[0];
        var_67a206c222c5563b = var_4abd463c3a5d6022[1];
        if (var_bdb648436473d142 < 0) {
            var_bdb648436473d142 = var_67a206c222c5563b + var_bdb648436473d142;
        }
        posy = var_bdb648436473d142 + 21.3333 * linenum;
        return posy;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0x263
    // Size: 0xe5
    function private function_a8195523f9312bdb(xoffset, linenum, text, color) {
        var_bdb649436473d375 = level.snd.debug.hud_x;
        var_4abd463c3a5d6022 = function_d8bcdde57d13f7fc();
        var_b835ae2157a354ac = var_4abd463c3a5d6022[0];
        var_67a206c222c5563b = var_4abd463c3a5d6022[1];
        if (isdefined(color) == 0) {
            color = (1, 1, 1);
        }
        if (var_bdb649436473d375 < 0) {
            var_bdb649436473d375 = var_b835ae2157a354ac + var_bdb649436473d375;
        }
        function_136df9498dfe620e(text, var_bdb649436473d375 + xoffset, function_610a4d42e1bd79b6(linenum), 1.33333, "<dev string:x38>", color, 0.854248, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x350
    // Size: 0x79
    function private function_63d7ef395b80d539() {
        origin = undefined;
        if (isdefined(self.origin)) {
            origin = self.origin;
        }
        if (isdefined(self.v)) {
            origin = self.v["<dev string:x3a>"];
            self.origin = origin;
            self.var_851aec1d4841216b = 1;
        }
        if (function_5b8457b9d8edb521(self)) {
            return undefined;
        }
        assert(isvector(origin));
        return origin;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3d1
    // Size: 0x79
    function private function_d6187958efa9c2c7() {
        angles = undefined;
        if (isdefined(self.angles)) {
            angles = self.angles;
        }
        if (isdefined(self.v)) {
            angles = self.v["<dev string:x41>"];
            self.angles = angles;
            self.var_842f6a714c56c49 = 1;
        }
        if (function_5b8457b9d8edb521(self)) {
            return undefined;
        }
        assert(isvector(angles));
        return angles;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x452
    // Size: 0x64
    function private function_43cba18755fc094a() {
        soundalias = "<dev string:x48>";
        if (isdefined(self.v) && isdefined(self.v["<dev string:x50>"])) {
            soundalias = self.v["<dev string:x50>"];
        } else if (isdefined(self.soundalias)) {
            soundalias = self.soundalias;
        }
        return soundalias;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 5, eflags: 0x4
    // Checksum 0x0, Offset: 0x4be
    // Size: 0x29b
    function private function_ae05558e8bda0cd0(player, playerview, playerangles, cosfov, maxdistance) {
        var_d3d4bcbfc74b9c86 = level.snd.debug.filter;
        soundalias = function_43cba18755fc094a();
        origin = undefined;
        assert(isdefined(soundalias));
        var_c4efae1c7a606f7c = 1;
        if (isdefined(var_c4efae1c7a606f7c) && var_c4efae1c7a606f7c == 0) {
            return -1;
        }
        if (isdefined(var_d3d4bcbfc74b9c86) && var_d3d4bcbfc74b9c86 != "<dev string:x35>") {
            if (issubstr(soundalias, var_d3d4bcbfc74b9c86) == 0) {
                return -1;
            }
        }
        origin = function_63d7ef395b80d539();
        if (isdefined(origin) == 0) {
            return -1;
        }
        deltapos = origin - playerview;
        normal = vectornormalize(deltapos);
        playerforward = anglestoforward(playerangles);
        dot = vectordot(playerforward, normal);
        iswithinfov = dot >= cosfov;
        var_eca64e01de79c736 = level.snd.debug.dot;
        if (isdefined(player.snd.var_417ab9c93d29bb8a) && player.snd.var_417ab9c93d29bb8a == self && isdefined(player.snd.var_4db3cec945488fb0) && player.snd.var_4db3cec945488fb0 != dot) {
            player.snd.var_4db3cec945488fb0 = dot;
            player.snd.var_417ab9c93d29bb8a = undefined;
        }
        if (dot > var_eca64e01de79c736 && (!isdefined(player.snd.var_4db3cec945488fb0) || dot > player.snd.var_4db3cec945488fb0)) {
            player.snd.var_4db3cec945488fb0 = dot;
            player.snd.var_417ab9c93d29bb8a = self;
        }
        if (iswithinfov == 0) {
            return -1;
        }
        dist_squared = distancesquared(playerview, origin);
        if (dist_squared < 2) {
            return -1;
        }
        maxdistancesquared = squared(maxdistance);
        if (maxdistancesquared > 0 && maxdistancesquared < dist_squared) {
            return -1;
        }
        return dist_squared;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x761
    // Size: 0x85
    function function_eafcfcc99aaa9b6c(array, var_61c0f41b1bed6240) {
        newarray = [];
        foreach (item in array) {
            if (function_5b8457b9d8edb521(item)) {
                continue;
            }
            if (istrue(var_61c0f41b1bed6240)) {
                newarray[i] = item;
                continue;
            }
            newarray[newarray.size] = item;
        }
        return newarray;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 7, eflags: 0x4
    // Checksum 0x0, Offset: 0x7ee
    // Size: 0x15d
    function private function_430eaebd4be461f0(var_f8b46c0726cc845a, array, player, playerview, playerangles, cosfov, maxdistance) {
        playerforward = anglestoforward(playerangles);
        playerfov = player function_bb75bae7022fb8cd();
        visible = [];
        array = function_eafcfcc99aaa9b6c(array);
        assert(isarray(var_f8b46c0726cc845a));
        if (isarray(array) && array.size > 0) {
            visible = function_789bd1ba84f550cb(array, playerview, playerforward, playerfov, maxdistance);
            var_f8b46c0726cc845a = array_combine(var_f8b46c0726cc845a, visible);
        }
        var_d3d4bcbfc74b9c86 = level.snd.debug.filter;
        if (isdefined(var_d3d4bcbfc74b9c86) && var_d3d4bcbfc74b9c86 != "<dev string:x35>") {
            foreach (ent in var_f8b46c0726cc845a) {
                soundalias = ent function_43cba18755fc094a();
                if (issubstr(soundalias, var_d3d4bcbfc74b9c86)) {
                    var_f8b46c0726cc845a = array_remove(var_f8b46c0726cc845a, ent);
                }
            }
        }
        return var_f8b46c0726cc845a;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x953
    // Size: 0x148
    function private function_ce1b5b37050ad9ac(player, var_2240d3d67a311c62) {
        maxdistance = level.snd.debug.distance_max;
        maxdistance = ter_op(maxdistance <= 0, 262144, maxdistance);
        var_f8b46c0726cc845a = [];
        assert(isdefined(player));
        assert(isdefined(var_2240d3d67a311c62));
        playerview = player function_97f58d285dd23025();
        playerangles = player function_d8b4c23126bf4d7b();
        fov = player function_bb75bae7022fb8cd();
        cosfov = cos(fov);
        if (isdefined(level.snd.createfxent) && var_2240d3d67a311c62 >= 3) {
            var_f8b46c0726cc845a = function_430eaebd4be461f0(var_f8b46c0726cc845a, level.snd.createfxent, player, playerview, playerangles, cosfov, maxdistance);
        }
        if (isdefined(level.snd) && isdefined(level.snd.objects)) {
            var_f8b46c0726cc845a = function_430eaebd4be461f0(var_f8b46c0726cc845a, level.snd.objects, player, playerview, playerangles, cosfov, maxdistance);
        }
        return var_f8b46c0726cc845a;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xaa3
    // Size: 0x263
    function private function_56e2e247a47b711e() {
        origin = function_63d7ef395b80d539();
        angles = function_d6187958efa9c2c7();
        soundalias = function_43cba18755fc094a();
        var_6f6c4242d4b349d0 = level.snd.debug.dist_radius;
        radius = var_6f6c4242d4b349d0;
        var_d4c235a7625e1bc5 = 0;
        angle = undefined;
        if (isdefined(self.angles)) {
            angles = self.angles;
        }
        if (soundalias != "<dev string:x48>") {
            angle = function_6d9cb3dc1b62081(soundalias, "<dev string:x5b>");
            dist_min = function_f0ef19ea41182a49(soundalias, "<dev string:x69>");
            if (isdefined(dist_min) && dist_min > 0) {
                radius = dist_min;
            } else {
                var_d4c235a7625e1bc5 = 1;
            }
        }
        var_d844dbf52fc5d65b = 0;
        foreach (player in function_db2dac8138d9a79e()) {
            playerview = player function_97f58d285dd23025();
            var_d844dbf52fc5d65b = function_ccb738f1c790e173(playerview, origin, radius);
            if (var_d844dbf52fc5d65b == 1) {
                radius = var_6f6c4242d4b349d0;
                break;
            }
        }
        colorscale = level.snd.debug.color_scale;
        color = vectorscale((1, 1, 1), colorscale);
        line_alpha = 0.72974;
        if (isdefined(angle) && angle > 0) {
            half_radius = radius * 0.5;
            arrow_length = 2 + radius * 2 - half_radius;
            function_7ee6a5b47e28ca9d(origin, angles, arrow_length, half_radius, (1, 1, 1), line_alpha);
        }
        function_4650937e025ac500(origin, radius * 2, angles, (1, 1, 1), line_alpha);
        if (var_d844dbf52fc5d65b == 1 || var_d4c235a7625e1bc5 == 1) {
            function_30e01b23ce52fbec(origin, angles, radius, color, line_alpha, 0, 1);
            return;
        }
        sphere(origin, radius, color, 0, 1);
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0xd0e
    // Size: 0x18c
    function private function_d1bfa3fe50d2151e(player, var_f8b46c0726cc845a, var_2240d3d67a311c62) {
        if (isdefined(player.snd) && isdefined(player.snd.var_417ab9c93d29bb8a)) {
            return player.snd.var_417ab9c93d29bb8a;
        }
        var_5577659c95e9cc5d = level.snd.debug.var_ec352c3c51dc0b3a;
        fov = player function_bb75bae7022fb8cd();
        playerview = player function_97f58d285dd23025();
        playerangles = player function_d8b4c23126bf4d7b();
        playerforward = anglestoforward(playerangles);
        var_eca64e01de79c736 = level.snd.debug.dot;
        var_5e8ef38ac5ff542f = 0;
        var_a5af5c7bb917c0d8 = undefined;
        var_f7dbe86fdee0144d = function_706b5dd50f7d5c96(playerview, playerforward, var_f8b46c0726cc845a);
        if (isdefined(var_f7dbe86fdee0144d)) {
            origin = var_f7dbe86fdee0144d function_63d7ef395b80d539();
            deltapos = origin - playerview;
            normal = vectornormalize(deltapos);
            dot = vectordot(playerforward, normal);
            if (dot > var_eca64e01de79c736 && dot > var_5e8ef38ac5ff542f) {
                var_5e8ef38ac5ff542f = dot;
                var_a5af5c7bb917c0d8 = var_f7dbe86fdee0144d;
            }
        }
        return var_a5af5c7bb917c0d8;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0xea2
    // Size: 0x3e4
    function private function_2a994ef790942fac(player, var_2240d3d67a311c62) {
        var_c5c80003d40904a8 = level.snd.debug.color_3d;
        colorscale = level.snd.debug.color_scale;
        var_19ad00a4b81e54ec = function_1f9e5d44e92014a5(var_c5c80003d40904a8, colorscale * 10);
        fov = player function_bb75bae7022fb8cd();
        origin = function_63d7ef395b80d539();
        soundalias = function_43cba18755fc094a();
        radiusmin = "<dev string:x72>";
        radiusmax = "<dev string:x72>";
        assert(isdefined(player));
        playerview = player function_97f58d285dd23025();
        playerangles = player function_d8b4c23126bf4d7b();
        playerright = anglestoright(playerangles);
        if (soundalias != "<dev string:x48>") {
            dist_min = function_f0ef19ea41182a49(soundalias, "<dev string:x69>");
            dist_max = function_f0cc0bea40f1c3c7(soundalias, "<dev string:x74>");
            if (isdefined(dist_min) && dist_min > 0) {
                radiusmin = dist_min;
            }
            if (isdefined(dist_max) && dist_max > 0) {
                radiusmax = dist_max;
            }
        }
        if (isdefined(soundalias)) {
            var_120536851fd5eb6 = level.snd.debug.scale_3d;
            dist = distance(origin, playerview);
            alpha = 1;
            var_3fb9d6859e6d3a47 = alpha * alpha;
            if (isnumber(radiusmin) && radiusmin > 0 && isnumber(radiusmax) && radiusmax > 0) {
                var_ed9bf77762a97893 = 0;
                if (radiusmin == radiusmax) {
                    var_ed9bf77762a97893 = 0.001;
                }
                mapfloat(radiusmin, radiusmax + var_ed9bf77762a97893, 1, 0.5, dist);
            }
            var_abeed90f073feea9 = dist * 0.00133333;
            function_5e035a2095a884bf(soundalias, origin + (0, 0, -1.666 * var_abeed90f073feea9 * var_120536851fd5eb6 * 16), -1.666 * var_120536851fd5eb6, "<dev string:x7d>", var_19ad00a4b81e54ec, alpha, (0, 0, 0), var_3fb9d6859e6d3a47, (1, 1, 1), var_3fb9d6859e6d3a47, 1);
            detail_text = "<dev string:x35>";
            if (istrue(level.snd.var_78f5f86726c0fdb5)) {
                detail_text = "<dev string:x84>";
            }
            if (istrue(level.snd.var_ab52ccadc04df539)) {
                detail_text = "<dev string:x8b>";
            }
            detail_text += "<dev string:x92>" + function_692101820901e01a(radiusmin) + "<dev string:x9a>" + function_692101820901e01a(dist) + "<dev string:x9a>" + function_692101820901e01a(radiusmax);
            function_5e035a2095a884bf(detail_text, origin + (0, 0, -2.666 * var_abeed90f073feea9 * var_120536851fd5eb6 * 16), -1.333 * var_120536851fd5eb6, "<dev string:x7d>", var_19ad00a4b81e54ec, alpha, (0, 0, 0), var_3fb9d6859e6d3a47, (1, 1, 1), var_3fb9d6859e6d3a47, 1);
        }
        if (isdefined(radiusmax) && isnumber(radiusmax) && radiusmax > 0) {
            color = vectorscale(var_19ad00a4b81e54ec, 1);
            line_alpha = 1;
            angles = function_d6187958efa9c2c7();
            function_4650937e025ac500(origin, radiusmax * 2, angles, color, line_alpha);
            function_7fa31368e342a4f6(origin, radiusmax, vectorscale(var_19ad00a4b81e54ec, 0.72974), line_alpha, 0, 1);
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x128e
    // Size: 0x435
    function private function_5feca042f84baca8(var_2240d3d67a311c62) {
        if (var_2240d3d67a311c62 <= 1) {
            return;
        }
        players = function_db2dac8138d9a79e();
        level.snd.debug.var_6fa6e7757a7aa1da = [];
        foreach (player in players) {
            var_aa99acff75aed163 = [];
            var_aa99acff75aed163 = function_ce1b5b37050ad9ac(player, var_2240d3d67a311c62);
            level.snd.debug.var_6fa6e7757a7aa1da = array_combine_unique(level.snd.debug.var_6fa6e7757a7aa1da, var_aa99acff75aed163);
        }
        var_213bfc74dc169aa = level.snd.debug.draw_limit;
        var_ca5d0a59893b310d = 0;
        if (var_213bfc74dc169aa > 0 && level.snd.debug.var_6fa6e7757a7aa1da.size >= var_213bfc74dc169aa) {
            var_d37195110b81bff0 = [];
            foreach (player in players) {
                var_d37195110b81bff0[var_d37195110b81bff0.size] = player function_97f58d285dd23025();
            }
            var_f1b071c7011e0341 = function_50a1d9b95fbe0ba5(var_d37195110b81bff0);
            level.snd.debug.var_6fa6e7757a7aa1da = sortbydistance(level.snd.debug.var_6fa6e7757a7aa1da, var_f1b071c7011e0341);
            if (!isarray(level.snd.debug.var_6fa6e7757a7aa1da)) {
                level.snd.debug.var_6fa6e7757a7aa1da = [];
            }
            foreach (ent in level.snd.debug.var_6fa6e7757a7aa1da) {
                if (isdefined(ent.var_851aec1d4841216b)) {
                    ent.origin = undefined;
                    ent.var_851aec1d4841216b = undefined;
                }
            }
        }
        level.snd.debug.var_6fa6e7757a7aa1da = function_eafcfcc99aaa9b6c(level.snd.debug.var_6fa6e7757a7aa1da);
        foreach (var_f7dbe86fdee0144d in level.snd.debug.var_6fa6e7757a7aa1da) {
            if (var_213bfc74dc169aa > 0 && var_ca5d0a59893b310d >= var_213bfc74dc169aa) {
                function_a8195523f9312bdb(520, 2, "<dev string:x9e>" + var_213bfc74dc169aa + "<dev string:xa2>", (1, 0, 0));
                break;
            }
            var_f7dbe86fdee0144d function_56e2e247a47b711e();
            var_ca5d0a59893b310d += 1;
        }
        var_b62205459ecc325d = [];
        foreach (player in players) {
            var_21c97ab25e68095c = function_d1bfa3fe50d2151e(player, level.snd.debug.var_6fa6e7757a7aa1da, var_2240d3d67a311c62);
            if (isdefined(var_b62205459ecc325d) && isdefined(var_21c97ab25e68095c)) {
                var_21c97ab25e68095c function_2a994ef790942fac(player, var_2240d3d67a311c62);
                var_b62205459ecc325d[var_b62205459ecc325d.size] = var_21c97ab25e68095c;
                var_ca5d0a59893b310d += 1;
            }
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x16cb
    // Size: 0x474
    function private function_5438080024b6d6fe(var_2240d3d67a311c62) {
        var_d3d4bcbfc74b9c86 = level.snd.debug.filter;
        var_ee3d5e48edeea9bf = 0;
        var_5a8dd6bda55949ee = 0;
        var_fc209da4400ead40 = 0;
        var_e056c3b0a332cb78 = "<dev string:x35>";
        var_95fe98afda81a3ee = "<dev string:x35>";
        var_d42058c56906a4e4 = 0;
        if (isdefined(level.snd.createfxent)) {
            assert(isdefined(level.snd.var_e914f110583f1ecc));
            assert(isdefined(level.snd.var_636f92f3bd6945a5));
            var_ee3d5e48edeea9bf = level.snd.var_e914f110583f1ecc;
            var_5a8dd6bda55949ee = level.snd.var_636f92f3bd6945a5;
        }
        if (isdefined(level.snd) && isdefined(level.snd.objects)) {
            var_fc209da4400ead40 = level.snd.objects.size;
        }
        if (isdefined(level.snd.debug.var_6fa6e7757a7aa1da) && level.snd.debug.var_6fa6e7757a7aa1da.size > 0 && var_2240d3d67a311c62 >= 3) {
            var_e056c3b0a332cb78 += "<dev string:xae>" + level.snd.debug.var_6fa6e7757a7aa1da.size + "<dev string:xb1>";
        }
        if (isdefined(var_d3d4bcbfc74b9c86) && var_d3d4bcbfc74b9c86 != "<dev string:x35>") {
            var_95fe98afda81a3ee += "<dev string:xbb>" + var_d3d4bcbfc74b9c86 + "<dev string:xbb>";
        }
        if (isdefined(level.snd.param_ents)) {
            var_d42058c56906a4e4 = level.snd.param_ents.size;
        }
        row = -3;
        if (istrue(level.snd.var_78f5f86726c0fdb5)) {
            mapname = tolower(level.script);
            mapname = function_960946df28da50d3(mapname, 24);
            function_a8195523f9312bdb(0, row, mapname);
        }
        row = -2;
        if (istrue(level.snd.var_78f5f86726c0fdb5)) {
            start = function_80ab0bb7534149c0();
            if (!isstring(start) || start == "<dev string:x35>") {
                start = "<dev string:xbd>";
            }
            start = function_960946df28da50d3(start, 24);
            function_a8195523f9312bdb(0, row, start);
        }
        row = -1;
        if (istrue(level.snd.var_ab52ccadc04df539)) {
            player = function_db2dac8138d9a79e()[0];
            trigger = player.snd.trigger;
            trigger_name = default_to(trigger.script_ambientroom, "<dev string:xc8>");
            trigger_name = function_960946df28da50d3(trigger_name, 24);
            function_a8195523f9312bdb(0, row, trigger_name);
        }
        row = 0;
        if (istrue(level.snd.var_78f5f86726c0fdb5)) {
            function_a8195523f9312bdb(0, row, "<dev string:xd1>" + var_fc209da4400ead40);
        }
        row++;
        if (istrue(level.snd.var_ab52ccadc04df539)) {
            function_a8195523f9312bdb(0, row, "<dev string:xec>" + var_fc209da4400ead40);
            row++;
        }
        function_a8195523f9312bdb(0, row, "<dev string:x107>" + var_d42058c56906a4e4);
        row++;
        if (var_2240d3d67a311c62 >= 3) {
            var_2e2de5dd36c88fd0 = "<dev string:x35>";
            if (isdefined(level.snd.debug.var_6fa6e7757a7aa1da) && level.snd.debug.var_6fa6e7757a7aa1da.size > 0) {
                var_2e2de5dd36c88fd0 += level.snd.debug.var_6fa6e7757a7aa1da.size;
            } else {
                var_2e2de5dd36c88fd0 += "<dev string:x36>";
            }
            if (isdefined(var_d3d4bcbfc74b9c86) && var_d3d4bcbfc74b9c86 != "<dev string:x35>") {
                var_2e2de5dd36c88fd0 += "<dev string:xae>" + var_95fe98afda81a3ee + "<dev string:x122>";
            }
            function_a8195523f9312bdb(0, row, "<dev string:x124>" + var_2e2de5dd36c88fd0);
            row++;
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1b47
    // Size: 0x276
    function private function_83a48917a4ec6c1(var_2240d3d67a311c62) {
        var_3c89542a3939b78d = 0.75;
        crosshair = level.snd.debug.var_93b4e16bd6acb433;
        var_c8a006445f83e801 = level.snd.debug.var_62998715c6062af8;
        var_5577659c95e9cc5d = level.snd.debug.var_ec352c3c51dc0b3a;
        if (crosshair != 0 && isdefined(level.snd.debug.var_a05e5c07eff77b7a) == 0) {
            hud = newhudelem();
            hud.x = 320;
            hud.y = 240;
            hud.alignx = "<dev string:x7d>";
            hud.aligny = "<dev string:x13f>";
            hud.horzalign = "<dev string:x146>";
            hud.vertalign = "<dev string:x146>";
            hud.foreground = 1;
            hud.sort = 1;
            level.snd.debug.var_a05e5c07eff77b7a = hud;
        }
        if (crosshair != 0 && isdefined(level.snd.debug.var_a05e5c07eff77b7a) && "<dev string:x151>" != "<dev string:x35>") {
            level.snd.debug.var_a05e5c07eff77b7a setshader("<dev string:x151>", int(var_5577659c95e9cc5d * 2 * var_3c89542a3939b78d), int(var_5577659c95e9cc5d * 2));
            level.snd.debug.var_a05e5c07eff77b7a.alpha = var_c8a006445f83e801;
        }
        if (crosshair == 0 && isdefined(level.snd.debug.var_a05e5c07eff77b7a)) {
            level.snd.debug.var_a05e5c07eff77b7a destroy();
            level.snd.debug.var_a05e5c07eff77b7a = undefined;
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1dc5
    // Size: 0x1e0
    function private function_5d2d297a10cbd598(var_2240d3d67a311c62) {
        if (isdefined(var_2240d3d67a311c62) && var_2240d3d67a311c62 < 1) {
            return;
        }
        if (getdvar(@"createfx") != "<dev string:x157>") {
            if (isdefined(level.snd.createfxent) && level.snd.createfxent.size > 0) {
                return;
            }
        } else {
            while (isdefined(level.createfx) == 0) {
                waitframe();
            }
        }
        while (isdefined(level.createfxent) == 0) {
            waitframe();
        }
        level.snd.createfxent = [];
        level.snd.var_e914f110583f1ecc = 0;
        level.snd.var_636f92f3bd6945a5 = 0;
        foreach (ent in level.createfxent) {
            if (isdefined(ent.v["<dev string:x15a>"]) == 0) {
                continue;
            }
            if (ent.v["<dev string:x15a>"] == "<dev string:x15f>") {
                level.snd.var_e914f110583f1ecc++;
                level.snd.createfxent[level.snd.createfxent.size] = ent;
            }
            if (ent.v["<dev string:x15a>"] == "<dev string:x167>") {
                level.snd.var_636f92f3bd6945a5++;
                level.snd.createfxent[level.snd.createfxent.size] = ent;
            }
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x1fad
    // Size: 0x3bd
    function private function_131a3c370b210d2d(key, value) {
        var_a6bace7a6b848559 = isstring(key) || isdefined(key);
        var_3039e0320100978 = isdefined(value);
        if (function_110d3ab280057f5b(!var_a6bace7a6b848559, "<dev string:x178>")) {
            return;
        }
        if (function_110d3ab280057f5b(!var_3039e0320100978, "<dev string:x192>")) {
            return;
        }
        if (key == @"hash_47683a136b10d4dd") {
            level.snd.debug.debuglevel = int(value);
            if (level.snd.debug.debuglevel == 0) {
                level notify("<dev string:x1ae>");
            } else {
                level thread function_1ff086cb81ec2eaf();
            }
        } else if (key == @"hash_9c1eb53708e52e2f") {
            level.snd.debug.filter = "<dev string:x35>" + value;
        } else if (key == @"hash_8f80f3ca72788192") {
            level.snd.debug.hud_x = int(value);
        } else if (key == @"hash_8f80f4ca727883c5") {
            level.snd.debug.hud_y = int(value);
        } else if (key == @"hash_bca67414aef4061b") {
            level.snd.debug.dist_radius = int(value);
        } else if (key == @"hash_90c83c3028a58709") {
            level.snd.debug.scale_3d = float(value);
        } else if (key == @"hash_f21deb173dd93370") {
            if (isstring(value)) {
            } else if (isvector(value)) {
                level.snd.debug.color_3d = value;
            }
        } else if (key == @"hash_2a753b30a1212892") {
            level.snd.debug.color_scale = float(value);
        } else if (key == @"hash_fb5f3970d2e3bfdb") {
            level.snd.debug.var_c171dfc1fc9795d8 = int(value);
        } else if (key == @"hash_52ac4c0cc02bb1fa") {
            level.snd.debug.distance_max = int(value);
        } else if (key == @"hash_53a06c9d638ec478") {
            level.snd.debug.dot = float(value);
        } else if (key == @"hash_33175192ed572d96") {
            level.snd.debug.draw_limit = int(value);
        } else if (key == @"hash_7cb2165a98d551b") {
            level.snd.debug.var_93b4e16bd6acb433 = int(value);
        } else if (key == @"hash_abd89601b7f5878d") {
            level.snd.debug.var_62998715c6062af8 = float(value);
        } else if (key == @"hash_e307089961790a19") {
            level.snd.debug.var_ec352c3c51dc0b3a = int(value);
        }
        return value;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x2372
    // Size: 0x51
    function private function_5d4a469bda1be613() {
        if (isdefined(level.snd) && isdefined(level.snd.debug) && istrue(level.snd.debug.initialized)) {
            return 1;
        }
        return 0;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x23cb
    // Size: 0x14
    function private function_2e895b4acdf9dd6e() {
        while (function_5d4a469bda1be613() == 0) {
            waitframe();
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x23e7
    // Size: 0x24
    function private function_4b459298d3c63c76(text) {
        waitforplayers();
        waitframe();
        waittillframeend();
        adddebugcommand(text + "<dev string:x1bc>");
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0x2413
    // Size: 0x5e
    function private function_7f69c39e5bffbfc6(menu, submenu, item, text) {
        devgui_txt = "<dev string:x1bf>" + menu + "<dev string:x1cd>" + submenu + "<dev string:x1cd>" + item + "<dev string:x1cf>" + text + "<dev string:x1bc>";
        function_4b459298d3c63c76(devgui_txt);
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x2479
    // Size: 0x826
    function private function_8ca9d22363543a7c() {
        if (function_5d4a469bda1be613()) {
            return;
        }
        if ("<dev string:x151>" != "<dev string:x35>") {
            precacheshader("<dev string:x151>");
        }
        var_fb11c2ca74cc1eb6 = -320;
        var_fb11c3ca74cc20e9 = -128;
        if (istrue(level.pc)) {
            var_fb11c2ca74cc1eb6 = -320;
            var_fb11c3ca74cc20e9 = -128;
        }
        level.snd.debug = spawnstruct();
        level.snd.debug.debuglevel = getdvarint(@"hash_47683a136b10d4dd", 0);
        level.snd.debug.filter = getdvar(@"hash_9c1eb53708e52e2f", "<dev string:x35>");
        level.snd.debug.hud_x = getdvarint(@"hash_8f80f3ca72788192", var_fb11c2ca74cc1eb6);
        level.snd.debug.hud_y = getdvarint(@"hash_8f80f4ca727883c5", var_fb11c3ca74cc20e9);
        level.snd.debug.dist_radius = getdvarint(@"hash_bca67414aef4061b", 12);
        level.snd.debug.scale_3d = getdvarfloat(@"hash_90c83c3028a58709", 1);
        level.snd.debug.color_3d = getdvarvector(@"hash_f21deb173dd93370", (0.5, 1, 0.666));
        level.snd.debug.color_scale = getdvarfloat(@"hash_2a753b30a1212892", 0.72974);
        level.snd.debug.var_c171dfc1fc9795d8 = getdvarint(@"hash_fb5f3970d2e3bfdb", 5);
        level.snd.debug.distance_max = getdvarint(@"hash_52ac4c0cc02bb1fa", 0);
        level.snd.debug.dot = getdvarfloat(@"hash_53a06c9d638ec478", 0.99);
        level.snd.debug.draw_limit = getdvarint(@"hash_33175192ed572d96", 0);
        level.snd.debug.var_93b4e16bd6acb433 = getdvarint(@"hash_7cb2165a98d551b", 0);
        level.snd.debug.var_62998715c6062af8 = getdvarfloat(@"hash_abd89601b7f5878d", 0.1);
        level.snd.debug.var_ec352c3c51dc0b3a = getdvarint(@"hash_e307089961790a19", 3);
        level.snd.debug.initialized = 1;
        snd_dvar(@"hash_47683a136b10d4dd", level.snd.debug.debuglevel, &function_131a3c370b210d2d);
        snd_dvar(@"hash_9c1eb53708e52e2f", level.snd.debug.filter, &function_131a3c370b210d2d);
        snd_dvar(@"hash_8f80f3ca72788192", level.snd.debug.hud_x, &function_131a3c370b210d2d);
        snd_dvar(@"hash_8f80f4ca727883c5", level.snd.debug.hud_y, &function_131a3c370b210d2d);
        snd_dvar(@"hash_bca67414aef4061b", level.snd.debug.dist_radius, &function_131a3c370b210d2d);
        snd_dvar(@"hash_90c83c3028a58709", level.snd.debug.scale_3d, &function_131a3c370b210d2d);
        snd_dvar(@"hash_f21deb173dd93370", level.snd.debug.color_3d, &function_131a3c370b210d2d);
        snd_dvar(@"hash_2a753b30a1212892", level.snd.debug.color_scale, &function_131a3c370b210d2d);
        snd_dvar(@"hash_fb5f3970d2e3bfdb", level.snd.debug.var_c171dfc1fc9795d8, &function_131a3c370b210d2d);
        snd_dvar(@"hash_52ac4c0cc02bb1fa", level.snd.debug.distance_max, &function_131a3c370b210d2d);
        snd_dvar(@"hash_53a06c9d638ec478", level.snd.debug.dot, &function_131a3c370b210d2d);
        snd_dvar(@"hash_33175192ed572d96", level.snd.debug.draw_limit, &function_131a3c370b210d2d);
        snd_dvar(@"hash_7cb2165a98d551b", level.snd.debug.var_93b4e16bd6acb433, &function_131a3c370b210d2d);
        snd_dvar(@"hash_abd89601b7f5878d", level.snd.debug.var_62998715c6062af8, &function_131a3c370b210d2d);
        snd_dvar(@"hash_e307089961790a19", level.snd.debug.var_ec352c3c51dc0b3a, &function_131a3c370b210d2d);
        menu = "<dev string:x1d2>";
        submenu = "<dev string:x1d8>";
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x1e8>", "<dev string:x1f1>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x1fe>", "<dev string:x20a>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x220>", "<dev string:x233>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x24f>", "<dev string:x25a>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x26f>", "<dev string:x27c>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x292>", "<dev string:x2a2>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x2b4>", "<dev string:x2bc>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x2ce>", "<dev string:x2e1>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x2f8>", "<dev string:x304>");
        function_7f69c39e5bffbfc6(menu, submenu, "<dev string:x315>", "<dev string:x322>");
        function_4b459298d3c63c76("<dev string:x333>");
        function_4b459298d3c63c76("<dev string:x34f>");
        function_4b459298d3c63c76("<dev string:x371>");
        function_4b459298d3c63c76("<dev string:x39f>");
        function_4b459298d3c63c76("<dev string:x3c8>");
        function_4b459298d3c63c76("<dev string:x3f0>");
        function_4b459298d3c63c76("<dev string:x415>");
        function_4b459298d3c63c76("<dev string:x441>");
        function_4b459298d3c63c76("<dev string:x477>");
        function_4b459298d3c63c76("<dev string:x4a5>" + level.snd.debug.hud_x + "<dev string:x4c0>");
        function_4b459298d3c63c76("<dev string:x4cc>" + level.snd.debug.hud_y + "<dev string:x4e7>");
        if (level.snd.debug.debuglevel == 0) {
            level notify("<dev string:x1ae>");
            return;
        }
        level thread function_1ff086cb81ec2eaf();
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x2ca7
    // Size: 0x78
    function private function_1ff086cb81ec2eaf() {
        level notify("<dev string:x1ae>");
        level endon("<dev string:x1ae>");
        function_2e895b4acdf9dd6e();
        waitforplayers();
        while (true) {
            var_2240d3d67a311c62 = default_to(level.snd.debug.debuglevel, 0);
            if (var_2240d3d67a311c62 > 0) {
                function_5feca042f84baca8(var_2240d3d67a311c62);
                function_83a48917a4ec6c1(var_2240d3d67a311c62);
                function_5438080024b6d6fe(var_2240d3d67a311c62);
            }
            waitframe();
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x2d27
    // Size: 0x4a
    function private function_b83d783133dfe70e(key, value) {
        if (value != "<dev string:x35>" && isstring(value)) {
            function_110d3ab280057f5b(1, "<dev string:x4f3>" + value + "<dev string:x503>");
            level notify(value);
        }
        return "<dev string:x35>";
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x2d79
    // Size: 0x194
    function private function_9b1d7df2fa24c064(value) {
        level notify("<dev string:x507>");
        level endon("<dev string:x507>");
        if (isdefined(level.snd.debug.playing)) {
            snd_stop(level.snd.debug.playing);
            level.snd.debug.playing = undefined;
        }
        if (isstring(value) && value.size > 0) {
            var_9194651a5af00454 = strtok(value, "<dev string:x518>");
            var_3fe46cb10bd07785 = [];
            foreach (sndalias in var_9194651a5af00454) {
                var_3fe46cb10bd07785[var_3fe46cb10bd07785.size] = snd_play(sndalias);
            }
            level.snd.debug.playing = var_3fe46cb10bd07785;
        }
        if (isdefined(level.snd.debug.playing)) {
            snd_wait(level.snd.debug.playing);
            level.snd.debug.playing = undefined;
            setdvar(@"hash_52b4c8d3c40cfc34", "<dev string:x35>");
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x2f15
    // Size: 0x22
    function private function_6ab031022bbfafc4(key, value) {
        level thread function_9b1d7df2fa24c064(value);
        return value;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x2f3f
    // Size: 0x122
    function private function_81cfa2421a94112d(key, value) {
        if (key == @"hash_6db29b2f497ade76" || value == "<dev string:x35>") {
            foreach (player in level.players) {
                player clearsoundsubmix();
            }
            return;
        }
        if (key == @"hash_e5b570e920b9c1fd") {
            var_208c19aab59e73cd = strtok(value, "<dev string:x51c>");
            duck = var_208c19aab59e73cd[0];
            scale = float(default_to(var_208c19aab59e73cd[1], 1));
            foreach (player in level.players) {
                player setsoundsubmix(duck, scale);
            }
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x3069
    // Size: 0x8a
    function private function_9cf4deebf02226fa(key, value) {
        foreach (player in level.players) {
            player setplayermusicstate("<dev string:x35>");
            waitframe();
            player setplayermusicstate(value);
        }
        setdvar(@"hash_2fa2b5d1e7614a6a", "<dev string:x35>");
        return value;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x30fb
    // Size: 0x111
    function private function_db6951d7ac17cc55(waitframes) {
        offset = (262144, 262144, 262144);
        foreach (player in level.players) {
            playerorigin = player.origin;
            playerhealth = player.health;
            player setpriorityclienttriggeraudiozone("<dev string:x51e>", "<dev string:x526>", 0);
            while (waitframes >= 0) {
                player setorigin(playerorigin + offset);
                player dontinterpolate();
                player cancelmantle();
                waitframe();
                waitframes -= 1;
            }
            player clearpriorityclienttriggeraudiozone("<dev string:x526>");
            player setorigin(playerorigin);
            player dontinterpolate();
            player cancelmantle();
            player cleardamageindicators();
            player.health = playerhealth;
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x3214
    // Size: 0x42
    function private function_18b9b79a8d7942f7(key, value) {
        waitframes = int(value);
        if (waitframes < 1) {
            waitframes = 1;
        }
        level thread function_db6951d7ac17cc55(waitframes);
        return "<dev string:x35>";
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x325e
    // Size: 0x2f3
    function private function_e52df609e0b8d047() {
        player = self;
        player endon("<dev string:x52d>");
        player endon("<dev string:x533>");
        while (!function_5b8457b9d8edb521(player)) {
            var_4bd9f46334d973f1 = function_d8bcdde57d13f7fc();
            var_189c7feb52c8c21a = var_4bd9f46334d973f1[0] * 0.5;
            var_189c62eb52c88253 = var_4bd9f46334d973f1[1] * 0.5;
            eyeorigin = player function_97f58d285dd23025();
            eyeangles = player function_d8b4c23126bf4d7b();
            var_995faf77e9de15d3 = anglestoforward(eyeangles);
            var_8cdb475cf2c15ac4 = anglestoright(eyeangles);
            traceend = eyeorigin + var_995faf77e9de15d3 * 262144;
            trace = scripts\engine\trace::_bullet_trace(eyeorigin, traceend, 1, player, 1, 1);
            if (isdefined(trace) && isdefined(trace["<dev string:x544>"]) && trace["<dev string:x544>"] != eyeorigin) {
                pos = trace["<dev string:x544>"];
                surfacetype = trace["<dev string:x54d>"];
                dist = distance(pos, eyeorigin);
                fontscale = 1.5;
                posstring = "<dev string:x559>" + pos[0] + "<dev string:x55c>" + pos[1] + "<dev string:x55c>" + pos[2] + "<dev string:x55f>";
                hoffset = 1 * fontscale * 16;
                function_136df9498dfe620e(posstring, var_189c7feb52c8c21a, var_189c62eb52c88253 + hoffset, fontscale, "<dev string:x7d>", (1, 1, 1), 0.854248, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
                diststring = "<dev string:x35>" + dist;
                hoffset = 2 * fontscale * 16;
                function_136df9498dfe620e(diststring, var_189c7feb52c8c21a, var_189c62eb52c88253 + hoffset, fontscale, "<dev string:x7d>", (1, 1, 1), 0.854248, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
                if (isdefined(surfacetype)) {
                    var_423754e58ce7ee58 = "<dev string:x35>" + surfacetype + "<dev string:x35>";
                    hoffset = 3 * fontscale * 16;
                    function_136df9498dfe620e(var_423754e58ce7ee58, var_189c7feb52c8c21a, var_189c62eb52c88253 + hoffset, fontscale, "<dev string:x7d>", (1, 1, 1), 0.854248, (0, 0, 0), 0.72974, (1, 1, 1), 0.72974);
                }
                function_4650937e025ac500(pos, 4, (0, 0, 0), (1, 1, 1), 1, 1);
            }
            waitframe();
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x3559
    // Size: 0x8c
    function private function_dcc6800a8a5a0355(key, value) {
        intvalue = int(value);
        foreach (player in level.players) {
            if (intvalue > 0) {
                player thread function_e52df609e0b8d047();
                continue;
            }
            player notify("<dev string:x533>");
        }
        return value;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x35ed
    // Size: 0x8a6
    function private function_199d44e597149895(dist) {
        player = self;
        player notify("<dev string:x562>");
        player endon("<dev string:x562>");
        player endon("<dev string:x52d>");
        dist = default_to(dist, 2400);
        while (!function_5b8457b9d8edb521(player)) {
            playervieworg = player function_97f58d285dd23025();
            playerangles = player function_d8b4c23126bf4d7b();
            playerforward = anglestoforward(playerangles);
            playerfov = player function_bb75bae7022fb8cd();
            scale = -1 * level.snd.debug.scale_3d;
            ents = [];
            if (istrue(level.snd.var_ab52ccadc04df539)) {
                ents = scr_getentitiesinradius(0, playervieworg, dist);
            } else {
                ents = scr_getentitiesinradius(playervieworg, dist, undefined);
            }
            var_5f3da9038753aa93 = function_789bd1ba84f550cb(ents, playervieworg, playerforward, playerfov, dist);
            foreach (ent in var_5f3da9038753aa93) {
                ent_dist = distance(ent.origin, playervieworg);
                var_b509c8891a5529a3 = ent_dist * 0.00125 * 16 * level.snd.debug.scale_3d;
                row = -1;
                yy = (0, 0, 0);
                if (istrue(level.snd.var_78f5f86726c0fdb5)) {
                    if (isnumber(ent_dist)) {
                        yy = (0, 0, var_b509c8891a5529a3 * row);
                        function_5e035a2095a884bf("<dev string:x577>", ent.origin + yy, scale, "<dev string:x582>", (0.72974, 0.72974, 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                        function_5e035a2095a884bf("<dev string:x35>" + ent_dist, ent.origin + yy, scale, "<dev string:x38>", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                    }
                    if (isstring(ent.classname)) {
                        row++;
                        yy = (0, 0, var_b509c8891a5529a3 * row);
                        function_5e035a2095a884bf("<dev string:x584>", ent.origin + yy, scale, "<dev string:x582>", (0.72974, 0.72974, 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                        function_5e035a2095a884bf("<dev string:x35>" + default_to(ent.classname, "<dev string:x593>"), ent.origin + yy, scale, "<dev string:x38>", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                    }
                    if (isstring(ent.targetname)) {
                        row++;
                        yy = (0, 0, var_b509c8891a5529a3 * row);
                        function_5e035a2095a884bf("<dev string:x59f>", ent.origin + yy, scale, "<dev string:x582>", (0.72974, 0.72974, 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                        function_5e035a2095a884bf("<dev string:x35>" + default_to(ent.targetname, "<dev string:x593>"), ent.origin + yy, scale, "<dev string:x38>", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                    }
                    if (isstring(ent.script_noteworthy)) {
                        row++;
                        yy = (0, 0, var_b509c8891a5529a3 * row);
                        function_5e035a2095a884bf("<dev string:x5af>", ent.origin + yy, scale, "<dev string:x582>", (0.72974, 0.72974, 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                        function_5e035a2095a884bf("<dev string:x35>" + default_to(ent.script_noteworthy, "<dev string:x593>"), ent.origin + yy, scale, "<dev string:x38>", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                    }
                }
                row = 3;
                if (istrue(level.snd.var_ab52ccadc04df539)) {
                    if (isstring(ent.classname)) {
                        function_5e035a2095a884bf("<dev string:x5c6>", ent.origin + yy, scale, "<dev string:x582>", (0.72974, 0.72974, 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                        function_5e035a2095a884bf("<dev string:x35>" + default_to(ent.classname, "<dev string:x593>"), ent.origin + yy, scale, "<dev string:x38>", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                    }
                    if (isstring(ent.targetname)) {
                        row++;
                        yy = (0, 0, var_b509c8891a5529a3 * row);
                        function_5e035a2095a884bf("<dev string:x5d5>", ent.origin + yy, scale, "<dev string:x582>", (0.72974, 0.72974, 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                        function_5e035a2095a884bf("<dev string:x35>" + default_to(ent.targetname, "<dev string:x593>"), ent.origin + yy, scale, "<dev string:x38>", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                    }
                    if (isstring(ent.script_noteworthy)) {
                        row++;
                        yy = (0, 0, var_b509c8891a5529a3 * row);
                        function_5e035a2095a884bf("<dev string:x5e5>", ent.origin + yy, scale, "<dev string:x582>", (0.72974, 0.72974, 0.72974), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                        function_5e035a2095a884bf("<dev string:x35>" + default_to(ent.script_noteworthy, "<dev string:x593>"), ent.origin + yy, scale, "<dev string:x38>", (1, 1, 1), 1, (0, 0, 0), 0.72, (1, 1, 1), 0.72);
                    }
                }
                if (istrue(level.snd.var_78f5f86726c0fdb5)) {
                    function_4650937e025ac500(ent.origin, 12, ent.angles, (1, 1, 1), 1, 0);
                }
                if (istrue(level.snd.var_ab52ccadc04df539)) {
                    function_7ee6a5b47e28ca9d(ent.origin, ent.angles, 12, 4, (1, 0, 0), 1, 0);
                }
            }
            waitframe();
        }
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x3e9b
    // Size: 0x9d
    function private function_34f703fbbeea4237(key, value) {
        waitforplayers();
        players = function_db2dac8138d9a79e();
        intvalue = int(value);
        foreach (player in players) {
            if (intvalue > 0) {
                player thread function_199d44e597149895(intvalue);
                continue;
            }
            player notify("<dev string:x562>");
        }
        return value;
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x3f40
    // Size: 0x1c
    function private function_6629f0a213a0183(key, value) {
        return "<dev string:x35>";
    }

    // Namespace snd_debug / namespace_7814a76f54b08173
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x3f64
    // Size: 0x186
    function private function_9003e74ec81bae70(key, value) {
        level._createfx.selected_fx_ents = [];
        foreach (ent in level.createfxent) {
            if (isdefined(ent.v["<dev string:x15a>"]) == 0) {
                continue;
            }
            if (isdefined(ent.v["<dev string:x3a>"]) && string_starts_with(ent.v["<dev string:x15a>"], "<dev string:x15f>")) {
                origin = ent.v["<dev string:x3a>"];
                angles = (270, 0, 0);
                origin = (floor(origin[0]), floor(origin[1]), floor(origin[2]));
                ent.v["<dev string:x41>"] = angles;
                ent.v["<dev string:x3a>"] = origin;
                level._createfx.selected_fx_ents[level._createfx.selected_fx_ents.size] = ent;
            }
        }
        scripts\common\createfx::update_selected_entities();
        level._createfx.selected_fx_ents = [];
        return "<dev string:x35>";
    }

#/
