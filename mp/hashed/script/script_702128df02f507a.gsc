#using scripts\mp\flags.gsc;
#using scripts\mp\compass.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\scene.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_702128df02f507a;
#using scripts\common\devgui.gsc;

#namespace namespace_cf51e0de98ebcb9e;

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x17f
// Size: 0x2b
function autoexec main() {
    if (getdvarint(@"hash_a9df41b469b5dbe2", 1) <= 0) {
        return;
    }
    init();
    /#
        level thread debug_init();
    #/
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2
// Size: 0x66
function init() {
    var_8c2b09fa83193b40 = function_7e930b64aa35ffee();
    if (isdefined(var_8c2b09fa83193b40) && var_8c2b09fa83193b40.size > 0) {
        level.var_a30a1d15c4401399 = spawnstruct();
        var_6a5dccee5fd220aa = function_bc90551fbdb43ef6(var_8c2b09fa83193b40);
        level.var_a30a1d15c4401399.var_6a5dccee5fd220aa = var_6a5dccee5fd220aa;
        thread function_bf0a1510baea47c5(var_6a5dccee5fd220aa);
        function_e9fe6584103182cb(var_6a5dccee5fd220aa);
    }
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x220
// Size: 0x91
function function_7e930b64aa35ffee() {
    mapinfo = function_79404c2fcca1c184();
    if (!isdefined(mapinfo)) {
        return undefined;
    }
    if (!isdefined(mapinfo.var_56d371dd4dd18dda) || mapinfo.var_56d371dd4dd18dda == %"") {
        return undefined;
    }
    var_6b937c81802e4bfb = getscriptbundle(mapinfo.var_56d371dd4dd18dda);
    if (!isdefined(var_6b937c81802e4bfb)) {
        assertmsg("<dev string:x1c>" + mapinfo.var_56d371dd4dd18dda + "<dev string:x38>");
        return undefined;
    }
    return var_6b937c81802e4bfb.var_8c2b09fa83193b40;
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0xfd
function function_667d4e416d37d616(origin, var_7c8953aa388fb2f0, var_f795b12e5a594b2c) {
    if (!isdefined(level.var_a30a1d15c4401399) || !isdefined(level.var_a30a1d15c4401399.var_6a5dccee5fd220aa)) {
        return undefined;
    }
    if (!is_equal(level.var_a30a1d15c4401399.var_6a5dccee5fd220aa.name, var_7c8953aa388fb2f0)) {
        return undefined;
    }
    if (isdefined(var_f795b12e5a594b2c) && isdefined(level.var_a30a1d15c4401399.var_6a5dccee5fd220aa.var_d94d9204d8cb75d0.state) && var_f795b12e5a594b2c != level.var_a30a1d15c4401399.var_6a5dccee5fd220aa.var_d94d9204d8cb75d0.state) {
        return 0;
    }
    var_82a1b9668c3e9620 = function_335e62799b1a356a(origin, var_7c8953aa388fb2f0, level.var_a30a1d15c4401399.var_6a5dccee5fd220aa.defaultstate);
    return var_82a1b9668c3e9620;
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0
// Size: 0x15c
function function_bc90551fbdb43ef6(var_8c2b09fa83193b40) {
    weightoverrides = getdvar(@"hash_d8db6ac022cc3906", "");
    var_e3ecf1db05fcac6b = strtok(weightoverrides, ",");
    var_a09fe28e02b92232 = function_3c118c933f1f96b4(var_e3ecf1db05fcac6b);
    if (var_a09fe28e02b92232.size > 0) {
        var_7b172f966919ffd3 = [];
        foreach (index, var_a2cb49cb3e8717b3 in var_8c2b09fa83193b40) {
            var_a2cb49cb3e8717b3.name = tolower(var_a2cb49cb3e8717b3.name);
            var_a2cb49cb3e8717b3.weight = 0;
            var_7b172f966919ffd3[var_a2cb49cb3e8717b3.name] = index;
        }
        foreach (var_4f763d528ddf9775 in var_a09fe28e02b92232) {
            var_e2417a1fab5e2e29 = var_7b172f966919ffd3[var_4f763d528ddf9775.name];
            var_8c2b09fa83193b40[var_e2417a1fab5e2e29].weight = var_4f763d528ddf9775.weight;
        }
    }
    return function_fd2c2c40201aed7e(var_8c2b09fa83193b40);
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x525
// Size: 0xf1
function function_3c118c933f1f96b4(var_e3ecf1db05fcac6b) {
    var_a09fe28e02b92232 = [];
    foreach (pair in var_e3ecf1db05fcac6b) {
        var_a7b955e77125deae = strtok(pair, " ");
        if (var_a7b955e77125deae.size > 1 && isstring(var_a7b955e77125deae[0])) {
            var_4f763d528ddf9775 = spawnstruct();
            var_4f763d528ddf9775.name = tolower(var_a7b955e77125deae[0]);
            var_4f763d528ddf9775.weight = int(var_a7b955e77125deae[1]);
            var_a09fe28e02b92232[var_a09fe28e02b92232.size] = var_4f763d528ddf9775;
            continue;
        }
        assertmsg("<dev string:x49>" + function_3c8848a3a11b2553(@"hash_d8db6ac022cc3906") + "<dev string:x55>" + pair + "<dev string:x67>");
    }
    return var_a09fe28e02b92232;
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61f
// Size: 0xea
function function_fd2c2c40201aed7e(var_8c2b09fa83193b40) {
    totalweight = 0;
    foreach (var_a2cb49cb3e8717b3 in var_8c2b09fa83193b40) {
        totalweight += var_a2cb49cb3e8717b3.weight;
    }
    var_afb27532ad1515a6 = randomfloat(totalweight);
    cumulativeweight = 0;
    var_6a5dccee5fd220aa = undefined;
    foreach (var_a2cb49cb3e8717b3 in var_8c2b09fa83193b40) {
        cumulativeweight += var_a2cb49cb3e8717b3.weight;
        if (cumulativeweight > var_afb27532ad1515a6) {
            var_6a5dccee5fd220aa = var_a2cb49cb3e8717b3;
            break;
        }
    }
    return var_6a5dccee5fd220aa;
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x712
// Size: 0x9f
function function_bf0a1510baea47c5(var_a2cb49cb3e8717b3) {
    level endon("game_ended");
    if (!isdefined(var_a2cb49cb3e8717b3)) {
        return;
    }
    if (isdefined(var_a2cb49cb3e8717b3.scenename)) {
        var_a2cb49cb3e8717b3.scene = function_850332357833c7ed(var_a2cb49cb3e8717b3.scenename);
    }
    if (isdefined(var_a2cb49cb3e8717b3.var_beb3ce9cb5705897) && var_a2cb49cb3e8717b3.var_beb3ce9cb5705897 != "") {
        game["dialog"][var_a2cb49cb3e8717b3.var_beb3ce9cb5705897] = var_a2cb49cb3e8717b3.var_beb3ce9cb5705897;
    }
    function_1109bf32b4f881b8(var_a2cb49cb3e8717b3);
    function_2d2875f903aa2a92(var_a2cb49cb3e8717b3);
    function_8aa7eefcc94fcf5d(var_a2cb49cb3e8717b3);
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b9
// Size: 0x30
function function_850332357833c7ed(scenename) {
    scene = spawnstruct();
    scene scene::set_scriptbundle(scenename);
    scene scene::function_bc521bee52fde214(1);
    return scene;
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f2
// Size: 0x172
function function_1109bf32b4f881b8(var_a2cb49cb3e8717b3) {
    var_7837d7a932253c21 = !istrue(var_a2cb49cb3e8717b3.var_6cbc15fececf3c86);
    if (var_7837d7a932253c21) {
        scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    }
    if (isdefined(var_a2cb49cb3e8717b3.var_71055f7bafa2c28a)) {
        function_4cf525a6ef2c0d20(var_a2cb49cb3e8717b3.name, var_a2cb49cb3e8717b3.var_71055f7bafa2c28a);
    }
    if (isdefined(var_a2cb49cb3e8717b3.var_56e04d3d0e7663ca)) {
        scripts\mp\compass::setupminimap(var_a2cb49cb3e8717b3.var_56e04d3d0e7663ca);
    }
    if (var_7837d7a932253c21) {
        scripts\mp\flags::gameflagwait("prematch_fade_done");
    } else {
        waitframe();
    }
    if (isdefined(var_a2cb49cb3e8717b3.defaultstate)) {
        scripts\common\utility::function_39698f30fd7e8a1e(var_a2cb49cb3e8717b3.name, var_a2cb49cb3e8717b3.defaultstate);
    }
    if (isdefined(var_a2cb49cb3e8717b3.var_71055f7bafa2c28a)) {
        function_1c1e3d250d7d89e(var_a2cb49cb3e8717b3.name, var_a2cb49cb3e8717b3.var_71055f7bafa2c28a);
    }
    waitframe();
    if (isdefined(var_a2cb49cb3e8717b3.scene)) {
        var_a2cb49cb3e8717b3.scene scripts\common\scene::pre_stream();
        var_a2cb49cb3e8717b3.scene scripts\common\scene::init();
        var_a2cb49cb3e8717b3.scene scene::function_b0b8f796886a9c81(1);
    }
    if (isdefined(var_a2cb49cb3e8717b3.var_d94d9204d8cb75d0.state)) {
        function_4cf525a6ef2c0d20(var_a2cb49cb3e8717b3.name, var_a2cb49cb3e8717b3.var_d94d9204d8cb75d0.state);
    }
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x96c
// Size: 0x99
function function_2d2875f903aa2a92(var_a2cb49cb3e8717b3) {
    if (!isdefined(var_a2cb49cb3e8717b3.scene)) {
        return;
    }
    var_7837d7a932253c21 = !istrue(var_a2cb49cb3e8717b3.var_6cbc15fececf3c86);
    if (!var_7837d7a932253c21) {
        waitframe();
    } else if (isdefined(level.br_ac130)) {
        level.br_ac130 waittill("start_moving");
    } else {
        scripts\mp\flags::gameflagwait("infil_animatic_complete");
    }
    waittime = scripts\mp\gametypes\br_c130::function_130df32ea7502b9e() - var_a2cb49cb3e8717b3.var_3c98c782dfda4138;
    if (waittime > 0 && var_7837d7a932253c21) {
        wait waittime;
    }
    function_4d9e4eccd09dec28(var_a2cb49cb3e8717b3);
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0d
// Size: 0x31
function function_4d9e4eccd09dec28(var_a2cb49cb3e8717b3) {
    var_a2cb49cb3e8717b3.scene thread scripts\common\scene::play();
    level thread function_9977d85412dfb260(var_a2cb49cb3e8717b3);
    thread function_ad4330182461d797(var_a2cb49cb3e8717b3);
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa46
// Size: 0xa5
function function_8aa7eefcc94fcf5d(var_a2cb49cb3e8717b3) {
    wait var_a2cb49cb3e8717b3.var_d94d9204d8cb75d0.delay;
    if (isdefined(var_a2cb49cb3e8717b3.var_d94d9204d8cb75d0.state)) {
        function_1c1e3d250d7d89e(var_a2cb49cb3e8717b3.name, var_a2cb49cb3e8717b3.var_d94d9204d8cb75d0.state);
    }
    waittime = getdvarint(@"hash_c83d487ec3dec085", 2);
    if (waittime > 0) {
        wait waittime;
    }
    if (isdefined(var_a2cb49cb3e8717b3.scene)) {
        var_a2cb49cb3e8717b3.scene scripts\common\scene::cleanup();
    }
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf3
// Size: 0x10e
function function_9977d85412dfb260(var_a2cb49cb3e8717b3) {
    if (isdefined(var_a2cb49cb3e8717b3.exploders) && var_a2cb49cb3e8717b3.exploders.size > 0) {
        foreach (exploder in var_a2cb49cb3e8717b3.exploders) {
            if (isdefined(exploder) && isdefined(exploder.name)) {
                if (isdefined(exploder.delay) && exploder.delay >= 0) {
                    if (exploder.delay == 0) {
                        thread scripts\engine\utility::exploder(exploder.name, level.players);
                        continue;
                    }
                    scripts\engine\utility::function_f9a207358d70923c(exploder.delay, "game_ended", &scripts\engine\utility::exploder, exploder.name, level.players);
                }
            }
        }
    }
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc09
// Size: 0x5c
function function_ad4330182461d797(var_a2cb49cb3e8717b3) {
    if (isdefined(var_a2cb49cb3e8717b3.var_beb3ce9cb5705897) && var_a2cb49cb3e8717b3.var_beb3ce9cb5705897 != "") {
        if (isdefined(var_a2cb49cb3e8717b3.var_c335b73c96a684ee)) {
            wait var_a2cb49cb3e8717b3.var_c335b73c96a684ee;
        }
        scripts\mp\gametypes\br_public::brleaderdialog(var_a2cb49cb3e8717b3.var_beb3ce9cb5705897);
    }
}

// Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc6d
// Size: 0x3c
function private function_e9fe6584103182cb(var_a2cb49cb3e8717b3) {
    eventparams = ["scenario_name", var_a2cb49cb3e8717b3.name];
    dlog_recordevent("dlog_event_br_destruction_scenario", eventparams);
}

/#

    // Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcb1
    // Size: 0xc
    function debug_init() {
        devgui_init();
    }

    // Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xcc5
    // Size: 0x41
    function devgui_init() {
        var_8c2b09fa83193b40 = namespace_c9be15e212bc70fe::function_7e930b64aa35ffee();
        if (!isdefined(var_8c2b09fa83193b40)) {
            return;
        }
        function_e243334881a8b809("<dev string:x6c>", &function_28157cbc9158d55f, var_8c2b09fa83193b40);
        function_e243334881a8b809("<dev string:x7c>", &function_dea73eea830e5dfd, var_8c2b09fa83193b40);
    }

    // Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0xd0e
    // Size: 0x7c
    function function_e243334881a8b809(var_328e6462b9c91bdb, callback, var_8c2b09fa83193b40) {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x8c>" + var_328e6462b9c91bdb + "<dev string:xab>");
        for (i = 0; i < var_8c2b09fa83193b40.size; i++) {
            var_a2cb49cb3e8717b3 = var_8c2b09fa83193b40[i];
            scripts\common\devgui::function_b23a59dfb4ca49a1(var_a2cb49cb3e8717b3.name, var_328e6462b9c91bdb + "<dev string:xb0>" + i, callback);
        }
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xd92
    // Size: 0xab
    function function_28157cbc9158d55f(params) {
        var_8c2b09fa83193b40 = namespace_c9be15e212bc70fe::function_7e930b64aa35ffee();
        var_a2cb49cb3e8717b3 = var_8c2b09fa83193b40[int(params[0])];
        var_a2cb49cb3e8717b3.var_6cbc15fececf3c86 = 1;
        if (isdefined(var_a2cb49cb3e8717b3.scenename)) {
            var_a2cb49cb3e8717b3.scene = function_850332357833c7ed(var_a2cb49cb3e8717b3.scenename);
        }
        if (isdefined(var_a2cb49cb3e8717b3.scene)) {
            var_a2cb49cb3e8717b3.scene scripts\common\scene::pre_stream();
            var_a2cb49cb3e8717b3.scene scene::function_b0b8f796886a9c81(1);
        }
        function_4d9e4eccd09dec28(var_a2cb49cb3e8717b3);
    }

    // Namespace namespace_cf51e0de98ebcb9e / namespace_c9be15e212bc70fe
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xe45
    // Size: 0x80
    function function_dea73eea830e5dfd(params) {
        var_8c2b09fa83193b40 = namespace_c9be15e212bc70fe::function_7e930b64aa35ffee();
        var_a2cb49cb3e8717b3 = var_8c2b09fa83193b40[int(params[0])];
        var_a2cb49cb3e8717b3.var_6cbc15fececf3c86 = 1;
        if (isdefined(var_a2cb49cb3e8717b3.var_d94d9204d8cb75d0.state)) {
            function_1c1e3d250d7d89e(var_a2cb49cb3e8717b3.name, var_a2cb49cb3e8717b3.defaultstate);
        }
        waitframe();
        function_bf0a1510baea47c5(var_a2cb49cb3e8717b3);
    }

#/
