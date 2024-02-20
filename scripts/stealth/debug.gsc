// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\smartobjects\utility.gsc;

#namespace debug;

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88
// Size: 0x149
function function_ecc7697a5265b9d8() {
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
        while (1) {
            waitframe();
            if (!debug_enabled()) {
                continue;
            }
            function_c98349d49ef496b5();
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

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        while (1) {
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

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36a
// Size: 0xa1
function function_3c165dbd67e4c5aa() {
    /#
        self endon("<unknown string>");
        setdvarifuninitialized(@"hash_67d1d2d65d5da2ab", "<unknown string>");
        while (1) {
            if (debug_enabled()) {
                space = 10;
                count = 0;
                if (ent_flag("<unknown string>")) {
                    print3d(self.origin + (0, 0, count * space * -1), "<unknown string>", (0.2, 1, 0.2), 1, 0.5);
                }
                count++;
                function_d8bd47c53db785c8("<unknown string>");
                waitframe();
            } else {
                wait(1);
            }
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x412
// Size: 0xb2
function function_f545d4a803ca4bd7() {
    /#
        self endon("<unknown string>");
        setdvarifuninitialized(@"hash_9e5e998ddfcc8447", "<unknown string>");
        setdvarifuninitialized(@"hash_a1d5d00556c4bddd", "<unknown string>");
        setdevdvarifuninitialized(@"hash_f9e17cb98b253864", 0);
        while (1) {
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
            } else {
                wait(1);
            }
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cb
// Size: 0x2b
function debug_enabled() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_c5b31ff1b47a0f69", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fd
// Size: 0x15
function function_f1c3d8f46961ed52() {
    /#
        return getdvarint(@"hash_932e9550632df2cb");
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x519
// Size: 0x2b
function function_c1b2391e0af178d() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_9e5e998ddfcc8447", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54b
// Size: 0x2b
function function_d9143f39f30fecf1() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_67d1d2d65d5da2ab", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57d
// Size: 0x2b
function function_ca7435750eb63fe6() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_a1d5d00556c4bddd", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5af
// Size: 0x2b
function function_a8005409dfbcbb79() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_a3c8097b0584ad3c", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e1
// Size: 0x2b
function function_68a6af3bcbe8d474() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_29199fda70b29985", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x613
// Size: 0x2b
function function_4f071e84ae5ccf30() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_d036770ff7a14497", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x645
// Size: 0x2b
function function_79c554909de26a4c() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_f30debd28e3f37e1", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x677
// Size: 0x2b
function function_ff38e8c9a6564c50() {
    /#
        dvar = getunarchiveddebugdvar(@"hash_350b154807f4d745", "<unknown string>");
        return int(dvar);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a9
// Size: 0x1a
function function_6a4e0953fbd5e6bc() {
    /#
        return getunarchiveddebugdvar(@"hash_99b5f3d24be9d6ca", "<unknown string>");
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6ca
// Size: 0x69
function function_5d7b010922ed637d(start, end, color) {
    /#
        num = 3;
        for (i = 0; i < num; i++) {
            start = start + (0, 0, num * 0.05);
            end = end + (0, 0, num * 0.05);
            line(start, end, color);
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x73a
// Size: 0x72
function function_8d6e72a913cd2ec5(start, end, radius, color) {
    /#
        num = 3;
        for (i = 0; i < num; i++) {
            start = start + (0, 0, num * 0.05);
            end = end + (0, 0, num * 0.05);
            cylinder(start, end, radius, color);
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        var_e94b62032a5ae9c3 = "<unknown string>" + actor + "<unknown string>" + msg;
        println(var_e94b62032a5ae9c3);
        if (getdvarint(@"hash_60656e331eb4e226") == 1) {
            thread function_24051a9bda001947(msg);
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
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

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9cf
// Size: 0x30
function function_20367cc98c4d2265(type) {
    /#
        level.stealth.debug.screen[type] = 0;
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        while (1) {
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

// Namespace debug/namespace_91707ccc3e1bf8ff
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

// Namespace debug/namespace_91707ccc3e1bf8ff
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

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        var_d2a2b3b248cc53e6 = 0;
        start = gettime();
        if (!isdefined(self.stealth.var_1e34ae3edc88af3f)) {
            self.stealth.var_1e34ae3edc88af3f = [];
            self.stealth.var_75968050cd6ebe9f = -1;
        }
        self.stealth.var_75968050cd6ebe9f++;
        var_567a970e3a74b89a = self.stealth.var_75968050cd6ebe9f;
        self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a] = offset;
        previd = var_567a970e3a74b89a - 1;
        while (isdefined(self.stealth.var_1e34ae3edc88af3f[previd])) {
            delta = self.stealth.var_1e34ae3edc88af3f[previd][2] - self.stealth.var_1e34ae3edc88af3f[previd + 1][2];
            if (delta >= spacing) {
                break;
            }
            self.stealth.var_1e34ae3edc88af3f[previd] = (self.stealth.var_1e34ae3edc88af3f[previd][0], self.stealth.var_1e34ae3edc88af3f[previd][1], self.stealth.var_1e34ae3edc88af3f[previd + 1][2] + spacing + delta);
            previd = previd - 1;
        }
        draworigin = self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a];
        while (gettime() - start < life * 1000) {
            waitframe();
            if (isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.var_1e34ae3edc88af3f) && isdefined(self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a])) {
                draworigin = self.origin + self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a];
            }
            print3d(draworigin, text, color, alpha, scale, 1);
            draworigin = (draworigin[0], draworigin[1], draworigin[2] + var_d2a2b3b248cc53e6);
            if (isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.var_1e34ae3edc88af3f) && isdefined(self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a])) {
                self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a] = (self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a][0], self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a][1], self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a][2] + var_d2a2b3b248cc53e6);
            }
        }
        if (isdefined(self) && isalive(self) && isdefined(self.stealth) && isdefined(self.stealth.var_1e34ae3edc88af3f) && isdefined(self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a])) {
            self.stealth.var_1e34ae3edc88af3f[var_567a970e3a74b89a] = undefined;
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1052
// Size: 0x170
function function_d8bd47c53db785c8(team, offset) {
    /#
        enemies = getaiarray(team);
        if (team == "<unknown string>") {
            enemies[enemies.size] = level.player;
        }
        yellow = (1, 1, 0);
        green = (0, 1, 0);
        red = (1, 0, 0);
        foreach (enemy in enemies) {
            var_e315754da935ff1a = squared(enemy.maxvisibledist + 200);
            var_bb9eb3489d232302 = squared(enemy.maxvisibledist);
            distsqrd = distancesquared(enemy.origin, self.origin);
            if (distsqrd < var_bb9eb3489d232302) {
                color = red;
            } else if (distsqrd < var_e315754da935ff1a) {
                color = yellow;
            } else {
                color = green;
            }
            line(self.origin, enemy.origin, color);
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
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
                break;
            }
        }
        return 0;
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
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
            var_dcf5e15c58c4152a = "<unknown string>";
            viewpos = level.players[0] getvieworigin();
            scale = utility::function_5a18f19c457e5d1a(self.origin, viewpos, 1200);
            if (scale < 2) {
                size = size * scale;
                space = space * scale;
            }
            if (isdefined(self.agent_type)) {
                var_dcf5e15c58c4152a = var_dcf5e15c58c4152a + "<unknown string>" + self.agent_type;
            }
            if (var_dcf5e15c58c4152a.size > 0) {
                print3d(self.origin - (0, 0, count * space), var_dcf5e15c58c4152a, white, 1, size);
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
            var_329fc0e25cdd3569 = "<unknown string>";
            var_c502bd8f5118f622 = green;
            if (isdefined(self.health)) {
                var_329fc0e25cdd3569 = var_329fc0e25cdd3569 + "<unknown string>" + self.health + "<unknown string>" + self.maxhealth + "<unknown string>";
                var_7003b6562720957e = self.health / self.maxhealth;
                if (var_7003b6562720957e < 0.33) {
                    var_c502bd8f5118f622 = red;
                } else if (var_7003b6562720957e < 0.66) {
                    var_c502bd8f5118f622 = yellow;
                }
                if (isdefined(self.armorhealth)) {
                    var_329fc0e25cdd3569 = var_329fc0e25cdd3569 + "<unknown string>" + self.armorhealth + "<unknown string>";
                }
            }
            if (var_329fc0e25cdd3569.size > 0) {
                print3d(self.origin - (0, 0, count * space), var_329fc0e25cdd3569, var_c502bd8f5118f622, 1, size);
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
                var_94a5745c9566a0a7 = distance(self.origin, viewpos);
                var_ce72f9835ebc188e = var_ce72f9835ebc188e + "<unknown string>" + round(var_94a5745c9566a0a7) + "<unknown string>" + round(var_94a5745c9566a0a7 * self.var_8a783f4c73c2ae91 + self.var_4268b42fc89d0be9, 0.01);
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
                var_865d5ecd4057429f = self.script_aigroup;
                if (isdefined(var_865d5ecd4057429f)) {
                    str_info = str_info + "<unknown string>" + var_865d5ecd4057429f + "<unknown string>";
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

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        var_f34379acba78a66b = "<unknown string>";
        var_ee09899b81df35c0 = namespace_e124d8b75dab4be0::get_patrol_style();
        if (isdefined(var_ee09899b81df35c0)) {
            var_f34379acba78a66b = var_ee09899b81df35c0;
        }
        var_dee4b373f2a46ae9 = "<unknown string>";
        var_9715a843470b3c8b = "<unknown string>";
        var_e0a17bf94350782e = 0;
        pod = function_bc5df124338cefea(self);
        if (isdefined(self.var_fe5ebefa740c7106)) {
            switch (self.var_fe5ebefa740c7106) {
            case 0:
                var_dee4b373f2a46ae9 = "<unknown string>";
                break;
            case 1:
                var_dee4b373f2a46ae9 = "<unknown string>";
                if (isdefined(level.stealth.investigate_volumes[self.script_stealthgroup])) {
                    var_e0a17bf94350782e = 1;
                }
                break;
            case 2:
                var_dee4b373f2a46ae9 = "<unknown string>";
                if (isdefined(level.stealth.hunt_volumes[self.script_stealthgroup])) {
                    var_e0a17bf94350782e = 1;
                }
                var_9715a843470b3c8b = "<unknown string>";
                break;
            case 3:
                var_dee4b373f2a46ae9 = "<unknown string>";
                if (isdefined(level.stealth.combat_volumes[self.script_stealthgroup])) {
                    var_e0a17bf94350782e = 1;
                }
                break;
            }
        }
        print3d(self.origin - (0, 0, count * space), self getentitynumber() + "<unknown string>" + var_dee4b373f2a46ae9 + var_9715a843470b3c8b, white, 1, size);
        count++;
        print3d(self.origin - (0, 0, count * space), "<unknown string>" + var_f34379acba78a66b, white, 1, size);
        count++;
        var_5ccc584607c50ade = "<unknown string>";
        if (isdefined(self.enemy)) {
            var_5ccc584607c50ade = var_5ccc584607c50ade + "<unknown string>" + self.enemy getentitynumber() + "<unknown string>";
        }
        if (var_e0a17bf94350782e) {
            var_5ccc584607c50ade = var_5ccc584607c50ade + "<unknown string>";
        }
        if (var_5ccc584607c50ade.size > 0) {
            print3d(self.origin - (0, 0, count * space), var_5ccc584607c50ade, yellow, 1, size);
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
            for (var_2926a4bbecb9e0fd = 0; var_2926a4bbecb9e0fd < level.players.size; var_2926a4bbecb9e0fd++) {
                ts = self getthreatsight(level.players[var_2926a4bbecb9e0fd]);
                if (ts > 0) {
                    var_e94b62032a5ae9c3 = var_2926a4bbecb9e0fd + "<unknown string>" + ts;
                    if (self cansee(level.players[var_2926a4bbecb9e0fd])) {
                        color = red;
                    } else {
                        color = green;
                    }
                    print3d(self.origin - (0, 0, count * space), var_e94b62032a5ae9c3, color, 1, size);
                    count++;
                }
            }
        }
        if (isdefined(self.shootposoverride)) {
            line(self geteye(), self.shootposoverride, (1, 1, 0));
        }
        var_17afa92512a88a81 = self.origin + (0, 0, 8);
        var_d7e6335331543ce0 = self.origin + (0, 0, 8) + anglestoforward(self.angles) * 36;
        line(var_17afa92512a88a81, var_d7e6335331543ce0, (0, 0, 1));
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d84
// Size: 0x5d
function function_886940100cc17179(baseangles, angle, var_15e473e94288d70b) {
    /#
        if (var_15e473e94288d70b == 0) {
            return anglestoforward(baseangles + (angle, 0, 0));
        } else if (var_15e473e94288d70b == 1) {
            return anglestoforward(baseangles + (0, angle, 0));
        } else if (var_15e473e94288d70b == 2) {
            return anglestoforward(baseangles + (0, 0, angle));
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1de8
// Size: 0xf2
function function_ab68b8f1b9191d70(origin, startangle, endangle, baseangles, var_46f432042b3473d8, var_15e473e94288d70b, var_efe3f96afffe2036, color) {
    /#
        /#
            assert(startangle < endangle);
        #/
        var_c5b03acf3c55a490 = origin + var_46f432042b3473d8 * function_886940100cc17179(baseangles, startangle, var_15e473e94288d70b);
        var_a2a941f9c8c3a410 = var_c5b03acf3c55a490;
        line(origin, var_c5b03acf3c55a490, color);
        angledelta = (endangle - startangle) / var_efe3f96afffe2036;
        for (i = 1; i < var_efe3f96afffe2036 + 1; i++) {
            angle = startangle + angledelta * i;
            var_a2a941f9c8c3a410 = origin + var_46f432042b3473d8 * function_886940100cc17179(baseangles, angle, var_15e473e94288d70b);
            line(var_c5b03acf3c55a490, var_a2a941f9c8c3a410, color);
            var_c5b03acf3c55a490 = var_a2a941f9c8c3a410;
        }
        line(origin, var_a2a941f9c8c3a410, color);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        var_73c53ebba60d01f8 = acos(dot);
        if (isai(self)) {
            var_20d1cf05ad0b07fe = self gettagangles("<unknown string>")[1];
        } else {
            var_20d1cf05ad0b07fe = self gettagangles("<unknown string>")[1];
        }
        viewdist = level.player.maxvisibledist;
        if (isai(self)) {
            start = self gettagorigin("<unknown string>");
        } else {
            start = self gettagorigin("<unknown string>");
        }
        var_8b4c94ee530f045e = 10;
        function_ab68b8f1b9191d70(start, -1 * var_73c53ebba60d01f8, var_73c53ebba60d01f8, (0, var_20d1cf05ad0b07fe, 0), viewdist, 1, var_8b4c94ee530f045e, color);
        if (self.fovcosinez > dot) {
            color = color * 0.5;
            var_3287480b22f63981 = acos(self.fovcosinez);
            var_f6adb3472f6d5f7f = 0;
            function_ab68b8f1b9191d70(start, -1 * var_3287480b22f63981, var_3287480b22f63981, (var_f6adb3472f6d5f7f, var_20d1cf05ad0b07fe, 0), viewdist, 0, var_8b4c94ee530f045e, color);
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
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

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x217a
// Size: 0x271
function function_459a4d528437596() {
    /#
        var_37da5cf398e21053 = 16;
        var_b1af308f96448361 = 30000;
        level.stealth.var_6e359a38f384e170 = [];
        level.stealth.var_78f9cb3724128a61 = 0;
        level.stealth.var_cfee0ec929c863b8 = 0;
        var_69e2bf7730e3c6a = 50;
        var_69e2cf7730e3e9d = 340;
        var_f426174e166cc725 = 20;
        var_2ef25064bff9ed14 = 1.5;
        textcolor = (1, 1, 1);
        var_91e26b8f12169e08 = level.stealth;
        while (1) {
            if (function_a8005409dfbcbb79()) {
                var_3b40392d00a51017 = gettime() - var_b1af308f96448361;
                if (var_91e26b8f12169e08.var_cfee0ec929c863b8 > 0) {
                    cury = var_69e2cf7730e3e9d;
                    curline = var_91e26b8f12169e08.var_78f9cb3724128a61;
                    for (iline = 0; iline < var_91e26b8f12169e08.var_cfee0ec929c863b8; iline++) {
                        if (var_91e26b8f12169e08.var_6e359a38f384e170[curline].time > var_3b40392d00a51017) {
                            text = "<unknown string>";
                            if (isstring(var_91e26b8f12169e08.var_6e359a38f384e170[curline].speaker)) {
                                text = text + var_91e26b8f12169e08.var_6e359a38f384e170[curline].speaker;
                            } else {
                                foreach (speaker in var_91e26b8f12169e08.var_6e359a38f384e170[curline].speaker) {
                                    if (isdefined(speaker)) {
                                        text = text + "<unknown string>" + speaker getentitynumber();
                                    }
                                }
                                var_91e26b8f12169e08.var_6e359a38f384e170[curline].speaker = text;
                            }
                            text = text + "<unknown string>" + var_91e26b8f12169e08.var_6e359a38f384e170[curline].text;
                            printtoscreen2d(var_69e2bf7730e3c6a, cury, text, textcolor, var_2ef25064bff9ed14);
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

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        if (isdefined(stealth.var_6e359a38f384e170[var_82fe7e64cacf7088]) && stealth.var_6e359a38f384e170[var_82fe7e64cacf7088].time == curtime && stealth.var_6e359a38f384e170[var_82fe7e64cacf7088].text == line) {
            stealth.var_6e359a38f384e170[var_82fe7e64cacf7088].speaker[stealth.var_6e359a38f384e170[var_82fe7e64cacf7088].speaker.size] = speaker;
            return;
        }
        s = spawnstruct();
        s.speaker = [0:speaker];
        s.text = line;
        s.time = curtime;
        stealth.var_6e359a38f384e170[var_91fb44e58e12150c] = s;
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

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25af
// Size: 0x225
function function_c98349d49ef496b5() {
    /#
        if (!debug_enabled() || !isdefined(level.stealth) || !isdefined(level.stealth.corpse)) {
            return;
        }
        if (!isdefined(level.fngetcorpsearrayfunc)) {
            return;
        }
        color = (1, 1, 0);
        var_d64a0fcf259a0053 = (0.9, 0, 0);
        corpses = [[ level.fngetcorpsearrayfunc ]]();
        guys = getaiarray("<unknown string>");
        foreach (corpse in corpses) {
            var_a4f5fb62ba3a113b = getcorpseorigin(corpse);
            if (function_3b88420e0790461f(corpse)) {
                continue;
            } else if (function_9d0df1a4b8cf341d(corpse)) {
                print3d(var_a4f5fb62ba3a113b, "<unknown string>");
                continue;
            } else {
                print3d(var_a4f5fb62ba3a113b, "<unknown string>");
            }
            line(corpse.origin, var_a4f5fb62ba3a113b);
            var_dad1e987e6efeaf = function_e3f5cef1ceede64a();
            foreach (guy in guys) {
                if (!isdefined(guy.stealth)) {
                    continue;
                }
                if (guy [[ guy.fnisinstealthcombat ]]()) {
                    continue;
                }
                dist = distancesquared(var_a4f5fb62ba3a113b, guy.origin);
                if (dist < var_dad1e987e6efeaf.detect_distsqrd) {
                    line(guy.origin, var_a4f5fb62ba3a113b, var_d64a0fcf259a0053);
                } else if (dist < var_dad1e987e6efeaf.sight_distsqrd) {
                    line(guy.origin, var_a4f5fb62ba3a113b, color);
                }
            }
        }
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
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

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2864
// Size: 0xc3
function draw_axis(origin, angles, length) {
    /#
        var_996a07fd7388db1c = anglestoaxis(angles);
        forward = var_996a07fd7388db1c["<unknown string>"] * length;
        right = var_996a07fd7388db1c["<unknown string>"] * length;
        up = var_996a07fd7388db1c["<unknown string>"] * length;
        line(origin - forward, origin + forward, (1, 0, 0), 1);
        line(origin - up, origin + up, (0, 1, 0), 1);
        line(origin - right, origin + right, (0, 0, 1), 1);
    #/
}

// Namespace debug/namespace_91707ccc3e1bf8ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x292e
// Size: 0x1f8
function function_df6b11367f42a8e1() {
    /#
        if (!isdefined(anim.smartobjectpoints)) {
            return;
        }
        var_7c3624b8fb212b11 = function_68a6af3bcbe8d474();
        if (var_7c3624b8fb212b11 == 0) {
            return;
        }
        colorgray = (0.7, 0.7, 0.7);
        foreach (obj in anim.smartobjectpoints) {
            angles = (0, 0, 0);
            if (isdefined(obj.angles)) {
                angles = obj.angles;
            }
            draw_axis(obj.origin, angles, 12);
            if (var_7c3624b8fb212b11 == 2) {
                print3d(obj.origin - (0, 0, 12), obj.script_smartobject, colorgray, 1, 0.3, 1);
                objtype = namespace_277f7d3daf8f1a98::getsmartobjecttype(obj.script_smartobject);
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

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        var_17f4654f29b7be4f = function_6a4e0953fbd5e6bc();
        foreach (group, var_ea234e51c7d33a15 in level.stealth.hunt_stealth_group_region_sets) {
            if (var_17f4654f29b7be4f != group && var_17f4654f29b7be4f != "<unknown string>") {
                continue;
            }
            foreach (region in var_ea234e51c7d33a15.hunt_regions) {
                for (i = 1; i < region.route_points.size; i++) {
                    var_cdcced78f516cff9 = region.route_points[i - 1];
                    p1 = region.route_points[i];
                    line(var_cdcced78f516cff9.origin, p1.origin, (0, 0.7, 0), 1, 0, 1);
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

// Namespace debug/namespace_91707ccc3e1bf8ff
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
        var_17f4654f29b7be4f = function_6a4e0953fbd5e6bc();
        foreach (group, var_ea234e51c7d33a15 in level.stealth.hunt_stealth_group_region_sets) {
            if (var_17f4654f29b7be4f != group && var_17f4654f29b7be4f != "<unknown string>") {
                continue;
            }
            var_28686396a415964e = [];
            foreach (region in var_ea234e51c7d33a15.hunt_regions) {
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
                var_f672d0313cf8fcb = region.shared_data.bfs_cooldown - gettime();
                if (var_f672d0313cf8fcb > 0) {
                    count++;
                    print3d(region.approx_location - (0, 0, count * space), "<unknown string>" + var_f672d0313cf8fcb, white, 1, size);
                }
            }
            foreach (region in var_ea234e51c7d33a15.hunt_regions) {
                foreach (link in region.region_links) {
                    var_f60abd21a94383f4 = link.region;
                    line(region.approx_location, var_f60abd21a94383f4.approx_location, (0, 0, 0.7), 1, 0, 1);
                }
            }
        }
    #/
}

