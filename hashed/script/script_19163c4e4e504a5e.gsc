#using scripts\engine\utility.gsc;
#using script_6bf6c8e2e1fdccaa;
#using script_53f4e6352b0b2425;

#namespace namespace_52923e00c20bfd5f;

/#

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0xbc
    // Size: 0xe3
    function function_8c3a8f58cbd39dca(posx, posy, text, color, alpha, scale, duration) {
        if (isdefined(text) == 0 || text == "<dev string:x1c>") {
            return;
        }
        color = default_to(color, (1, 1, 1));
        alpha = default_to(alpha, 1);
        scale = default_to(scale, 1);
        duration = default_to(duration, 1);
        if (function_ea27c1335507c840(level.snd.callbacks["<dev string:x1d>"])) {
            [[ level.snd.callbacks["<dev string:x1d>"] ]](posx, posy, text, color, alpha, scale, duration);
            return;
        }
        printtoscreen2d(posx, posy, text, color, scale);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a7
    // Size: 0xcd
    function function_d4355e5f7ead5aff(text, scale) {
        assert(isdefined(text));
        if (isdefined(scale) == 0) {
            scale = 1;
        }
        var_4abd463c3a5d6022 = function_d8bcdde57d13f7fc();
        var_b835ae2157a354ac = var_4abd463c3a5d6022[0];
        var_67a206c222c5563b = var_4abd463c3a5d6022[1];
        textlength = text.size;
        textwidth = textlength * 8 * scale;
        centerx = var_b835ae2157a354ac * 0.5 - textwidth * 0.5;
        centery = var_67a206c222c5563b * 0.5 - 8;
        center = [centerx, centery];
        return center;
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x27c
    // Size: 0x6d
    function function_9e5b1c32235027a1(text, scale) {
        centerpos = function_d4355e5f7ead5aff(text, scale);
        var_c73310f7c3115ea0 = centerpos[0];
        var_c73311f7c31160d3 = centerpos[1];
        var_c73311f7c31160d3 = var_c73311f7c31160d3 * 0.5 + 8;
        defaultpos = [var_c73310f7c3115ea0, var_c73311f7c31160d3];
        return defaultpos;
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 7, eflags: 0x4
    // Checksum 0x0, Offset: 0x2f1
    // Size: 0x335
    function private function_b443cb2ef9d9f62e(posx, posy, text, color, scale, var_c09e956d9fbc81a6, var_efb4633080df25f2) {
        var_70cca5628b078414 = 16 * scale;
        frametime = function_e448203aedcadcf8();
        var_d591b3c0c160fe0c = int(var_c09e956d9fbc81a6 / frametime);
        framecount = 0;
        var_9c498628589f3217 = int(var_efb4633080df25f2 / frametime);
        var_1a6b830aa7112a1b = 1;
        var_ecca01fff1922a5c = 0;
        if (istrue(level.snd.var_ab52ccadc04df539)) {
            var_1a6b830aa7112a1b = 2;
        }
        assertex(isstruct(level.snd), "<dev string:x29>");
        if (isarray(level.snd.var_efef27a9405ace5e) == 0) {
            level.snd.var_efef27a9405ace5e = [];
        }
        assert(isarray(level.snd.var_efef27a9405ace5e));
        if (level.snd.var_efef27a9405ace5e.size > 0) {
            foreach (row in level.snd.var_efef27a9405ace5e) {
                if (array_contains(level.snd.var_efef27a9405ace5e, posy)) {
                    posy += var_70cca5628b078414;
                    continue;
                }
                break;
            }
        }
        level.snd.var_efef27a9405ace5e[level.snd.var_efef27a9405ace5e.size] = posy;
        while (framecount < var_d591b3c0c160fe0c) {
            if (framecount < var_9c498628589f3217) {
                var_b817b40b3548dbde = int(float(framecount) / float(var_1a6b830aa7112a1b));
                var_b817b40b3548dbde %= 2;
                if (var_b817b40b3548dbde) {
                    framecount += 1;
                    waitframe();
                    continue;
                }
            }
            framefrac = float(framecount) / float(var_d591b3c0c160fe0c);
            framefrac = clamp(framefrac, 0, 1);
            alpha = namespace_53c50dd747d66443::function_e6ef280f5472a1d2(1 - framefrac, "<dev string:x42>");
            var_3fb9d6859e6d3a47 = alpha * alpha;
            colorscale = function_1f9e5d44e92014a5(color, alpha);
            function_136df9498dfe620e(text, posx, posy, scale, "<dev string:x4a>", colorscale, alpha, (0, 0, 0), var_3fb9d6859e6d3a47, (1, 1, 1), var_3fb9d6859e6d3a47, 1);
            framecount += 1;
            waitframe();
        }
        if (isarray(level.snd.var_efef27a9405ace5e)) {
            level.snd.var_efef27a9405ace5e = array_remove(level.snd.var_efef27a9405ace5e, posy);
        }
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x62e
    // Size: 0xe2
    function function_265429989bce8de3(text, posx, posy, color, scale, var_c09e956d9fbc81a6, var_efb4633080df25f2) {
        assert(isdefined(text));
        color = default_to(color, (1, 0.5, 0.5));
        scale = default_to(scale, 1.75);
        var_c09e956d9fbc81a6 = default_to(var_c09e956d9fbc81a6, 4);
        var_efb4633080df25f2 = default_to(var_efb4633080df25f2, 1);
        if (isdefined(posx) == 0 || isdefined(posy) == 0) {
            defaultpos = function_9e5b1c32235027a1(text, scale);
            if (isdefined(posx) == 0) {
                posx = defaultpos[0];
            }
            if (isdefined(posy) == 0) {
                posy = defaultpos[1];
            }
        }
        level thread function_b443cb2ef9d9f62e(posx, posy, text, color, scale, var_c09e956d9fbc81a6, var_efb4633080df25f2);
        println(text);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x718
    // Size: 0x62
    function function_946a9bcdca68c4b0(var_77b899748c172731) {
        assertex(isstruct(level.snd), "<dev string:x29>");
        if (isdefined(var_77b899748c172731) && var_77b899748c172731 != 0) {
            level.snd.var_e5679e17677f3e17 = 1;
            return;
        }
        level.snd.var_e5679e17677f3e17 = undefined;
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x782
    // Size: 0x4c
    function function_8c3fad58cbda089b(origin, text, color, alpha, scale, duration, centered) {
        print3d(origin, text, color, alpha, scale, duration, centered);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x7d6
    // Size: 0x4d
    function function_978f0bcacd3604af(origin, text, color, alpha, scale, duration, right) {
        print3d(origin, text, color, alpha, scale, duration, 1);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 12, eflags: 0x0
    // Checksum 0x0, Offset: 0x82b
    // Size: 0x274
    function function_136df9498dfe620e(text, x, y, scale, var_8c2efb8562e518db, color, alpha, shadowcolor, var_387279bba749a4fb, lightcolor, var_101c12d7d21fcaed, duration) {
        color = default_to(color, (1, 1, 1));
        alpha = default_to(alpha, 1);
        scale = default_to(scale, 1);
        var_8c2efb8562e518db = default_to(var_8c2efb8562e518db, "<dev string:x4c>");
        duration = default_to(duration, 1);
        offset = (0, 0, 0);
        width = 8 * scale * text.size;
        switch (var_8c2efb8562e518db) {
        case 0:
        case #"hash_311044bc01bd8beb":
        case #"hash_c9b3133a17a3b2d0":
        default: 
            break;
        case 1:
        case #"hash_311041bc01bd8732":
        case #"hash_5a33ecbc44e76355":
        case #"hash_bf1a695c21e57fe4": 
            offset += (width * -0.5, 0, 0);
            break;
        case 2:
        case #"hash_311052bc01bda1f5":
        case #"hash_96815ce4f2a3dbc5": 
            offset += (width * -1, 0, 0);
            break;
        }
        lightcolor = undefined;
        if (isdefined(shadowcolor)) {
            var_45b1e0436485721a = 1;
            if (!isdefined(var_387279bba749a4fb)) {
                var_387279bba749a4fb = alpha * 0.7333;
            }
            position = (x + 1.333 * scale, y + 1.333 * scale, 0) + offset;
            function_8c3a8f58cbd39dca(position[0], position[1], text, shadowcolor, var_387279bba749a4fb, scale, duration);
        }
        if (isdefined(lightcolor)) {
            if (!isdefined(var_101c12d7d21fcaed)) {
                var_101c12d7d21fcaed = alpha * 0.7333;
            }
            position = (x + -0.666 * scale, y + -0.666 * scale, 0) + offset;
            function_8c3a8f58cbd39dca(position[0], position[1], text, lightcolor, var_101c12d7d21fcaed, scale, duration);
        }
        position = (x, y, 0) + offset;
        function_8c3a8f58cbd39dca(position[0], position[1], text, color, alpha, scale, duration);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 11, eflags: 0x0
    // Checksum 0x0, Offset: 0xaa7
    // Size: 0x453
    function function_5e035a2095a884bf(text, origin, scale, var_8c2efb8562e518db, color, alpha, shadowcolor, var_387279bba749a4fb, lightcolor, var_101c12d7d21fcaed, duration) {
        color = default_to(color, (1, 1, 1));
        alpha = default_to(alpha, 1);
        scale = default_to(scale, 1);
        var_8c2efb8562e518db = default_to(var_8c2efb8562e518db, "<dev string:x4c>");
        duration = int(default_to(duration, 1));
        var_2b63954b2c1a3970 = scale < 0;
        scale = abs(scale);
        textsize = text.size;
        if (issubstr(text, "<dev string:x6b>")) {
            lines = strtok(text, "<dev string:x6b>");
            if (isarray(lines) && lines.size > 1) {
                longest = 0;
                foreach (line in lines) {
                    if (line.size > longest) {
                        longest = line.size;
                    }
                }
                textsize = longest;
            }
        }
        var_f05f199059948076 = (1, 0, 0);
        var_f50980e23cfa0751 = (0, 0, 1);
        players = function_db2dac8138d9a79e();
        if (isarray(players) && isdefined(players[0])) {
            player = players[0];
            vieworigin = player function_97f58d285dd23025();
            viewangles = player function_d8b4c23126bf4d7b();
            var_f05f199059948076 = anglestoright(viewangles);
            var_f50980e23cfa0751 = anglestoup(viewangles);
            if (var_2b63954b2c1a3970) {
                dist = distance(origin, vieworigin);
                var_abeed90f073feea9 = dist * 0.00133333;
                scale *= var_abeed90f073feea9;
            }
        }
        width = 8 * scale * textsize;
        offset = (0, 0, 2 * scale * -1);
        var_f41bec4cc5aa6ac4 = var_f05f199059948076 * offset[0];
        var_a12ec15333a89503 = var_f50980e23cfa0751 * offset[2];
        centered = 0;
        switch (var_8c2efb8562e518db) {
        case 0:
        case #"hash_311044bc01bd8beb":
        case #"hash_c9b3133a17a3b2d0":
        default: 
            break;
        case 1:
        case #"hash_311041bc01bd8732":
        case #"hash_5a33ecbc44e76355":
        case #"hash_bf1a695c21e57fe4": 
            centered = 1;
            break;
        case 2:
        case #"hash_311052bc01bda1f5":
        case #"hash_96815ce4f2a3dbc5": 
            offset += (width * -1, 0, 0);
            break;
        }
        shadowcolor = undefined;
        lightcolor = undefined;
        if (isdefined(shadowcolor)) {
            if (!isdefined(var_387279bba749a4fb)) {
                var_387279bba749a4fb = alpha * 0.72974;
            }
            var_45b1e0436485721a = var_f05f199059948076 * 1.333 * scale + var_f50980e23cfa0751 * -1.333 * scale;
            position = origin + var_f05f199059948076 * offset[0] + var_f50980e23cfa0751 * offset[2];
            position += var_45b1e0436485721a;
            print3d(position, text, shadowcolor, var_387279bba749a4fb, scale, duration, centered);
        }
        if (isdefined(lightcolor)) {
            if (!isdefined(var_101c12d7d21fcaed)) {
                var_101c12d7d21fcaed = alpha * 0.72974;
            }
            var_ae30af512d099638 = var_f05f199059948076 * -0.666 * scale + var_f50980e23cfa0751 * 0.666 * scale;
            position = origin + var_f05f199059948076 * offset[0] + var_f50980e23cfa0751 * offset[2];
            position += var_ae30af512d099638;
            print3d(position, text, lightcolor, var_101c12d7d21fcaed, scale, duration, centered);
        }
        position = origin + var_f05f199059948076 * offset[0] + var_f50980e23cfa0751 * offset[2];
        print3d(position, text, color, alpha, scale, duration, centered);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0xf02
    // Size: 0xef
    function private function_fc51b1db9f1aa696(color, depthtest, var_48cb69f953af4855, offset) {
        if (var_48cb69f953af4855.size < 2) {
            return;
        }
        linecount = var_48cb69f953af4855.size - 1;
        alpha = 1;
        var_d7e388a619f35e5 = 1 / linecount;
        colorscale = color;
        while (linecount > 0) {
            var_606a39ec86caba12 = var_48cb69f953af4855[linecount];
            var_cc3a9c77e552c717 = var_48cb69f953af4855[linecount - 1];
            if (isvector(var_606a39ec86caba12) && isvector(var_cc3a9c77e552c717) && var_606a39ec86caba12 != var_cc3a9c77e552c717) {
                if (isvector(offset)) {
                    var_606a39ec86caba12 += offset;
                    var_cc3a9c77e552c717 += offset;
                }
                line(var_606a39ec86caba12, var_cc3a9c77e552c717, colorscale, alpha, depthtest, 1);
            }
            colorscale = vectorscale(color, alpha * 1.5);
            alpha -= var_d7e388a619f35e5;
            linecount--;
        }
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0xff9
    // Size: 0x117
    function private function_e58246b402adf0b1(color, depthtest, duration, offset) {
        assert(isdefined(self.origin), "<dev string:x6d>");
        assert(isvector(color), "<dev string:x8f>");
        assert(isdefined(duration), "<dev string:xaa>");
        framecount = 0;
        var_48cb69f953af4855 = [];
        var_48cb69f953af4855[0] = self.origin;
        self endon("<dev string:xc8>");
        while (var_48cb69f953af4855.size > 0) {
            var_7b8c6389c2a19ab1 = [];
            if (framecount >= duration) {
                for (i = 1; i < var_48cb69f953af4855.size; i++) {
                    var_7b8c6389c2a19ab1[i - 1] = var_48cb69f953af4855[i];
                }
            } else {
                var_7b8c6389c2a19ab1 = var_48cb69f953af4855;
            }
            if (isdefined(self) && isdefined(self.origin) && function_5b8457b9d8edb521(self) == 0) {
                var_7b8c6389c2a19ab1[var_7b8c6389c2a19ab1.size] = self.origin;
            }
            var_48cb69f953af4855 = var_7b8c6389c2a19ab1;
            function_fc51b1db9f1aa696(color, depthtest, var_48cb69f953af4855, offset);
            framecount++;
            waitframe();
        }
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x1118
    // Size: 0xc3
    function function_15c2c9757e8c8e38(var_9de171c233b0cc60, color, depthtest, duration, offset) {
        color = default_to(color, (1, 1, 1));
        depthtest = default_to(depthtest, 0);
        duration = default_to(duration, 5);
        if (function_110d3ab280057f5b(!isdefined(var_9de171c233b0cc60), "<dev string:xda>")) {
            return;
        }
        if (istrue(level.snd.var_ab52ccadc04df539)) {
            duration = int(60 * duration);
        } else {
            duration = int(20 * duration);
        }
        assert(duration > 2, "<dev string:xff>");
        var_9de171c233b0cc60 thread function_e58246b402adf0b1(color, depthtest, duration, offset);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x11e3
    // Size: 0x248
    function function_35b7df275c1ba312(origin, angles, extents, color, alpha, depthtest, duration) {
        half = extents * 0.5;
        var_aa02a8caf5581cd0 = (half, half, half);
        mins = origin - var_aa02a8caf5581cd0;
        maxs = origin + var_aa02a8caf5581cd0;
        var_52059c030c147851[0] = (maxs[0], maxs[1], maxs[2]);
        var_52059c030c147851[1] = (maxs[0], maxs[1], mins[2]);
        var_52059c030c147851[2] = (mins[0], maxs[1], mins[2]);
        var_52059c030c147851[3] = (mins[0], maxs[1], maxs[2]);
        var_520599030c1471b8[0] = (maxs[0], mins[1], maxs[2]);
        var_520599030c1471b8[1] = (maxs[0], mins[1], mins[2]);
        var_520599030c1471b8[2] = (mins[0], mins[1], mins[2]);
        var_520599030c1471b8[3] = (mins[0], mins[1], maxs[2]);
        if (angles != (0, 0, 0)) {
            var_52059c030c147851[0] = origin + rotatevector(origin - var_52059c030c147851[0], angles);
            var_52059c030c147851[1] = origin + rotatevector(origin - var_52059c030c147851[1], angles);
            var_52059c030c147851[2] = origin + rotatevector(origin - var_52059c030c147851[2], angles);
            var_52059c030c147851[3] = origin + rotatevector(origin - var_52059c030c147851[3], angles);
            var_520599030c1471b8[0] = origin + rotatevector(origin - var_520599030c1471b8[0], angles);
            var_520599030c1471b8[1] = origin + rotatevector(origin - var_520599030c1471b8[1], angles);
            var_520599030c1471b8[2] = origin + rotatevector(origin - var_520599030c1471b8[2], angles);
            var_520599030c1471b8[3] = origin + rotatevector(origin - var_520599030c1471b8[3], angles);
        }
        for (i = 0; i < 4; i++) {
            j = i + 1;
            if (j == 4) {
                j = 0;
            }
            line(var_52059c030c147851[i], var_52059c030c147851[j], color, alpha, depthtest, duration);
            line(var_520599030c1471b8[i], var_520599030c1471b8[j], color, alpha, depthtest, duration);
            line(var_52059c030c147851[i], var_520599030c1471b8[i], color, alpha, depthtest, duration);
        }
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x1433
    // Size: 0x4d
    function function_30e01b23ce52fbec(origin, angles, var_332f7bac7240929e, color, alpha, depthtest, duration) {
        function_35b7df275c1ba312(origin, angles, var_332f7bac7240929e, color, alpha, depthtest, duration);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 7, eflags: 0x0
    // Checksum 0x0, Offset: 0x1488
    // Size: 0x1fd
    function function_4650937e025ac500(origin, size, angles, color, alpha, depthtest, duration) {
        forward = (1, 0, 0);
        right = (0, 1, 0);
        up = (0, 0, 1);
        size = default_to(size, 16);
        angles = default_to(angles, (0, 0, 0));
        color = default_to(color, (1, 1, 1));
        alpha = default_to(alpha, 1);
        depthtest = default_to(depthtest, 0);
        duration = default_to(duration, 1);
        if (angles != (0, 0, 0)) {
            forward = anglestoforward(angles);
            right = anglestoright(angles) * -1;
            up = anglestoup(angles);
        }
        half = size * 0.5;
        forward *= half;
        right *= half;
        up *= half;
        var_a7588e0db9b1de4a = 0.333;
        var_a7589b0db9b1fae1 = (var_a7588e0db9b1de4a, var_a7588e0db9b1de4a, var_a7588e0db9b1de4a);
        var_6cafb824b496de85 = color * var_a7589b0db9b1fae1 + (1, 0, 0);
        var_6cafc324b496f6b6 = color * var_a7589b0db9b1fae1 + (0, 1, 0);
        colb = color * var_a7589b0db9b1fae1 + (0, 0, 1);
        line(origin - forward, origin + forward, var_6cafb824b496de85, alpha, depthtest, duration);
        line(origin - right, origin + right, var_6cafc324b496f6b6, alpha, depthtest, duration);
        line(origin - up, origin + up, colb, alpha, depthtest, duration);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 8, eflags: 0x0
    // Checksum 0x0, Offset: 0x168d
    // Size: 0x229
    function function_7ee6a5b47e28ca9d(origin, angles, length, var_6c4d477832b37636, color, alpha, depthtest, duration) {
        assert(isvector(origin));
        assert(isvector(angles));
        length = default_to(length, 12);
        var_6c4d477832b37636 = default_to(var_6c4d477832b37636, 4);
        color = default_to(color, (1, 1, 1));
        alpha = default_to(alpha, 1);
        depthtest = default_to(depthtest, 0);
        duration = int(default_to(duration, 1));
        arrow_forward = anglestoforward(angles);
        arrowhead_forward = arrow_forward;
        arrowhead_right = anglestoright(angles);
        var_c4573fc4dc2c85d4 = anglestoup(angles);
        var_5fbcc7d59dd6adc1 = var_c4573fc4dc2c85d4;
        arrow_forward = vectorscale(arrow_forward, length);
        arrowhead_forward = vectorscale(arrowhead_forward, length - var_6c4d477832b37636);
        arrowhead_right = vectorscale(arrowhead_right, var_6c4d477832b37636);
        var_c4573fc4dc2c85d4 = vectorscale(var_c4573fc4dc2c85d4, var_6c4d477832b37636);
        var_5fbcc7d59dd6adc1 = vectorscale(var_5fbcc7d59dd6adc1, -1 * var_6c4d477832b37636);
        o = origin;
        a = o + arrow_forward;
        b = o + arrowhead_forward - arrowhead_right;
        c = o + arrowhead_forward + arrowhead_right;
        d = o + arrowhead_forward + var_c4573fc4dc2c85d4;
        e = o + arrowhead_forward + var_5fbcc7d59dd6adc1;
        line(o, a, color, alpha, depthtest, duration);
        line(a, b, color, alpha, depthtest, duration);
        line(b, c, color, alpha, depthtest, duration);
        line(c, a, color, alpha, depthtest, duration);
        line(a, d, color, alpha, depthtest, duration);
        line(d, e, color, alpha, depthtest, duration);
        line(e, a, color, alpha, depthtest, duration);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x18be
    // Size: 0x56
    function function_7fa31368e342a4f6(origin, radius, color, alpha, depthtest, duration) {
        depthtest = default_to(depthtest, 0);
        duration = default_to(duration, 1);
        sphere(origin, radius, color, depthtest, duration);
    }

#/

// Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x191c
// Size: 0x1c
function function_1589f10b96600d0f(screenheight) {
    var_c67e2413c92619a6 = 480 / screenheight;
    return var_c67e2413c92619a6;
}

// Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1941
// Size: 0x6d
function function_d6886acce6238019(var_b83b258fc6e7927c, screensize) {
    screensize = default_to(screensize, function_d8bcdde57d13f7fc());
    var_c67e2413c92619a6 = function_1589f10b96600d0f(screensize[1]);
    var_d7658fb0cc1002d6 = var_b83b258fc6e7927c[0] * var_c67e2413c92619a6;
    var_2c4f8ad1c5669e49 = var_b83b258fc6e7927c[1] * var_c67e2413c92619a6;
    return [int(var_d7658fb0cc1002d6), int(var_2c4f8ad1c5669e49)];
}

// Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19b7
// Size: 0xa2
function function_a540f05eecfe7e96(var_b83b258fc6e7927c, screensize) {
    screensize = default_to(screensize, function_d8bcdde57d13f7fc());
    var_c67e2413c92619a6 = function_1589f10b96600d0f(screensize[1]);
    var_fb11c2ca74cc1eb6 = var_b83b258fc6e7927c[0] * var_c67e2413c92619a6;
    var_fb11c3ca74cc20e9 = var_b83b258fc6e7927c[1] * var_c67e2413c92619a6;
    screenaspect = screensize[0] / screensize[1];
    var_766fc6b1f18eeeab = screenaspect * 480;
    var_ede6ddae6daaa631 = -0.5 * (var_766fc6b1f18eeeab - 640);
    var_fb11c2ca74cc1eb6 += var_ede6ddae6daaa631;
    return [var_fb11c2ca74cc1eb6, var_fb11c3ca74cc20e9];
}

// Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a62
// Size: 0x15a
function private function_55792e20398965bf() {
    if (isdefined(level.snd.var_4893b4259503b919)) {
        return;
    }
    level.snd.var_4893b4259503b919 = getthread();
    while (isdefined(level.snd.var_7c6225b8fb5193aa)) {
        now = gettime();
        var_d09fe962dd2b94c6 = [];
        foreach (hud in level.snd.var_7c6225b8fb5193aa) {
            assert(function_5b8457b9d8edb521(hud) == 0);
            if (hud.duration > 0) {
                var_d09fe962dd2b94c6[var_d09fe962dd2b94c6.size] = hud;
                if (hud.time == now) {
                    continue;
                }
                hud.duration -= 1;
                if (hud.var_bb63ba5e47e69df1 <= now) {
                    hud.alpha = 0;
                    hud settext("");
                }
                continue;
            }
            hud destroy();
        }
        level.snd.var_7c6225b8fb5193aa = var_d09fe962dd2b94c6;
        waitframe();
    }
}

// Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1bc4
// Size: 0x13a
function private function_bc5b7015df7542d1(duration) {
    hud = undefined;
    now = gettime();
    var_bb63ba5e47e69df1 = duration * 50;
    /#
        foreach (hud in level.snd.var_7c6225b8fb5193aa) {
            assert(function_5b8457b9d8edb521(hud) == 0);
            if (now >= hud.var_bb63ba5e47e69df1) {
                hud.time = now;
                hud.var_bb63ba5e47e69df1 = now + var_bb63ba5e47e69df1;
                hud.duration = duration;
                return hud;
            }
        }
        hud = newhudelem();
        hud.time = now;
        hud.var_bb63ba5e47e69df1 = now + var_bb63ba5e47e69df1;
        hud.duration = duration;
        index = level.snd.var_7c6225b8fb5193aa.size;
        level.snd.var_7c6225b8fb5193aa[index] = hud;
    #/
    return hud;
}

// Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
// Params 7, eflags: 0x4
// Checksum 0x0, Offset: 0x1d07
// Size: 0x237
function private function_b712ac81c5cb013b(posx, posy, text, color, alpha, scale, duration) {
    var_9dc0190a0b3db5e1 = 640;
    var_2f78b902f77d8a30 = 480;
    var_4445d2b30afaabdb = var_9dc0190a0b3db5e1 / var_2f78b902f77d8a30;
    var_4abd463c3a5d6022 = function_d8bcdde57d13f7fc();
    var_b835ae2157a354ac = var_4abd463c3a5d6022[0];
    var_67a206c222c5563b = var_4abd463c3a5d6022[1];
    var_2d6e500898a10090 = var_b835ae2157a354ac / var_67a206c222c5563b;
    widthoffset = -0.5 * (var_2f78b902f77d8a30 * var_2d6e500898a10090 - var_9dc0190a0b3db5e1);
    var_fb11c2ca74cc1eb6 = posx / var_b835ae2157a354ac * var_9dc0190a0b3db5e1 + (1 - posx / var_b835ae2157a354ac * 0.5) * widthoffset;
    var_fb11c3ca74cc20e9 = posy / var_67a206c222c5563b * var_2f78b902f77d8a30;
    assertex(isstruct(level.snd), "snd was not initialized.");
    if (isdefined(level.snd.var_7c6225b8fb5193aa) == 0) {
        level.snd.var_7c6225b8fb5193aa = [];
    }
    level thread function_55792e20398965bf();
    hud = function_bc5b7015df7542d1(duration);
    hud.x = var_fb11c2ca74cc1eb6;
    hud.y = var_fb11c3ca74cc20e9;
    hud settext(text);
    hud.color = color;
    hud.alpha = alpha;
    hud.fontscale = scale * 0.5;
    hud.font = "smallfixed";
    hud.alignx = "left";
    hud.aligny = "bottom";
    hud.var_406fd34934f7e3d2 = "fullscreen";
    hud.vertalign = "fullscreen";
    hud.xoffset = 0;
    hud.yoffset = 0;
    hud.xpadding = 0;
    hud.ypadding = 0;
}

/#

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f46
    // Size: 0x2c
    function private function_7c3d0b968c966668(num) {
        if (num <= 9 && num >= 0) {
            return ("<dev string:x121>" + num);
        }
        return "<dev string:x1c>" + num;
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0x1f7a
    // Size: 0x1bb
    function private function_9aaed43357848f20(framecount, fps, var_4e6d89fb533555bb) {
        assert(isdefined(framecount));
        if (isdefined(fps) == 0) {
            fps = 20;
        }
        if (isdefined(var_4e6d89fb533555bb) == 0) {
            var_4e6d89fb533555bb = 0;
        }
        totalseconds = int(framecount / fps);
        var_545970488603b0da = int(totalseconds / 60);
        var_31368b6dac8dc908 = int(var_545970488603b0da / 60);
        var_41c91eb0c52ca3be = int(var_31368b6dac8dc908 / 24);
        frames = framecount % fps;
        var_9b51060e1a10fcbb = frames / fps * 100;
        seconds = totalseconds % 60;
        minutes = var_545970488603b0da % 60;
        hours = var_31368b6dac8dc908 % 60;
        days = var_41c91eb0c52ca3be % 99;
        var_fa9c2cd5285cc106 = function_7c3d0b968c966668(frames);
        var_5a6ff3568f35765e = function_7c3d0b968c966668(var_9b51060e1a10fcbb);
        var_5053ffa57cf6704f = function_7c3d0b968c966668(seconds);
        var_d3d355ba89284103 = function_7c3d0b968c966668(minutes);
        var_895ec68524c1ce21 = function_7c3d0b968c966668(hours);
        var_51e3b024a89347f = function_7c3d0b968c966668(days);
        var_85143a456ffcf2a0 = var_51e3b024a89347f + "<dev string:x123>" + var_895ec68524c1ce21 + "<dev string:x123>" + var_d3d355ba89284103 + "<dev string:x123>" + var_5053ffa57cf6704f;
        if (var_4e6d89fb533555bb == 1) {
            var_85143a456ffcf2a0 += "<dev string:x125>" + var_5a6ff3568f35765e;
        } else {
            var_85143a456ffcf2a0 += "<dev string:x123>" + var_fa9c2cd5285cc106;
        }
        return var_85143a456ffcf2a0;
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0x213d
    // Size: 0x6d
    function private function_9313eda58ed29e3e(var_7cf09fa8c49859b, var_287879caa47775be, fps) {
        if (isdefined(var_7cf09fa8c49859b) == 0) {
            var_7cf09fa8c49859b = 0;
        }
        assertex(var_7cf09fa8c49859b >= 0, "<dev string:x127>");
        var_b9ce494d75fa5500 = fps / 20;
        framecount = var_7cf09fa8c49859b;
        framecount += var_287879caa47775be * var_b9ce494d75fa5500;
        framecount = floor(framecount);
        framecount = int(framecount);
        return framecount;
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x21b2
    // Size: 0x3f8
    function private function_2b151de570c1d056(var_7cf09fa8c49859b) {
        assert(isdefined(level.snd.var_67c23c87f12482ad));
        if (isdefined(var_7cf09fa8c49859b) == 0) {
            var_7cf09fa8c49859b = 0;
        }
        assertex(var_7cf09fa8c49859b >= 0, "<dev string:x127>");
        var_b9ce494d75fa5500 = level.snd.var_67c23c87f12482ad.fps / 20;
        level.snd.var_67c23c87f12482ad endon("<dev string:x157>");
        level.snd.var_67c23c87f12482ad.isactive = 1;
        level.snd.var_67c23c87f12482ad.framecount = 0;
        level.snd.var_67c23c87f12482ad.var_7cf09fa8c49859b = var_7cf09fa8c49859b;
        while (isdefined(level.snd.var_67c23c87f12482ad) && level.snd.var_67c23c87f12482ad.isactive == 1) {
            posx = level.snd.var_67c23c87f12482ad.posx;
            posy = level.snd.var_67c23c87f12482ad.posy;
            alpha = 1;
            scale = level.snd.var_67c23c87f12482ad.scale;
            framecount = function_9313eda58ed29e3e(var_7cf09fa8c49859b, level.snd.var_67c23c87f12482ad.framecount, level.snd.var_67c23c87f12482ad.fps);
            var_85143a456ffcf2a0 = function_9aaed43357848f20(framecount, level.snd.var_67c23c87f12482ad.fps);
            function_8c3a8f58cbd39dca(posx, posy, var_85143a456ffcf2a0, (1, 1, 1), alpha, scale, 1);
            if (level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876.size > 0) {
                posy += scale * 12;
                function_8c3a8f58cbd39dca(posx, posy, "<dev string:x169>", (1, 1, 1), alpha, scale, 1);
                posy += scale * 12;
                foreach (mark in level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876) {
                    var_e8da9c4c976d3605 = mark[1];
                    var_66f170dfaea4c0f8 = function_9313eda58ed29e3e(var_7cf09fa8c49859b, mark[0], level.snd.var_67c23c87f12482ad.fps);
                    var_67c23c87f12482ad = function_9aaed43357848f20(var_66f170dfaea4c0f8, level.snd.var_67c23c87f12482ad.fps);
                    var_21d6a92c8da06588 = var_67c23c87f12482ad + "<dev string:x178>" + var_e8da9c4c976d3605 + "<dev string:x6b>";
                    function_8c3a8f58cbd39dca(posx, posy, var_21d6a92c8da06588, (1, 1, 1), alpha, scale, 1);
                    posy += scale * 12;
                }
            }
            level.snd.var_67c23c87f12482ad.framecount += 1;
            waitframe();
        }
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x25b2
    // Size: 0x157
    function function_b6bd12cc4f34415e() {
        if (isdefined(level.snd.var_67c23c87f12482ad) == 0) {
            return;
        }
        level.snd.var_67c23c87f12482ad notify("<dev string:x157>");
        level.snd.var_67c23c87f12482ad.isactive = 0;
        level.snd.var_67c23c87f12482ad.isvisible = 0;
        var_66f170dfaea4c0f8 = function_9313eda58ed29e3e(level.snd.var_67c23c87f12482ad.var_7cf09fa8c49859b, level.snd.var_67c23c87f12482ad.framecount, level.snd.var_67c23c87f12482ad.fps);
        var_67c23c87f12482ad = function_9aaed43357848f20(var_66f170dfaea4c0f8, level.snd.var_67c23c87f12482ad.fps);
        var_e8da9c4c976d3605 = var_67c23c87f12482ad + "<dev string:x17c>";
        println(var_e8da9c4c976d3605);
        level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876 = undefined;
        level.snd.var_67c23c87f12482ad = undefined;
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2711
    // Size: 0x150
    function function_d24a92cfbc477ca7(text) {
        if (isdefined(level.snd.var_67c23c87f12482ad) == 0) {
            function_5177fa294d4fe5cd();
        }
        var_e6d566083f4ec4ba = level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876.size;
        level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876[var_e6d566083f4ec4ba] = [level.snd.var_67c23c87f12482ad.framecount, text];
        var_66f170dfaea4c0f8 = function_9313eda58ed29e3e(level.snd.var_67c23c87f12482ad.var_7cf09fa8c49859b, level.snd.var_67c23c87f12482ad.framecount, level.snd.var_67c23c87f12482ad.fps);
        var_67c23c87f12482ad = function_9aaed43357848f20(var_66f170dfaea4c0f8, level.snd.var_67c23c87f12482ad.fps);
        var_e8da9c4c976d3605 = var_67c23c87f12482ad + "<dev string:x178>" + text;
        println(var_e8da9c4c976d3605);
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2869
    // Size: 0x92
    function function_4680808ae4ce7935() {
        if (isdefined(level.snd.var_67c23c87f12482ad) && isdefined(level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876)) {
            for (i = 0; i < level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876.size; i++) {
                level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876[i] = undefined;
            }
        }
    }

    // Namespace namespace_52923e00c20bfd5f / namespace_b5325e4326813876
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0x2903
    // Size: 0x26e
    function function_5177fa294d4fe5cd(var_ada09577e62e45ee, scale, posx, posy, var_4e6d89fb533555bb, var_7cf09fa8c49859b) {
        isvisible = 1;
        assertex(isstruct(level.snd), "<dev string:x29>");
        if (isdefined(level.snd.var_67c23c87f12482ad)) {
            function_b6bd12cc4f34415e();
        }
        assert(isdefined(level.snd.var_67c23c87f12482ad) == 0);
        level.snd.var_67c23c87f12482ad = spawnstruct();
        level.snd.var_67c23c87f12482ad.var_ddcc8fd338d07876 = [];
        if (isdefined(var_ada09577e62e45ee) == 0) {
            var_ada09577e62e45ee = 20;
        }
        if (isdefined(scale) == 0) {
            scale = 2;
        }
        scale /= 1;
        var_4abd463c3a5d6022 = function_d8bcdde57d13f7fc();
        var_b835ae2157a354ac = var_4abd463c3a5d6022[0];
        var_67a206c222c5563b = var_4abd463c3a5d6022[1];
        var_f46497512c0f2957 = 6 * 14 * scale;
        centerx = var_b835ae2157a354ac * 0.5 - var_f46497512c0f2957 * 0.5;
        centery = var_67a206c222c5563b * 0.5 - 12 * 0.5;
        if (isdefined(posx) == 0) {
            posx = centerx;
        }
        if (isdefined(posy) == 0) {
            centeroffset = 192;
            posy = centery + centeroffset;
        }
        level.snd.var_67c23c87f12482ad.posx = posx;
        level.snd.var_67c23c87f12482ad.posy = posy;
        level.snd.var_67c23c87f12482ad.scale = scale;
        level.snd.var_67c23c87f12482ad.fps = var_ada09577e62e45ee;
        level.snd.var_67c23c87f12482ad.isvisible = isvisible;
        level.snd.var_67c23c87f12482ad.var_4e6d89fb533555bb = var_4e6d89fb533555bb;
        level.snd.var_67c23c87f12482ad thread function_2b151de570c1d056(var_7cf09fa8c49859b);
    }

#/
