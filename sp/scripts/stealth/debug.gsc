#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\smartobjects\utility.gsc;

#namespace debug;

/#

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x88
    // Size: 0x148
    function debug_manager() {
        setdvarifuninitialized(@"hash_c5b31ff1b47a0f69", "<dev string:x1c>");
        setdvarifuninitialized(@"hash_a3c8097b0584ad3c", "<dev string:x1c>");
        setdvarifuninitialized(@"hash_29199fda70b29985", "<dev string:x1c>");
        setdvarifuninitialized(@"hash_e24fb561372dfef1", -1);
        setdvarifuninitialized(@"hash_d036770ff7a14497", "<dev string:x1c>");
        setdvarifuninitialized(@"hash_f30debd28e3f37e1", "<dev string:x1c>");
        setdvarifuninitialized(@"hash_99b5f3d24be9d6ca", "<dev string:x1e>");
        setdvarifuninitialized(@"hash_936a3d04dd90f9b7", "<dev string:x1c>");
        thread function_459a4d528437596();
        registersharedfunc("<dev string:x1f>", "<dev string:x2d>", &function_55f9cd7d60a115bb);
        while (true) {
            waitframe();
            if (!debug_enabled()) {
                continue;
            }
            draw_corpses();
            function_dd7ad6e8da294b01("<dev string:x40>", "<dev string:x48>");
            function_dd7ad6e8da294b01("<dev string:x40>", "<dev string:x5a>" + flag("<dev string:x6c>"));
            function_dd7ad6e8da294b01("<dev string:x40>", "<dev string:x7c>" + flag("<dev string:x8e>"));
            function_20367cc98c4d2265("<dev string:x40>");
            function_df6b11367f42a8e1();
            function_47439b5d33f2695a();
            function_477aac1963f8269e();
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d8
    // Size: 0x18a
    function debug_player() {
        self endon("<dev string:x9e>");
        hudelem = newclienthudelem(self);
        hudelem.x = -50;
        hudelem.y = 450;
        hudelem.color = (0.5, 1, 0.5);
        hudelem.archived = 0;
        hudelem setdevtext("<dev string:xa4>");
        z = 0;
        space = 10;
        tab = "<dev string:xbb>";
        while (true) {
            if (debug_enabled()) {
                if (!isdefined(level.player.stealth) || !level.player flag("<dev string:x6c>")) {
                    hudelem.alpha = 0;
                } else {
                    hudelem.alpha = 1;
                }
                function_dd7ad6e8da294b01("<dev string:xbe>", "<dev string:xc5>");
                function_dd7ad6e8da294b01("<dev string:xbe>", "<dev string:xce>" + self.script_stealthgroup);
                function_dd7ad6e8da294b01("<dev string:xbe>", "<dev string:xde>" + level.player.maxvisibledist);
                if (level.player ent_flag("<dev string:xef>")) {
                    function_dd7ad6e8da294b01("<dev string:xbe>", "<dev string:x101>");
                }
            } else {
                hudelem.alpha = 0;
            }
            function_20367cc98c4d2265("<dev string:xbe>");
            waitframe();
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x36a
    // Size: 0xa0
    function debug_friendly() {
        self endon("<dev string:x9e>");
        setdvarifuninitialized(@"hash_67d1d2d65d5da2ab", "<dev string:x10b>");
        while (true) {
            if (debug_enabled()) {
                space = 10;
                count = 0;
                if (ent_flag("<dev string:xef>")) {
                    print3d(self.origin + (0, 0, count * space * -1), "<dev string:x10e>", (0.2, 1, 0.2), 1, 0.5);
                }
                count++;
                draw_enemies("<dev string:x118>");
                waitframe();
                continue;
            }
            wait 1;
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x412
    // Size: 0xb1
    function debug_enemy() {
        self endon("<dev string:x9e>");
        setdvarifuninitialized(@"hash_9e5e998ddfcc8447", "<dev string:x10b>");
        setdvarifuninitialized(@"hash_a1d5d00556c4bddd", "<dev string:x1c>");
        setdevdvarifuninitialized(@"hash_f9e17cb98b253864", 0);
        while (true) {
            if (istrue(self.in_melee_death)) {
                return;
            }
            if (debug_enabled()) {
                if (function_f1c3d8f46961ed52() == -1 || function_f1c3d8f46961ed52() == self getentitynumber()) {
                    function_499e30b2511f6c94();
                }
                num = function_c1b2391e0af178d();
                if (num == self getentitynumber()) {
                    function_a02eac45a40e4217();
                }
                waitframe();
                continue;
            }
            wait 1;
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4cb
    // Size: 0x2a
    function debug_enabled() {
        dvar = getunarchiveddebugdvar(@"hash_c5b31ff1b47a0f69", "<dev string:x1c>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4fd
    // Size: 0x14
    function function_f1c3d8f46961ed52() {
        return getdvarint(@"ai_debugentindex");
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x519
    // Size: 0x2a
    function function_c1b2391e0af178d() {
        dvar = getunarchiveddebugdvar(@"hash_9e5e998ddfcc8447", "<dev string:x10b>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x54b
    // Size: 0x2a
    function function_d9143f39f30fecf1() {
        dvar = getunarchiveddebugdvar(@"hash_67d1d2d65d5da2ab", "<dev string:x10b>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x57d
    // Size: 0x2a
    function function_ca7435750eb63fe6() {
        dvar = getunarchiveddebugdvar(@"hash_a1d5d00556c4bddd", "<dev string:x1c>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5af
    // Size: 0x2a
    function function_a8005409dfbcbb79() {
        dvar = getunarchiveddebugdvar(@"hash_a3c8097b0584ad3c", "<dev string:x1c>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5e1
    // Size: 0x2a
    function function_68a6af3bcbe8d474() {
        dvar = getunarchiveddebugdvar(@"hash_29199fda70b29985", "<dev string:x1c>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x613
    // Size: 0x2a
    function function_4f071e84ae5ccf30() {
        dvar = getunarchiveddebugdvar(@"hash_d036770ff7a14497", "<dev string:x1c>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x645
    // Size: 0x2a
    function function_79c554909de26a4c() {
        dvar = getunarchiveddebugdvar(@"hash_f30debd28e3f37e1", "<dev string:x1c>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x677
    // Size: 0x2a
    function function_ff38e8c9a6564c50() {
        dvar = getunarchiveddebugdvar(@"hash_350b154807f4d745", "<dev string:x1c>");
        return int(dvar);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6a9
    // Size: 0x19
    function function_6a4e0953fbd5e6bc() {
        return getunarchiveddebugdvar(@"hash_99b5f3d24be9d6ca", "<dev string:x1c>");
    }

    // Namespace debug / scripts\stealth\debug
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x6ca
    // Size: 0x68
    function thick_line(start, end, color) {
        num = 3;
        for (i = 0; i < num; i++) {
            start += (0, 0, num * 0.05);
            end += (0, 0, num * 0.05);
            line(start, end, color);
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x73a
    // Size: 0x71
    function thick_cylinder(start, end, radius, color) {
        num = 3;
        for (i = 0; i < num; i++) {
            start += (0, 0, num * 0.05);
            end += (0, 0, num * 0.05);
            cylinder(start, end, radius, color);
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x7b3
    // Size: 0x103
    function function_804ccafa69edd640(msg) {
        if (!flag("<dev string:x6c>")) {
            return;
        }
        type = undefined;
        name = undefined;
        if (isdefined(self.script_noteworthy)) {
            type = "<dev string:x11f>";
            name = self.script_noteworthy;
        } else if (isdefined(self.targetname)) {
            type = "<dev string:x131>";
            name = self.targetname;
        }
        actor = "<dev string:x13c>" + self getentitynumber() + "<dev string:x14d>" + self.unique_id + "<dev string:x153>" + self.export;
        if (isdefined(type)) {
            actor += "<dev string:x15d>" + type + "<dev string:x15f>" + name;
        }
        txt = "<dev string:x162>" + actor + "<dev string:x171>" + msg;
        println(txt);
        if (getdvarint(@"hash_60656e331eb4e226") == 1) {
            thread function_24051a9bda001947(msg);
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x8be
    // Size: 0x109
    function function_dd7ad6e8da294b01(type, msg) {
        if (!isdefined(level.stealth.debug.screen[type])) {
            level.stealth.debug.screen[type] = 0;
        }
        x = 10;
        if (type == "<dev string:x40>") {
            y = 50;
        } else if (type == "<dev string:xbe>") {
            y = 150;
        } else if (type == "<dev string:x178>") {
            y = 250;
        } else {
            y = 350;
        }
        y += level.stealth.debug.screen[type] * 15;
        printtoscreen2d(x, y, msg, (1, 1, 1), 1.25);
        level.stealth.debug.screen[type]++;
    }

    // Namespace debug / scripts\stealth\debug
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9cf
    // Size: 0x2f
    function function_20367cc98c4d2265(type) {
        level.stealth.debug.screen[type] = 0;
    }

    // Namespace debug / scripts\stealth\debug
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0xa06
    // Size: 0xbf
    function debug_points(points, endonevent) {
        if (!debug_enabled()) {
            return;
        }
        self endon("<dev string:x9e>");
        self endon(endonevent);
        while (true) {
            foreach (point in points) {
                if (isdefined(point.used_time)) {
                    print3d(point.origin, "<dev string:x1e>" + point.used_time);
                    line(point.origin, self.origin);
                }
            }
            waitframe();
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xacd
    // Size: 0x124
    function function_5ac11b46f9a0051d(type) {
        if (!debug_enabled()) {
            return;
        }
        self endon("<dev string:x9e>");
        self notify("<dev string:x17d>");
        self endon("<dev string:x17d>");
        color = (0.2, 1, 0.2);
        msg = "<dev string:x18e>";
        if (type == "<dev string:x195>") {
            color = (1, 1, 0);
            msg = "<dev string:x19e>";
        } else if (type == "<dev string:x1a0>") {
            color = (1, 0.5, 0.25);
            msg = "<dev string:x19e>";
        } else if (type == "<dev string:x1a9>") {
            color = (1, 0, 0);
            msg = "<dev string:x1b0>";
        } else if (type == "<dev string:x1b2>") {
            color = (1, 0, 0);
            msg = "<dev string:x1be>";
        }
        timer = gettime() + 5000;
        while (gettime() < timer) {
            waitframe();
            print3d(self.origin + (0, 0, 72), msg, color, 1, 3);
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xbf9
    // Size: 0x47
    function function_48c141571ea55421(msg, offset, scale, color) {
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        function_55f9cd7d60a115bb(msg, color, 1, scale, offset);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 6, eflags: 0x0
    // Checksum 0x0, Offset: 0xc48
    // Size: 0x3fe
    function function_55f9cd7d60a115bb(text, color, alpha, scale, offset, life) {
        if (!debug_enabled() && !function_ff38e8c9a6564c50()) {
            return;
        }
        if (!isdefined(text) || !isdefined(self.stealth)) {
            return;
        }
        if (!isdefined(offset)) {
            offset = (0, 0, 92);
        }
        if (!isdefined(scale)) {
            scale = 0.5;
        }
        if (!isdefined(life)) {
            life = 3;
        }
        spacing = 10 * scale;
        riserate = 0;
        start = gettime();
        if (!isdefined(self.stealth.debug_rising)) {
            self.stealth.debug_rising = [];
            self.stealth.var_75968050cd6ebe9f = -1;
        }
        self.stealth.var_75968050cd6ebe9f++;
        myid = self.stealth.var_75968050cd6ebe9f;
        self.stealth.debug_rising[myid] = offset;
        for (previd = myid - 1; isdefined(self.stealth.debug_rising[previd]); previd -= 1) {
            delta = self.stealth.debug_rising[previd][2] - self.stealth.debug_rising[previd + 1][2];
            if (delta >= spacing) {
                break;
            }
            self.stealth.debug_rising[previd] = (self.stealth.debug_rising[previd][0], self.stealth.debug_rising[previd][1], self.stealth.debug_rising[previd + 1][2] + spacing + delta);
        }
        draworigin = self.stealth.debug_rising[myid];
        while (gettime() - start < life * 1000) {
            waitframe();
            if (isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.debug_rising) && isdefined(self.stealth.debug_rising[myid])) {
                draworigin = self.origin + self.stealth.debug_rising[myid];
            }
            print3d(draworigin, text, color, alpha, scale, 1);
            draworigin = (draworigin[0], draworigin[1], draworigin[2] + riserate);
            if (isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.debug_rising) && isdefined(self.stealth.debug_rising[myid])) {
                self.stealth.debug_rising[myid] = (self.stealth.debug_rising[myid][0], self.stealth.debug_rising[myid][1], self.stealth.debug_rising[myid][2] + riserate);
            }
        }
        if (isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.debug_rising) && isdefined(self.stealth.debug_rising[myid])) {
            self.stealth.debug_rising[myid] = undefined;
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x104e
    // Size: 0x16b
    function draw_enemies(team, offset) {
        enemies = getaiarray(team);
        if (team == "<dev string:x118>") {
            enemies[enemies.size] = level.player;
        }
        yellow = (1, 1, 0);
        green = (0, 1, 0);
        red = (1, 0, 0);
        foreach (enemy in enemies) {
            yellow_dist = squared(enemy.maxvisibledist + 200);
            vis_dist = squared(enemy.maxvisibledist);
            distsqrd = distancesquared(enemy.origin, self.origin);
            if (distsqrd < vis_dist) {
                color = red;
            } else if (distsqrd < yellow_dist) {
                color = yellow;
            } else {
                color = green;
            }
            line(self.origin, enemy.origin, color);
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x11c1
    // Size: 0xa3
    function function_159af129de631d3e(agent) {
        dvar = getunarchiveddebugdvar(@"hash_f9e17cb98b253864", "<dev string:x1c>");
        if (isdefined(agent)) {
            switch (dvar) {
            case #"hash_31100fbc01bd387c":
                return 1;
            case #"hash_311012bc01bd3d35":
                if (agent.type != "<dev string:x1c5>") {
                    return 1;
                }
                return 0;
            case #"hash_311011bc01bd3ba2":
                if (agent.type == "<dev string:x1c5>") {
                    return 1;
                }
                return 0;
            default:
                return 0;
            }
        }
        return 0;
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x126c
    // Size: 0x5e1
    function function_6ed101071f87cd39() {
        count = 0;
        var_39670b09f106e922 = function_159af129de631d3e(self);
        if (var_39670b09f106e922) {
            space = 20;
            white = (1, 1, 1);
            red = (1, 0, 0);
            yellow = (1, 1, 0);
            green = (0, 1, 0);
            size = 1;
            agenttype = "<dev string:x1e>";
            viewpos = level.players[0] getvieworigin();
            scale = utility::function_5a18f19c457e5d1a(self.origin, viewpos, 1200);
            if (scale < 2) {
                size *= scale;
                space *= scale;
            }
            if (isdefined(self.agent_type)) {
                agenttype += "<dev string:x1ce>" + self.agent_type;
            }
            if (agenttype.size > 0) {
                print3d(self.origin - (0, 0, count * space), agenttype, white, 1, size);
                count++;
            }
            var_ba4f0da211b259e6 = "<dev string:x1e>";
            if (isdefined(self.var_ce4c4978f5a2a4a8) && isdefined(self.var_ce4c4978f5a2a4a8.spawnfilter)) {
                var_ba4f0da211b259e6 += "<dev string:x1d5>" + self.var_ce4c4978f5a2a4a8.spawnfilter;
            }
            if (var_ba4f0da211b259e6.size > 0) {
                print3d(self.origin - (0, 0, count * space), var_ba4f0da211b259e6, white, 1, size);
                count++;
            }
            agentstats = "<dev string:x1e>";
            healthcolor = green;
            if (isdefined(self.health)) {
                agentstats += "<dev string:x1e3>" + self.health + "<dev string:x1ed>" + self.maxhealth + "<dev string:x1ef>";
                healthpct = self.health / self.maxhealth;
                if (healthpct < 0.33) {
                    healthcolor = red;
                } else if (healthpct < 0.66) {
                    healthcolor = yellow;
                }
                if (isdefined(self.armorhealth)) {
                    agentstats += "<dev string:x1f1>" + self.armorhealth + "<dev string:x1fb>";
                }
            }
            if (agentstats.size > 0) {
                print3d(self.origin - (0, 0, count * space), agentstats, healthcolor, 1, size);
                count++;
            }
            loadout = "<dev string:x1e>";
            if (isdefined(self.primaryweapon)) {
                loadout += "<dev string:x1ff>" + getweaponbasename(self.primaryweapon);
                if (isdefined(self.secondaryweapon)) {
                    loadout += "<dev string:x203>" + function_7b2b4dc5f3dfb2c9(self.secondaryweapon);
                }
            }
            if (loadout.size > 0) {
                print3d(self.origin - (0, 0, count * space), loadout, white, 1, size);
                count++;
            }
            var_932e79601aac5a0 = "<dev string:x1e>";
            if (isdefined(self.accuracy)) {
                var_932e79601aac5a0 += "<dev string:x208>" + self.accuracy + "<dev string:x213>" + self.baseaccuracy;
            }
            if (var_932e79601aac5a0.size > 0) {
                print3d(self.origin - (0, 0, count * space), var_932e79601aac5a0, white, 1, size);
                count++;
            }
            var_47a2f514cd9c0063 = "<dev string:x1e>";
            var_ce72f9835ebc188e = "<dev string:x1e>";
            if (isdefined(self.var_4268b42fc89d0be9)) {
                var_47a2f514cd9c0063 += "<dev string:x21d>" + self.var_4268b42fc89d0be9 + "<dev string:x229>" + round(self.var_8a783f4c73c2ae91 * 1000, 0.01);
                playerdistance = distance(self.origin, viewpos);
                var_ce72f9835ebc188e += "<dev string:x238>" + round(playerdistance) + "<dev string:x241>" + round(playerdistance * self.var_8a783f4c73c2ae91 + self.var_4268b42fc89d0be9, 0.01);
            }
            if (var_47a2f514cd9c0063.size > 0) {
                print3d(self.origin - (0, 0, count * space), var_47a2f514cd9c0063, white, 1, size);
                count++;
                print3d(self.origin - (0, 0, count * space), var_ce72f9835ebc188e, white, 1, size);
                count++;
            }
            if (utility::iscp()) {
                goalvolume = self getgoalvolume();
                str_info = "<dev string:x1e>";
                if (isdefined(goalvolume) && isdefined(goalvolume.targetname)) {
                    str_info += "<dev string:x24e>" + goalvolume.targetname + "<dev string:x15d>";
                }
                ai_group = self.script_aigroup;
                if (isdefined(ai_group)) {
                    str_info += "<dev string:x25b>" + ai_group + "<dev string:x15d>";
                }
                if (isdefined(self.goalradius)) {
                    str_info += "<dev string:x266>" + self.goalradius + "<dev string:x15d>";
                }
                if (isdefined(self.fixednode)) {
                    str_info += "<dev string:x26f>" + self.fixednode + "<dev string:x15d>";
                }
                if (istrue(self.ignoreall)) {
                    str_info += "<dev string:x27b>";
                } else {
                    str_info += "<dev string:x28c>";
                }
                if (istrue(self.ignoreme)) {
                    str_info += "<dev string:x29e>";
                } else {
                    str_info += "<dev string:x2ae>";
                }
                if (str_info.size > 0) {
                    print3d(self.origin - (0, 0, count * space), str_info, white, 1, size);
                    count++;
                }
            }
        }
        return count;
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1855
    // Size: 0x51f
    function function_499e30b2511f6c94() {
        space = 20;
        count = 0;
        size = 2;
        white = (1, 1, 1);
        red = (1, 0, 0);
        yellow = (1, 1, 0);
        green = (0, 1, 0);
        if (function_ca7435750eb63fe6()) {
            draw_fov();
        }
        if (utility::ismp() || utility::iscp()) {
            count = function_6ed101071f87cd39();
            if (count > 0) {
                size = 1;
                viewpos = level.players[0] getvieworigin();
                scale = utility::function_5a18f19c457e5d1a(self.origin, viewpos, 1200);
                if (scale < 2) {
                    size *= scale;
                    space *= scale;
                }
            }
        }
        animstr = "<dev string:x2bf>";
        patrolstyle = scripts\stealth\utility::get_patrol_style();
        if (isdefined(patrolstyle)) {
            animstr = patrolstyle;
        }
        var_dee4b373f2a46ae9 = "<dev string:x2c6>";
        var_9715a843470b3c8b = "<dev string:x1e>";
        bounded = 0;
        pod = function_bc5df124338cefea(self);
        if (isdefined(self.var_fe5ebefa740c7106)) {
            switch (self.var_fe5ebefa740c7106) {
            case 0:
                var_dee4b373f2a46ae9 = "<dev string:x2ce>";
                break;
            case 1:
                var_dee4b373f2a46ae9 = "<dev string:x2d3>";
                if (isdefined(level.stealth.investigate_volumes[self.script_stealthgroup])) {
                    bounded = 1;
                }
                break;
            case 2:
                var_dee4b373f2a46ae9 = "<dev string:x2d7>";
                if (isdefined(level.stealth.hunt_volumes[self.script_stealthgroup])) {
                    bounded = 1;
                }
                var_9715a843470b3c8b = "<dev string:x2dc>";
                break;
            case 3:
                var_dee4b373f2a46ae9 = "<dev string:x2e6>";
                if (isdefined(level.stealth.combat_volumes[self.script_stealthgroup])) {
                    bounded = 1;
                }
                break;
            }
        }
        print3d(self.origin - (0, 0, count * space), self getentitynumber() + "<dev string:x2ed>" + var_dee4b373f2a46ae9 + var_9715a843470b3c8b, white, 1, size);
        count++;
        print3d(self.origin - (0, 0, count * space), "<dev string:x2f5>" + animstr, white, 1, size);
        count++;
        nextline = "<dev string:x1e>";
        if (isdefined(self.enemy)) {
            nextline += "<dev string:x2fc>" + self.enemy getentitynumber() + "<dev string:x15d>";
        }
        if (bounded) {
            nextline += "<dev string:x304>";
        }
        if (nextline.size > 0) {
            print3d(self.origin - (0, 0, count * space), nextline, yellow, 1, size);
            count++;
        }
        if (isdefined(self.lightmeter)) {
            print3d(self.origin - (0, 0, count * space), "<dev string:x30c>" + self.lightmeter, red, 1, size);
            count++;
        }
        group = "<dev string:x1e>";
        if (isdefined(self.script_stealthgroup)) {
            group = "<dev string:x319>" + self.script_stealthgroup + "<dev string:x15d>";
        }
        if (group.size > 0) {
            print3d(self.origin - (0, 0, count * space), group, white, 1, size);
            count++;
        }
        if (!self [[ self.fnisinstealthcombat ]]()) {
            for (iplayer = 0; iplayer < level.players.size; iplayer++) {
                ts = self getthreatsight(level.players[iplayer]);
                if (ts > 0) {
                    txt = iplayer + "<dev string:x15f>" + ts;
                    if (self cansee(level.players[iplayer])) {
                        color = red;
                    } else {
                        color = green;
                    }
                    print3d(self.origin - (0, 0, count * space), txt, color, 1, size);
                    count++;
                }
            }
        }
        if (isdefined(self.shootposoverride)) {
            line(self geteye(), self.shootposoverride, (1, 1, 0));
        }
        facingstart = self.origin + (0, 0, 8);
        facingend = self.origin + (0, 0, 8) + anglestoforward(self.angles) * 36;
        line(facingstart, facingend, (0, 0, 1));
    }

    // Namespace debug / scripts\stealth\debug
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d7c
    // Size: 0x5c
    function function_886940100cc17179(baseangles, angle, angleidx) {
        if (angleidx == 0) {
            return anglestoforward(baseangles + (angle, 0, 0));
        }
        if (angleidx == 1) {
            return anglestoforward(baseangles + (0, angle, 0));
        }
        if (angleidx == 2) {
            return anglestoforward(baseangles + (0, 0, angle));
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 8, eflags: 0x0
    // Checksum 0x0, Offset: 0x1de0
    // Size: 0xf1
    function function_ab68b8f1b9191d70(origin, startangle, endangle, baseangles, len, angleidx, var_efe3f96afffe2036, color) {
        assert(startangle < endangle);
        prevpt = origin + len * function_886940100cc17179(baseangles, startangle, angleidx);
        nextpt = prevpt;
        line(origin, prevpt, color);
        angledelta = (endangle - startangle) / var_efe3f96afffe2036;
        for (i = 1; i < var_efe3f96afffe2036 + 1; i++) {
            angle = startangle + angledelta * i;
            nextpt = origin + len * function_886940100cc17179(baseangles, angle, angleidx);
            line(prevpt, nextpt, color);
            prevpt = nextpt;
        }
        line(origin, nextpt, color);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1ed9
    // Size: 0x157
    function draw_fov() {
        dot = self.fovcosine;
        if (isdefined(self.enemy)) {
            dot = self.fovcosinebusy;
        }
        color = (1, 0, 0);
        fov_yaw = acos(dot);
        if (isai(self)) {
            eye_yaw = self gettagangles("<dev string:x328>")[1];
        } else {
            eye_yaw = self gettagangles("<dev string:x330>")[1];
        }
        viewdist = level.player.maxvisibledist;
        if (isai(self)) {
            start = self gettagorigin("<dev string:x328>");
        } else {
            start = self gettagorigin("<dev string:x330>");
        }
        var_8b4c94ee530f045e = 10;
        function_ab68b8f1b9191d70(start, -1 * fov_yaw, fov_yaw, (0, eye_yaw, 0), viewdist, 1, var_8b4c94ee530f045e, color);
        if (self.fovcosinez > dot) {
            color *= 0.5;
            fov_pitch = acos(self.fovcosinez);
            eye_pitch = 0;
            function_ab68b8f1b9191d70(start, -1 * fov_pitch, fov_pitch, (eye_pitch, eye_yaw, 0), viewdist, 0, var_8b4c94ee530f045e, color);
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2038
    // Size: 0x132
    function function_a02eac45a40e4217() {
        tab = "<dev string:xbb>";
        function_dd7ad6e8da294b01("<dev string:x33b>", "<dev string:x341>" + self getentitynumber() + "<dev string:x1ef>");
        function_dd7ad6e8da294b01("<dev string:x33b>", "<dev string:xce>" + self.script_stealthgroup);
        function_dd7ad6e8da294b01("<dev string:x33b>", "<dev string:x355>" + self.alertlevel);
        if (isdefined(self.enemy)) {
            enemy = self.enemy getentitynumber();
        } else {
            enemy = "<dev string:x362>";
        }
        function_dd7ad6e8da294b01("<dev string:x33b>", "<dev string:x2fc>" + enemy);
        function_dd7ad6e8da294b01("<dev string:x33b>", "<dev string:x36c>" + self.stealth.ai_event);
        if (self.team == "<dev string:x118>") {
            team = "<dev string:x37c>";
        } else {
            team = "<dev string:x118>";
        }
        enemies = getaiarray(team);
        if (team == "<dev string:x118>") {
            enemies[enemies.size] = level.player;
        }
        function_20367cc98c4d2265("<dev string:x33b>");
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2172
    // Size: 0x26c
    function function_459a4d528437596() {
        var_37da5cf398e21053 = 16;
        cmaxtime = 30000;
        level.stealth.chatbox = [];
        level.stealth.var_78f9cb3724128a61 = 0;
        level.stealth.var_cfee0ec929c863b8 = 0;
        var_69e2bf7730e3c6a = 50;
        var_69e2cf7730e3e9d = 340;
        var_f426174e166cc725 = 20;
        cscale = 1.5;
        textcolor = (1, 1, 1);
        levelstealth = level.stealth;
        while (true) {
            if (function_a8005409dfbcbb79()) {
                var_3b40392d00a51017 = gettime() - cmaxtime;
                if (levelstealth.var_cfee0ec929c863b8 > 0) {
                    cury = var_69e2cf7730e3e9d;
                    curline = levelstealth.var_78f9cb3724128a61;
                    for (iline = 0; iline < levelstealth.var_cfee0ec929c863b8; iline++) {
                        if (levelstealth.chatbox[curline].time > var_3b40392d00a51017) {
                            text = "<dev string:x1e>";
                            if (isstring(levelstealth.chatbox[curline].speaker)) {
                                text += levelstealth.chatbox[curline].speaker;
                            } else {
                                foreach (speaker in levelstealth.chatbox[curline].speaker) {
                                    if (isdefined(speaker)) {
                                        text += "<dev string:x15d>" + speaker getentitynumber();
                                    }
                                }
                                levelstealth.chatbox[curline].speaker = text;
                            }
                            text += "<dev string:x15f>" + levelstealth.chatbox[curline].text;
                            printtoscreen2d(var_69e2bf7730e3c6a, cury, text, textcolor, cscale);
                            cury += var_f426174e166cc725;
                        }
                        curline = (curline + 1) % var_37da5cf398e21053;
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x23e6
    // Size: 0x1b5
    function function_ec780a18fdfb4982(speaker, line) {
        var_37da5cf398e21053 = 16;
        stealth = level.stealth;
        var_91fb44e58e12150c = (stealth.var_78f9cb3724128a61 + stealth.var_cfee0ec929c863b8) % var_37da5cf398e21053;
        curtime = gettime();
        var_82fe7e64cacf7088 = var_91fb44e58e12150c - 1;
        if (var_82fe7e64cacf7088 < 0) {
            var_82fe7e64cacf7088 = var_37da5cf398e21053 - 1;
        }
        if (isdefined(stealth.chatbox[var_82fe7e64cacf7088]) && stealth.chatbox[var_82fe7e64cacf7088].time == curtime && stealth.chatbox[var_82fe7e64cacf7088].text == line) {
            stealth.chatbox[var_82fe7e64cacf7088].speaker[stealth.chatbox[var_82fe7e64cacf7088].speaker.size] = speaker;
            return;
        }
        s = spawnstruct();
        s.speaker = [speaker];
        s.text = line;
        s.time = curtime;
        stealth.chatbox[var_91fb44e58e12150c] = s;
        if (var_91fb44e58e12150c == stealth.var_78f9cb3724128a61 && stealth.var_cfee0ec929c863b8 > 0) {
            stealth.var_78f9cb3724128a61 = (stealth.var_78f9cb3724128a61 + 1) % var_37da5cf398e21053;
        } else {
            stealth.var_cfee0ec929c863b8++;
        }
        assert(stealth.var_cfee0ec929c863b8 <= var_37da5cf398e21053);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x25a3
    // Size: 0x21c
    function draw_corpses() {
        if (!debug_enabled() || !isdefined(level.stealth) || !isdefined(level.stealth.corpse)) {
            return;
        }
        if (!isdefined(level.fngetcorpsearrayfunc)) {
            return;
        }
        color = (1, 1, 0);
        found_color = (0.9, 0, 0);
        corpses = [[ level.fngetcorpsearrayfunc ]]();
        guys = getaiarray("<dev string:x37c>");
        foreach (corpse in corpses) {
            corpseorigin = getcorpseorigin(corpse);
            if (function_3b88420e0790461f(corpse)) {
                continue;
            } else if (function_9d0df1a4b8cf341d(corpse)) {
                print3d(corpseorigin, "<dev string:x381>");
                continue;
            } else {
                print3d(corpseorigin, "<dev string:x38e>");
            }
            line(corpse.origin, corpseorigin);
            corpsedistances = function_e3f5cef1ceede64a();
            foreach (guy in guys) {
                if (!isdefined(guy.stealth)) {
                    continue;
                }
                if (guy [[ guy.fnisinstealthcombat ]]()) {
                    continue;
                }
                dist = distancesquared(corpseorigin, guy.origin);
                if (dist < corpsedistances.detect_distsqrd) {
                    line(guy.origin, corpseorigin, found_color);
                    continue;
                }
                if (dist < corpsedistances.sight_distsqrd) {
                    line(guy.origin, corpseorigin, color);
                }
            }
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x27c7
    // Size: 0x81
    function function_24051a9bda001947(message, duration) {
        self notify("<dev string:x395>");
        self endon("<dev string:x395>");
        self endon("<dev string:x9e>");
        if (!isdefined(duration)) {
            duration = 5;
        }
        for (time = 0; time < duration * 20; time++) {
            print3d(self.origin + (0, 0, 45), message, (0.48, 9.4, 0.76), 0.85);
            waitframe();
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x2850
    // Size: 0xc2
    function draw_axis(origin, angles, length) {
        axes = anglestoaxis(angles);
        forward = axes["<dev string:x3a6>"] * length;
        right = axes["<dev string:x3ae>"] * length;
        up = axes["<dev string:x3b4>"] * length;
        line(origin - forward, origin + forward, (1, 0, 0), 1);
        line(origin - up, origin + up, (0, 1, 0), 1);
        line(origin - right, origin + right, (0, 0, 1), 1);
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x291a
    // Size: 0x1f3
    function function_df6b11367f42a8e1() {
        if (!isdefined(anim.smartobjectpoints)) {
            return;
        }
        debughunt = function_68a6af3bcbe8d474();
        if (debughunt == 0) {
            return;
        }
        colorgray = (0.7, 0.7, 0.7);
        foreach (obj in anim.smartobjectpoints) {
            angles = (0, 0, 0);
            if (isdefined(obj.angles)) {
                angles = obj.angles;
            }
            draw_axis(obj.origin, angles, 12);
            if (debughunt == 2) {
                print3d(obj.origin - (0, 0, 12), obj.script_smartobject, colorgray, 1, 0.3, 1);
                objtype = scripts\smartobjects\utility::getsmartobjecttype(obj.script_smartobject);
                if (isdefined(objtype) && isdefined(objtype.fngetinfo)) {
                    info = [[ objtype.fngetinfo ]]();
                    if (isdefined(info.radiussqrd)) {
                        r = sqrt(info.radiussqrd);
                        function_ab68b8f1b9191d70(obj.origin, 0, 360, angles, r, 1, 8, colorgray);
                    }
                    if (isdefined(obj.claimer)) {
                        print3d(obj.origin - (0, 0, 18), "<dev string:x3b7>" + obj.claimer getentitynumber(), colorgray, 1, 0.3, 1);
                    }
                }
            }
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b15
    // Size: 0x2b7
    function function_47439b5d33f2695a() {
        var_60d789eee36da978 = function_4f071e84ae5ccf30();
        if (var_60d789eee36da978 == 0) {
            return;
        }
        if (!isdefined(level.stealth.hunt_stealth_group_region_sets)) {
            return;
        }
        debuggroup = function_6a4e0953fbd5e6bc();
        foreach (group_data in level.stealth.hunt_stealth_group_region_sets) {
            if (debuggroup != group && debuggroup != "<dev string:x1e>") {
                continue;
            }
            foreach (region in group_data.hunt_regions) {
                for (i = 1; i < region.route_points.size; i++) {
                    p0 = region.route_points[i - 1];
                    p1 = region.route_points[i];
                    line(p0.origin, p1.origin, (0, 0.7, 0), 1, 0, 1);
                }
                if (isdefined(region.smart_objects)) {
                    foreach (smart_object in region.smart_objects) {
                        function_ab68b8f1b9191d70(smart_object.origin, 0, 360, smart_object.angles, 10, 1, 3, (0.7, 0, 0));
                    }
                }
                if (isdefined(region.region_links)) {
                    foreach (link in region.region_links) {
                        line(link.transition_point.origin, link.transition_to_point.origin, (0.7, 0.7, 0), 1, 0, 1);
                    }
                }
            }
        }
    }

    // Namespace debug / scripts\stealth\debug
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2dd4
    // Size: 0x39f
    function function_477aac1963f8269e() {
        var_4dea17d260740969 = function_79c554909de26a4c();
        if (var_4dea17d260740969 == 0) {
            return;
        }
        if (!isdefined(level.stealth.hunt_stealth_group_region_sets)) {
            return;
        }
        debuggroup = function_6a4e0953fbd5e6bc();
        foreach (group_data in level.stealth.hunt_stealth_group_region_sets) {
            if (debuggroup != group && debuggroup != "<dev string:x1e>") {
                continue;
            }
            var_28686396a415964e = [];
            foreach (region in group_data.hunt_regions) {
                assert(isdefined(region.approx_location));
                space = 10;
                count = 0;
                size = 0.5;
                white = (1, 1, 1);
                print3d(region.approx_location - (0, 0, count * space), "<dev string:x3bc>" + region.index, white, 1, size);
                count++;
                print3d(region.approx_location - (0, 0, count * space), "<dev string:x3c4>" + region.bfs_score, white, 1, size);
                count++;
                print3d(region.approx_location - (0, 0, count * space), "<dev string:x3d0>" + region.shared_data.bfs_assigned, white, 1, size);
                count++;
                print3d(region.approx_location - (0, 0, count * space), "<dev string:x3db>" + region.shared_data.in_region, white, 1, size);
                count++;
                print3d(region.approx_location - (0, 0, count * space), "<dev string:x3e7>" + region.stealth_group, white, 1, size);
                cooldowndiff = region.shared_data.bfs_cooldown - gettime();
                if (cooldowndiff > 0) {
                    count++;
                    print3d(region.approx_location - (0, 0, count * space), "<dev string:x3ef>" + cooldowndiff, white, 1, size);
                }
            }
            foreach (region in group_data.hunt_regions) {
                foreach (link in region.region_links) {
                    toregion = link.region;
                    line(region.approx_location, toregion.approx_location, (0, 0, 0.7), 1, 0, 1);
                }
            }
        }
    }

#/
