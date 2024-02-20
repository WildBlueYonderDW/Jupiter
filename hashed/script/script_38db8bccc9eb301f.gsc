// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using script_6e65833db7358163;
#using script_1feb0785278dafea;
#using script_77cef444e824c23;
#using script_4bb70b1c5860caaa;
#using script_2f988b639fd733;
#using script_3e01f6b89a26a5d9;
#using scripts\mp\supers.gsc;

#namespace field_upgrades;

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d9
// Size: 0xeb
function init() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_a3bc0cc17a8becc7);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_a3bc0cc17a8becc7);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_a3bc0cc17a8becc7);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_a3bc0cc17a8becc7);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_a3bc0cc17a8becc7);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_a3bc0cc17a8becc7);
        function_fe953f000498048f();
    #/
    level.var_762c63041675c851 = &function_f29f48692125dbe5;
    level.onplayerspawncallbacks = function_53c4c53197386572(level.onplayerspawncallbacks, []);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&function_549fe53b0dbd8eb9);
    level.var_f04301db8ca5ecfa = [];
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb
// Size: 0xe
function function_549fe53b0dbd8eb9() {
    self.pausesuperpointsovertime = 1;
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0
// Size: 0xca
function function_e7b6474ebd683537(var_9086f8d586abcdc2, var_bf8ab5d3f72923a8) {
    var_5fd8138e5546872f = getscriptbundle(level.var_7c7b046a6b9536fc);
    foreach (var_ed9ff549fe979ee0 in var_5fd8138e5546872f.var_63b618614d288401) {
        var_9ab60dae428d6472 = var_ed9ff549fe979ee0.ref;
        var_dd792c8e55182d7d = var_ed9ff549fe979ee0.bundle;
        if (isdefined(var_9ab60dae428d6472) && isdefined(var_dd792c8e55182d7d) && var_9ab60dae428d6472 == var_9086f8d586abcdc2) {
            return function_6a36b14e6b79459("super:" + var_dd792c8e55182d7d, var_bf8ab5d3f72923a8);
        }
    }
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1
// Size: 0xe7
function function_f29f48692125dbe5() {
    foreach (var_e9a02c6cae8ee1d8 in level.superglobals.supersbyid) {
        switch (var_e9a02c6cae8ee1d8) {
        case #"hash_d508880fd30faf68":
            namespace_6ac5b64d7fe68733::init();
            break;
        case #"hash_96f27034a876b211":
            namespace_f585f5e438cbdbc8::init();
            break;
        case #"hash_95aa0913ab7d91a0":
            namespace_36cac461fc37e847::init();
            break;
        case #"hash_25d6c8e468976601":
            namespace_f375801da2a1ee3a::init();
            break;
        case #"hash_aa20722d2fc8768c":
            namespace_1eba3ff32243c3bd::init();
            break;
        case #"hash_62554bb1c5b6193e":
            namespace_771aa7cc1ddd631::init();
            break;
        }
    }
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x49f
// Size: 0xca
function function_6e6915563d108662(eventstring, victim, sweapon) {
    player = self;
    if (isplayer(player)) {
        var_5ffe26e8d50879f6 = player namespace_85d036cb78063c4a::getcurrentsuper();
        if (isdefined(var_5ffe26e8d50879f6) && !istrue(var_5ffe26e8d50879f6.isinuse)) {
            var_611cd79750d56d20 = var_5ffe26e8d50879f6.basepoints;
            player namespace_85d036cb78063c4a::givesuperpoints(0, eventstring);
            var_16b01848ed89eab7 = var_5ffe26e8d50879f6.basepoints - var_611cd79750d56d20;
            /#
                iprintlnbold("<unknown string>" + var_5ffe26e8d50879f6.basepoints + "<unknown string>" + var_5ffe26e8d50879f6.staticdata.pointsneeded);
            #/
            return var_16b01848ed89eab7;
        }
    }
    return 0;
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x571
// Size: 0x3c
function function_dabbdf1761a23f5c() {
    var_5ffe26e8d50879f6 = namespace_85d036cb78063c4a::getcurrentsuper();
    var_6344aa9df2107f06 = function_53c4c53197386572(var_5ffe26e8d50879f6.staticdata.var_6344aa9df2107f06, 0);
    return var_6344aa9df2107f06;
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b5
// Size: 0x35
function function_ed72d0f08d00c1c0() {
    super = namespace_85d036cb78063c4a::getcurrentsuper();
    bundle = super.staticdata.bundle;
    return bundle;
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f2
// Size: 0x86
function function_75abcff430ed00b7(weapon_name) {
    self endon("death");
    gestureweapon = makeweapon(weapon_name);
    firetime = gestureweapon.firetime;
    if (!function_2f2713099cb7dd02(weapon_name)) {
        self giveandfireoffhand(gestureweapon);
    }
    wait(firetime);
    self playrumbleonentity("zombie_field_upgrade_wand_fire");
    params = spawnstruct();
    params.weaponname = weapon_name;
    callback::callback("field_upgrade_used", params);
    return 1;
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x680
// Size: 0x6e
function function_2f2713099cb7dd02(weapon_name) {
    switch (weapon_name) {
    case #"hash_2d5e3aea120977e4":
    case #"hash_ad7d698f8bbcd28b":
    case #"hash_b4aacb18bf56174e":
    case #"hash_ba0c9cf2eb888883":
    case #"hash_c69521daa24c2ec0":
    case #"hash_e9f42c97ae3fa950":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace field_upgrades/namespace_e23f629a8349dfaf
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6f5
// Size: 0xb2
function function_a3bc0cc17a8becc7(a_params) {
    /#
        foreach (player in level.players) {
            var_5ffe26e8d50879f6 = player namespace_85d036cb78063c4a::getcurrentsuper();
            if (isdefined(var_5ffe26e8d50879f6)) {
                var_5ffe26e8d50879f6.staticdata.var_6344aa9df2107f06 = int(a_params[0]);
                iprintlnbold("<unknown string>" + var_5ffe26e8d50879f6.staticdata.var_6344aa9df2107f06);
            }
        }
    #/
}

