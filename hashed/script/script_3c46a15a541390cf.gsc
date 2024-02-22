// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_2d9d24f7c63ac143;
#using script_367c2e5a914658d7;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace br_multi_circle;

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x977
// Size: 0xbe
function init() {
    if (getdvarint(@"hash_bd987ce7239ab732", 0) == 0) {
        return;
    }
    logstring("br_multi_circle::init");
    if (getdvarint(@"hash_5bd161f5b9367829", 0) != 0) {
        namespace_71073fa38f11492::enablefeature("circleEarlyStart");
    }
    game["dialog"]["circle_split"] = "gmst_wzan_crsp";
    game["dialog"]["circle_merge"] = "gmst_wzan_crmr";
    game["dialog"]["circle_victory"] = "gmst_wzan_crsv";
    function_ccacfdcc7aa6b6d7();
    function_21ffe8d91278bbaa();
    if (getdvarint(@"hash_f4a50b0871efa9e9", 1) != 0) {
        namespace_c5622898120e827f::function_eca79fa0f341ee08(12, undefined, undefined, undefined, &function_cee78f828e373996);
    }
    level.var_80c1e8e18146024f = &function_fea1e6f98afb74f4;
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3c
// Size: 0x276
function function_ccacfdcc7aa6b6d7() {
    level.br_circle.var_bf394857229861a5 = &function_1b21de2360beaff;
    level.var_2df69b8e552238b6 = 1;
    level.br_multi_circle = spawnstruct();
    level.br_multi_circle.var_209967c144016964 = getdvarint(@"hash_db9e0a9d41057bae", 1);
    level.br_multi_circle.var_8a10c39962f6d9fd = getdvarint(@"hash_c87134a23557be72", 1);
    level.br_multi_circle.var_c22567ed8cfe3761 = getdvarint(@"hash_638da851601ca79a", 1);
    level.br_multi_circle.var_dfc65f80af9670de = getdvarfloat(@"hash_8e7ef4c30d5b5a55", 0);
    level.br_multi_circle.var_117e933d19f2c221 = getdvarint(@"hash_4e2f0d19a2f755ee", 1);
    level.br_multi_circle.var_7cee15a31694177c = getdvarint(@"hash_dc93c4d0bfb9cf05", 1);
    level.br_multi_circle.var_28da030377a08f4a = getdvarint(@"hash_8382dae948fa600f", 1);
    level.br_multi_circle.var_bc58018f3e4a64cc = getdvarfloat(@"hash_9e74a59c2151d0a", 0.5);
    level.br_multi_circle.var_2e5bb265e73e668a = getdvarfloat(@"hash_e87e2d1053dae898", 0.5);
    level.br_multi_circle.var_9539818567fb5ec4 = getdvarfloat(@"hash_904276ad1475566a", 1);
    level.br_multi_circle.var_46e6e2faf04b1dd8 = getdvarfloat(@"hash_389468ee25ff1dd2", 2);
    level.br_multi_circle.var_4fb3372df7d3fcb0 = getdvarfloat(@"hash_5d8995f6d065bc6", 0.5);
    level.br_multi_circle.var_f3ea1a173901b831 = getdvarint(@"hash_744515d8c05e3243", 1);
    level.br_multi_circle.var_c73cd3ac9dde962f = getdvarint(@"hash_c8f6fbc981b7f489", 0);
    level.br_multi_circle.var_2c70dc5ef86d8ceb = getdvarint(@"hash_317adf8ca39c83ae", 0);
    level.br_multi_circle.configs = [];
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb9
// Size: 0x118
function function_21ffe8d91278bbaa() {
    if (getdvarint(@"hash_56bf37e58750811d", 0)) {
        return;
    }
    logstring("br_multi_circle::initMultiCircleConfigData");
    var_592732704eec44a = getdvar(@"hash_8be0f964d36b6d6a", "jup_multicircleconfig_list");
    var_f6684ac355c9345d = getscriptbundle("multicircleconfiglist:" + var_592732704eec44a);
    /#
        assertex(isdefined(var_f6684ac355c9345d), "Could not load multicircle script bundle config list:" + var_592732704eec44a);
    #/
    if (isdefined(var_f6684ac355c9345d)) {
        foreach (entry in var_f6684ac355c9345d.var_204bc53a09c2fac) {
            var_f5b9225aa3d3bc58 = "multicircleconfig:" + entry.config;
            config = getscriptbundle(var_f5b9225aa3d3bc58);
            /#
                assertex(isdefined(config), "Could not load multicircle script bundle config:" + var_f5b9225aa3d3bc58);
            #/
            if (isdefined(config)) {
                function_d0fdd965ed982f8f(config);
            }
        }
    }
    function_862a4b386242e67b();
    function_f92da29572a7dc78();
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd8
// Size: 0x2a
function function_f92da29572a7dc78() {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return;
    }
    config = function_3ae1773696ab9337();
    function_8ff39b7a49d2bd92(config);
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe09
// Size: 0x32d
function function_d0fdd965ed982f8f(cfg) {
    /#
        assertex(isdefined(cfg.var_f5b9225aa3d3bc58), "Undefined Multicircle config name.");
    #/
    var_cf3800024083abbe = undefined;
    if (isdefined(cfg.var_7c6a99996a5e4a78) && cfg.var_7c6a99996a5e4a78.size > 0) {
        /#
            assertex(isarray(cfg.var_7c6a99996a5e4a78) && cfg.var_c22567ed8cfe3761 - cfg.var_8a10c39962f6d9fd + 1 == cfg.var_7c6a99996a5e4a78.size, "Invalid Multicircle config. Circle radii size must cover [ split -> merge ].");
        #/
        var_cf3800024083abbe = [];
        for (i = 0; i < cfg.var_7c6a99996a5e4a78.size; i++) {
            var_cf3800024083abbe[var_cf3800024083abbe.size] = cfg.var_7c6a99996a5e4a78[i].radius;
        }
    }
    var_48380029fbb1007a = spawnstruct();
    var_48380029fbb1007a.name = function_53c4c53197386572(cfg.var_f5b9225aa3d3bc58, "");
    var_48380029fbb1007a.weight = function_53c4c53197386572(cfg.weight, 0);
    var_48380029fbb1007a.var_209967c144016964 = cfg.var_209967c144016964;
    var_48380029fbb1007a.var_8a10c39962f6d9fd = cfg.var_8a10c39962f6d9fd;
    var_48380029fbb1007a.var_c22567ed8cfe3761 = cfg.var_c22567ed8cfe3761;
    var_48380029fbb1007a.var_117e933d19f2c221 = function_53c4c53197386572(cfg.var_117e933d19f2c221, 0);
    var_48380029fbb1007a.var_7cee15a31694177c = function_53c4c53197386572(cfg.var_7cee15a31694177c, 0);
    var_48380029fbb1007a.var_28da030377a08f4a = function_53c4c53197386572(cfg.var_28da030377a08f4a, 0);
    var_48380029fbb1007a.var_bc58018f3e4a64cc = function_53c4c53197386572(cfg.var_d49d3b793f0995e, 0);
    var_48380029fbb1007a.var_2e5bb265e73e668a = function_53c4c53197386572(cfg.var_80380656e112cb14, 0);
    var_48380029fbb1007a.var_672d4686b7455eb8 = function_53c4c53197386572(cfg.var_9b248840395c2a72, 0);
    var_48380029fbb1007a.var_f4b1f848582fbe3e = function_53c4c53197386572(cfg.var_13ab99b2a8cf8eb0, 0);
    var_48380029fbb1007a.var_9539818567fb5ec4 = function_53c4c53197386572(cfg.var_9539818567fb5ec4, 0);
    var_48380029fbb1007a.var_46e6e2faf04b1dd8 = function_53c4c53197386572(cfg.var_46e6e2faf04b1dd8, 0);
    var_48380029fbb1007a.var_4fb3372df7d3fcb0 = function_53c4c53197386572(cfg.var_4fb3372df7d3fcb0, 0);
    var_48380029fbb1007a.var_cf3800024083abbe = var_cf3800024083abbe;
    var_48380029fbb1007a.var_b4debdc14c4f2a53 = function_53c4c53197386572(cfg.var_b4debdc14c4f2a53, 0);
    var_48380029fbb1007a.var_fc8abdeeac961e8c = function_53c4c53197386572(cfg.var_fc8abdeeac961e8c, 0);
    level.br_multi_circle.configs[var_48380029fbb1007a.name] = var_48380029fbb1007a;
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113d
// Size: 0x1ee
function function_862a4b386242e67b() {
    foreach (config in level.br_multi_circle.configs) {
        var_de20025c62a6ebb9 = getdvarfloat(function_2ef675c13ca1c4af(@"hash_11299b6aac0cc23e", config.name, "_first_circle"), -2);
        if (var_de20025c62a6ebb9 > -2) {
            var_de20025c62a6ebb9 = clamp(var_de20025c62a6ebb9, -1, 1);
            config.var_fc8abdeeac961e8c = var_de20025c62a6ebb9;
        }
    }
    var_161626a430526f7d = getdvar(@"hash_a963ed27ec05a745", "");
    if (var_161626a430526f7d != "" && isdefined(level.br_multi_circle.configs[var_161626a430526f7d])) {
        level.br_multi_circle.var_161626a430526f7d = var_161626a430526f7d;
        return;
    }
    var_a0634e394fa7ae94 = [];
    foreach (config in level.br_multi_circle.configs) {
        var_f8ae147109a2c415 = getdvarfloat(function_2ef675c13ca1c4af(@"hash_11299b6aac0cc23e", config.name, "_weight"), -1);
        if (var_f8ae147109a2c415 >= 0) {
            config.weight = var_f8ae147109a2c415;
        }
        if (config.weight <= 0) {
            continue;
        }
        var_a0634e394fa7ae94[config.name] = config;
    }
    level.br_multi_circle.configs = var_a0634e394fa7ae94;
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1332
// Size: 0x142
function function_3ae1773696ab9337() {
    if (isdefined(level.br_multi_circle.var_161626a430526f7d)) {
        return level.br_multi_circle.configs[level.br_multi_circle.var_161626a430526f7d];
    }
    var_c35d9f1adc6b131f = 0;
    foreach (config in level.br_multi_circle.configs) {
        var_c35d9f1adc6b131f = var_c35d9f1adc6b131f + config.weight;
    }
    var_f3fd55934af8f5d1 = randomfloat(var_c35d9f1adc6b131f);
    var_6c7baf3a3eb2576d = 0;
    foreach (config in level.br_multi_circle.configs) {
        var_6c7baf3a3eb2576d = var_6c7baf3a3eb2576d + config.weight;
        if (var_f3fd55934af8f5d1 <= var_6c7baf3a3eb2576d) {
            return config;
        }
    }
    return undefined;
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147c
// Size: 0x2e9
function function_8ff39b7a49d2bd92(config) {
    if (!isdefined(config)) {
        return;
    }
    level.br_multi_circle.config = config;
    level.br_multi_circle.var_209967c144016964 = config.var_209967c144016964;
    level.br_multi_circle.var_8a10c39962f6d9fd = config.var_8a10c39962f6d9fd;
    level.br_multi_circle.var_c22567ed8cfe3761 = config.var_c22567ed8cfe3761;
    level.br_multi_circle.var_117e933d19f2c221 = config.var_117e933d19f2c221;
    level.br_multi_circle.var_7cee15a31694177c = config.var_7cee15a31694177c;
    level.br_multi_circle.var_28da030377a08f4a = config.var_28da030377a08f4a;
    level.br_multi_circle.var_bc58018f3e4a64cc = config.var_bc58018f3e4a64cc;
    level.br_multi_circle.var_2e5bb265e73e668a = config.var_2e5bb265e73e668a;
    level.br_multi_circle.var_672d4686b7455eb8 = config.var_672d4686b7455eb8;
    level.br_multi_circle.var_f4b1f848582fbe3e = config.var_f4b1f848582fbe3e;
    level.br_multi_circle.var_9539818567fb5ec4 = config.var_9539818567fb5ec4;
    level.br_multi_circle.var_46e6e2faf04b1dd8 = config.var_46e6e2faf04b1dd8;
    level.br_multi_circle.var_4fb3372df7d3fcb0 = config.var_4fb3372df7d3fcb0;
    level.br_multi_circle.var_e60bfc21d3dced49 = undefined;
    logstring("br_multi_circle::applyMultiCircleConfig -> name=" + config.name + " count=" + config.var_209967c144016964 + " split=" + config.var_8a10c39962f6d9fd + " merge=" + config.var_c22567ed8cfe3761);
    if (!isdefined(config.createfunc)) {
        if (getdvarint(@"hash_dd0bab5c26cb2240", 1) == 1) {
            setdvar(@"hash_14f6d33e8f4f0c84", config.var_fc8abdeeac961e8c);
        }
        level.br_multi_circle.var_e60bfc21d3dced49 = config.var_b4debdc14c4f2a53;
        if (isdefined(config.var_8a10c39962f6d9fd) && isdefined(config.var_cf3800024083abbe)) {
            for (i = 0; i < config.var_cf3800024083abbe.size; i++) {
                level.br_level.br_circleradii[config.var_8a10c39962f6d9fd + i] = config.var_cf3800024083abbe[i];
            }
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176c
// Size: 0x79
function function_598312eb02c8eb61() {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return;
    }
    function_b0f5ee01693ab2fd();
    function_d12a7c7251710cbf();
    config = level.br_multi_circle.config;
    if (isdefined(config) && isdefined(config.createfunc)) {
        function_99b71c1ba0ed78b5();
        [[ config.createfunc ]]();
    } else {
        function_e71987651701448a();
    }
    level notify("calc_circle_centers");
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ec
// Size: 0x99
function function_1b21de2360beaff(circleindex) {
    var_9bedd0ecb39838d6 = 0;
    var_d6bac3bf0f64d280 = 1;
    if (!function_49411683f5a51daa(circleindex)) {
        if (isdefined(level.br_multi_circle.var_672d4686b7455eb8)) {
            var_9bedd0ecb39838d6 = level.br_multi_circle.var_672d4686b7455eb8;
        }
        if (isdefined(level.br_multi_circle.var_f4b1f848582fbe3e)) {
            var_d6bac3bf0f64d280 = level.br_multi_circle.var_f4b1f848582fbe3e;
        }
    }
    return [0:var_9bedd0ecb39838d6, 1:var_d6bac3bf0f64d280];
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188d
// Size: 0x14f
function function_fea1e6f98afb74f4(var_7b6d5db8cb3c5782) {
    if (!istrue(level.var_2df69b8e552238b6)) {
        return;
    }
    function_ebfd46aa8754608();
    function_74c4ed830065b00c();
    level thread function_c6ca870b4cdff7d();
    if (istrue(var_7b6d5db8cb3c5782) && !namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart")) {
        level waittill("infils_ready");
    }
    if (istrue(level.usegulag)) {
        namespace_47fd1e79a44628cd::setupgulagtimer();
    }
    level thread function_4c7e6f6847607c99();
    level thread function_5d02313c7d7c9d62();
    level thread function_d00dee714982522b();
    level thread function_70dab1712e13880c();
    level thread stopcirclesatgameend();
    level.br_circle.var_5b8569581e64d55a = gettime();
    if (isdefined(level.br_level.br_circledelaytimes)) {
        for (i = 0; i < level.br_level.br_circledelaytimes.size; i++) {
            function_2d74067acccaf1a4(i);
        }
    }
    if (isdefined(level.var_20f62868a14ab570)) {
        foreach (callback in level.var_20f62868a14ab570) {
            [[ callback ]]();
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e3
// Size: 0xb80
function function_2d74067acccaf1a4(circleindex) {
    level endon("game_ended");
    level endon("br_ending_start");
    /#
        function_673b160b18fe0611();
    #/
    if (istrue(namespace_71073fa38f11492::runbrgametypefunc("circleTimer", circleindex))) {
        return;
    }
    level.br_circle.starttime = gettime();
    level.br_circle.circleindex = circleindex;
    var_f007ce073dc3c519 = circleindex == 0;
    var_6b890e6be7982efb = circleindex == level.br_level.br_circleclosetimes.size - 1;
    var_f2e5f195d91a8b4f = circleindex + 1 == level.br_multi_circle.var_8a10c39962f6d9fd;
    var_96ca8e35a7b219e3 = circleindex + 1 == level.br_multi_circle.var_c22567ed8cfe3761;
    var_4767c01df2fb3334 = function_6249dca788e0dff0();
    if (isdefined(var_4767c01df2fb3334)) {
        var_de3d7eab92efbdeb = var_4767c01df2fb3334 - 1;
        var_ce33e17e41f5adf4 = getdvarint(@"hash_a72502fd7665f68a", 0);
        if (circleindex == var_de3d7eab92efbdeb) {
            callback::callback("on_circle_attach_to_train_pre");
        }
        if (circleindex == var_4767c01df2fb3334) {
            callback::callback("on_circle_attach_to_train");
        }
        var_582678f2774a4c82 = function_d6f728b66bd3966(circleindex);
        var_8cdf8ec86507d0dc = var_ce33e17e41f5adf4 && circleindex == var_de3d7eab92efbdeb;
    } else {
        var_582678f2774a4c82 = 0;
        var_8cdf8ec86507d0dc = 0;
    }
    var_c3d4caa5cb4132e6 = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    var_154ef61b7a7f747a = level.br_level.br_circleradii[circleindex + 1];
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        if (function_fc0f865ddcf551ad()) {
            setomnvar("ui_br_circle_num", circleindex);
        } else {
            setomnvar("ui_br_circle_num", circleindex + 1);
        }
    }
    thread namespace_47fd1e79a44628cd::circletimer(circleindex);
    namespace_71073fa38f11492::runbrgametypefunc("circleTimerNext", circleindex);
    /#
        assertex(isdefined(level.br_level.br_circleminimapradii[circleindex]), "Minimap radius not defined for circle " + circleindex + "! Make sure you have defined level.br_level.br_circleMinimapRadii[] in the map's init().");
    #/
    level thread br_lerp_minimap_zoom(circleindex);
    var_5a6e343a8574af81 = level.br_level.br_circlecenters[circleindex + 1];
    level.br_circle.centertarget = var_5a6e343a8574af81;
    multicirclecount = function_d987886bb9de9137();
    if (function_e32a50f37301a6ab()) {
        function_f9b131d3d6eae27d(multicirclecount, var_6b890e6be7982efb);
    }
    function_2f4fb0777ebb4cc0();
    cleanupoutercrates();
    function_878eaeed15433716();
    var_ac6a89d630fa8dee = [];
    for (i = 0; i < multicirclecount; i++) {
        centertarget = level.br_multi_circle.circles[i].var_8ae269616d09dfc5[circleindex + 1];
        var_ac6a89d630fa8dee[i] = centertarget;
        var_2dcf644323bdfedb = level.br_multi_circle.circles[i].var_3ff449a8eec1b966;
        if (var_582678f2774a4c82) {
            var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin = (var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin[0], var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin[1], var_154ef61b7a7f747a);
        } else {
            var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin = (centertarget[0], centertarget[1], var_154ef61b7a7f747a);
        }
    }
    if (getdvarint(@"hash_ee18596487fa7230", 0)) {
        namespace_bbc79db4c3949a5c::function_57f3fd16b628c829(circleindex);
    }
    var_dc59f76c34681ede = (var_f2e5f195d91a8b4f || var_96ca8e35a7b219e3) && multicirclecount != 1;
    level thread startuiclosetimer(var_c3d4caa5cb4132e6, var_f007ce073dc3c519, var_6b890e6be7982efb, circleindex, var_dc59f76c34681ede);
    for (i = 0; i < multicirclecount; i++) {
        var_2dcf644323bdfedb = level.br_multi_circle.circles[i].var_3ff449a8eec1b966;
        var_2dcf644323bdfedb.var_ddeec615921cc88c.origin = var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin;
        if (var_8cdf8ec86507d0dc) {
            var_2dcf644323bdfedb.var_58308f5095b6080e.origin = (var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin[0], var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin[1], var_154ef61b7a7f747a);
        } else {
            var_2dcf644323bdfedb.var_58308f5095b6080e.origin = var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin;
        }
    }
    waitframe();
    for (i = 0; i < multicirclecount; i++) {
        var_2dcf644323bdfedb = level.br_multi_circle.circles[i].var_3ff449a8eec1b966;
        function_1139f778f794ff98(var_2dcf644323bdfedb.var_46870b6fa8ad4427, var_2dcf644323bdfedb.var_58308f5095b6080e, var_2dcf644323bdfedb.var_ddeec615921cc88c, var_c3d4caa5cb4132e6, var_6b890e6be7982efb);
    }
    namespace_bbc79db4c3949a5c::function_47759b7ed0818a3f(circleindex, var_f007ce073dc3c519);
    if (multicirclecount != 1 && !var_f007ce073dc3c519) {
        level thread function_9bb9abf5fd67056a(circleindex + 1, 1);
    }
    if (istrue(level.usegulag)) {
        level thread namespace_47fd1e79a44628cd::transitioncircle(var_154ef61b7a7f747a, var_c3d4caa5cb4132e6);
    }
    if (isdefined(level.br_level.var_572a1674797a9fa8) && isdefined(level.br_level.var_572a1674797a9fa8[circleindex])) {
        if (issharedfuncdefined("br_movingtrain", "changeCargoTrainSpeed")) {
            var_bf35557ed9dfccca = getsharedfunc("br_movingtrain", "changeCargoTrainSpeed");
            thread [[ var_bf35557ed9dfccca ]](level.br_level.var_572a1674797a9fa8[circleindex], level.br_level.var_564911cbc1774914);
        } else {
            /#
                assertmsg("Cannot set train speed: Missing shared function!");
            #/
        }
    }
    level notify("br_circle_set");
    if (var_f2e5f195d91a8b4f) {
        level notify("multi_circle_show_split");
    } else if (var_96ca8e35a7b219e3) {
        level notify("multi_circle_show_merge");
    }
    for (i = 0; i < multicirclecount; i++) {
        var_2dcf644323bdfedb = level.br_multi_circle.circles[i].var_3ff449a8eec1b966;
        if (var_582678f2774a4c82) {
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_46870b6fa8ad4427);
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_ddeec615921cc88c);
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_933b2a39ebfd2ad9);
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_58308f5095b6080e);
        } else if (var_8cdf8ec86507d0dc) {
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_58308f5095b6080e);
        }
    }
    wait(var_c3d4caa5cb4132e6);
    level notify("stop_circle_track_train");
    if (function_e32a50f37301a6ab()) {
        function_f9b131d3d6eae27d(multicirclecount, var_6b890e6be7982efb);
    }
    function_2f4fb0777ebb4cc0();
    if (multicirclecount > 1) {
        if (circleindex + 1 == level.br_multi_circle.var_8a10c39962f6d9fd) {
            level notify("multi_circle_split");
            namespace_a011fbf6d93f25e5::function_14099f0f07c09e69(gettime());
        } else if (circleindex + 1 == level.br_multi_circle.var_c22567ed8cfe3761) {
            var_c00a2e62499631e9 = function_59d0ab7e24248ad7();
            var_4b6b489dae052a24 = var_c00a2e62499631e9[1];
            playercounts = var_c00a2e62499631e9[0];
            namespace_a011fbf6d93f25e5::function_77c1c837c38efa21(gettime(), playercounts, var_4b6b489dae052a24);
        }
    }
    level notify("br_circle_started");
    level.circleclosing = 1;
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        setomnvar("ui_hardpoint_timer", gettime() + int(closetime * 1000));
    }
    namespace_bbc79db4c3949a5c::function_8d09229c08abd549(circleindex, var_6b890e6be7982efb);
    if (multicirclecount != 1) {
        level thread function_9bb9abf5fd67056a(circleindex + 1, 0);
    }
    for (i = 0; i < multicirclecount; i++) {
        var_2dcf644323bdfedb = level.br_multi_circle.circles[i].var_3ff449a8eec1b966;
        var_2dcf644323bdfedb.var_58308f5095b6080e.origin = var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin;
        var_2dcf644323bdfedb.var_ddeec615921cc88c.origin = var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin;
        function_898ca8fcdf7d6479(var_2dcf644323bdfedb.var_46870b6fa8ad4427, var_2dcf644323bdfedb.var_58308f5095b6080e, var_2dcf644323bdfedb.var_ddeec615921cc88c, var_2dcf644323bdfedb.var_933b2a39ebfd2ad9, int(closetime), var_6b890e6be7982efb);
        if (var_582678f2774a4c82) {
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_46870b6fa8ad4427, var_154ef61b7a7f747a, closetime);
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_ddeec615921cc88c);
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_933b2a39ebfd2ad9);
            level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_58308f5095b6080e);
        } else {
            var_2dcf644323bdfedb.var_46870b6fa8ad4427 brcirclemoveto(var_ac6a89d630fa8dee[i][0], var_ac6a89d630fa8dee[i][1], var_154ef61b7a7f747a, closetime);
            if (var_8cdf8ec86507d0dc) {
                level thread function_111ebdee65ef6d36(var_2dcf644323bdfedb.var_58308f5095b6080e);
            }
        }
    }
    var_e499790b0786eb88 = !istrue(level.br_circle.var_a0d948a339eee04) && !(isdefined(level.isstandardsandbox) && !level.isstandardsandbox);
    if (var_e499790b0786eb88) {
        level thread namespace_3bde6869e44a2770::function_a486df26072a530a(level.br_circle.circleindex, level.br_level.br_circleclosetimes.size, 0.4);
    }
    wait(closetime);
    level notify("stop_circle_track_train");
    if (function_e32a50f37301a6ab()) {
        function_f9b131d3d6eae27d(multicirclecount, var_6b890e6be7982efb);
    }
    function_2f4fb0777ebb4cc0();
    if (multicirclecount > 1) {
        if (var_f2e5f195d91a8b4f) {
            level.br_multi_circle.var_ce4d234d77082447 = 1;
            var_c00a2d6249962fb6 = function_59d0ab7e24248ad7();
            var_4b6b489dae052a24 = var_c00a2d6249962fb6[1];
            playercounts = var_c00a2d6249962fb6[0];
            namespace_a011fbf6d93f25e5::function_c3ca7338446f4fce(gettime(), playercounts, var_4b6b489dae052a24);
        } else if (var_96ca8e35a7b219e3) {
            level.br_multi_circle.var_ce4d234d77082447 = 0;
            level notify("multi_circle_merge");
            namespace_a011fbf6d93f25e5::function_4eb4428fe15d7276(gettime());
        }
    }
    if (resetdangercircleorigin(circleindex)) {
        if (getdvarint(@"hash_e0a1364a76dd764e", 1)) {
            for (i = 0; i < multicirclecount; i++) {
                var_2dcf644323bdfedb = level.br_multi_circle.circles[i].var_3ff449a8eec1b966;
                var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin = (var_ac6a89d630fa8dee[i][0], var_ac6a89d630fa8dee[i][1], var_154ef61b7a7f747a);
            }
        }
    }
    level.circleclosing = 0;
    var_f2da81fb842e7a5e = 5;
    if (var_f2da81fb842e7a5e > 0 && circleindex < var_f2da81fb842e7a5e) {
        namespace_62c556437da28f50::addglobalrankxpmultiplier(1.2, "cirlceMult_" + string(circleindex));
        namespace_4cd6e0abb58d4200::addweaponrankxpmultiplier(1.2, "cirlceMult_" + string(circleindex));
    }
    for (i = 0; i < multicirclecount; i++) {
        cleanupouterspawnclosets(var_ac6a89d630fa8dee[i], var_154ef61b7a7f747a);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256a
// Size: 0x123
function function_111ebdee65ef6d36(circleent, var_154ef61b7a7f747a, closetime) {
    if (isdefined(var_154ef61b7a7f747a) ^ isdefined(closetime)) {
        /#
            assertex(0, "Usage error: Arguments 'targetRadius' and 'closeTime' are mutually dependent. Must specify both or none.");
        #/
        return;
    }
    level endon("game_ended");
    level endon("br_ending_start");
    level endon("stop_circle_track_train");
    var_f57a8f007f02f223 = isdefined(var_154ef61b7a7f747a);
    starttime = gettime() / 1000;
    startradius = circleent.origin[2];
    var_d232dbfd1f080af = startradius;
    while (1) {
        trainent = level.wztrain_info.var_b2a3f9abcee9d071["cargo_train"];
        if (isdefined(trainent)) {
            targetpos = trainent getorigin();
            if (var_f57a8f007f02f223 && closetime > 0) {
                elapsed = gettime() / 1000 - starttime;
                var_d232dbfd1f080af = lerp(startradius, var_154ef61b7a7f747a, min(elapsed / closetime, 1));
            }
            circleent.origin = (targetpos[0], targetpos[1], var_d232dbfd1f080af);
        }
        waitframe();
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2694
// Size: 0x109
function function_f9b131d3d6eae27d(multicirclecount, var_6b890e6be7982efb) {
    level endon("game_ended");
    level.br_circle endon("circle_unpaused");
    while (1) {
        for (i = 0; i < multicirclecount; i++) {
            var_2dcf644323bdfedb = level.br_multi_circle.circles[i].var_3ff449a8eec1b966;
            var_2dcf644323bdfedb.var_58308f5095b6080e.origin = var_2dcf644323bdfedb.var_933b2a39ebfd2ad9.origin;
            var_2dcf644323bdfedb.var_ddeec615921cc88c.origin = var_2dcf644323bdfedb.var_46870b6fa8ad4427.origin;
            function_898ca8fcdf7d6479(var_2dcf644323bdfedb.var_46870b6fa8ad4427, var_2dcf644323bdfedb.var_58308f5095b6080e, var_2dcf644323bdfedb.var_ddeec615921cc88c, var_2dcf644323bdfedb.var_933b2a39ebfd2ad9, int(16777), var_6b890e6be7982efb);
        }
        wait(1);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a4
// Size: 0x4b
function function_4c7e6f6847607c99() {
    level endon("game_ended");
    level endon("br_ending_start");
    while (level.br_circle.circleindex < 0) {
        waitframe();
    }
    if (namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart")) {
        level waittill("infils_ready");
    }
    level notify("update_circle_hide");
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f6
// Size: 0xff
function function_1139f778f794ff98(circleent, var_933b2a39ebfd2ad9, var_46870b6fa8ad4427, duration, var_6b890e6be7982efb) {
    foreach (p in level.players) {
        if (!isbot(p)) {
            var_416318ee02bcd7d9 = _safecircledurationforplayer(p, duration);
            p setclientomnvar("ui_br_circle0_start_time", gettime());
            p setclientomnvar("ui_br_circle0_duration", var_416318ee02bcd7d9);
            if (istrue(var_6b890e6be7982efb)) {
                p _hidesafecircleui();
            }
            var_416318ee02bcd7d9 = _dangercircledurationforplayer(p, duration);
            p setclientomnvar("ui_br_circle1_start_time", gettime());
            p setclientomnvar("ui_br_circle1_duration", var_416318ee02bcd7d9);
        }
    }
    circleent function_f566102230d6730d(var_933b2a39ebfd2ad9, var_46870b6fa8ad4427, var_46870b6fa8ad4427);
    thread updatecirclehide(duration);
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28fc
// Size: 0x107
function function_898ca8fcdf7d6479(circleent, var_933b2a39ebfd2ad9, var_164900b8467e2e6f, var_e7e68ca013618514, duration, var_6b890e6be7982efb) {
    foreach (p in level.players) {
        if (!isbot(p)) {
            var_416318ee02bcd7d9 = _safecircledurationforplayer(p, duration);
            p setclientomnvar("ui_br_circle0_start_time", gettime());
            p setclientomnvar("ui_br_circle0_duration", var_416318ee02bcd7d9);
            if (istrue(var_6b890e6be7982efb)) {
                p _hidesafecircleui();
            }
            var_416318ee02bcd7d9 = _dangercircledurationforplayer(p, duration);
            p setclientomnvar("ui_br_circle1_start_time", gettime());
            p setclientomnvar("ui_br_circle1_duration", var_416318ee02bcd7d9);
        }
    }
    circleent function_f566102230d6730d(var_933b2a39ebfd2ad9, var_164900b8467e2e6f, var_e7e68ca013618514);
    thread updatecirclehide(duration);
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0a
// Size: 0x168
function function_9bb9abf5fd67056a(circleindex, var_c286002d25bc3f59) {
    level endon("game_ended");
    level endon("br_ending_start");
    var_ab0f126b12b30e01 = undefined;
    var_25a76641870dd568 = undefined;
    if (circleindex == level.br_multi_circle.var_8a10c39962f6d9fd) {
        var_ab0f126b12b30e01 = "br_multi_circle_split";
        var_25a76641870dd568 = 10;
        namespace_d3d40f75bb4e4c32::brleaderdialog("circle_split");
    } else if (circleindex == level.br_multi_circle.var_c22567ed8cfe3761) {
        var_ab0f126b12b30e01 = "br_multi_circle_merge";
        var_25a76641870dd568 = 11;
        namespace_d3d40f75bb4e4c32::brleaderdialog("circle_merge");
    }
    if (!isdefined(var_ab0f126b12b30e01)) {
        return;
    }
    if (var_c286002d25bc3f59) {
        var_ab0f126b12b30e01 = var_ab0f126b12b30e01 + "_open";
    } else {
        var_ab0f126b12b30e01 = var_ab0f126b12b30e01 + "_close";
    }
    foreach (player in level.players) {
        if (!isbot(player)) {
            if (!player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                player thread namespace_44abc05161e2e2cb::showsplash(var_ab0f126b12b30e01);
            }
            player setclientomnvar("ui_br_circle_state", var_25a76641870dd568);
        }
    }
    if (level.br_multi_circle.var_c73cd3ac9dde962f) {
        wait(2);
        setomnvar("ui_minimap_pulse", 1);
        wait(2);
        setomnvar("ui_minimap_pulse", 0);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b79
// Size: 0xfe
function function_cee78f828e373996() {
    level.br_circle.dangercircleui.origin = getdangercircleorigin();
    level.br_circle.dangercircleent.origin = getdangercircleorigin();
    duration = getdvarint(@"hash_d8db46472f1970a3", 300);
    foreach (player in level.players) {
        if (!isbot(player)) {
            player setclientomnvar("ui_br_circle0_start_time", 0);
            player setclientomnvar("ui_br_circle1_start_time", gettime());
            player setclientomnvar("ui_br_circle1_duration", int(duration * 1000));
            player setclientomnvar("ui_br_infil_started", 0);
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7e
// Size: 0x8e
function function_5d02313c7d7c9d62() {
    level endon("game_ended");
    level endon("br_ending_start");
    level endon("endCircleDamageTick");
    while (level.br_circle.circleindex < 0) {
        waitframe();
    }
    if (namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart")) {
        level waittill("infils_ready");
    }
    level childthread function_d835881b2d4842d3();
    if (level.br_multi_circle.var_f3ea1a173901b831) {
        level childthread function_47d1a34bde08097d();
        if (istrue(getdvarint(@"hash_72ae262a8559256", 0))) {
            level childthread function_eb2f52408ac501ac();
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d13
// Size: 0x495
function function_d835881b2d4842d3() {
    var_a058dc250ace641d = function_ce6456364079cce7();
    while (1) {
        /#
        #/
        if (isdefined(level.br_circle.dangercircleent)) {
            index = level.br_circle.circleindex;
            if (index > level.br_circle.damagetick.size - 1) {
                index = level.br_circle.damagetick.size - 1;
            }
            damagetick = level.br_circle.damagetick[index];
            if (isdefined(level.circledamagemultiplier)) {
                damagetick = damagetick * level.circledamagemultiplier;
            }
            if (damagetick > 0) {
                foreach (player in level.players) {
                    if (!isdefined(player) || !isdefined(player.origin)) {
                        continue;
                    }
                    if (isdefined(player) && istrue(player.var_a6637f42471575bc)) {
                        continue;
                    }
                    if (namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart") && istrue(player.plotarmor)) {
                        player function_6fcdea7a7060ce40();
                    } else {
                        var_acfa1a113ba7d7c7 = 0;
                        if (!function_ee854fdd1e77efc4(player.origin)) {
                            if (player cancircledamageplayer(player)) {
                                var_acfa1a113ba7d7c7 = 1;
                                player function_f8d9c5f59fc6c187();
                                if (getdvarint(@"hash_2b717602559e86b8", 0) == 1) {
                                    var_36e462d047634362 = player function_1e0f84e555b3de7d(var_a058dc250ace641d, damagetick);
                                } else {
                                    var_36e462d047634362 = damagetick;
                                }
                                /#
                                    if (istrue(level.br_multi_circle.var_2c70dc5ef86d8ceb)) {
                                        player iprintln("br_multi_circle_merge" + "br_multi_circle" + var_36e462d047634362 + "br_ftue_gas_damage");
                                    }
                                #/
                                var_973f8e42fb3c591b = var_36e462d047634362;
                                if (isdefined(level.var_aa1aaed4a9b80d4b) && isdefined(level.var_152d5a9c5ac5cdad) && level.br_circle.circleindex <= level.var_aa1aaed4a9b80d4b) {
                                    var_973f8e42fb3c591b = var_973f8e42fb3c591b * level.var_152d5a9c5ac5cdad;
                                }
                                if (namespace_9c6cddd872ad75f7::function_27e68abe09612a13(player)) {
                                    if (namespace_cb965d2f71fefddc::function_f213f06eba604bbd(player)) {
                                        if (istrue(player.var_a18181d8bdaa0dab)) {
                                            player notify("gasmask_buffer_reset");
                                        } else if (level.var_5312bc14bd5db377 > 0) {
                                            player.var_a18181d8bdaa0dab = 1;
                                            player thread namespace_cb965d2f71fefddc::function_a1d897962a19d27e();
                                        }
                                    }
                                    if (istrue(player.var_a18181d8bdaa0dab)) {
                                        if (!istrue(player.gasmaskequipped)) {
                                            player function_81652bad17cd28bd(var_36e462d047634362);
                                        }
                                        player namespace_9c6cddd872ad75f7::processdamage(var_973f8e42fb3c591b);
                                    } else if (isdefined(player.gasmaskhealth) && player.gasmaskhealth <= 0) {
                                        if (!istrue(level.var_e79884673ac9666e)) {
                                            player namespace_cb965d2f71fefddc::function_4d16b9c52efa3b8();
                                            player namespace_cb965d2f71fefddc::function_8e9b00a1d2b23d72();
                                            player playsoundtoplayer("br_gas_mask_break_plr", player);
                                        }
                                    } else {
                                        if (!istrue(level.var_e79884673ac9666e)) {
                                            player namespace_cb965d2f71fefddc::function_cdf7f2f6bd3207("br_multi_circle");
                                        }
                                        player namespace_9c6cddd872ad75f7::processdamage(var_973f8e42fb3c591b);
                                    }
                                } else {
                                    player function_81652bad17cd28bd(var_36e462d047634362);
                                }
                                if (namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
                                    player namespace_aead94004cf4c147::function_5323bef1ad6244b9(var_973f8e42fb3c591b);
                                }
                            } else {
                                player function_6fcdea7a7060ce40();
                            }
                        } else {
                            player function_6fcdea7a7060ce40();
                            if (namespace_9c6cddd872ad75f7::hasgasmask(player)) {
                                if (namespace_cb965d2f71fefddc::function_f213f06eba604bbd(player)) {
                                    if (istrue(player.var_a18181d8bdaa0dab)) {
                                        player notify("gasmask_buffer_reset");
                                    } else if (level.var_5312bc14bd5db377 > 0) {
                                        player.var_a18181d8bdaa0dab = 1;
                                        player thread namespace_cb965d2f71fefddc::function_a1d897962a19d27e();
                                    }
                                }
                                if (istrue(player.var_a18181d8bdaa0dab)) {
                                    continue;
                                } else if (!istrue(level.var_e79884673ac9666e)) {
                                    if (isdefined(player.gasmaskhealth) && player.gasmaskhealth <= 0) {
                                        player playsoundtoplayer("br_gas_mask_break_plr", player);
                                        player namespace_cb965d2f71fefddc::function_4d16b9c52efa3b8();
                                    } else {
                                        player namespace_cb965d2f71fefddc::function_8206bc54a1ed73cb("br_multi_circle");
                                    }
                                }
                            }
                        }
                        if (namespace_36f464722d326bbe::isbrstylegametype()) {
                            player updateindangercirclestate(var_acfa1a113ba7d7c7);
                        }
                        if (var_acfa1a113ba7d7c7) {
                            if (namespace_3c37cb17ade254d::issharedfuncdefined("ftue", "player_action")) {
                                player [[ namespace_3c37cb17ade254d::getsharedfunc("ftue", "player_action") ]]("br_ftue_gas_damage");
                            }
                        }
                    }
                }
            }
        }
        /#
        #/
        wait(1);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31af
// Size: 0x1e
function function_47d1a34bde08097d() {
    wait(0.25);
    while (1) {
        namespace_bbc79db4c3949a5c::function_ebdd2e77a8ade959();
        wait(1);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d4
// Size: 0x2b
function function_eb2f52408ac501ac() {
    wait(0.5);
    while (1) {
        namespace_2ffd685c7e2d86a3::function_c4b698ed8dd5c33d();
        wait(1);
        namespace_2ffd685c7e2d86a3::function_974a505e30d0049c();
        wait(1);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3206
// Size: 0x147
function function_d00dee714982522b() {
    if (namespace_bbc79db4c3949a5c::function_ea6cdf6492dfb4fa()) {
        return;
    }
    level endon("game_ended");
    level endon("br_ending_start");
    level endon("endCircleDamageTick");
    while (level.br_circle.circleindex < 0) {
        waitframe();
    }
    if (namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart")) {
        level waittill("infils_ready");
    }
    while (1) {
        wait(1);
        if (isdefined(level.var_8a12e160a2617c92)) {
            foreach (var_7f590f6ae7f3bc83, var_d9dbca8ecf0dc293 in level.var_8a12e160a2617c92) {
                var_d9dbca8ecf0dc293 = array_removeundefined(var_d9dbca8ecf0dc293);
                foreach (var_85ec09c82046805a in var_d9dbca8ecf0dc293) {
                    var_cf876cd1a06753f5 = function_f487a2a306e21bdb(var_85ec09c82046805a.origin);
                    if (var_cf876cd1a06753f5 > 0) {
                        delaythread(var_cf876cd1a06753f5, &function_e65c3ee9c7741955, var_85ec09c82046805a, var_7f590f6ae7f3bc83);
                    }
                }
                level.var_8a12e160a2617c92[var_7f590f6ae7f3bc83] = [];
            }
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3354
// Size: 0x4a
function function_e65c3ee9c7741955(obj, var_7f590f6ae7f3bc83) {
    if (!isdefined(obj)) {
        return;
    }
    var_bca649c8dd3208d8 = undefined;
    if (isdefined(level.var_725403a0618f5a10)) {
        var_bca649c8dd3208d8 = level.var_725403a0618f5a10[var_7f590f6ae7f3bc83];
    }
    if (isdefined(var_bca649c8dd3208d8)) {
        [[ var_bca649c8dd3208d8 ]](obj);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a5
// Size: 0xac
function function_878eaeed15433716() {
    if (!isdefined(level.br_pickups)) {
        return;
    }
    foreach (crate in level.br_pickups.crates) {
        if (isdefined(crate) && !function_27779e30fe4c0d62(crate.origin)) {
            level.br_pickups.outercrates[level.br_pickups.outercrates.size] = crate;
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3458
// Size: 0x11
function function_70dab1712e13880c() {
    function_a5bc99d4d649f54b();
    function_4d4df5d8d091815();
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3470
// Size: 0x2ea
function function_a5bc99d4d649f54b() {
    if (level.br_multi_circle.var_209967c144016964 == 1) {
        return;
    }
    if (getdvarint(@"hash_3250cdab1dfb0ac4", 1)) {
        return;
    }
    level endon("game_ended");
    level endon("br_ending_start");
    level endon("multi_circle_merge");
    level waittill("multi_circle_split");
    var_993e5cf734fbd0fc = [];
    if (getdvarint(@"hash_37133e3ee3beae30", 0)) {
        var_993e5cf734fbd0fc = function_b378fd0a01e94537();
    }
    var_881f82e9f82546e7 = getdvarint(@"hash_db6f837f9260ec08", 0);
    multicirclecount = function_d987886bb9de9137();
    while (1) {
        var_545d0b8ca332a79f = [];
        var_13443b3cff3e3fe4 = [];
        for (i = 0; i < multicirclecount; i++) {
            var_545d0b8ca332a79f[i] = 0;
            var_13443b3cff3e3fe4[i] = [];
        }
        foreach (player in level.players) {
            if (!isdefined(player) || !isalive(player) || player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                continue;
            }
            var_f2d6db8b91f22768 = 0;
            for (i = 0; i < multicirclecount; i++) {
                inside = 0;
                if (var_881f82e9f82546e7) {
                    inside = function_783961b002f33360(player.origin, i);
                } else {
                    inside = function_d277283fb9ad5d46(player.origin, i);
                }
                if (inside) {
                    var_f2d6db8b91f22768 = var_f2d6db8b91f22768 | 1 << i;
                    var_545d0b8ca332a79f[i]++;
                    if (isdefined(player.team)) {
                        var_13443b3cff3e3fe4[i][player.team] = player.team;
                    }
                }
            }
            player setclientomnvar("ui_br_multi_circle_player_data", var_f2d6db8b91f22768);
        }
        var_dc66d1253386e15f = 0;
        var_5bc1a2a5f43e530b = 0;
        var_209967c144016964 = int(min(multicirclecount, 4));
        for (i = 0; i < var_209967c144016964; i++) {
            var_dc66d1253386e15f = var_dc66d1253386e15f | var_545d0b8ca332a79f[i] << i * 8;
            var_5bc1a2a5f43e530b = var_5bc1a2a5f43e530b | var_13443b3cff3e3fe4[i].size << i * 8;
        }
        setomnvar("ui_br_multi_circle_player_count", var_dc66d1253386e15f);
        setomnvar("ui_br_multi_circle_team_count", var_5bc1a2a5f43e530b);
        for (i = 0; i < var_209967c144016964; i++) {
            if (var_13443b3cff3e3fe4[i].size == 1) {
                function_7c70020cf67057ab(i, array_get_first_item(var_13443b3cff3e3fe4[i]));
            }
            if (isdefined(var_993e5cf734fbd0fc[i])) {
                overlay = var_993e5cf734fbd0fc[i];
                value = var_545d0b8ca332a79f[i];
                if (getdvarint(@"hash_7042bbd75f3ffc34", 1)) {
                    value = var_13443b3cff3e3fe4[i].size;
                }
                overlay setvalue(value);
            }
        }
        wait(1);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3761
// Size: 0x1b
function function_4d4df5d8d091815() {
    setomnvar("ui_br_multi_circle_player_count", 0);
    setomnvar("ui_br_multi_circle_team_count", 0);
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3783
// Size: 0x15b
function function_59d0ab7e24248ad7() {
    var_545d0b8ca332a79f = [];
    var_13443b3cff3e3fe4 = [];
    var_7c22bfff29a960a3 = [];
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        var_545d0b8ca332a79f[i] = 0;
        var_13443b3cff3e3fe4[i] = [];
        var_7c22bfff29a960a3[i] = 0;
    }
    for (i = multicirclecount; i < 4; i++) {
        var_545d0b8ca332a79f[i] = -1;
        var_7c22bfff29a960a3[i] = -1;
    }
    foreach (player in level.players) {
        if (!isdefined(player) || !isalive(player) || player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            continue;
        }
        for (i = 0; i < multicirclecount; i++) {
            if (function_d277283fb9ad5d46(player.origin, i)) {
                var_545d0b8ca332a79f[i]++;
                if (isdefined(player.team)) {
                    var_13443b3cff3e3fe4[i][player.team] = player.team;
                }
            }
        }
    }
    for (i = 0; i < multicirclecount; i++) {
        var_7c22bfff29a960a3[i] = var_13443b3cff3e3fe4[i].size;
    }
    return [0:var_545d0b8ca332a79f, 1:var_7c22bfff29a960a3];
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e6
// Size: 0xa2
function function_7c70020cf67057ab(index, team) {
    if (!getdvarint(@"hash_76e1dbe6c4d5f900", 1)) {
        return;
    }
    if (!istrue(level.br_multi_circle.var_ce4d234d77082447)) {
        return;
    }
    circle = level.br_multi_circle.circles[index];
    if (!isdefined(circle) || istrue(circle.var_fa9a850338119f4b)) {
        return;
    }
    circle.var_fa9a850338119f4b = 1;
    function_398360bb754c9099(team);
    function_23753850f8e1a765(team);
    namespace_d3d40f75bb4e4c32::brleaderdialogteam("circle_victory", team);
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398f
// Size: 0x88
function function_398360bb754c9099(team) {
    foreach (player in namespace_54d20dd0dd79277f::getteamdata(team, "players")) {
        if (isalive(player) && !isbot(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_multi_circle_winner");
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a1e
// Size: 0x81
function function_23753850f8e1a765(team) {
    var_501265b5fe210821 = getdvarint(@"hash_28bd0ecbfe827fd1", 500);
    foreach (player in namespace_54d20dd0dd79277f::getteamdata(team, "players")) {
        player namespace_c6ccccd95254983f::playerplunderpickup(var_501265b5fe210821);
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa6
// Size: 0x140
function function_c6ca870b4cdff7d() {
    if (!getdvarint(@"hash_ddf454c0808d773", 1) || level.br_multi_circle.var_209967c144016964 == 1) {
        return;
    }
    level endon("game_ended");
    level endon("br_ending_start");
    level endon("multi_circle_show_merge");
    if (level.br_multi_circle.var_8a10c39962f6d9fd != 1) {
        level waittill("multi_circle_show_split");
    }
    function_560a6f9647ff9be6();
    level thread function_1ee81753adbe0cce();
    while (1) {
        multicirclecount = function_d987886bb9de9137();
        for (i = 0; i < multicirclecount; i++) {
            objid = level.br_multi_circle.circles[i].objid;
            pos = level.br_multi_circle.circles[i].var_3ff449a8eec1b966.var_933b2a39ebfd2ad9.origin;
            objpos = namespace_d3d40f75bb4e4c32::droptogroundmultitrace((pos[0], pos[1], 0));
            namespace_5a22b6f3a56f7e9b::update_objective_position(objid, objpos);
        }
        level waittill("br_circle_set");
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bed
// Size: 0x149
function function_560a6f9647ff9be6() {
    objectiveids = [0:20, 1:21, 2:22, 3:23];
    var_9ba3781176232ea2 = [0:"icon_waypoint_circle_a", 1:"icon_waypoint_circle_b", 2:"icon_waypoint_circle_c", 3:"icon_waypoint_circle_d"];
    var_8907f37a417e18c3 = [0:"MP_BR_INGAME/MULTI_CIRCLE_LABEL_ALPHA", 1:"MP_BR_INGAME/MULTI_CIRCLE_LABEL_BRAVO", 2:"MP_BR_INGAME/MULTI_CIRCLE_LABEL_CHARLIE", 3:"MP_BR_INGAME/MULTI_CIRCLE_LABEL_DELTA"];
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
        if (objid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "active", (0, 0, 0), var_9ba3781176232ea2[i], "icon_regular");
            namespace_5a22b6f3a56f7e9b::function_79a1a16de6b22b2d(objid, objectiveids[i]);
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
            function_a13e72e0427ecad2(objid, function_bf3237ab00fd71a1());
            objective_setlabel(objid, var_8907f37a417e18c3[i]);
            namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objid);
            objective_sethideelevation(objid, 1);
            level.br_multi_circle.circles[i].objid = objid;
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d3d
// Size: 0x99
function function_1ee81753adbe0cce() {
    level waittill_any_3("game_ended", "br_ending_start", "multi_circle_show_merge");
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        objid = level.br_multi_circle.circles[i].objid;
        if (isdefined(objid)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(objid);
            level.br_multi_circle.circles[i].objid = undefined;
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ddd
// Size: 0x4e
function function_e71987651701448a() {
    function_f0a1762eeb5ba01f();
    var_3b5686b7d0848557 = getdvarint(@"hash_5741b69fc7803a21", 100);
    for (attempts = 0; attempts < var_3b5686b7d0848557 && function_bb8dc18fdc2c007a(); attempts++) {
        function_f0a1762eeb5ba01f();
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e32
// Size: 0x1db
function function_b0f5ee01693ab2fd() {
    if (function_d987886bb9de9137() <= 1) {
        return;
    }
    var_988215f0a875942a = level.br_multi_circle.var_8a10c39962f6d9fd - 1;
    if (var_988215f0a875942a >= 0 && var_988215f0a875942a < level.br_level.br_circleclosetimes.size) {
        level.br_level.br_circleclosetimes[var_988215f0a875942a] = level.br_level.br_circleclosetimes[var_988215f0a875942a] * level.br_multi_circle.var_9539818567fb5ec4;
    }
    var_c048a22d8171b9f6 = level.br_multi_circle.var_c22567ed8cfe3761 - 1;
    if (var_c048a22d8171b9f6 >= 0 && var_c048a22d8171b9f6 < level.br_level.br_circleclosetimes.size) {
        level.br_level.br_circleclosetimes[var_c048a22d8171b9f6] = level.br_level.br_circleclosetimes[var_c048a22d8171b9f6] * level.br_multi_circle.var_46e6e2faf04b1dd8;
    }
    for (i = var_988215f0a875942a + 1; i < var_c048a22d8171b9f6; i++) {
        if (i < level.br_level.br_circleclosetimes.size) {
            level.br_level.br_circleclosetimes[i] = level.br_level.br_circleclosetimes[i] * level.br_multi_circle.var_4fb3372df7d3fcb0;
        }
        if (i < level.br_level.br_circledelaytimes.size) {
            level.br_level.br_circledelaytimes[i] = level.br_level.br_circledelaytimes[i] * level.br_multi_circle.var_4fb3372df7d3fcb0;
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4014
// Size: 0x6f1
function private function_f0a1762eeb5ba01f() {
    if (!isdefined(level.br_level.br_circlecenters)) {
        return;
    }
    if (!isdefined(level.br_multi_circle)) {
        return;
    }
    level.br_multi_circle.circles = [];
    var_38a4c729748ad94c = getdvarint(@"hash_67a8c844bad5a45b", 0);
    if (!var_38a4c729748ad94c && namespace_71073fa38f11492::isfeatureenabled("circleSnapToNavMesh")) {
        var_38a4c729748ad94c = 1;
    }
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        level.br_multi_circle.circles[i] = spawnstruct();
        level.br_multi_circle.circles[i].var_8ae269616d09dfc5 = [];
    }
    var_8a10c39962f6d9fd = level.br_multi_circle.var_8a10c39962f6d9fd;
    var_c22567ed8cfe3761 = level.br_multi_circle.var_c22567ed8cfe3761;
    var_d6dfb1e3ee22156e = var_c22567ed8cfe3761 - var_8a10c39962f6d9fd;
    if (level.br_multi_circle.var_209967c144016964 == 1) {
        var_8a10c39962f6d9fd = level.br_level.br_circlecenters.size;
    }
    for (i = 0; i < multicirclecount; i++) {
        for (j = 0; j < var_8a10c39962f6d9fd; j++) {
            level.br_multi_circle.circles[i].var_8ae269616d09dfc5[j] = level.br_level.br_circlecenters[j];
        }
    }
    if (level.br_multi_circle.var_209967c144016964 == 1) {
        return;
    }
    var_dfc65f80af9670de = level.br_multi_circle.var_dfc65f80af9670de;
    angleoffset = 360 / multicirclecount;
    var_c9a27c992548d1ec = getdvarfloat(@"hash_7d2daa00c9da1e39", 0);
    if (getdvarint(@"hash_79b501617ac641bd", 1)) {
        var_c9a27c992548d1ec = var_c9a27c992548d1ec + randomfloat(angleoffset) - angleoffset / 2;
    }
    var_2f93004a3fb7b8f2 = undefined;
    var_bc58018f3e4a64cc = level.br_multi_circle.var_bc58018f3e4a64cc;
    var_2e5bb265e73e668a = level.br_multi_circle.var_2e5bb265e73e668a;
    var_ac535e4a58f7bc39 = var_8a10c39962f6d9fd;
    if (istrue(level.br_multi_circle.var_28da030377a08f4a)) {
        var_ac535e4a58f7bc39--;
    }
    origin = level.br_level.br_circlecenters[var_ac535e4a58f7bc39];
    radius = level.br_level.br_circleradii[var_ac535e4a58f7bc39];
    for (i = 0; i < multicirclecount; i++) {
        var_a08c9ef825c077e9 = origin;
        theta = i * angleoffset + var_c9a27c992548d1ec;
        if (istrue(level.br_multi_circle.var_7cee15a31694177c)) {
            var_a08c9ef825c077e9 = getrandompointinboundscircle(origin, radius, var_bc58018f3e4a64cc, var_2e5bb265e73e668a, 1, var_38a4c729748ad94c, 1, undefined, theta, theta);
        } else {
            var_a2685ac790aef5ac = randomfloat(var_dfc65f80af9670de) - var_dfc65f80af9670de / 2;
            if (!isdefined(var_2f93004a3fb7b8f2) || !istrue(level.br_multi_circle.var_117e933d19f2c221)) {
                var_2f93004a3fb7b8f2 = var_bc58018f3e4a64cc + randomfloat(var_2e5bb265e73e668a - var_bc58018f3e4a64cc);
            }
            theta = theta + var_a2685ac790aef5ac;
            originoffset = (radius * var_2f93004a3fb7b8f2 * cos(theta), radius * var_2f93004a3fb7b8f2 * sin(theta), 0);
            var_a08c9ef825c077e9 = origin + originoffset;
        }
        level.br_multi_circle.circles[i].var_8ae269616d09dfc5[var_8a10c39962f6d9fd] = var_a08c9ef825c077e9;
    }
    if (var_d6dfb1e3ee22156e > 1) {
        var_78f5d97243a6245f = var_8a10c39962f6d9fd;
        var_f46a9099528726ca = var_8a10c39962f6d9fd + var_d6dfb1e3ee22156e;
        var_cf3800024083abbe = array_slice(level.br_level.br_circleradii, var_78f5d97243a6245f, var_f46a9099528726ca);
        var_79a6e85c95fe549b = array_slice(level.br_level.br_circleclosetimes, var_78f5d97243a6245f, var_f46a9099528726ca);
        for (i = 0; i < multicirclecount; i++) {
            origin = level.br_multi_circle.circles[i].var_8ae269616d09dfc5[var_8a10c39962f6d9fd];
            var_8ae269616d09dfc5 = namespace_bbc79db4c3949a5c::function_c7f3ae56442546d1(origin, var_cf3800024083abbe, var_79a6e85c95fe549b, 1);
            if (isdefined(var_8ae269616d09dfc5)) {
                for (j = 1; j < var_8ae269616d09dfc5.size; j++) {
                    newindex = level.br_multi_circle.circles[i].var_8ae269616d09dfc5.size;
                    level.br_multi_circle.circles[i].var_8ae269616d09dfc5[newindex] = var_8ae269616d09dfc5[j];
                }
            }
        }
    }
    for (i = 0; i < multicirclecount; i++) {
        for (j = var_c22567ed8cfe3761; j < level.br_level.br_circlecenters.size; j++) {
            newindex = level.br_multi_circle.circles[i].var_8ae269616d09dfc5.size;
            level.br_multi_circle.circles[i].var_8ae269616d09dfc5[newindex] = level.br_level.br_circlecenters[j];
        }
    }
    if (getdvarint(@"hash_4b45bb60c8b9d7a", 0) > 0) {
        var_386253fc27b67432 = level.br_level.br_movingcirclecount;
        var_38a4c729748ad94c = getdvarint(@"hash_67a8c844bad5a45b", 0);
        if (!var_38a4c729748ad94c && namespace_71073fa38f11492::isfeatureenabled("circleSnapToNavMesh")) {
            var_38a4c729748ad94c = 1;
        }
        var_78f5d97243a6245f = var_c22567ed8cfe3761;
        var_f46a9099528726ca = var_c22567ed8cfe3761 + var_386253fc27b67432 + 1;
        var_8ae269616d09dfc5 = array_slice(level.br_level.br_circlecenters, var_78f5d97243a6245f, var_f46a9099528726ca);
        var_cf3800024083abbe = array_slice(level.br_level.br_circleradii, var_78f5d97243a6245f, var_f46a9099528726ca);
        var_48c37d0bef1c3760 = namespace_bbc79db4c3949a5c::function_a09532919ae80718(var_386253fc27b67432, var_8ae269616d09dfc5, var_cf3800024083abbe, var_38a4c729748ad94c);
        if (isdefined(var_48c37d0bef1c3760)) {
            for (i = 0; i < multicirclecount; i++) {
                for (j = 0; j < var_48c37d0bef1c3760.size; j++) {
                    newindex = level.br_multi_circle.circles[i].var_8ae269616d09dfc5.size;
                    level.br_multi_circle.circles[i].var_8ae269616d09dfc5[newindex] = var_48c37d0bef1c3760[j];
                }
            }
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x470c
// Size: 0x279
function private function_bb8dc18fdc2c007a() {
    multicirclecount = function_d987886bb9de9137();
    if (multicirclecount <= 1) {
        return 0;
    }
    var_2def3add71ff2d42 = getdvarfloat(@"hash_6c976cff653fe181", 0.5);
    var_a9b2ebbbed787836 = getdvarfloat(@"hash_2d35a2046d6899a9", 0.5);
    for (c = level.br_multi_circle.var_8a10c39962f6d9fd; c < level.br_multi_circle.var_c22567ed8cfe3761; c++) {
        radius = level.br_level.br_circleradii[c];
        if (radius == 0) {
            return 0;
        }
        for (i = 0; i < multicirclecount - 1; i++) {
            for (j = i + 1; j < multicirclecount; j++) {
                var_12b347cbeaaa73c6 = level.br_multi_circle.circles[i].var_8ae269616d09dfc5[c];
                var_12b346cbeaaa7193 = level.br_multi_circle.circles[j].var_8ae269616d09dfc5[c];
                dist = distance2d(var_12b347cbeaaa73c6, var_12b346cbeaaa7193);
                var_b1d0bc03029f6a2c = dist / 2 * radius;
                if (var_b1d0bc03029f6a2c < var_2def3add71ff2d42) {
                    return 1;
                }
            }
        }
    }
    index = level.br_multi_circle.var_c22567ed8cfe3761 - 1;
    if (index < 1) {
        return 0;
    }
    for (i = 0; i < multicirclecount; i++) {
        var_12b347cbeaaa73c6 = level.br_multi_circle.circles[i].var_8ae269616d09dfc5[index];
        var_12b346cbeaaa7193 = level.br_multi_circle.circles[i].var_8ae269616d09dfc5[index + 1];
        var_531a5c376a1c480a = level.br_level.br_circleradii[index];
        var_531a5b376a1c45d7 = level.br_level.br_circleradii[index + 1];
        if (var_531a5c376a1c480a + var_531a5b376a1c45d7 == 0) {
            return 0;
        }
        dist = distance2d(var_12b347cbeaaa73c6, var_12b346cbeaaa7193);
        var_b1d0bc03029f6a2c = dist / (var_531a5c376a1c480a + var_531a5b376a1c45d7);
        if (var_b1d0bc03029f6a2c < var_a9b2ebbbed787836) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x498d
// Size: 0x2ad
function function_ebfd46aa8754608() {
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        var_8bebf2bfdbc76342 = level.br_multi_circle.circles[i].var_8ae269616d09dfc5[1];
        var_fb3aa9fba9719098 = level.br_level.br_circlecenters[0];
        safecircleent = spawn("script_model", (var_8bebf2bfdbc76342[0], var_8bebf2bfdbc76342[1], level.br_level.br_circleradii[1]));
        safecircleui = spawn("script_model", safecircleent.origin);
        dangercircleent = spawnbrcircle(var_fb3aa9fba9719098[0], var_fb3aa9fba9719098[1], level.br_level.br_circleradii[0]);
        dangercircleui = spawn("script_model", dangercircleent.origin);
        var_2dcf644323bdfedb = spawnstruct();
        var_2dcf644323bdfedb.var_933b2a39ebfd2ad9 = safecircleent;
        var_2dcf644323bdfedb.var_58308f5095b6080e = safecircleui;
        var_2dcf644323bdfedb.var_46870b6fa8ad4427 = dangercircleent;
        var_2dcf644323bdfedb.var_ddeec615921cc88c = dangercircleui;
        level.br_multi_circle.circles[i].var_3ff449a8eec1b966 = var_2dcf644323bdfedb;
        dangercircleent thread dangercircleenthidefromplayers();
        dangercircleent function_f566102230d6730d(safecircleent, dangercircleui, dangercircleui);
    }
    var_2dcf644323bdfedb = level.br_multi_circle.circles[0].var_3ff449a8eec1b966;
    level.br_circle.safecircleent = var_2dcf644323bdfedb.var_933b2a39ebfd2ad9;
    level.br_circle.safecircleui = var_2dcf644323bdfedb.var_58308f5095b6080e;
    level.br_circle.dangercircleent = var_2dcf644323bdfedb.var_46870b6fa8ad4427;
    level.br_circle.dangercircleui = var_2dcf644323bdfedb.var_ddeec615921cc88c;
    level.br_circle.safecircleent.hidden = 0;
    level.br_circle.safecircleui.hidden = 0;
    level.br_circle.dangercircleent.hidden = 0;
    level.br_circle.dangercircleui.hidden = 0;
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c41
// Size: 0x7d
function function_99b71c1ba0ed78b5() {
    level.br_multi_circle.circles = [];
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        level.br_multi_circle.circles[i] = spawnstruct();
        level.br_multi_circle.circles[i].var_8ae269616d09dfc5 = [];
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cc5
// Size: 0xb6
function function_74c4ed830065b00c() {
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.dangercircleui)) {
        return;
    }
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        var_3ff449a8eec1b966 = level.br_multi_circle.circles[i].var_3ff449a8eec1b966;
        if (isdefined(var_3ff449a8eec1b966) && isdefined(var_3ff449a8eec1b966.var_46870b6fa8ad4427)) {
            var_3ff449a8eec1b966.var_46870b6fa8ad4427 show();
            var_3ff449a8eec1b966.var_46870b6fa8ad4427 hide(1);
        }
    }
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d82
// Size: 0x41
function function_154cd3a077d16782() {
    /#
        level notify("ui_br_multi_circle_team_count");
        multicirclecount = function_d987886bb9de9137();
        for (i = 0; i < multicirclecount; i++) {
            level thread function_5d9c9221653df2f3(i);
        }
    #/
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4dca
// Size: 0x337
function function_5d9c9221653df2f3(var_264e3329827f2da3) {
    /#
        if (!istrue(level.var_2df69b8e552238b6)) {
            return;
        }
        circle = level.br_multi_circle.circles[var_264e3329827f2da3];
        if (!isdefined(circle)) {
            return;
        }
        level endon("ui_br_multi_circle_team_count");
        colors = [0:(1, 1, 1), 1:(0.764706, 0.25098, 0.129412), 2:(0.380392, 0.647059, 0.309804), 3:(0.427451, 0.811765, 0.964706), 4:(0.929412, 0.796078, 0.337255), 5:(1, 0.0431373, 0.843137), 6:(0.380392, 0.278431, 0.517647), 7:(1, 0.658824, 0.647059), 8:(0.380392, 0.780392, 0.803922), 9:(1, 1, 1), 10:(0.501961, 0.501961, 0.501961), 11:(0.898039, 0.6, 0), 12:(0, 0, 0), 13:(0.929412, 0.796078, 0.337255)];
        var_515792830044f5b4 = 1;
        var_6c3696e7c53f4954 = 1;
        var_3689cc0770006441 = [];
        var_3689cc0770006441[var_515792830044f5b4] = 1;
        var_3689cc0770006441[var_6c3696e7c53f4954] = 1;
        var_3689cc0770006441[0] = 1;
        var_3689cc0770006441[9] = 1;
        var_3689cc0770006441[10] = 1;
        var_3689cc0770006441[12] = 1;
        var_3689cc0770006441[13] = 1;
        thread function_714587ed175036c5();
        var_5a4d0a8404636492 = [0:"right", 1:"<unknown string>", 2:"<unknown string>"];
        var_b35ce0e21357e4c6 = 1;
        while (1) {
            waitframe();
            colorindex = 0;
            for (circleindex = 0; circleindex < circle.var_8ae269616d09dfc5.size; circleindex++) {
                radius = level.br_level.br_circleradii[circleindex];
                center = circle.var_8ae269616d09dfc5[circleindex];
                if (circleindex == 0) {
                    var_7cf2711e2953a547 = var_515792830044f5b4;
                } else if (circleindex == circle.var_8ae269616d09dfc5.size - 1) {
                    var_7cf2711e2953a547 = var_6c3696e7c53f4954;
                } else {
                    while (istrue(var_3689cc0770006441[colorindex])) {
                        colorindex = (colorindex + 1) % colors.size;
                    }
                    var_7cf2711e2953a547 = colorindex;
                    colorindex = (colorindex + 1) % colors.size;
                }
                color = colors[var_7cf2711e2953a547];
                namespace_3c37cb17ade254d::draw_circle(center, max(5, radius), color, 1, 0, 1);
                print3d(center, "<unknown string>" + circleindex + "<unknown string>" + radius, color, 1, 1, 1, 1);
                if (var_b35ce0e21357e4c6) {
                    circleent = spawnstruct();
                    circleent function_6b6b6273f8180522("<unknown string>" + var_5a4d0a8404636492[circleindex % var_5a4d0a8404636492.size], center, max(50, radius));
                    circleent function_6988310081de7b45();
                    circleent thread function_c3f32250a5b22066();
                }
            }
            var_b35ce0e21357e4c6 = 0;
        }
    #/
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5108
// Size: 0x1d
function function_714587ed175036c5() {
    /#
        level endon("ui_br_multi_circle_team_count");
        level waittill("<unknown string>");
        thread function_154cd3a077d16782();
    #/
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x512c
// Size: 0x290
function function_cdabf323178aabc6() {
    /#
        level notify("<unknown string>");
        if (!istrue(level.var_2df69b8e552238b6)) {
            return;
        }
        level endon("<unknown string>");
        var_1a44ea2b73097af9 = "<unknown string>";
        var_3e610f2c94b5003a = "<unknown string>";
        var_e7551285d088af48 = "<unknown string>";
        var_b40ab23b53022209 = getsharedfunc("<unknown string>", "<unknown string>");
        multicirclecount = function_d987886bb9de9137();
        for (i = 0; i < multicirclecount; i++) {
            circle = level.br_multi_circle.circles[i];
            if (!isdefined(circle)) {
                return;
            }
            for (circleindex = 0; circleindex < circle.var_8ae269616d09dfc5.size; circleindex++) {
                center = circle.var_8ae269616d09dfc5[circleindex];
                markerid = [[ var_b40ab23b53022209 ]](99);
                objective_state(markerid, "<unknown string>");
                objective_icon(markerid, var_1a44ea2b73097af9);
                objective_position(markerid, center);
                level thread function_5da8967d6638d199(markerid);
            }
        }
        var_90169e022ac262d4 = [[ var_b40ab23b53022209 ]](99);
        level thread function_5da8967d6638d199(var_90169e022ac262d4);
        if (level.br_level.var_8e40f29c8cdeb0f4) {
            var_ca131e6b449235d2 = [[ var_b40ab23b53022209 ]](99);
            level thread function_5da8967d6638d199(var_ca131e6b449235d2);
        }
        while (1) {
            waitframe();
            var_382e141c1a44e21b = level.br_circle.circleindex;
            var_2082f17f2e1c69bf = level.br_level.br_circleradii.size - 1 - level.br_level.br_movingcirclecount;
            if (var_382e141c1a44e21b < var_2082f17f2e1c69bf) {
                objective_state(var_90169e022ac262d4, "<unknown string>");
                objective_icon(var_90169e022ac262d4, var_3e610f2c94b5003a);
                objective_position(var_90169e022ac262d4, level.br_level.br_circlecenters[var_382e141c1a44e21b + 1]);
            }
            if (level.br_level.var_8e40f29c8cdeb0f4) {
                trainent = level.wztrain_info.var_b2a3f9abcee9d071["<unknown string>"];
                if (isdefined(trainent)) {
                    var_e861d907a4647eb1 = trainent.origin;
                    objective_state(var_ca131e6b449235d2, "<unknown string>");
                    objective_icon(var_ca131e6b449235d2, var_e7551285d088af48);
                    objective_position(var_ca131e6b449235d2, var_e861d907a4647eb1);
                }
            }
        }
    #/
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53c3
// Size: 0xe
function function_295e765fd8265c81() {
    /#
        level notify("<unknown string>");
    #/
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x53d8
// Size: 0x37
function function_5da8967d6638d199(markerid) {
    /#
        level waittill("<unknown string>");
        var_1b8303c67ceb65ea = getsharedfunc("<unknown string>", "<unknown string>");
        [[ var_1b8303c67ceb65ea ]](markerid);
    #/
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5416
// Size: 0x9c
function function_b378fd0a01e94537() {
    y_offset = 10;
    labels = [0:"MP/BR_MULTI_CIRCLE_LABEL_A", 1:"MP/BR_MULTI_CIRCLE_LABEL_B", 2:"MP/BR_MULTI_CIRCLE_LABEL_C", 3:"MP/BR_MULTI_CIRCLE_LABEL_D"];
    var_993e5cf734fbd0fc = [];
    multicirclecount = function_d987886bb9de9137();
    for (i = 0; i < multicirclecount; i++) {
        overlay = function_7196fee664cfae44(labels[i], y_offset * i);
        overlay thread function_b0f35a515a8ee538();
        var_993e5cf734fbd0fc[var_993e5cf734fbd0fc.size] = overlay;
    }
    return var_993e5cf734fbd0fc;
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54ba
// Size: 0xca
function function_7196fee664cfae44(label, yoffset) {
    hudelem = newhudelem();
    hudelem.label = label;
    hudelem.x = 720;
    hudelem.y = 50 + yoffset;
    hudelem.alignx = "right";
    hudelem.aligny = "middle";
    hudelem.sort = 1;
    hudelem.foreground = 1;
    hudelem.hidewheninmenu = 1;
    hudelem.alpha = 1;
    hudelem.fontscale = 1;
    hudelem.font = "objective";
    return hudelem;
}

// Namespace br_multi_circle/namespace_d04031d92bc84201
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x558c
// Size: 0x2a
function function_b0f35a515a8ee538() {
    level endon("game_ended");
    hudelem = self;
    level waittill("multi_circle_merge");
    if (isdefined(hudelem)) {
        hudelem destroy();
    }
}

