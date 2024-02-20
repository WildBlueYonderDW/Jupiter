// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_6b684505b9959a08;
#using script_5f71ed065b9cea1e;
#using script_4c770a9a4ad7659c;
#using scripts\engine\scriptable.gsc;

#namespace namespace_6d633d94b557096d;

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a
// Size: 0x6a
function function_75e180b08f394748(var_bae6a1d8f73bc001, var_f07d96bc912b9e7b, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    thread function_bba4e34b29ba13f1(var_bae6a1d8f73bc001, var_f07d96bc912b9e7b, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b
// Size: 0x2c
function function_6099c5a2ad80e231(var_90fb64f0224fa64d) {
    if (function_b85bd94f620bff4d(var_90fb64f0224fa64d)) {
        namespace_c4d0d7d42beedd07::function_1c5f030d48fdff4c("Attempted to despawn Managed Reward Cache while it was not allowed to despawn. The Managed Reward Cache will not be despawned.");
        return;
    }
    thread function_b03d531238fefdd6(var_90fb64f0224fa64d);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x43e
// Size: 0x38
function function_b6ffbbaf23178f9b(var_90fb64f0224fa64d, player, var_3b7149d011516405) {
    var_1f72a33e8a69dbbc = function_6a3fb8b0f82a6608(var_90fb64f0224fa64d);
    namespace_c4d0d7d42beedd07::function_fb4fb51dbc0ad916(var_1f72a33e8a69dbbc, player, var_3b7149d011516405);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47d
// Size: 0x2e
function function_805de4f236be02cc(var_90fb64f0224fa64d, player) {
    var_1f72a33e8a69dbbc = function_6a3fb8b0f82a6608(var_90fb64f0224fa64d);
    return namespace_c4d0d7d42beedd07::function_1f4c33cae718bc25(var_1f72a33e8a69dbbc, player);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b3
// Size: 0x41
function function_8b4f7ed65818ac99(var_90fb64f0224fa64d, player, var_f71227aeabe614eb, item) {
    var_1f72a33e8a69dbbc = function_6a3fb8b0f82a6608(var_90fb64f0224fa64d);
    function_77eb3b9f9e4993c6(var_1f72a33e8a69dbbc, player, var_f71227aeabe614eb, item);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fb
// Size: 0x5e
function function_a52e804f95d8ef78(var_90fb64f0224fa64d) {
    if (isdefined(var_90fb64f0224fa64d) && istrue(var_90fb64f0224fa64d.var_c796363b5db0ff3d)) {
        var_90fb64f0224fa64d.var_f6b8ead4a2723464 = 0;
        var_9034903ebbba6749 = namespace_c4d0d7d42beedd07::function_1a020d38f2327a5c(var_90fb64f0224fa64d.var_1f72a33e8a69dbbc);
        function_1c972fc13937297c("Blocking managed reward cache from despawning (" + var_9034903ebbba6749 + ")");
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x560
// Size: 0x79
function function_f1c1ef5a544c2add(var_90fb64f0224fa64d) {
    if (!isdefined(var_90fb64f0224fa64d) || !istrue(var_90fb64f0224fa64d.var_c796363b5db0ff3d)) {
        return;
    }
    if (istrue(var_90fb64f0224fa64d.var_f6b8ead4a2723464)) {
        return;
    }
    var_90fb64f0224fa64d.var_f6b8ead4a2723464 = 1;
    var_90fb64f0224fa64d notify("allow_despawn");
    var_9034903ebbba6749 = namespace_c4d0d7d42beedd07::function_1a020d38f2327a5c(var_90fb64f0224fa64d.var_1f72a33e8a69dbbc);
    function_1c972fc13937297c("Allowing managed reward cache to despawn (" + var_9034903ebbba6749 + ")");
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e0
// Size: 0x39
function function_b85bd94f620bff4d(var_90fb64f0224fa64d) {
    /#
        assert(isdefined(var_90fb64f0224fa64d));
    #/
    /#
        assert(istrue(var_90fb64f0224fa64d.var_c796363b5db0ff3d));
    #/
    return !istrue(var_90fb64f0224fa64d.var_f6b8ead4a2723464);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x621
// Size: 0x1e
function private function_c85912811be68bac(var_90fb64f0224fa64d) {
    if (function_b85bd94f620bff4d(var_90fb64f0224fa64d)) {
        var_90fb64f0224fa64d waittill("allow_despawn");
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x646
// Size: 0x43
function private function_5a390d87abd73ea9(var_90fb64f0224fa64d, durationseconds) {
    var_1f72a33e8a69dbbc = var_90fb64f0224fa64d.var_1f72a33e8a69dbbc;
    var_1f72a33e8a69dbbc endon("despawn");
    function_a52e804f95d8ef78(var_90fb64f0224fa64d);
    wait(durationseconds);
    function_f1c1ef5a544c2add(var_90fb64f0224fa64d);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params a, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x690
// Size: 0x17b
function private function_bba4e34b29ba13f1(var_bae6a1d8f73bc001, var_f07d96bc912b9e7b, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_3c99a2a84c4b850f) {
    if (!function_f9797f263f83b5db()) {
        function_8a1f174dff87026d();
    }
    if (!isdefined(var_bae6a1d8f73bc001) || !isstruct(var_bae6a1d8f73bc001) || !istrue(var_bae6a1d8f73bc001.var_ca97045f00d9e8d1)) {
        function_962000cd2f24f683(var_3c99a2a84c4b850f);
        namespace_c4d0d7d42beedd07::function_e02e37e34dec2042("Could not spawn managed reward cache. Reason: invalid rewardCacheSettings (either undefined or an invalid struct).");
        return;
    }
    if (!isdefined(var_f07d96bc912b9e7b) || !isstruct(var_bae6a1d8f73bc001) || !istrue(var_f07d96bc912b9e7b.var_e87bbb6687a470cb)) {
        function_962000cd2f24f683(var_3c99a2a84c4b850f);
        namespace_c4d0d7d42beedd07::function_e02e37e34dec2042("Could not spawn managed reward cache. Reason: invalid rewardCacheBehaviorSettings (either undefined or an invalid struct).");
        return;
    }
    function_7cf93f546f99ec52(var_bae6a1d8f73bc001, var_f07d96bc912b9e7b);
    var_2ddd9832c99e9ec0 = namespace_81b7e1672a7e54da::function_1390dfbeba11bd06(var_f07d96bc912b9e7b);
    if (var_2ddd9832c99e9ec0 > 0) {
        wait(var_2ddd9832c99e9ec0);
    }
    var_1ef25734ad342445 = var_bae6a1d8f73bc001;
    function_3efd8c5e5178e70f(var_bae6a1d8f73bc001, var_5fd834fd88580734, var_4f7eafafa93f49e5, var_ce0e8fe5ee941ba9, var_5110040e4247ddb8, var_ed118e6dd8c246, var_15fc8e507acc4b19, var_a1bdf2e1fd12ffc, var_1ef25734ad342445);
    var_1f72a33e8a69dbbc = var_1ef25734ad342445 waittill("reward_cache_spawn_done");
    if (!isdefined(var_1f72a33e8a69dbbc)) {
        function_962000cd2f24f683(var_3c99a2a84c4b850f);
        namespace_c4d0d7d42beedd07::function_469b7ea0b94baae6("Could not spawn managed reward cache. Reason: failed to spawn rewardcache. See log for details.");
        return;
    }
    var_90fb64f0224fa64d = function_82dd2c1df451e2d8(var_1f72a33e8a69dbbc, var_f07d96bc912b9e7b);
    function_625a9b76f256ef2c(var_90fb64f0224fa64d);
    function_7351ae1c7acdfe05(var_90fb64f0224fa64d);
    if (isdefined(var_3c99a2a84c4b850f)) {
        var_3c99a2a84c4b850f notify("managed_reward_cache_spawn_done", var_90fb64f0224fa64d);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x812
// Size: 0x94
function private function_82dd2c1df451e2d8(var_1f72a33e8a69dbbc, var_f07d96bc912b9e7b) {
    if (!isdefined(level.var_1b8364c4179a5d0d)) {
        level.var_1b8364c4179a5d0d = 0;
    } else {
        level.var_1b8364c4179a5d0d++;
    }
    var_90fb64f0224fa64d = spawnstruct();
    var_90fb64f0224fa64d.var_1f72a33e8a69dbbc = var_1f72a33e8a69dbbc;
    var_90fb64f0224fa64d.var_37ea7194ab3ca6 = var_f07d96bc912b9e7b;
    var_90fb64f0224fa64d.var_f6b8ead4a2723464 = 1;
    var_90fb64f0224fa64d.id = level.var_1b8364c4179a5d0d;
    var_90fb64f0224fa64d.var_c796363b5db0ff3d = 1;
    return var_90fb64f0224fa64d;
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ae
// Size: 0xd
function private function_f9797f263f83b5db() {
    return isdefined(level.var_28853a1b752a9a5a);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8c3
// Size: 0x3b
function private function_8a1f174dff87026d() {
    level.var_28853a1b752a9a5a = [];
    namespace_7f0bcee5d45a1dea::add("player_connect", &function_e5594507f84bc271);
    namespace_7f0bcee5d45a1dea::add("player_disconnect", &function_db04e6dd6940b0a5);
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&function_706b9cce1dad33e3);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x905
// Size: 0x22
function private function_7351ae1c7acdfe05(var_90fb64f0224fa64d) {
    level.var_28853a1b752a9a5a[level.var_28853a1b752a9a5a.size] = var_90fb64f0224fa64d;
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x92e
// Size: 0x25
function private function_7f5879fa6d0f4644(var_90fb64f0224fa64d) {
    level.var_28853a1b752a9a5a = array_remove(level.var_28853a1b752a9a5a, var_90fb64f0224fa64d);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x95a
// Size: 0x27
function private function_7cf93f546f99ec52(var_bae6a1d8f73bc001, var_f07d96bc912b9e7b) {
    if (namespace_81b7e1672a7e54da::function_7f6409712a4fed0(var_f07d96bc912b9e7b)) {
        namespace_9a8748f9afa48155::function_3a6f51417a1eccbd(var_bae6a1d8f73bc001, 0);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x988
// Size: 0xb7
function private function_625a9b76f256ef2c(var_90fb64f0224fa64d) {
    var_1f72a33e8a69dbbc = var_90fb64f0224fa64d.var_1f72a33e8a69dbbc;
    var_dcbc42d7f8d81f9a = namespace_81b7e1672a7e54da::function_7f6409712a4fed0(var_90fb64f0224fa64d.var_37ea7194ab3ca6);
    if (istrue(var_dcbc42d7f8d81f9a)) {
        foreach (var_c359824d10b7dbd3 in var_1f72a33e8a69dbbc.var_55b52f7bc45800e0) {
            thread function_578fdf854f247ff(var_90fb64f0224fa64d, var_c359824d10b7dbd3);
        }
    }
    thread function_b2335dc4d0d582a4(var_90fb64f0224fa64d);
    thread function_970625a4872d1eb0(var_90fb64f0224fa64d);
    thread function_6069980f5e216bf1(var_90fb64f0224fa64d);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa46
// Size: 0x63
function private function_578fdf854f247ff(var_90fb64f0224fa64d, var_c359824d10b7dbd3) {
    var_1f72a33e8a69dbbc = var_c359824d10b7dbd3.var_81d4f50295d743eb;
    var_1f72a33e8a69dbbc endon("despawn");
    while (1) {
        var_c359824d10b7dbd3 waittill("closed");
        function_c85912811be68bac(var_90fb64f0224fa64d);
        if (function_baba3a8fbc912f3d(var_c359824d10b7dbd3)) {
            namespace_c4d0d7d42beedd07::function_2f75f3a22eb7b56f(var_c359824d10b7dbd3);
        }
        function_3f49eb16e2358fdf(var_90fb64f0224fa64d);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab0
// Size: 0x6e
function private function_b2335dc4d0d582a4(var_90fb64f0224fa64d) {
    var_d9c7c84351cf42df = namespace_81b7e1672a7e54da::function_ac56ad97c1a63439(var_90fb64f0224fa64d.var_37ea7194ab3ca6);
    var_1f72a33e8a69dbbc = var_90fb64f0224fa64d.var_1f72a33e8a69dbbc;
    var_1f72a33e8a69dbbc endon("despawn");
    wait(var_d9c7c84351cf42df);
    function_56af4a69d55d969f(var_90fb64f0224fa64d.var_1f72a33e8a69dbbc, "TIMER EXPIRED");
    function_c85912811be68bac(var_90fb64f0224fa64d);
    function_6099c5a2ad80e231(var_90fb64f0224fa64d);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb25
// Size: 0xac
function private function_970625a4872d1eb0(var_90fb64f0224fa64d) {
    var_1f72a33e8a69dbbc = var_90fb64f0224fa64d.var_1f72a33e8a69dbbc;
    var_1f72a33e8a69dbbc endon("despawn");
    var_30696e731b04d0ba = namespace_81b7e1672a7e54da::function_64fa791e7ba0c5c8(var_90fb64f0224fa64d.var_37ea7194ab3ca6);
    var_31af7bf3df8ad717 = var_30696e731b04d0ba * var_30696e731b04d0ba;
    while (1) {
        function_c85912811be68bac(var_90fb64f0224fa64d);
        var_4f59c6cfbc2800c8 = namespace_c4d0d7d42beedd07::function_f7f1569f0905f7da(var_1f72a33e8a69dbbc);
        if (function_6d1405b0c8e865f9(var_4f59c6cfbc2800c8, namespace_c4d0d7d42beedd07::function_4952f5234b065969(var_1f72a33e8a69dbbc), var_31af7bf3df8ad717)) {
            function_56af4a69d55d969f(var_90fb64f0224fa64d.var_1f72a33e8a69dbbc, "OWNERS TOO FAR");
            function_6099c5a2ad80e231(var_90fb64f0224fa64d);
        }
        wait(3);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbd8
// Size: 0x10b
function private function_6069980f5e216bf1(var_90fb64f0224fa64d) {
    var_1f72a33e8a69dbbc = var_90fb64f0224fa64d.var_1f72a33e8a69dbbc;
    var_1f72a33e8a69dbbc endon("despawn");
    var_9a625ef2dcb8e396 = namespace_81b7e1672a7e54da::function_3ff17248ab8350f3(var_90fb64f0224fa64d.var_37ea7194ab3ca6);
    var_ff2a5c20f11de9f3 = var_9a625ef2dcb8e396 * var_9a625ef2dcb8e396;
    while (1) {
        var_2634bb5a8d1fe266 = 0;
        foreach (player in namespace_c4d0d7d42beedd07::function_b804f364121242d3(var_1f72a33e8a69dbbc)) {
            if (!isplayer(player)) {
                if (!var_2634bb5a8d1fe266) {
                    namespace_c4d0d7d42beedd07::function_e882ec9e31af5ae1(var_1f72a33e8a69dbbc);
                    var_2634bb5a8d1fe266 = 1;
                }
            } else if (distance2dsquared(player.origin, namespace_c4d0d7d42beedd07::function_4952f5234b065969(var_1f72a33e8a69dbbc)) > var_ff2a5c20f11de9f3) {
                namespace_c4d0d7d42beedd07::function_6b2d5732baa26e46(var_1f72a33e8a69dbbc, player);
            } else {
                namespace_c4d0d7d42beedd07::function_6305217aebc3f926(var_1f72a33e8a69dbbc, player);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcea
// Size: 0x6f
function private function_b03d531238fefdd6(var_90fb64f0224fa64d) {
    var_1f72a33e8a69dbbc = var_90fb64f0224fa64d.var_1f72a33e8a69dbbc;
    var_1f72a33e8a69dbbc notify("despawn");
    var_90fb64f0224fa64d notify("managed_reward_cache_despawned");
    var_1f72a33e8a69dbbc endon("despawn");
    var_d99131f23781644f = namespace_81b7e1672a7e54da::function_18ff06d7a702f239(var_90fb64f0224fa64d.var_37ea7194ab3ca6);
    namespace_c4d0d7d42beedd07::function_49baf487775e6ddb(var_1f72a33e8a69dbbc);
    wait(var_d99131f23781644f);
    function_2260bfc08cd754ea(var_1f72a33e8a69dbbc);
    function_7f5879fa6d0f4644(var_90fb64f0224fa64d);
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd60
// Size: 0x4b
function private function_6a3fb8b0f82a6608(var_9162f7d6d0e432bd) {
    if (!isstruct(var_9162f7d6d0e432bd)) {
        return undefined;
    }
    if (istrue(var_9162f7d6d0e432bd.var_b8039209fb3f728c)) {
        return var_9162f7d6d0e432bd;
    } else if (istrue(var_9162f7d6d0e432bd.var_c796363b5db0ff3d)) {
        return var_9162f7d6d0e432bd.var_1f72a33e8a69dbbc;
    } else {
        return undefined;
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb2
// Size: 0x3f
function private function_3f49eb16e2358fdf(var_90fb64f0224fa64d) {
    if (namespace_c4d0d7d42beedd07::isempty(var_90fb64f0224fa64d.var_1f72a33e8a69dbbc)) {
        function_56af4a69d55d969f(var_90fb64f0224fa64d.var_1f72a33e8a69dbbc, "CLOSED WHILE EMPTY");
        function_6099c5a2ad80e231(var_90fb64f0224fa64d);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdf8
// Size: 0x7f
function private function_e5594507f84bc271(params) {
    var_3772b8e200b65881 = self;
    foreach (var_90fb64f0224fa64d in function_53c4c53197386572(level.var_28853a1b752a9a5a, [])) {
        function_e94f3e14a7107b53(var_90fb64f0224fa64d.var_1f72a33e8a69dbbc, var_3772b8e200b65881);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe7e
// Size: 0x7f
function private function_db04e6dd6940b0a5(params) {
    var_94b7bfcf2a39a22f = self;
    foreach (var_90fb64f0224fa64d in function_53c4c53197386572(level.var_28853a1b752a9a5a, [])) {
        function_511d55926d101fd1(var_90fb64f0224fa64d.var_1f72a33e8a69dbbc, var_94b7bfcf2a39a22f);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf04
// Size: 0x1a
function private function_962000cd2f24f683(var_26a8fe3c4a4bc8ae) {
    if (isdefined(var_26a8fe3c4a4bc8ae)) {
        var_26a8fe3c4a4bc8ae notify("managed_reward_cache_spawn_done", undefined);
    }
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf25
// Size: 0x85
function private function_6d1405b0c8e865f9(players, origin, var_f5499c708b0be15f) {
    foreach (player in players) {
        if (isplayer(player) && distance2dsquared(player.origin, origin) <= var_f5499c708b0be15f) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_6d633d94b557096d/namespace_6c3b1ce1e63f8038
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfb2
// Size: 0x87
function private function_56af4a69d55d969f(var_1f72a33e8a69dbbc, var_6e62e08e9e75ee4c) {
    if (istrue(getdvarint(@"hash_c81336f4624077f5", 0))) {
        return;
    }
    var_f1126f87cbfb3910 = !istrue(getdvarint(@"hash_6d8a08730dfb4052", 0));
    var_4783e9093fa91a4 = function_1a020d38f2327a5c(var_1f72a33e8a69dbbc, var_f1126f87cbfb3910);
    prefix = "Despawned ";
    if (isdefined(var_6e62e08e9e75ee4c)) {
        prefix = prefix + "for reason (" + var_6e62e08e9e75ee4c + ") ";
    }
    function_1c972fc13937297c(prefix + var_4783e9093fa91a4);
}

