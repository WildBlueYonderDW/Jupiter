// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\smartobjects\utility.gsc;

#namespace debug;

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0x149
function debug_manager() {
    /#
        setdvarifuninitialized(@"hash_c5b31ff1b47a0f69", "<unknown string>");
        setdvarifuninitialized(@"hash_a3c8097b0584ad3c", "<unknown string>");
        setdvarifuninitialized(@"hash_29199fda70b29985", "<unknown string>");
        setdvarifuninitialized(@"hash_e24fb561372dfef1", -1);
        setdvarifuninitialized(@"hash_d036770ff7a14497", "<unknown string>");
        setdvarifuninitialized(@"hash_f30debd28e3f37e1", "<unknown string>");
        setdvarifuninitialized(@"hash_99b5f3d24be9d6ca", "<unknown string>");
        setdvarifuninitialized(@"hash_936a3d04dd90f9b7", "<unknown string>");
        thread function_459a4d528437596();
        registersharedfunc("<unknown string>", "<unknown string>", &function_55f9cd7d60a115bb);
        while (true) {
            waitframe();
            if (!debug_enabled()) {
                continue;
            }
            draw_corpses();
            function_dd7ad6e8da294b01("<unknown string>", "<unknown string>");
            function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + flag("<unknown string>"));
            function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + flag("<unknown string>"));
            function_20367cc98c4d2265("<unknown string>");
            function_df6b11367f42a8e1();
            function_47439b5d33f2695a();
            function_477aac1963f8269e();
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8
// Size: 0x18b
function debug_player() {
    /#
        self endon("<unknown string>");
        hudelem = newclienthudelem(self);
        hudelem.x = -50;
        hudelem.y = 450;
        hudelem.color = (0.5, 1, 0.5);
        hudelem.archived = 0;
        hudelem setdevtext("<unknown string>");
        z = 0;
        space = 10;
        tab = "<unknown string>";
        while (true) {
            if (debug_enabled()) {
                if (!isdefined(level.player.stealth) || !level.player flag("<unknown string>")) {
                    hudelem.alpha = 0;
                } else {
                    hudelem.alpha = 1;
                }
                function_dd7ad6e8da294b01("<unknown string>", "<unknown string>");
                function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + self.script_stealthgroup);
                function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + level.player.maxvisibledist);
                if (level.player ent_flag("<unknown string>")) {
                    function_dd7ad6e8da294b01("<unknown string>", "<unknown string>");
                }
            } else {
                hudelem.alpha = 0;
            }
            function_20367cc98c4d2265("<unknown string>");
            waitframe();
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36a
// Size: 0xa1
function debug_friendly() {
    /#
        self endon("<unknown string>");
        setdvarifuninitialized(@"hash_67d1d2d65d5da2ab", "<unknown string>");
        while (true) {
            if (debug_enabled()) {
                space = 10;
                count = 0;
                if (ent_flag("<unknown string>")) {
                    print3d(self.origin + (0, 0, count * space * -1), "<unknown string>", (0.2, 1, 0.2), 1, 0.5);
                }
                count++;
                draw_enemies("<unknown string>");
                waitframe();
                continue;
            }
            wait(1);
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x412
// Size: 0xb2
function debug_enemy() {
    /#
        self endon("<unknown string>");
        setdvarifuninitialized(@"hash_9e5e998ddfcc8447", "<unknown string>");
        setdvarifuninitialized(@"hash_a1d5d00556c4bddd", "<unknown string>");
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
            wait(1);
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cb
// Size: 0x2b
function debug_enabled() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_c5b31ff1b47a0f69", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fd
// Size: 0x15
function function_f1c3d8f46961ed52() {
    /#
        return getdvarint(@"hash_932e9550632df2cb");
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0x2b
function function_c1b2391e0af178d() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_9e5e998ddfcc8447", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54b
// Size: 0x2b
function function_d9143f39f30fecf1() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_67d1d2d65d5da2ab", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57d
// Size: 0x2b
function function_ca7435750eb63fe6() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_a1d5d00556c4bddd", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5af
// Size: 0x2b
function function_a8005409dfbcbb79() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_a3c8097b0584ad3c", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e1
// Size: 0x2b
function function_68a6af3bcbe8d474() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_29199fda70b29985", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x613
// Size: 0x2b
function function_4f071e84ae5ccf30() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_d036770ff7a14497", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x645
// Size: 0x2b
function function_79c554909de26a4c() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_f30debd28e3f37e1", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x677
// Size: 0x2b
function function_ff38e8c9a6564c50() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_350b154807f4d745", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a9
// Size: 0x1a
function function_6a4e0953fbd5e6bc() {
    /#
        return getunarchiveddebugdvar(@"hash_99b5f3d24be9d6ca", "<unknown string>");
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6ca
// Size: 0x69
function thick_line(start, end, color) {
    /#
        num = 3;
        for (i = 0; i < num; i++) {
            start = start + (0, 0, num * 0.05);
            end = end + (0, 0, num * 0.05);
            line(start, end, color);
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x73a
// Size: 0x72
function thick_cylinder(start, end, radius, color) {
    /#
        num = 3;
        for (i = 0; i < num; i++) {
            start = start + (0, 0, num * 0.05);
            end = end + (0, 0, num * 0.05);
            cylinder(start, end, radius, color);
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b3
// Size: 0x104
function function_804ccafa69edd640(msg) {
    /#
        if (!flag("<unknown string>")) {
            return;
        }
        type = undefined;
        name = undefined;
        if (isdefined(self.script_noteworthy)) {
            type = "<unknown string>";
            name = self.script_noteworthy;
        } else if (isdefined(self.targetname)) {
            type = "<unknown string>";
            name = self.targetname;
        }
        actor = "<unknown string>" + self getentitynumber() + "<unknown string>" + self.unique_id + "<unknown string>" + self.export;
        if (isdefined(type)) {
            actor = actor + "<unknown string>" + type + "<unknown string>" + name;
        }
        txt = "<unknown string>" + actor + "<unknown string>" + msg;
        println(txt);
        if (getdvarint(@"hash_60656e331eb4e226") == 1) {
            thread function_24051a9bda001947(msg);
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8be
// Size: 0x10a
function function_dd7ad6e8da294b01(type, msg) {
    /#
        if (!isdefined(level.stealth.debug.screen[type])) {
            level.stealth.debug.screen[type] = 0;
        }
        x = 10;
        if (type == "<unknown string>") {
            y = 50;
        } else if (type == "<unknown string>") {
            y = 150;
        } else if (type == "<unknown string>") {
            y = 250;
        } else {
            y = 350;
        }
        y = y + level.stealth.debug.screen[type] * 15;
        printtoscreen2d(x, y, msg, (1, 1, 1), 1.25);
        level.stealth.debug.screen[type]++;
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9cf
// Size: 0x30
function function_20367cc98c4d2265(type) {
    /#
        level.stealth.debug.screen[type] = 0;
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa06
// Size: 0xc4
function debug_points(points, endonevent) {
    /#
        if (!debug_enabled()) {
            return;
        }
        self endon("<unknown string>");
        self endon(endonevent);
        while (true) {
            foreach (point in points) {
                if (isdefined(point.used_time)) {
                    print3d(point.origin, "<unknown string>" + point.used_time);
                    line(point.origin, self.origin);
                }
            }
            waitframe();
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad1
// Size: 0x125
function function_5ac11b46f9a0051d(type) {
    /#
        if (!debug_enabled()) {
            return;
        }
        self endon("<unknown string>");
        self notify("<unknown string>");
        self endon("<unknown string>");
        color = (0.2, 1, 0.2);
        msg = "<unknown string>";
        if (type == "<unknown string>") {
            color = (1, 1, 0);
            msg = "<unknown string>";
        } else if (type == "<unknown string>") {
            color = (1, 0.5, 0.25);
            msg = "<unknown string>";
        } else if (type == "<unknown string>") {
            color = (1, 0, 0);
            msg = "<unknown string>";
        } else if (type == "<unknown string>") {
            color = (1, 0, 0);
            msg = "<unknown string>";
        }
        timer = gettime() + 5000;
        while (gettime() < timer) {
            waitframe();
            print3d(self.origin + (0, 0, 72), msg, color, 1, 3);
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbfd
// Size: 0x48
function function_48c141571ea55421(msg, offset, scale, color) {
    /#
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        function_55f9cd7d60a115bb(msg, color, 1, scale, offset);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc4c
// Size: 0x3ff
function function_55f9cd7d60a115bb(text, color, alpha, scale, offset, life) {
    /#
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
        for (previd = myid - 1; isdefined(self.stealth.debug_rising[previd]); previd = previd - 1) {
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
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1052
// Size: 0x170
function draw_enemies(team, offset) {
    /#
        enemies = getaiarray(team);
        if (team == "<unknown string>") {
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
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11c9
// Size: 0xa4
function function_159af129de631d3e(agent) {
    /#
        dvar = getunarchiveddebugdvar(@"hash_f9e17cb98b253864", "<unknown string>");
        if (isdefined(agent)) {
            switch (dvar) {
            case #"hash_31100fbc01bd387c":
                return 1;
            case #"hash_311012bc01bd3d35":
                if (agent.type != "<unknown string>") {
                    return 1;
                }
                return 0;
            case #"hash_311011bc01bd3ba2":
                if (agent.type == "<unknown string>") {
                    return 1;
                }
                return 0;
            default:
                return 0;
            }
        }
        return 0;
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1274
// Size: 0x5e2
function function_6ed101071f87cd39() {
    /#
        count = 0;
        var_39670b09f106e922 = function_159af129de631d3e(self);
        if (var_39670b09f106e922) {
            space = 20;
            white = (1, 1, 1);
            red = (1, 0, 0);
            yellow = (1, 1, 0);
            green = (0, 1, 0);
            size = 1;
            agenttype = "<unknown string>";
            viewpos = level.players[0] getvieworigin();
            scale = utility::function_5a18f19c457e5d1a(self.origin, viewpos, 1200);
            if (scale < 2) {
                size = size * scale;
                space = space * scale;
            }
            if (isdefined(self.agent_type)) {
                agenttype = agenttype + "<unknown string>" + self.agent_type;
            }
            if (agenttype.size > 0) {
                print3d(self.origin - (0, 0, count * space), agenttype, white, 1, size);
                count++;
            }
            var_ba4f0da211b259e6 = "<unknown string>";
            if (isdefined(self.ob) && isdefined(self.ob.spawnfilter)) {
                var_ba4f0da211b259e6 = var_ba4f0da211b259e6 + "<unknown string>" + self.ob.spawnfilter;
            }
            if (var_ba4f0da211b259e6.size > 0) {
                print3d(self.origin - (0, 0, count * space), var_ba4f0da211b259e6, white, 1, size);
                count++;
            }
            agentstats = "<unknown string>";
            healthcolor = green;
            if (isdefined(self.health)) {
                agentstats = agentstats + "<unknown string>" + self.health + "<unknown string>" + self.maxhealth + "<unknown string>";
                healthpct = self.health / self.maxhealth;
                if (healthpct < 0.33) {
                    healthcolor = red;
                } else if (healthpct < 0.66) {
                    healthcolor = yellow;
                }
                if (isdefined(self.armorhealth)) {
                    agentstats = agentstats + "<unknown string>" + self.armorhealth + "<unknown string>";
                }
            }
            if (agentstats.size > 0) {
                print3d(self.origin - (0, 0, count * space), agentstats, healthcolor, 1, size);
                count++;
            }
            loadout = "<unknown string>";
            if (isdefined(self.primaryweapon)) {
                loadout = loadout + "<unknown string>" + getweaponbasename(self.primaryweapon);
                if (isdefined(self.secondaryweapon)) {
                    loadout = loadout + "<unknown string>" + function_7b2b4dc5f3dfb2c9(self.secondaryweapon);
                }
            }
            if (loadout.size > 0) {
                print3d(self.origin - (0, 0, count * space), loadout, white, 1, size);
                count++;
            }
            var_932e79601aac5a0 = "<unknown string>";
            if (isdefined(self.accuracy)) {
                var_932e79601aac5a0 = var_932e79601aac5a0 + "<unknown string>" + self.accuracy + "<unknown string>" + self.baseaccuracy;
            }
            if (var_932e79601aac5a0.size > 0) {
                print3d(self.origin - (0, 0, count * space), var_932e79601aac5a0, white, 1, size);
                count++;
            }
            var_47a2f514cd9c0063 = "<unknown string>";
            var_ce72f9835ebc188e = "<unknown string>";
            if (isdefined(self.var_4268b42fc89d0be9)) {
                var_47a2f514cd9c0063 = var_47a2f514cd9c0063 + "<unknown string>" + self.var_4268b42fc89d0be9 + "<unknown string>" + round(self.var_8a783f4c73c2ae91 * 1000, 0.01);
                playerdistance = distance(self.origin, viewpos);
                var_ce72f9835ebc188e = var_ce72f9835ebc188e + "<unknown string>" + round(playerdistance) + "<unknown string>" + round(playerdistance * self.var_8a783f4c73c2ae91 + self.var_4268b42fc89d0be9, 0.01);
            }
            if (var_47a2f514cd9c0063.size > 0) {
                print3d(self.origin - (0, 0, count * space), var_47a2f514cd9c0063, white, 1, size);
                count++;
                print3d(self.origin - (0, 0, count * space), var_ce72f9835ebc188e, white, 1, size);
                count++;
            }
            if (utility::iscp()) {
                goalvolume = self getgoalvolume();
                str_info = "<unknown string>";
                if (isdefined(goalvolume) && isdefined(goalvolume.targetname)) {
                    str_info = str_info + "<unknown string>" + goalvolume.targetname + "<unknown string>";
                }
                ai_group = self.script_aigroup;
                if (isdefined(ai_group)) {
                    str_info = str_info + "<unknown string>" + ai_group + "<unknown string>";
                }
                if (isdefined(self.goalradius)) {
                    str_info = str_info + "<unknown string>" + self.goalradius + "<unknown string>";
                }
                if (isdefined(self.fixednode)) {
                    str_info = str_info + "<unknown string>" + self.fixednode + "<unknown string>";
                }
                if (istrue(self.ignoreall)) {
                    str_info = str_info + "<unknown string>";
                } else {
                    str_info = str_info + "<unknown string>";
                }
                if (istrue(self.ignoreme)) {
                    str_info = str_info + "<unknown string>";
                } else {
                    str_info = str_info + "<unknown string>";
                }
                if (str_info.size > 0) {
                    print3d(self.origin - (0, 0, count * space), str_info, white, 1, size);
                    count++;
                }
            }
        }
        return count;
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185d
// Size: 0x520
function function_499e30b2511f6c94() {
    /#
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
                    size = size * scale;
                    space = space * scale;
                }
            }
        }
        animstr = "<unknown string>";
        patrolstyle = scripts/stealth/utility::get_patrol_style();
        if (isdefined(patrolstyle)) {
            animstr = patrolstyle;
        }
        var_dee4b373f2a46ae9 = "<unknown string>";
        var_9715a843470b3c8b = "<unknown string>";
        bounded = 0;
        pod = function_bc5df124338cefea(self);
        if (isdefined(self.var_fe5ebefa740c7106)) {
            switch (self.var_fe5ebefa740c7106) {
            case 0:
                var_dee4b373f2a46ae9 = "<unknown string>";
                break;
            case 1:
                var_dee4b373f2a46ae9 = "<unknown string>";
                if (isdefined(level.stealth.investigate_volumes[self.script_stealthgroup])) {
                    bounded = 1;
                }
                break;
            case 2:
                var_dee4b373f2a46ae9 = "<unknown string>";
                if (isdefined(level.stealth.hunt_volumes[self.script_stealthgroup])) {
                    bounded = 1;
                }
                var_9715a843470b3c8b = "<unknown string>";
                break;
            case 3:
                var_dee4b373f2a46ae9 = "<unknown string>";
                if (isdefined(level.stealth.combat_volumes[self.script_stealthgroup])) {
                    bounded = 1;
                }
                break;
            }
        }
        print3d(self.origin - (0, 0, count * space), self getentitynumber() + "<unknown string>" + var_dee4b373f2a46ae9 + var_9715a843470b3c8b, white, 1, size);
        count++;
        print3d(self.origin - (0, 0, count * space), "<unknown string>" + animstr, white, 1, size);
        count++;
        nextline = "<unknown string>";
        if (isdefined(self.enemy)) {
            nextline = nextline + "<unknown string>" + self.enemy getentitynumber() + "<unknown string>";
        }
        if (bounded) {
            nextline = nextline + "<unknown string>";
        }
        if (nextline.size > 0) {
            print3d(self.origin - (0, 0, count * space), nextline, yellow, 1, size);
            count++;
        }
        if (isdefined(self.lightmeter)) {
            print3d(self.origin - (0, 0, count * space), "<unknown string>" + self.lightmeter, red, 1, size);
            count++;
        }
        group = "<unknown string>";
        if (isdefined(self.script_stealthgroup)) {
            group = "<unknown string>" + self.script_stealthgroup + "<unknown string>";
        }
        if (group.size > 0) {
            print3d(self.origin - (0, 0, count * space), group, white, 1, size);
            count++;
        }
        if (!self [[ self.fnisinstealthcombat ]]()) {
            for (iplayer = 0; iplayer < level.players.size; iplayer++) {
                ts = self getthreatsight(level.players[iplayer]);
                if (ts > 0) {
                    txt = iplayer + "<unknown string>" + ts;
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
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d84
// Size: 0x5d
function function_886940100cc17179(baseangles, angle, angleidx) {
    /#
        if (angleidx == 0) {
            return anglestoforward(baseangles + (angle, 0, 0));
        }
        if (angleidx == 1) {
            return anglestoforward(baseangles + (0, angle, 0));
        }
        if (angleidx == 2) {
            return anglestoforward(baseangles + (0, 0, angle));
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1de8
// Size: 0xf2
function function_ab68b8f1b9191d70(origin, startangle, endangle, baseangles, len, angleidx, var_efe3f96afffe2036, color) {
    /#
        /#
            assert(startangle < endangle);
        #/
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
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ee1
// Size: 0x158
function draw_fov() {
    /#
        dot = self.fovcosine;
        if (isdefined(self.enemy)) {
            dot = self.fovcosinebusy;
        }
        color = (1, 0, 0);
        fov_yaw = acos(dot);
        if (isai(self)) {
            eye_yaw = self gettagangles("<unknown string>")[1];
        } else {
            eye_yaw = self gettagangles("<unknown string>")[1];
        }
        viewdist = level.player.maxvisibledist;
        if (isai(self)) {
            start = self gettagorigin("<unknown string>");
        } else {
            start = self gettagorigin("<unknown string>");
        }
        var_8b4c94ee530f045e = 10;
        function_ab68b8f1b9191d70(start, -1 * fov_yaw, fov_yaw, (0, eye_yaw, 0), viewdist, 1, var_8b4c94ee530f045e, color);
        if (self.fovcosinez > dot) {
            color = color * 0.5;
            fov_pitch = acos(self.fovcosinez);
            eye_pitch = 0;
            function_ab68b8f1b9191d70(start, -1 * fov_pitch, fov_pitch, (eye_pitch, eye_yaw, 0), viewdist, 0, var_8b4c94ee530f045e, color);
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2040
// Size: 0x133
function function_a02eac45a40e4217() {
    /#
        tab = "<unknown string>";
        function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + self getentitynumber() + "<unknown string>");
        function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + self.script_stealthgroup);
        function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + self.alertlevel);
        if (isdefined(self.enemy)) {
            enemy = self.enemy getentitynumber();
        } else {
            enemy = "<unknown string>";
        }
        function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + enemy);
        function_dd7ad6e8da294b01("<unknown string>", "<unknown string>" + self.stealth.ai_event);
        if (self.team == "<unknown string>") {
            team = "<unknown string>";
        } else {
            team = "<unknown string>";
        }
        enemies = getaiarray(team);
        if (team == "<unknown string>") {
            enemies[enemies.size] = level.player;
        }
        function_20367cc98c4d2265("<unknown string>");
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x217a
// Size: 0x271
function function_459a4d528437596() {
    /#
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
                            text = "<unknown string>";
                            if (isstring(levelstealth.chatbox[curline].speaker)) {
                                text = text + levelstealth.chatbox[curline].speaker;
                            } else {
                                foreach (speaker in levelstealth.chatbox[curline].speaker) {
                                    if (isdefined(speaker)) {
                                        text = text + "<unknown string>" + speaker getentitynumber();
                                    }
                                }
                                levelstealth.chatbox[curline].speaker = text;
                            }
                            text = text + "<unknown string>" + levelstealth.chatbox[curline].text;
                            printtoscreen2d(var_69e2bf7730e3c6a, cury, text, textcolor, cscale);
                            cury = cury + var_f426174e166cc725;
                        }
                        curline = (curline + 1) % var_37da5cf398e21053;
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23f2
// Size: 0x1b6
function function_ec780a18fdfb4982(speaker, line) {
    /#
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
        /#
            assert(stealth.var_cfee0ec929c863b8 <= var_37da5cf398e21053);
        #/
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25af
// Size: 0x225
function draw_corpses() {
    /#
        if (!debug_enabled() || !isdefined(level.stealth) || !isdefined(level.stealth.corpse)) {
            return;
        }
        if (!isdefined(level.fngetcorpsearrayfunc)) {
            return;
        }
        color = (1, 1, 0);
        found_color = (0.9, 0, 0);
        corpses = [[ level.fngetcorpsearrayfunc ]]();
        guys = getaiarray("<unknown string>");
        foreach (corpse in corpses) {
            corpseorigin = getcorpseorigin(corpse);
            if (function_3b88420e0790461f(corpse)) {
                continue;
            } else if (function_9d0df1a4b8cf341d(corpse)) {
                print3d(corpseorigin, "<unknown string>");
                continue;
            } else {
                print3d(corpseorigin, "<unknown string>");
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
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27db
// Size: 0x82
function function_24051a9bda001947(message, duration) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        if (!isdefined(duration)) {
            duration = 5;
        }
        for (time = 0; time < duration * 20; time++) {
            print3d(self.origin + (0, 0, 45), message, (0.48, 9.4, 0.76), 0.85);
            waitframe();
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2864
// Size: 0xc3
function draw_axis(origin, angles, length) {
    /#
        axes = anglestoaxis(angles);
        forward = axes["<unknown string>"] * length;
        right = axes["<unknown string>"] * length;
        up = axes["<unknown string>"] * length;
        line(origin - forward, origin + forward, (1, 0, 0), 1);
        line(origin - up, origin + up, (0, 1, 0), 1);
        line(origin - right, origin + right, (0, 0, 1), 1);
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x292e
// Size: 0x1f8
function function_df6b11367f42a8e1() {
    /#
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
                objtype = scripts/smartobjects/utility::getsmartobjecttype(obj.script_smartobject);
                if (isdefined(objtype) && isdefined(objtype.fngetinfo)) {
                    info = [[ objtype.fngetinfo ]]();
                    if (isdefined(info.radiussqrd)) {
                        r = sqrt(info.radiussqrd);
                        function_ab68b8f1b9191d70(obj.origin, 0, 360, angles, r, 1, 8, colorgray);
                    }
                    if (isdefined(obj.claimer)) {
                        print3d(obj.origin - (0, 0, 18), "<unknown string>" + obj.claimer getentitynumber(), colorgray, 1, 0.3, 1);
                    }
                }
            }
        }
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2d
// Size: 0x2c8
function function_47439b5d33f2695a() {
    /#
        var_60d789eee36da978 = function_4f071e84ae5ccf30();
        if (var_60d789eee36da978 == 0) {
            return;
        }
        if (!isdefined(level.stealth.hunt_stealth_group_region_sets)) {
            return;
        }
        debuggroup = function_6a4e0953fbd5e6bc();
        foreach (group, group_data in level.stealth.hunt_stealth_group_region_sets) {
            if (debuggroup != group && debuggroup != "<unknown string>") {
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
    #/
}

// Namespace debug / scripts/stealth/debug
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dfc
// Size: 0x3b0
function function_477aac1963f8269e() {
    /#
        var_4dea17d260740969 = function_79c554909de26a4c();
        if (var_4dea17d260740969 == 0) {
            return;
        }
        if (!isdefined(level.stealth.hunt_stealth_group_region_sets)) {
            return;
        }
        debuggroup = function_6a4e0953fbd5e6bc();
        foreach (group, group_data in level.stealth.hunt_stealth_group_region_sets) {
            if (debuggroup != group && debuggroup != "<unknown string>") {
                continue;
            }
            var_28686396a415964e = [];
            foreach (region in group_data.hunt_regions) {
                /#
                    assert(isdefined(region.approx_location));
                #/
                space = 10;
                count = 0;
                size = 0.5;
                white = (1, 1, 1);
                print3d(region.approx_location - (0, 0, count * space), "<unknown string>" + region.index, white, 1, size);
                count++;
                print3d(region.approx_location - (0, 0, count * space), "<unknown string>" + region.bfs_score, white, 1, size);
                count++;
                print3d(region.approx_location - (0, 0, count * space), "<unknown string>" + region.shared_data.bfs_assigned, white, 1, size);
                count++;
                print3d(region.approx_location - (0, 0, count * space), "<unknown string>" + region.shared_data.in_region, white, 1, size);
                count++;
                print3d(region.approx_location - (0, 0, count * space), "<unknown string>" + region.stealth_group, white, 1, size);
                cooldowndiff = region.shared_data.bfs_cooldown - gettime();
                if (cooldowndiff > 0) {
                    count++;
                    print3d(region.approx_location - (0, 0, count * space), "<unknown string>" + cooldowndiff, white, 1, size);
                }
            }
            foreach (region in group_data.hunt_regions) {
                foreach (link in region.region_links) {
                    toregion = link.region;
                    line(region.approx_location, toregion.approx_location, (0, 0, 0.7), 1, 0, 1);
                }
            }
        }
    #/
}

