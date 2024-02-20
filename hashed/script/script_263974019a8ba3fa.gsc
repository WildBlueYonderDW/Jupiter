// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_dc84b0aa8d501507;

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17b
// Size: 0xd6
function function_39e1cd8a0fce827a(position, dimensions, rot, shape) {
    if (isdefined(level.var_b31733f431ed12e0) && level.var_b31733f431ed12e0.var_209967c144016964 > 1) {
        /#
            assertmsg("Exclusion zones are not supported alongside multi circles");
        #/
        return;
    }
    if (!isdefined(shape)) {
        shape = 2;
    }
    if (!isdefined(rot)) {
        rot = (0, 0, 0);
    }
    for (i = 0; i < 3; i++) {
        if (!isdefined(level.var_bfbde2b8715f6c72) || !isdefined(level.var_bfbde2b8715f6c72[i])) {
            level.var_bfbde2b8715f6c72[i] = function_7d635301465bbed1(position, dimensions, rot, shape);
            return i;
        }
    }
    /#
        assertmsg("Tried to add more exclusion zones than the max: " + 3);
    #/
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x258
// Size: 0x7f
function function_de57b9616f575a63(position, var_72759fb8bd38aa1e) {
    if (!isvector(position)) {
        /#
            assertmsg("Position is not a vector: " + position);
        #/
    }
    if (!isdefined(level.var_bfbde2b8715f6c72)) {
        return -1;
    }
    for (i = 0; i < 3; i++) {
        if (isdefined(level.var_bfbde2b8715f6c72[i])) {
            if (level.var_bfbde2b8715f6c72[i] function_91bf6ad362e62084(position, var_72759fb8bd38aa1e)) {
                return i;
            }
        }
    }
    return -1;
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df
// Size: 0x54
function function_91bf6ad362e62084(position, var_72759fb8bd38aa1e) {
    if (!isvector(position)) {
        /#
            assertmsg("Position is not a vector: " + position);
        #/
    }
    var_d315d8a84c73470 = function_92b7f40b735f689f(self, position);
    return istrue(var_72759fb8bd38aa1e) ? var_d315d8a84c73470 && function_24c5a8d31ae262f(position) : var_d315d8a84c73470;
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33b
// Size: 0x4a
function function_781b540fbee7109a(zone) {
    /#
        assert(isdefined(level.var_bfbde2b8715f6c72));
    #/
    /#
        assert(isdefined(zone));
    #/
    level.var_bfbde2b8715f6c72 = utility::array_remove(level.var_bfbde2b8715f6c72, zone);
    zone delete();
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x38c
// Size: 0x5b
function function_7f267ef8e2210d1d(var_de595808b3e6a948, duration) {
    /#
        assert(isdefined(self));
    #/
    if (duration == 0) {
        self function_7b19792f59d0889d(self.origin, var_de595808b3e6a948, self.angles);
        return;
    }
    /#
        assertex(duration >= 0, "exclusionZone_lerp_dimension_duration duration cannot be negative");
    #/
    thread function_a4b442ebe4020bb(var_de595808b3e6a948, duration);
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ee
// Size: 0x7e
function private function_a4b442ebe4020bb(var_5f6228d3e1d47c7f, duration) {
    starttime = gettime();
    duration = duration * 1000;
    var_8007d36a029de440 = self function_d4828ad77ce1566f();
    while (isdefined(self) && gettime() < starttime + duration) {
        var_de595808b3e6a948 = vectorlerp(var_8007d36a029de440, var_5f6228d3e1d47c7f, (gettime() - starttime) / duration);
        self function_7b19792f59d0889d(self.origin, var_de595808b3e6a948);
        waitframe();
    }
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x473
// Size: 0x5a
function function_ca194605b904c777(var_de595808b3e6a948, rate, linear) {
    /#
        assert(isdefined(self));
    #/
    /#
        assertex(isdefined(rate), "exclusionZone_lerp_dimension_rate rate cannot be undefined");
    #/
    if (rate == 0) {
        self function_7b19792f59d0889d(self.origin, var_de595808b3e6a948);
        return;
    }
    thread function_a4547a6f54ebab99(var_de595808b3e6a948, rate, linear);
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d4
// Size: 0x148
function private function_a4547a6f54ebab99(var_5f6228d3e1d47c7f, rate, linear) {
    var_8007d36a029de440 = self function_d4828ad77ce1566f();
    var_de595808b3e6a948 = var_8007d36a029de440;
    var_e046a46d224708ed = (var_5f6228d3e1d47c7f - var_de595808b3e6a948) * rate;
    var_9b69be5413ef57ba = function_e94027c662b8573b(var_5f6228d3e1d47c7f - var_de595808b3e6a948);
    while (isdefined(self) && !is_equal(var_8007d36a029de440, var_5f6228d3e1d47c7f)) {
        if (!linear) {
            var_de595808b3e6a948 = var_de595808b3e6a948 + (var_5f6228d3e1d47c7f - var_de595808b3e6a948) * rate;
            for (i = 0; i < 3; i++) {
                if (abs(var_5f6228d3e1d47c7f[i] - var_de595808b3e6a948[i]) < abs(var_e046a46d224708ed[i])) {
                    var_de595808b3e6a948 = var_5f6228d3e1d47c7f;
                    continue;
                }
            }
        } else {
            var_de595808b3e6a948 = var_de595808b3e6a948 + rate;
        }
        for (i = 0; i < 3; i++) {
            if (sign(var_5f6228d3e1d47c7f[i] - var_de595808b3e6a948[i]) != var_9b69be5413ef57ba[i]) {
                self function_7b19792f59d0889d(self.origin, var_5f6228d3e1d47c7f, self.angles, level.framedurationseconds);
                return;
            }
        }
        self function_7b19792f59d0889d(self.origin, var_de595808b3e6a948, self.angles, level.framedurationseconds);
        wait(level.framedurationseconds);
        if (isdefined(self)) {
            var_8007d36a029de440 = self function_d4828ad77ce1566f();
        }
    }
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x623
// Size: 0x6
function function_b1eab7c7fda1fb57() {
    /#
    #/
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x630
// Size: 0x5c
function function_14767b88f55e26e0() {
    /#
        foreach (zone in level.var_bfbde2b8715f6c72) {
            function_781b540fbee7109a(zone);
            return;
        }
    #/
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x693
// Size: 0x17
function function_7176642fe2ed10cd(var_72759fb8bd38aa1e) {
    /#
        function_a4c336601037a54c(var_72759fb8bd38aa1e);
    #/
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b1
// Size: 0xc1
function function_afa41ee45eb3172f() {
    /#
        position = (4000, 0, 0);
        dimensions = (50000, 5000, 10000);
        rot = (0, 45, 0);
        shape = 1;
        function_39e1cd8a0fce827a(position, dimensions, rot);
        dimensions = (10000, 1000, 40000);
        position = (5000, 8000, 1500);
        function_39e1cd8a0fce827a(position, dimensions, rot);
        position = (7667, -5561, 1500);
        dimensions = (4000, 4000, 40000);
        function_39e1cd8a0fce827a(position, dimensions, rot, shape);
        level.var_ec780726787e2557 = 1;
    #/
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x779
// Size: 0xc8
function function_a4c336601037a54c(var_72759fb8bd38aa1e) {
    /#
        if (!isdefined(level.var_bfbde2b8715f6c72)) {
            iprintlnbold("<unknown string>");
            return;
        }
        position = level.players[0].origin;
        string = "<unknown string>";
        for (i = 0; i < 3; i++) {
            if (isdefined(level.var_bfbde2b8715f6c72[i])) {
                string = string + i + "<unknown string>" + (level.var_bfbde2b8715f6c72[i] function_91bf6ad362e62084(position, var_72759fb8bd38aa1e) ? "<unknown string>" : "<unknown string>");
            }
        }
        string = string + "<unknown string>" + function_de57b9616f575a63(position, var_72759fb8bd38aa1e);
        iprintlnbold(string);
    #/
}

// Namespace namespace_dc84b0aa8d501507/namespace_1ebea70fc689e6c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x848
// Size: 0x19c
function function_98810970acf573be() {
    /#
        if (istrue(level.var_ec780726787e2557)) {
            position = (4000, 0, 3000);
            dimensions = (10000, 10000, 4000);
            rot = (0, 0, 0);
            level.var_bfbde2b8715f6c72[0] function_7b19792f59d0889d(position, dimensions, rot, 30);
            position = (5000, 0, 2500);
            dimensions = (4000, 50000, 1000);
            level.var_bfbde2b8715f6c72[1] function_7b19792f59d0889d(position, dimensions, rot, 10);
            position = (-5000, 0, 1500);
            dimensions = (1500, 50000, 1000);
            level.var_bfbde2b8715f6c72[2] function_7b19792f59d0889d(position);
            level.var_ec780726787e2557 = 0;
        } else {
            position = (4000, 0, 3000);
            dimensions = (10000, 10000, 4000);
            rot = (0, 0, 0);
            level.var_bfbde2b8715f6c72[0] function_7b19792f59d0889d(position, dimensions, rot, 30);
            dimensions = (1000, 6000, 4000);
            position = (5000, 0, 1500);
            level.var_bfbde2b8715f6c72[1] function_7b19792f59d0889d(position, dimensions, rot, 10);
            position = (-2667, -5561, 1500);
            dimensions = (4000, 4000, 4000);
            level.var_bfbde2b8715f6c72[2] function_7b19792f59d0889d(position, dimensions, rot, 15);
            level.var_ec780726787e2557 = 1;
        }
    #/
}

