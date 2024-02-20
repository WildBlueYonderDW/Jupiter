// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using script_26ccbfe3954cacf4;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_44f4640b93ab1b47;
#using script_4c9bd9a3bf3f8cf7;
#using script_72af5a878a9d3397;
#using script_d74ae0b4aa21186;
#using scripts\mp\bots\bots.gsc;

#namespace namespace_5732e89c0b5a4be4;

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c
// Size: 0x1ba
function function_a955d908f57b75cf() {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("start_combat");
    if (!function_d012729eac1e7053()) {
        wait(getdvarint(@"hash_de394b7049bf2445", 20));
    }
    if (istrue(level.var_7b37b2193f163b9b.var_b871280cbdc11caf)) {
        return;
    }
    var_3af7dc40048a9337 = 0;
    var_ba5e7c3cfb3546a = undefined;
    while (1) {
        var_d012729eac1e7053 = function_d012729eac1e7053();
        var_b582b10663b5b2a9 = function_b2502f3345564abf();
        if (var_d012729eac1e7053) {
            /#
                if (getdvarint(@"hash_70561094fa4e91b5", 0)) {
                    if (isvalidplayer(self)) {
                        var_b582b10663b5b2a9 = 1;
                    }
                }
            #/
            if (!var_b582b10663b5b2a9) {
                activate();
                if (istrue(level.var_7b37b2193f163b9b.var_b871280cbdc11caf)) {
                    break;
                }
                var_ba5e7c3cfb3546a = undefined;
            } else {
                var_5cad1e6f9d962133 = namespace_a36a697bb5de283b::bot_is_in_gas() || namespace_4ad0bd66eaa05ae7::function_296623d26e11725() || isdefined(var_ba5e7c3cfb3546a) && var_ba5e7c3cfb3546a < gettime();
                if (var_5cad1e6f9d962133) {
                    function_54b60e1286f5aefa();
                    var_ba5e7c3cfb3546a = undefined;
                } else if (var_3af7dc40048a9337) {
                    suspend();
                    var_6ef184778caa05c5 = 10000;
                    var_ba5e7c3cfb3546a = gettime() + var_6ef184778caa05c5;
                }
            }
        } else if (var_b582b10663b5b2a9) {
            function_d3638cf9a2da76a("unengaged and range [2D dist = (default), height = (default)] meets for (default) ms and not witnessed");
        }
        msg = waittill_any_in_array_or_timeout([0:"off_navmesh", 1:"death", 2:"dormant_bot_suspending_chance"], 1);
        var_3af7dc40048a9337 = 0;
        if (msg == "off_navmesh") {
            success = namespace_95d8d8ec67e3e074::function_64432af189b8a177(4, 0);
            if (success) {
                return;
            }
        } else if (msg == "dormant_bot_suspending_chance") {
            var_3af7dc40048a9337 = 1;
        }
    }
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d
// Size: 0x221
function function_b2502f3345564abf(var_72fde5447014f573, height, var_b09a01f7b1772edc) {
    if (istrue(level.var_7b37b2193f163b9b.var_b871280cbdc11caf)) {
        return 0;
    }
    if (!isvalidplayer(self)) {
        return 0;
    }
    if (namespace_c50b30148766aa59::function_6f6c5cb39cd095b0()) {
        return 0;
    }
    if (function_5f352fb76c54705c()) {
        return 0;
    }
    curtime = gettime();
    if (!function_c4053e29135c5d27()) {
        self.var_b4adde4c68bb0f24.var_5bca0362e9475b80 = curtime;
        return 0;
    }
    if (!isdefined(var_72fde5447014f573)) {
        dist2d = getdvarint(@"hash_d0dc9e305f43690", 5900);
        var_72fde5447014f573 = dist2d * dist2d;
    }
    if (!isdefined(height)) {
        height = getdvarint(@"hash_68e3358ad64bef77", 5900);
    }
    if (!isdefined(var_b09a01f7b1772edc)) {
        var_b09a01f7b1772edc = getdvarint(@"hash_8f312094be1c23b0", 30000);
    }
    if (var_72fde5447014f573 > 0 && height > 0) {
        foreach (player in level.players) {
            if (isdefined(player) && player.connected && !isbot(player)) {
                if (distance2dsquared(player.origin, self.origin) < var_72fde5447014f573 && abs(player.origin[2] - self.origin[2]) < height) {
                    self.var_b4adde4c68bb0f24.var_5bca0362e9475b80 = curtime;
                    return 0;
                }
            }
        }
    }
    if (!isdefined(self.var_b4adde4c68bb0f24.var_5bca0362e9475b80)) {
        self.var_b4adde4c68bb0f24.var_5bca0362e9475b80 = curtime;
    }
    if (curtime - self.var_b4adde4c68bb0f24.var_5bca0362e9475b80 >= var_b09a01f7b1772edc) {
        if (function_16a5388d4963e316()) {
            self.var_b4adde4c68bb0f24.var_5bca0362e9475b80 = curtime;
        } else {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x646
// Size: 0x3a
function function_89b861aa78808ed8() {
    var_b09a01f7b1772edc = getdvarint(@"hash_8f312094be1c23b0", 30000);
    self.var_b4adde4c68bb0f24.var_5bca0362e9475b80 = gettime() - var_b09a01f7b1772edc;
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x687
// Size: 0xa0
function function_d3638cf9a2da76a(reason) {
    /#
        if (getdvarint(@"hash_d95f6cfac74fa872", 0)) {
            return 0;
        }
    #/
    if (istrue(level.var_7b37b2193f163b9b.var_b871280cbdc11caf)) {
        return 0;
    }
    if (!isdefined(reason)) {
        reason = "unknown reason";
    }
    /#
        println("<unknown string>" + self getentitynumber() + "<unknown string>" + self.name + "<unknown string>" + reason);
    #/
    self.var_b4adde4c68bb0f24.var_c2ad339c4e95c7fe = strtok(reason, " ")[0];
    thread function_b20f2224a6fa748e();
    return 1;
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f
// Size: 0x11
function function_b20f2224a6fa748e() {
    deactivate();
    function_395064ce6c6b6619();
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x747
// Size: 0xa8
function deactivate() {
    if (!function_d012729eac1e7053()) {
        namespace_92443376a63aa4bd::function_b1c37e649a5cd380("dormant");
        function_142b713a2846f9ac("Deactivated - Dormant");
        self.var_b4adde4c68bb0f24.var_d012729eac1e7053 = 1;
        self.var_b4adde4c68bb0f24.var_7197e7fd2adacf43 = gettime();
        namespace_56b9cc3deb6e3f5e::function_5e44c9968544264(0, [0:"Wander", 1:"EscapeGas"]);
        function_2c2b5b435027f895(undefined);
        level.var_7b37b2193f163b9b.var_892fa74a6b549ef0[level.var_7b37b2193f163b9b.var_892fa74a6b549ef0.size] = self;
        level notify("ui_bot_counter_updated");
    }
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f6
// Size: 0x87
function activate() {
    if (function_d012729eac1e7053()) {
        namespace_92443376a63aa4bd::function_b1c37e649a5cd380("active");
        function_142b713a2846f9ac("Activated - Dormant");
        self.var_b4adde4c68bb0f24.var_d012729eac1e7053 = 0;
        namespace_56b9cc3deb6e3f5e::function_5e44c9968544264(1);
        level.var_7b37b2193f163b9b.var_892fa74a6b549ef0 = array_remove(level.var_7b37b2193f163b9b.var_892fa74a6b549ef0, self);
        level notify("ui_bot_counter_updated");
        self notify("dormant_bot_activated");
        function_54b60e1286f5aefa();
    }
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x884
// Size: 0xc1
function function_395064ce6c6b6619() {
    /#
        assert(function_d012729eac1e7053());
    #/
    level endon("game_ended");
    self endon("disconnect");
    self endon("dormant_bot_activated");
    level endon("no_human_alive");
    while (!namespace_95d8d8ec67e3e074::function_a420e0f6eca5f1c6()) {
        slotcount = getdvarint(@"hash_f3a6b99340f5a95f", 20);
        point = function_f7d87293d8dda36();
        if (isdefined(point)) {
            slotcount = function_e3b7c7a52e05ac10(point);
        }
        var_307a1f35ab3c8c7b = level.var_7b37b2193f163b9b.var_156f390a5362bc55.size < slotcount;
        if (var_307a1f35ab3c8c7b && function_44db1017d85b121f()) {
            success = namespace_c50b30148766aa59::function_d3638cf9a2da76a("dormant recycle to ui bot");
            if (success) {
                return;
            }
        }
        wait(1);
    }
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94c
// Size: 0x61
function function_44db1017d85b121f() {
    if (namespace_4ad0bd66eaa05ae7::function_296623d26e11725()) {
        return 0;
    }
    if (function_5f352fb76c54705c()) {
        return 0;
    }
    var_d32939f3a50efd12 = gettime() - self.var_b4adde4c68bb0f24.var_7197e7fd2adacf43 > getdvarint(@"hash_3b0dbf95a91a8233", 30000);
    if (var_d32939f3a50efd12 || namespace_a36a697bb5de283b::bot_is_in_gas()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b5
// Size: 0x17
function issuspended() {
    return istrue(self.var_b4adde4c68bb0f24.issuspended);
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d4
// Size: 0x44
function suspend() {
    if (!issuspended()) {
        self botsetflag("suspended", 1);
        self.var_b4adde4c68bb0f24.issuspended = 1;
        function_142b713a2846f9ac("Deactivated - Dormant(Suspended)");
        self notify("bot_suspended");
    }
}

// Namespace namespace_5732e89c0b5a4be4/namespace_c4ef709c036dc4a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1f
// Size: 0x41
function function_54b60e1286f5aefa() {
    if (issuspended()) {
        self botsetflag("suspended", 0);
        self.var_b4adde4c68bb0f24.issuspended = 0;
        function_142b713a2846f9ac("Deactivated - Dormant");
        namespace_e4a5fcd525f0b19b::bot_restart_think_threads();
    }
}

