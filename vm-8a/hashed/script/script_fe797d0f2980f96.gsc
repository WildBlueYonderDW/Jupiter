#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3e34d236a84cfd96;
#using script_638d701d263ee1ed;

#namespace namespace_1cb5f1cc1f98b618;

/#

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x90
    // Size: 0x390
    function function_79f6b9ffeb872713() {
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2b>", "<dev string:x43>", &function_50a8580a8b718b47);
        function_b23a59dfb4ca49a1("<dev string:x62>", "<dev string:x7b>", &function_50a8580a8b718b47);
        function_a9a864379a098ad6("<dev string:x9b>", "<dev string:xab>", &function_42693079c84f5e6b, 1);
        function_b23a59dfb4ca49a1("<dev string:xbb>", "<dev string:xd7>" + "<dev string:xe9>", &function_1410eff963fa3b85, 1);
        function_b23a59dfb4ca49a1("<dev string:xf2>", "<dev string:xd7>" + "<dev string:x10d>", &function_1410eff963fa3b85, 1);
        function_b23a59dfb4ca49a1("<dev string:x116>", "<dev string:xd7>" + "<dev string:x132>", &function_1410eff963fa3b85, 1);
        function_b23a59dfb4ca49a1("<dev string:x13c>", "<dev string:xd7>" + "<dev string:x154>", &function_1410eff963fa3b85, 1);
        function_b23a59dfb4ca49a1("<dev string:x15b>", "<dev string:xd7>" + "<dev string:x174>", &function_1410eff963fa3b85, 1);
        function_a9a864379a098ad6("<dev string:x17c>", "<dev string:x18f>", &function_5652d4212374479);
        function_b23a59dfb4ca49a1("<dev string:x19e>", "<dev string:x1b2>" + "<dev string:xe9>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<dev string:x1bc>", "<dev string:x1b2>" + "<dev string:x10d>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<dev string:x1cf>", "<dev string:x1b2>" + "<dev string:x132>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<dev string:x1e3>", "<dev string:x1b2>" + "<dev string:x154>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<dev string:x1f3>", "<dev string:x1b2>" + "<dev string:x174>", &function_607a7d6915ef8735, 1);
        function_b23a59dfb4ca49a1("<dev string:x204>", "<dev string:x21f>" + "<dev string:xe9>", &function_ae3dd752642964cc, 1);
        function_b23a59dfb4ca49a1("<dev string:x230>", "<dev string:x21f>" + "<dev string:x10d>", &function_ae3dd752642964cc, 1);
        function_b23a59dfb4ca49a1("<dev string:x24a>", "<dev string:x21f>" + "<dev string:x132>", &function_ae3dd752642964cc, 1);
        function_b23a59dfb4ca49a1("<dev string:x265>", "<dev string:x21f>" + "<dev string:x154>", &function_ae3dd752642964cc, 1);
        function_b23a59dfb4ca49a1("<dev string:x27c>", "<dev string:x21f>" + "<dev string:x174>", &function_ae3dd752642964cc, 1);
        function_a9a864379a098ad6("<dev string:x294>", "<dev string:x2b1>", &function_ebf0cef1743090f7);
        function_a9a864379a098ad6("<dev string:x2ce>", "<dev string:x2e0>", &function_6409c5ab460c85f);
        function_a2fe753948998c89("<dev string:x2f2>", "<dev string:x308>");
        function_a2fe753948998c89("<dev string:x316>", "<dev string:x32f>");
        function_a2fe753948998c89("<dev string:x347>", "<dev string:x360>");
        function_a2fe753948998c89("<dev string:x378>", "<dev string:x392>");
        function_a2fe753948998c89("<dev string:x3ab>", "<dev string:x3cc>");
        function_a2fe753948998c89("<dev string:x3e5>", "<dev string:x405>");
        function_a2fe753948998c89("<dev string:x428>", "<dev string:x448>");
        function_a2fe753948998c89("<dev string:x46b>", "<dev string:x48c>");
        function_a2fe753948998c89("<dev string:x4b0>", "<dev string:x4d8>");
        function_a2fe753948998c89("<dev string:x4fc>", "<dev string:x525>");
        function_a2fe753948998c89("<dev string:x54e>", "<dev string:x571>" + 1800);
        function_a2fe753948998c89("<dev string:x593>", "<dev string:x5b0>");
        function_a2fe753948998c89("<dev string:x5d3>", "<dev string:x5f3>");
        function_a2fe753948998c89("<dev string:x619>", "<dev string:x639>");
        function_a2fe753948998c89("<dev string:x65f>", "<dev string:x67f>");
        function_fe953f000498048f();
        level.var_2d70874069468dab = spawnstruct();
        level.var_2d70874069468dab.updateseconds = 1;
        level thread function_b350da246217907c();
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x428
    // Size: 0xc7
    function function_c5fe5d9ce72fa0bc(activityclass, activitytypename) {
        assert(isstring(activityclass));
        assert(isstring(activitytypename));
        function_6e7290c8ee4f558b("<dev string:x6a5>" + activityclass + "<dev string:x6c3>" + activitytypename + "<dev string:x6c3>");
        function_b23a59dfb4ca49a1("<dev string:x6c5>", "<dev string:x6d5>" + activitytypename, &toggle_activity);
        function_b23a59dfb4ca49a1("<dev string:x6ed>", "<dev string:x6fe>" + activitytypename, &toggle_activity);
        function_b23a59dfb4ca49a1("<dev string:x717>", "<dev string:x72e>" + activityclass + "<dev string:x74f>" + activitytypename, &function_f7739f5c2b91aac3);
        function_b23a59dfb4ca49a1("<dev string:x751>", "<dev string:x769>" + activityclass + "<dev string:x74f>" + activitytypename, &function_f17b5e1e3d81ea1a);
        function_fe953f000498048f();
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4f7
    // Size: 0x164
    function private function_b350da246217907c() {
        waittillframeend();
        regions = [[ level.var_2d70874069468dab.var_fa51068d985cfd59 ]]();
        function_6e7290c8ee4f558b("<dev string:x1c>");
        foreach (region in regions) {
            function_b23a59dfb4ca49a1("<dev string:x782>" + region + "<dev string:x793>", "<dev string:x79f>" + "<dev string:xe9>" + "<dev string:x74f>" + region, &function_8072c276f04a62c1, 1);
            function_b23a59dfb4ca49a1("<dev string:x782>" + region + "<dev string:x7b0>", "<dev string:x79f>" + "<dev string:x10d>" + "<dev string:x74f>" + region, &function_8072c276f04a62c1, 1);
            function_b23a59dfb4ca49a1("<dev string:x782>" + region + "<dev string:x7bb>", "<dev string:x79f>" + "<dev string:x132>" + "<dev string:x74f>" + region, &function_8072c276f04a62c1, 1);
            function_b23a59dfb4ca49a1("<dev string:x782>" + region + "<dev string:x7c7>", "<dev string:x79f>" + "<dev string:x154>" + "<dev string:x74f>" + region, &function_8072c276f04a62c1, 1);
            function_b23a59dfb4ca49a1("<dev string:x782>" + region + "<dev string:x7cf>", "<dev string:x79f>" + "<dev string:x174>" + "<dev string:x74f>" + region, &function_8072c276f04a62c1, 1);
        }
        function_fe953f000498048f();
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x663
    // Size: 0x34
    function private function_6409c5ab460c85f() {
        setdvar(@"hash_f87b20273f0955f0", 2147483646);
        setdvar(@"hash_d431c6b00b5d6b2a", 2147483646);
        function_ba98175a5f6557f2();
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x69f
    // Size: 0x48
    function private function_50a8580a8b718b47(params) {
        switch (params[0]) {
        case #"hash_6caf06e2c9e6872e": 
            function_d0ac7479e6ae2265(1);
            break;
        case #"hash_c1c88ef798270243": 
            function_d0ac7479e6ae2265(0);
            break;
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x6ef
    // Size: 0x7d
    function private toggle_activity(params) {
        activitydvar = hashcat(@"hash_862d7d5538370d45", params[1]);
        value = int(getdvar(activitydvar, 1));
        switch (params[0]) {
        case #"hash_6caf06e2c9e6872e": 
            setdvar(activitydvar, 1);
            break;
        case #"hash_c1c88ef798270243": 
            setdvar(activitydvar, 0);
            break;
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x774
    // Size: 0xe
    function private function_b5c16cdb0a8b261e(params) {
        
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x78a
    // Size: 0x2ac
    function private draw_activity(activityinstance, runninginstance) {
        duration = int(ceil(level.var_2d70874069468dab.updateseconds / level.framedurationseconds));
        var_1d86cbaeb48162b0 = [[ level.var_2d70874069468dab.var_aa4bf0d23a33bd92 ]](@"hash_176090f07a9fa6df", activityinstance.class, 1800);
        var_2f347303bf358337 = (0.3, 0.3, 1);
        for (index = 0; index < activityinstance.origins.size; index++) {
            origin = activityinstance.origins[index];
            radius = activityinstance.radii[index];
            print3d(origin + (0, 0, 50), "<dev string:x7e7>" + activityinstance.type + "<dev string:x7ed>" + activityinstance.name, (1, 1, 1), 1, 1, duration, 1);
            print3d(origin + (0, 0, 30), "<dev string:x7f0>" + activityinstance.region + "<dev string:x7fa>", (1, 1, 1), 1, 1, duration, 1);
            print3d(origin + (0, 0, 10), "<dev string:x7fc>" + radius, (1, 1, 1), 1, 1, duration, 1);
            color = (1, 0, 0);
            if (isdefined(runninginstance)) {
                color = (0, 1, 0);
            }
            sphere(origin, 30, color, 0, duration);
            cylinder(origin, origin + (0, 0, 10), radius, color, 0, duration);
            var_34beb429638ce846 = (1, 1, 1);
            if (activityinstance.origins.size > 1) {
                var_34beb429638ce846 = var_2f347303bf358337;
            }
            cylinder(origin, origin + (0, 0, 10), radius + var_1d86cbaeb48162b0, var_34beb429638ce846, 0, duration);
        }
        for (index = 1; index < activityinstance.origins.size; index++) {
            prevorigin = activityinstance.origins[index - 1];
            origin = activityinstance.origins[index];
            line(prevorigin, origin, (0.8, 0.8, 1), 1, 0, duration);
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xa3e
    // Size: 0x34
    function private function_ae3dd752642964cc(params) {
        if (params.size > 0) {
            setdvar(hashcat(@"hash_1f77ee2c5138ab84", "<dev string:x804>" + params[0]), 1);
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xa7a
    // Size: 0x5c
    function private function_ebf0cef1743090f7() {
        var_f06b0050d062caaf = [[ level.var_2d70874069468dab.var_1aeea1d49e49164b ]]("<dev string:x132>", undefined, level.players[0].origin);
        if (isdefined(var_f06b0050d062caaf)) {
            [[ level.var_2d70874069468dab.var_fe3181404203f4d7 ]](var_f06b0050d062caaf);
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xade
    // Size: 0x66
    function private function_f7739f5c2b91aac3(params) {
        var_f06b0050d062caaf = [[ level.var_2d70874069468dab.var_1aeea1d49e49164b ]](params[0], params[1], level.players[0].origin);
        if (isdefined(var_f06b0050d062caaf)) {
            [[ level.var_2d70874069468dab.var_fe3181404203f4d7 ]](var_f06b0050d062caaf);
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0xb4c
    // Size: 0x1bd
    function private function_825b28c7ebf6d228(type, runningonly, drawregion) {
        if (!isdefined(runningonly)) {
            runningonly = 0;
        }
        while (true) {
            foreach (region, instancetypes in level.var_5b7c4eafd38d35c.activityinstances[type]) {
                if (isdefined(drawregion) && drawregion != region) {
                    continue;
                }
                foreach (instancetype, instances in instancetypes) {
                    foreach (instancename, instance in instances) {
                        runninginstance = undefined;
                        if (isdefined(level.var_5b7c4eafd38d35c.runninginstances[type][region]) && isdefined(level.var_5b7c4eafd38d35c.runninginstances[type][region][instancetype][instancename])) {
                            runninginstance = level.var_5b7c4eafd38d35c.runninginstances[type][region][instancetype][instancename];
                        }
                        if (runningonly && !isdefined(runninginstance)) {
                            continue;
                        }
                        draw_activity(instance, runninginstance);
                    }
                }
            }
            wait level.var_2d70874069468dab.updateseconds;
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xd11
    // Size: 0xc68
    function private function_42693079c84f5e6b() {
        while (true) {
            drawscale = getdvarfloat(@"hash_5b0a751f4964d0a0", 1);
            duration = int(ceil(level.var_2d70874069468dab.updateseconds / level.framedurationseconds));
            screenx = 500;
            screeny = 200;
            ydelta = 40 * drawscale;
            var_a91880e9ba5df15d = 35 * drawscale;
            color = (1, 1, 1);
            scale = 3 * drawscale;
            scalesmall = 2 * drawscale;
            printtoscreen2d(screenx, screeny, "<dev string:x807>", color, scale, duration);
            screeny += ydelta;
            regions = [];
            foreach (activityinstances in level.var_5b7c4eafd38d35c.activityinstances) {
                foreach (regionname, var_16608965b7f8614 in activityinstances) {
                    if (var_16608965b7f8614.size > 0) {
                        regions[regionname] = 1;
                    }
                }
            }
            printtoscreen2d(screenx, screeny, "<dev string:x823>" + regions.size, color, scale, duration);
            screeny += ydelta;
            globalcount = level.var_5b7c4eafd38d35c.activityinstances["<dev string:x154>"].size;
            activitycount = level.var_5b7c4eafd38d35c.activityinstances["<dev string:xe9>"].size;
            contractcount = level.var_5b7c4eafd38d35c.activityinstances["<dev string:x10d>"].size;
            objectivecount = level.var_5b7c4eafd38d35c.activityinstances["<dev string:x132>"].size;
            startupcount = level.var_5b7c4eafd38d35c.activityinstances["<dev string:x174>"].size;
            types = [];
            instances = [];
            regions = [[ level.var_2d70874069468dab.var_fa51068d985cfd59 ]]();
            var_a165f6980e3e577 = function_6a64df48ad4ce4f9();
            foreach (class in var_a165f6980e3e577) {
                types[class] = [];
                instances[class] = 0;
                foreach (region in regions) {
                    var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.activityinstances[class][region];
                    if (!isdefined(var_7d0882489e1ab140)) {
                        continue;
                    }
                    foreach (activitytype, activityinstances in var_7d0882489e1ab140) {
                        types[class][activitytype] = 1;
                        instances[class] = instances[class] + activityinstances.size;
                    }
                }
            }
            text = "<dev string:x833>" + types["<dev string:x154>"].size + "<dev string:x7fa>";
            text += "<dev string:x842>" + types["<dev string:xe9>"].size + "<dev string:x7fa>";
            text += "<dev string:x84d>" + types["<dev string:x10d>"].size + "<dev string:x7fa>";
            text += "<dev string:x858>" + types["<dev string:x132>"].size + "<dev string:x7fa>";
            text += "<dev string:x864>" + types["<dev string:x174>"].size + "<dev string:x7fa>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny += ydelta;
            text = "<dev string:x86e>" + instances["<dev string:x154>"] + "<dev string:x7fa>";
            text += "<dev string:x842>" + instances["<dev string:xe9>"] + "<dev string:x7fa>";
            text += "<dev string:x84d>" + instances["<dev string:x10d>"] + "<dev string:x7fa>";
            text += "<dev string:x858>" + instances["<dev string:x132>"] + "<dev string:x7fa>";
            text += "<dev string:x864>" + instances["<dev string:x174>"] + "<dev string:x7fa>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny += ydelta;
            difficulties = ["<dev string:x881>", "<dev string:x891>", "<dev string:x8a3>", "<dev string:x8b3>"];
            var_2bfe175508eba086 = [];
            foreach (class in var_a165f6980e3e577) {
                var_3a18cedb8717f4d1 = [];
                foreach (difficulty in difficulties) {
                    var_3a18cedb8717f4d1[difficulty] = [[ level.var_2d70874069468dab.var_a19c8c0604529f78 ]](class, difficulty);
                }
                var_2bfe175508eba086[class] = var_3a18cedb8717f4d1;
            }
            instances = [];
            var_a072fac9ece92308 = [];
            foreach (class in var_a165f6980e3e577) {
                instances[class] = 0;
                var_a072fac9ece92308[class] = [[ level.var_2d70874069468dab.var_c7aef763b2f3aa8 ]](class);
                foreach (region in regions) {
                    var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.runninginstances[class][region];
                    if (!isdefined(var_7d0882489e1ab140)) {
                        continue;
                    }
                    foreach (activitytype, activityinstances in var_7d0882489e1ab140) {
                        instances[class] = instances[class] + activityinstances.size;
                    }
                }
            }
            text = "<dev string:x8c9>" + instances["<dev string:x154>"] + "<dev string:x8da>" + var_a072fac9ece92308["<dev string:x154>"] + "<dev string:x7fa>";
            text += "<dev string:x842>" + instances["<dev string:xe9>"] + "<dev string:x8da>" + var_a072fac9ece92308["<dev string:xe9>"] + "<dev string:x7fa>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny += ydelta;
            text = "<dev string:x8e0>" + instances["<dev string:x10d>"] + "<dev string:x8da>" + var_a072fac9ece92308["<dev string:x10d>"] + "<dev string:x7fa>";
            text += "<dev string:x858>" + instances["<dev string:x132>"] + "<dev string:x8da>" + var_a072fac9ece92308["<dev string:x132>"] + "<dev string:x7fa>";
            text += "<dev string:x864>" + instances["<dev string:x174>"] + "<dev string:x8da>" + var_a072fac9ece92308["<dev string:x174>"] + "<dev string:x7fa>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny += ydelta;
            text = "<dev string:x8ee>";
            printtoscreen2d(screenx, screeny, text, color, scale, duration);
            screeny += ydelta;
            foreach (class in var_a165f6980e3e577) {
                text = "<dev string:x902>" + class + "<dev string:x907>";
                printtoscreen2d(screenx, screeny, text, color, scalesmall, duration);
                var_3a18cedb8717f4d1 = var_2bfe175508eba086[class];
                var_ccd2bc8536f2f0f9 = [];
                var_ccd2bc8536f2f0f9["<dev string:x881>"] = 0;
                var_ccd2bc8536f2f0f9["<dev string:x891>"] = 0;
                var_ccd2bc8536f2f0f9["<dev string:x8a3>"] = 0;
                var_ccd2bc8536f2f0f9["<dev string:x8b3>"] = 0;
                foreach (region in regions) {
                    regiondifficulty = namespace_f721fc7d0d2d0f47::function_cf8b9cfdad89cbec(region);
                    if (!isdefined(var_ccd2bc8536f2f0f9[regiondifficulty])) {
                        continue;
                    }
                    var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.runninginstances[class][region];
                    foreach (activityinstances in var_7d0882489e1ab140) {
                        var_ccd2bc8536f2f0f9[regiondifficulty] = var_ccd2bc8536f2f0f9[regiondifficulty] + activityinstances.size;
                    }
                }
                text = "<dev string:x909>" + var_ccd2bc8536f2f0f9["<dev string:x881>"] + "<dev string:x910>" + var_3a18cedb8717f4d1["<dev string:x881>"] + "<dev string:x916>";
                text += "<dev string:x91a>" + var_ccd2bc8536f2f0f9["<dev string:x891>"] + "<dev string:x910>" + var_3a18cedb8717f4d1["<dev string:x891>"] + "<dev string:x916>";
                text += "<dev string:x922>" + var_ccd2bc8536f2f0f9["<dev string:x8a3>"] + "<dev string:x910>" + var_3a18cedb8717f4d1["<dev string:x8a3>"] + "<dev string:x916>";
                text += "<dev string:x92a>" + var_ccd2bc8536f2f0f9["<dev string:x8b3>"] + "<dev string:x910>" + var_3a18cedb8717f4d1["<dev string:x8b3>"] + "<dev string:x92f>";
                printtoscreen2d(screenx + 500, screeny, text, color, scalesmall, duration);
                screeny += var_a91880e9ba5df15d;
            }
            screeny += ydelta / 2;
            printtoscreen2d(screenx, screeny, "<dev string:x932>", color, scale, duration);
            screeny += ydelta;
            foreach (region in regions) {
                runningcount = [];
                runningmax = [];
                foreach (class in var_a165f6980e3e577) {
                    runningcount[class] = 0;
                    var_7d0882489e1ab140 = level.var_5b7c4eafd38d35c.runninginstances[class][region];
                    if (!isdefined(var_7d0882489e1ab140)) {
                        continue;
                    }
                    foreach (activitytype, activityinstances in var_7d0882489e1ab140) {
                        runningcount[class] = runningcount[class] + activityinstances.size;
                    }
                    runningmax[class] = [[ level.var_2d70874069468dab.var_fb1eec0d33d8dc19 ]](class);
                }
                text = "<dev string:x902>" + region;
                printtoscreen2d(screenx, screeny, text, color, scalesmall, duration);
                text = "<dev string:x940>" + runningcount["<dev string:x154>"] + "<dev string:x910>" + runningmax["<dev string:x154>"] + "<dev string:x7fa>";
                text += "<dev string:x842>" + runningcount["<dev string:xe9>"] + "<dev string:x910>" + runningmax["<dev string:xe9>"] + "<dev string:x7fa>";
                text += "<dev string:x84d>" + runningcount["<dev string:x10d>"] + "<dev string:x910>" + runningmax["<dev string:x10d>"] + "<dev string:x7fa>";
                printtoscreen2d(screenx + 500, screeny, text, color, scalesmall, duration);
                text = "<dev string:x858>" + runningcount["<dev string:x132>"] + "<dev string:x910>" + runningmax["<dev string:x132>"] + "<dev string:x7fa>";
                text += "<dev string:x864>" + runningcount["<dev string:x174>"] + "<dev string:x910>" + runningmax["<dev string:x174>"] + "<dev string:x7fa>";
                printtoscreen2d(screenx + 1330, screeny, text, color, scalesmall, duration);
                screeny += var_a91880e9ba5df15d;
            }
            wait level.var_2d70874069468dab.updateseconds;
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1981
    // Size: 0x18
    function private function_607a7d6915ef8735(params) {
        function_825b28c7ebf6d228(params[0]);
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x19a1
    // Size: 0x1a
    function private function_1410eff963fa3b85(params) {
        function_825b28c7ebf6d228(params[0], 1);
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x19c3
    // Size: 0x1d
    function private function_8072c276f04a62c1(params) {
        function_825b28c7ebf6d228(params[0], undefined, params[1]);
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x19e8
    // Size: 0x22
    function private function_44cc30417358da(name) {
        if (function_7ac3c4c1bce16dd2(name)) {
            toggle_thread(name, undefined, undefined);
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1a12
    // Size: 0x29
    function private function_5652d4212374479() {
        function_44cc30417358da("<dev string:x948>");
        function_44cc30417358da("<dev string:x951>");
        function_44cc30417358da("<dev string:x962>");
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1a43
    // Size: 0x236
    function private function_898ada7f773b1c5a(params) {
        level notify("<dev string:x972>");
        level endon("<dev string:x972>");
        activityclass = params[0];
        activitytype = params[1];
        var_980df4613b316540 = activityclass + "<dev string:x804>" + activitytype;
        if (isdefined(level.var_2d70874069468dab.var_b0705e04df8f166a) && level.var_2d70874069468dab.var_b0705e04df8f166a == var_980df4613b316540) {
            level.var_2d70874069468dab.var_b0705e04df8f166a = undefined;
            return;
        }
        level.var_2d70874069468dab.var_b0705e04df8f166a = var_980df4613b316540;
        while (true) {
            regions = [[ level.var_2d70874069468dab.var_fa51068d985cfd59 ]]();
            foreach (region in regions) {
                if (!isdefined(level.var_5b7c4eafd38d35c.activityinstances[activityclass][region])) {
                    continue;
                }
                instances = level.var_5b7c4eafd38d35c.activityinstances[activityclass][region][activitytype];
                if (!isdefined(instances)) {
                    continue;
                }
                foreach (instancename, instance in instances) {
                    runninginstance = undefined;
                    if (isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region]) && isdefined(level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytype][instancename])) {
                        runninginstance = level.var_5b7c4eafd38d35c.runninginstances[activityclass][region][activitytype][instancename];
                    }
                    draw_activity(instance, runninginstance);
                }
            }
            wait level.var_2d70874069468dab.updateseconds;
        }
    }

    // Namespace namespace_1cb5f1cc1f98b618 / namespace_7386a088c3551598
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1c81
    // Size: 0x18
    function private function_f17b5e1e3d81ea1a(params) {
        level thread function_898ada7f773b1c5a(params);
    }

#/
