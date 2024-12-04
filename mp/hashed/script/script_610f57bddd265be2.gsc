#using script_263974019a8ba3fa;
#using script_5762ac2f22202ba2;
#using script_58f20490049af6ac;
#using script_610f57bddd265be2;
#using script_67fb1233e876ed8;
#using script_7ab5b649fa408138;
#using scripts\common\debug;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\parachute;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\scriptable;
#using scripts\engine\throttle;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\gametypes\br_analytics;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_gametypes;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\hud_util;
#using scripts\mp\utility\game;
#using scripts\mp\utility\lower_message;
#using scripts\mp\utility\player;
#using scripts\mp\weapons;

#namespace namespace_93577502ddc60c0d;

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xc90
// Size: 0xb
function autoexec main() {
    level thread function_deee3b97bf9c0945();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca3
// Size: 0x5e
function function_deee3b97bf9c0945() {
    waitframe();
    if (!getdvarint(@"hash_eb0811ead28c4f53", 0)) {
        return;
    }
    if (level.gametype == "ob" || level.gametype == "ob_rift_run") {
        return;
    }
    if (isdefined(level.var_2f26ac0d970dddb0) && !level.var_2f26ac0d970dddb0) {
        return;
    }
    init();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd09
// Size: 0x138
function init() {
    /#
        level thread debug_init();
    #/
    initvariables();
    scripts\engine\scriptable::scriptable_adddamagedcallback(&function_d01754fc00a031f4);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("redeploy_drone_interact", &function_f0567cda220a6f7d);
    if (level.var_fc4bb27a820f54dd.var_1bb94b0f20fb3532) {
        namespace_7052decdced06e44::function_4f7660cfd85cd517("redeploy_drone", &function_fb714d8704f1953a);
        namespace_7052decdced06e44::function_412f527ef0863f0e("redeploy_drone", &function_9858fb14ddbabacf);
    }
    utility::registersharedfunc("redeploy_drone", "precision_airstrike_death", &precision_airstrike_death);
    utility::registersharedfunc("redeploy_drone", "get_closest_redeploy_drone", &get_closest_redeploy_drone);
    utility::registersharedfunc("redeploy_drone", "dropbag_collision_watcher", &dropbag_collision_watcher);
    utility::registersharedfunc("redeploy_drone", "redeploy_drone_repopulation_watcher", &redeploy_drone_repopulation_watcher);
    utility::registersharedfunc("redeploy_drone", "redeploy_drone_destroyed", &redeploy_drone_destroyed);
    scripts\engine\utility::registersharedfunc("little_bird", "handleWorldCollision", &function_19e2fe45e130973f);
    scripts\engine\utility::registersharedfunc("veh9_palfa", "handleWorldCollision", &function_19e2fe45e130973f);
    if (scripts\mp\utility\game::function_d75b73c443421047()) {
        scripts\engine\utility::registersharedfunc("veh_jup_space_shipment_transport", "handleWorldCollision", &function_19e2fe45e130973f);
    }
    function_f1aed36ab4598ea("eqp_redeploy_drone");
    level thread function_23f7acaab482446();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe49
// Size: 0x631
function initvariables() {
    level.var_fc4bb27a820f54dd = spawnstruct();
    level.var_fc4bb27a820f54dd.i_count = getdvarint(@"hash_27f51798e10e62a0", 4);
    level.var_fc4bb27a820f54dd.i_health = getdvarint(@"hash_2af4efaafae6489b", 270);
    level.var_fc4bb27a820f54dd.var_43c609d0bf76cedc = getdvarint(@"hash_fc06cf8b2e6ff7c8", 100);
    level.var_fc4bb27a820f54dd.var_3bc74411a49ef743 = getdvarint(@"hash_4d3f3ddcf9c9ae8f", 2000);
    level.var_fc4bb27a820f54dd.var_94ca860762f3c07b = getdvarint(@"hash_2044315c6a32e0cf", 512);
    level.var_fc4bb27a820f54dd.var_f94808af4addfa87 = getdvarint(@"hash_3d4c3c323e772733", 60);
    level.var_fc4bb27a820f54dd.var_f96af6af4b041aa9 = getdvarint(@"hash_3d7052323e9fd24d", 165);
    level.var_fc4bb27a820f54dd.var_4b39ba581f4e16ef = getdvarint(@"hash_59ab4e81308f5bfb", 42);
    level.var_fc4bb27a820f54dd.var_73610df6cb8260e6 = getdvarint(@"hash_19bb495fc007952", 3);
    level.var_fc4bb27a820f54dd.var_4b2cdacf483dccc4 = getdvarfloat(@"hash_590a91e3623c94d", 4);
    level.var_fc4bb27a820f54dd.var_ab77bcfbf6ec9587 = getdvarint(@"hash_3cd8f7500c4cffcb", 30);
    level.var_fc4bb27a820f54dd.var_7e1e2deb54381dce = getdvarint(@"hash_7a6046af43f645a", 10);
    level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04 = getdvarint(@"hash_67144a280e505eb0", 10);
    level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5 = getdvarint(@"hash_e0052f554fb1d69", 50);
    level.var_fc4bb27a820f54dd.var_1bb94b0f20fb3532 = getdvarint(@"hash_b81d9b0920a22a50", 0) && getdvarint(@"hash_89be1a979c1ec008", 0);
    var_e375f6bd7e1961c9 = getdvarint(@"hash_9bd3724f70106775", 9000);
    level.var_fc4bb27a820f54dd.var_d1343ed4c5b69716 = squared(var_e375f6bd7e1961c9);
    var_d961317263b789a2 = getdvarint(@"hash_59c137234dad4ad6", 7000);
    level.var_fc4bb27a820f54dd.var_8a13be89e30d617 = squared(var_d961317263b789a2);
    level.var_fc4bb27a820f54dd.var_f06709293dd563e6 = getmatchrulesdata("commonOption", "parachuteOverheadWarningRadius");
    level.var_fc4bb27a820f54dd.var_9a279e924352be3b = getmatchrulesdata("commonOption", "parachuteOverheadWarningHeight");
    level.var_fc4bb27a820f54dd.var_b24b7a96d6c8e3c8 = getmatchrulesdata("commonOption", "parachuteOverheadWarningTimeoutMs");
    level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45 = [];
    level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45["veh9_mil_air_drone_redeploy_relocate"] = getanimlength(scriptables%veh9_mil_air_drone_redeploy_extend_hook_01_alt);
    level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45["veh9_mil_air_drone_redeploy_relocate_extended"] = getanimlength(scriptables%veh9_mil_air_drone_redeploy_extend_hook_02);
    level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45["veh9_mil_air_drone_redeploy_relocate_short"] = getanimlength(scriptables%veh9_mil_air_drone_redeploy_extend_hook_short_alt);
    level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45["veh9_mil_air_drone_redeploy_relocate_very_short"] = getanimlength(scriptables%veh9_mil_air_drone_redeploy_extend_hook_very_short_alt);
    level.var_fc4bb27a820f54dd.var_8a066943bb13715f = [];
    level.var_fc4bb27a820f54dd.var_8a066943bb13715f["veh9_mil_air_drone_redeploy_relocate"] = getanimlength(scriptables%veh9_mil_air_drone_redeploy_retract_hook_01_alt);
    level.var_fc4bb27a820f54dd.var_8a066943bb13715f["veh9_mil_air_drone_redeploy_relocate_extended"] = getanimlength(scriptables%veh9_mil_air_drone_redeploy_retract_hook_02);
    level.var_fc4bb27a820f54dd.var_8a066943bb13715f["veh9_mil_air_drone_redeploy_relocate_short"] = getanimlength(scriptables%veh9_mil_air_drone_redeploy_retract_hook_short_alt);
    level.var_fc4bb27a820f54dd.var_8a066943bb13715f["veh9_mil_air_drone_redeploy_relocate_very_short"] = getanimlength(scriptables%veh9_mil_air_drone_redeploy_retract_hook_very_short_alt);
    level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c = function_fb714d8704f1953a(undefined);
    level.var_fc4bb27a820f54dd.var_c6be6bfbfaa2f523 = level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c;
    level.var_fc4bb27a820f54dd.var_5715be6ca445d02e = level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c;
    if (isdefined(level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c)) {
        foreach (redeploy_drone in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            if (isdefined(redeploy_drone)) {
                redeploy_drone.var_47d27267be4655fb = 1;
            }
        }
    }
    level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3 = 1;
    if (isdefined(level.br_level) && isdefined(level.br_level.c130_speedoverride)) {
        level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3 = level.br_level.c130_speedoverride / 3044;
    }
    level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = [];
    level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = [];
    level.var_5161e88c4d5e0d35 = throttle_initialize("redeployDroneRelocate", 1, level.framedurationseconds);
    level.var_3976c9c03dc06d9b = getdvarint(@"hash_c977b0effe861ab8", 0);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1482
// Size: 0x1a
function function_fb714d8704f1953a(structname) {
    return getentitylessscriptablearray("scriptable_scriptable_redeploy_drone", "classname");
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a5
// Size: 0x3a
function function_23f7acaab482446() {
    waitframe();
    function_22627cfd727f11c3();
    while (!isdefined(level.br_ac130)) {
        wait 0.05;
    }
    level notify("respawn_redeploy_drones");
    level thread respawn_redeploy_drones();
    level thread function_c4f705b1e3e908de();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14e7
// Size: 0x134
function function_22627cfd727f11c3() {
    if (!level.var_fc4bb27a820f54dd.var_5715be6ca445d02e.size) {
        return;
    }
    function_aa6c956fa42c8dfd();
    if (!level.var_fc4bb27a820f54dd.var_1bb94b0f20fb3532) {
        function_4255350c89e0fecb();
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_5715be6ca445d02e) {
            scriptable thread spawn_redeploy_drone();
        }
    }
    for (i = 0; i < level.var_fc4bb27a820f54dd.var_5715be6ca445d02e.size; i++) {
        if (level.var_fc4bb27a820f54dd.var_5715be6ca445d02e[i] getscriptablepartstate("redeploy_drone") != "available") {
            level.var_fc4bb27a820f54dd.var_5715be6ca445d02e = array_remove(level.var_fc4bb27a820f54dd.var_5715be6ca445d02e, level.var_fc4bb27a820f54dd.var_5715be6ca445d02e[i]);
            i--;
        }
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1623
// Size: 0x54
function function_9858fb14ddbabacf(structname, dronestruct) {
    dronestruct thread spawn_redeploy_drone();
    size = level.var_fc4bb27a820f54dd.var_5715be6ca445d02e.size;
    level.var_fc4bb27a820f54dd.var_5715be6ca445d02e[size] = dronestruct;
    return dronestruct;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1680
// Size: 0x3d
function spawn_redeploy_drone() {
    function_ca6ea48c877cd367();
    self setscriptablepartstate("redeploy_drone_sfx", "engine_idle_sfx");
    health_init();
    scripts\mp\weapons::function_e00b77a9cb4d8322(self);
    scripts\mp\flags::gameflagwait("infil_animatic_complete");
    thread function_7f00c76550370a80();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16c5
// Size: 0xa3
function function_9b93b1ae68a3845b(data) {
    if (!istrue(self.var_3d94e3b5be6fd3d1)) {
        level thread redeploy_drone_repopulation_watcher(self);
    }
    vehicleowner = undefined;
    if (isdefined(data.attacker) && isdefined(data.attacker.owner)) {
        vehicleowner = data.attacker.owner;
    }
    if (isdefined(vehicleowner)) {
        redeploy_drone_destroyed(vehicleowner, self.model);
        return;
    }
    redeploy_drone_destroyed(data.attacker, self.model);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1770
// Size: 0xaa
function function_6ee9e5ec63dd6ef1(data) {
    if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, self)) {
        level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, self);
    }
    if (!istrue(self.var_3d94e3b5be6fd3d1)) {
        level thread redeploy_drone_repopulation_watcher(self);
    }
    function_d0250169e6dfa8e4(data.attacker, self.model);
    if (isdefined(self.var_daad7d20d7a17c02)) {
        self.var_daad7d20d7a17c02.b_occupied = 0;
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1822
// Size: 0x246
function respawn_redeploy_drones() {
    level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = array_removeundefined(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b);
    level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_removeundefined(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c);
    for (i = 0; i < level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b.size; i++) {
        drone = level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b[i];
        level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = array_remove(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b, drone);
        if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
            level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
        }
        drone delete();
        i--;
    }
    level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = undefined;
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        scriptable function_7fa5478ed150d979();
        /#
            scriptable function_20998d024463786f();
        #/
    }
    if (!level.var_fc4bb27a820f54dd.var_1bb94b0f20fb3532 && scripts\mp\gametypes\br_gametypes::isfeatureenabled("circleEarlyStart")) {
        function_4255350c89e0fecb();
    }
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_5715be6ca445d02e) {
        if (getdvarint(@"hash_8cc1035ee7514c26", 0)) {
            scriptable thread function_105f0caaa61e873();
            continue;
        }
        scriptable thread spawn_redeploy_drone();
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a70
// Size: 0x1e7
function function_4255350c89e0fecb() {
    redeploy_spawns = scripts\engine\utility::array_randomize(level.var_fc4bb27a820f54dd.var_c6be6bfbfaa2f523);
    var_767801e3c9d8e2d5 = scripts\mp\flags::gameflag("prematch_done");
    level.var_fc4bb27a820f54dd.var_5715be6ca445d02e = [];
    i_spawned = 0;
    foreach (scriptable in redeploy_spawns) {
        if (isdefined(scriptable.script_noteworthy) && scriptable.script_noteworthy != "redeploy_drone_spawn") {
            continue;
        }
        if (i_spawned >= level.var_fc4bb27a820f54dd.i_count) {
            /#
                scriptable thread function_ef3ab989669b4682();
            #/
            continue;
        }
        if (var_767801e3c9d8e2d5 && scriptable function_e745a94784401dfb()) {
            /#
                scriptable thread function_ef3ab989669b4682();
            #/
            continue;
        }
        var_7c6a1a7581e76afc = 1;
        foreach (other in redeploy_spawns) {
            if (!utility::array_contains(level.var_fc4bb27a820f54dd.var_5715be6ca445d02e, other)) {
                continue;
            }
            if (distance2dsquared(scriptable.origin, other.origin) > level.var_fc4bb27a820f54dd.var_d1343ed4c5b69716) {
                continue;
            }
            var_7c6a1a7581e76afc = 0;
            /#
                scriptable thread function_ef3ab989669b4682();
            #/
            break;
        }
        if (var_7c6a1a7581e76afc) {
            level.var_fc4bb27a820f54dd.var_5715be6ca445d02e[i_spawned] = scriptable;
            i_spawned++;
        }
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5f
// Size: 0x21c
function function_cc4a3e17d7bec89c() {
    minx = level.mapcorners[0].origin[0];
    maxx = level.mapcorners[1].origin[0];
    miny = level.mapcorners[1].origin[1];
    maxy = level.mapcorners[0].origin[1];
    var_9f3d56ff7b8de6bc = anglestoforward(level.br_ac130.angles) * -1;
    t_left = (minx - self.origin[0]) / var_9f3d56ff7b8de6bc[0];
    t_right = (maxx - self.origin[0]) / var_9f3d56ff7b8de6bc[0];
    t_top = (miny - self.origin[1]) / var_9f3d56ff7b8de6bc[1];
    t_bottom = (maxy - self.origin[1]) / var_9f3d56ff7b8de6bc[1];
    t = -1;
    if (t_left > 0 && (t < 0 || t_left < t)) {
        t = t_left;
    }
    if (t_right > 0 && (t < 0 || t_right < t)) {
        t = t_right;
    }
    if (t_top > 0 && (t < 0 || t_top < t)) {
        t = t_top;
    }
    if (t_bottom > 0 && (t < 0 || t_bottom < t)) {
        t = t_bottom;
    }
    if (t >= 0) {
        t += distance2d(self.origin, level.br_ac130.origin);
        spawnx = self.origin[0] + t * var_9f3d56ff7b8de6bc[0];
        spawny = self.origin[1] + t * var_9f3d56ff7b8de6bc[1];
        planeheight = level.br_ac130.origin[2];
        return (spawnx, spawny, planeheight);
    }
    return undefined;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e84
// Size: 0x4e7
function function_105f0caaa61e873() {
    scripts\mp\flags::gameflagwait("infil_animatic_complete");
    v_spawn = function_cc4a3e17d7bec89c();
    if (!isdefined(v_spawn)) {
        var_bcef23e599e4cc3c = vectordot(anglestoright(level.br_ac130.angles), vectornormalize(self.origin - level.br_ac130.origin));
        v_spawn = level.br_ac130.origin + anglestoforward(level.br_ac130.angles) * -1 * (distance(level.br_ac130.origin, self.origin) - 40000) + anglestoright(level.br_ac130.angles) * 15000 * var_bcef23e599e4cc3c;
    }
    var_57318a9f25cee67d = 100;
    var_570e949f25a8b4c3 = scripts\cp_mp\parachute::getc130height() - 4000;
    var_5731809f25ced07f = var_57318a9f25cee67d + var_570e949f25a8b4c3 / 2;
    var_fe7278bc3929329e = (var_570e949f25a8b4c3 - var_57318a9f25cee67d) / 2;
    var_3b7468ecd13ad07b = vectordot(anglestoforward(level.br_ac130.angles), vectornormalize(v_spawn - level.br_ac130.origin));
    var_bfff077aec6dc176 = var_5731809f25ced07f + var_fe7278bc3929329e * var_3b7468ecd13ad07b;
    v_spawn += (0, 0, -1 * var_bfff077aec6dc176);
    drone = spawn("script_model", v_spawn);
    drone setmodel("veh9_mil_air_drone_redeploy_relocate");
    drone.angles = vectortoangles(self.origin - drone.origin);
    var_338b4f24fc6601c = level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5 * 5 * level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3;
    drone.speed = var_338b4f24fc6601c;
    drone.health = level.var_fc4bb27a820f54dd.i_health;
    drone.type = self.type;
    drone setcandamage(1);
    drone forcenetfieldhighlod(1);
    level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c[level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c.size] = drone;
    if (level.var_3976c9c03dc06d9b) {
        drone scripts\cp_mp\emp_debuff::set_apply_emp_callback(&function_6ee9e5ec63dd6ef1);
        drone.var_3545410459b16762 = &function_6ee9e5ec63dd6ef1;
    }
    /#
        if (getdvarint(@"hash_d7987b5db214b981", 0)) {
            debug::debug_sphere(drone, 25, (1, 0, 0), undefined, "<dev string:x1c>", "<dev string:x47>");
            debug::draw_angles(drone, undefined, 150, undefined, "<dev string:x1c>", "<dev string:x47>");
        }
    #/
    var_db362b4f739b7928 = spawnstruct();
    var_db362b4f739b7928.var_5f59cdfbf4669cc3 = 0;
    var_db362b4f739b7928.var_73e374ce21fb4fb5 = var_338b4f24fc6601c;
    var_db362b4f739b7928.var_64ab0a075a4d97e4 = var_338b4f24fc6601c * 20 * level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3;
    var_db362b4f739b7928.var_f9b853a2bbd2f0d8 = 0.05 / level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3;
    drone thread namespace_2c2703f78fc59600::function_6d9358d777958a1b(self, var_db362b4f739b7928);
    drone thread namespace_2c2703f78fc59600::function_53a07930f4fc0e08(self);
    drone thread namespace_2c2703f78fc59600::function_314cdfb5c5633b1();
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        if (drone.health <= 0) {
            if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
                level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
            }
            return;
        }
        wait 0.05;
    }
    drone cable_deploy();
    if (!isalive(drone)) {
        if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
            level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
        }
        return;
    }
    drone notify("relocation_complete");
    self.health = drone.health;
    if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
        level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
    }
    drone delete();
    function_ca6ea48c877cd367();
    thread function_7f00c76550370a80();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2373
// Size: 0x182
function function_aa6c956fa42c8dfd() {
    collisioncontents = physics_createcontents(["physicscontents_aiclip", "physicscontents_water"]);
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        trace = scripts\engine\trace::ray_trace(scriptable.origin, scriptable.origin + (0, 0, -3000), undefined, collisioncontents, 1, 1, 0);
        scriptable.var_e02f90c16d8ae6d5 = trace["surfacetype"];
        scriptable.var_7a6430ba88c4d983 = trace["position"];
    }
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_c6be6bfbfaa2f523) {
        trace = scripts\engine\trace::ray_trace(scriptable.origin, scriptable.origin + (0, 0, -3000), undefined, collisioncontents, 1, 1, 0);
        scriptable.var_e02f90c16d8ae6d5 = trace["surfacetype"];
        scriptable.var_7a6430ba88c4d983 = trace["position"];
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24fd
// Size: 0xc6
function function_ca6ea48c877cd367() {
    self setscriptablepartstate("redeploy_drone", "available");
    self.b_occupied = 1;
    self.b_used = 1;
    if (level.var_3976c9c03dc06d9b) {
        scripts\cp_mp\emp_debuff::set_apply_emp_callback(&function_9b93b1ae68a3845b);
        self.var_3545410459b16762 = &function_9b93b1ae68a3845b;
    }
    scripts\mp\weapons::function_e00b77a9cb4d8322(self);
    /#
        function_5d3b11328dcb5023();
    #/
    if (!isdefined(self.var_7a6430ba88c4d983)) {
        assertmsg("<dev string:x77>" + self.origin + "<dev string:x8c>");
        self.var_7a6430ba88c4d983 = self.origin - (0, 0, 2727);
    }
    thread function_d34e3d2df3e5ea04(self.var_7a6430ba88c4d983, self.var_e02f90c16d8ae6d5);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25cb
// Size: 0x114
function function_d34e3d2df3e5ea04(var_9532254955f79cbb, surfacetype) {
    var_f252b4de7806249 = spawnscriptable("scriptable_redeploy_drone_anchor_impact", var_9532254955f79cbb);
    if (!isdefined(surfacetype)) {
        surfacetype = "surftype_dirt";
    }
    switch (surfacetype) {
    case #"hash_296fec58e16e327":
    case #"hash_588c5c47805606eb":
    case #"hash_5f33d5485b7f33ed":
    case #"hash_6dc36f3e31f59c8b":
        var_f252b4de7806249 setscriptablepartstate("redeploy_drone_anchor_impact", "impact_concrete");
        break;
    case #"hash_126fff7ad2aa45":
    case #"hash_5ff12d0a2c109d2c":
    case #"hash_d4e7d6c49368be7f":
        var_f252b4de7806249 setscriptablepartstate("redeploy_drone_anchor_impact", "impact_dirt");
        break;
    case #"hash_2fa4167540164873":
        var_f252b4de7806249 setscriptablepartstate("redeploy_drone_anchor_impact", "impact_metal");
        break;
    case #"hash_2dc2bd39328def65":
    case #"hash_3990683480267242":
        var_f252b4de7806249 setscriptablepartstate("redeploy_drone_anchor_impact", "impact_water");
        break;
    }
    wait 2;
    var_f252b4de7806249 freescriptable();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26e7
// Size: 0x37
function function_80ce8f3739b7a346() {
    level notify("redeploy_drone_kill_callout_" + self.origin);
    self setscriptablepartstate("redeploy_drone", "unavailable");
    self.b_occupied = 0;
    scripts\mp\weapons::function_1a33bd42949ccbda(self);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2726
// Size: 0x13
function function_7fa5478ed150d979() {
    function_80ce8f3739b7a346();
    /#
        function_b286b55f5ce15dd5();
    #/
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2741
// Size: 0x1d
function function_e745a94784401dfb() {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return false;
    }
    return !namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(self.origin);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2767
// Size: 0x22
function cable_deploy() {
    self setscriptablepartstate("redeploy_drone_relocation_sfx", "deploy");
    thread deploy_icon();
    wait function_320c500cc9fc6438();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2791
// Size: 0x5e
function function_320c500cc9fc6438() {
    var_9aa22f1e9fe5bb88 = undefined;
    if (isdefined(self.model)) {
        var_9aa22f1e9fe5bb88 = level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45[self.model];
    }
    var_9aa22f1e9fe5bb88 = default_to(var_9aa22f1e9fe5bb88, level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45["veh9_mil_air_drone_redeploy_relocate"]);
    return var_9aa22f1e9fe5bb88;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f8
// Size: 0x2e
function deploy_icon() {
    deploy_icon = spawnscriptable("scriptable_redeploy_drone_deploy", self.origin);
    wait 0.8;
    deploy_icon freescriptable();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x282e
// Size: 0x37
function cable_retract() {
    self setscriptablepartstate("redeploy_drone_relocation_sfx", "retract");
    wait function_c93b6208d01671b2() - 0.7;
    self setscriptablepartstate("redeploy_drone_cable_sfx", "retract_stop");
    wait 0.7;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x286d
// Size: 0x5e
function function_c93b6208d01671b2() {
    var_f7d09807e8db51ee = undefined;
    if (isdefined(self.model)) {
        var_f7d09807e8db51ee = level.var_fc4bb27a820f54dd.var_8a066943bb13715f[self.model];
    }
    var_f7d09807e8db51ee = default_to(var_f7d09807e8db51ee, level.var_fc4bb27a820f54dd.var_8a066943bb13715f["veh9_mil_air_drone_redeploy_relocate"]);
    return var_f7d09807e8db51ee;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d4
// Size: 0x66
function health_init() {
    /#
        if (getdvarint(@"hash_bf9414a8359d7c0", 0)) {
            self.health = 1;
            self.maxhealth = 1;
            return;
        }
    #/
    self.health = level.var_fc4bb27a820f54dd.i_health;
    self.maxhealth = level.var_fc4bb27a820f54dd.i_health;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x2942
// Size: 0x2eb
function function_d01754fc00a031f4(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (!isdefined(instance)) {
        return;
    }
    if (!istrue(instance.var_47d27267be4655fb)) {
        return;
    }
    if (idamage < 2) {
        return;
    }
    if (shitloc[2] < instance.origin[2] - 100) {
        return;
    }
    if (isplayer(eattacker)) {
        eattacker namespace_e072c8407b2a861c::updatehitmarker("standard", instance.health == 0, 0, 1, "hitequip");
    } else if (isdefined(eattacker.owner) && isplayer(eattacker.owner)) {
        eattacker.owner namespace_e072c8407b2a861c::updatehitmarker("standard", instance.health == 0, 0, 1, "hitequip");
    }
    vehicleowner = undefined;
    if (isdefined(eattacker.model) && eattacker.model == "veh8_mil_air_lbravo_mp_flyable" || eattacker.model == "veh8_mil_air_lbravo_mp_flyable_mg" || eattacker.model == "veh9_mil_air_heli_medium_vehphys_mp") {
        vehicleowner = eattacker.owner;
        level thread function_cf65fbc1c077fadb(eattacker, instance.origin);
    }
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXPLOSIVE_BULLET" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_EXPLOSIVE") {
        idamage = int(idamage * level.var_fc4bb27a820f54dd.var_4b2cdacf483dccc4);
    }
    if (isdefined(einflictor) && isdefined(einflictor.model) && einflictor.model == "ks_airstrike_target_br_ch3") {
        idamage = level.var_fc4bb27a820f54dd.var_71ba1ddbe86cab15;
    }
    instance.health -= idamage;
    if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "toma_proj_mp") {
        instance.health = 0;
    }
    if (instance.health <= 0) {
        if (!istrue(instance.var_3d94e3b5be6fd3d1)) {
            level thread redeploy_drone_repopulation_watcher(instance);
        }
        if (isdefined(vehicleowner)) {
            instance redeploy_drone_destroyed(vehicleowner, einflictor.model);
            return;
        }
        instance redeploy_drone_destroyed(eattacker, einflictor.model);
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c35
// Size: 0x127
function redeploy_drone_destroyed(eattacker, modelname, var_aae73b7b727db0c4) {
    self setscriptablepartstate("redeploy_drone", "unavailable");
    self setscriptablepartstate("redeploy_drone_sfx", "disabled");
    scripts\mp\weapons::function_1a33bd42949ccbda(self);
    /#
        function_20998d024463786f();
    #/
    self.b_occupied = 0;
    self notify("redeploy_drone_destroyed");
    if (isdefined(modelname) && modelname == "ks_airstrike_target_br_ch3" && isdefined(eattacker)) {
        eattacker.var_3efdaabc0f66846d++;
    }
    if (isdefined(eattacker)) {
        scripts\cp_mp\challenges::function_8359cadd253f9604(eattacker, "destroy_redeploy_drone", 1);
    }
    var_9a6c1b85896a116e = {#was_relocating:0, #circle_index:isdefined(level.br_circle) ? utility::getintorzero(level.br_circle.circleindex) : -1, #pos:self.origin};
    level thread scripts\mp\gametypes\br_analytics::function_bfc305f32a65dee5(var_9a6c1b85896a116e);
    if (istrue(var_aae73b7b727db0c4)) {
        function_6d23aa882f67a716(eattacker);
        return;
    }
    thread function_9e83f198888c61e2(self.origin, self.angles, eattacker);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2d64
// Size: 0x7c
function function_9e83f198888c61e2(position, angles, eattacker) {
    level endon("game_ended");
    drone = spawn("script_model", position);
    drone setmodel("veh9_mil_air_drone_redeploy_relocate");
    drone.angles = angles;
    drone.speed = 0;
    scripts\mp\weapons::function_e00b77a9cb4d8322(drone);
    drone.owner = eattacker;
    drone function_e47fae0ab5c70a88();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2de8
// Size: 0x4e
function function_e47fae0ab5c70a88() {
    level endon("game_ended");
    waitframe();
    self setscriptablepartstate("redeploy_drone_relocation_smoke_vfx", "enabled");
    self physics_registerforcollisioncallback();
    thread function_26aacbd66ab5c92();
    self waittill("collision");
    function_6d23aa882f67a716();
    wait 0.2;
    scripts\mp\weapons::function_1a33bd42949ccbda(self);
    self delete();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3e
// Size: 0x244
function function_26aacbd66ab5c92() {
    level endon("game_ended");
    self endon("collision");
    self endon("entitydeleted");
    v_movement = (0, 0, 0);
    if (isdefined(self.v_destination)) {
        v_movement = vectornormalize(self.v_destination - self.origin);
    }
    self physics_takecontrol(1, self.origin, v_movement * self.speed * 1500);
    i = level.var_fc4bb27a820f54dd.var_43c609d0bf76cedc;
    x = randomfloatrange(i / 2, i);
    x = ter_op(cointoss(), x, x * -1);
    y = randomfloatrange(i / 2, i);
    y = ter_op(cointoss(), y, y * -1);
    z = randomfloatrange(i / 10, i / 5);
    z = ter_op(cointoss(), z, z * -1);
    self physics_applyimpulse(self.origin + (randomintrange(-50, 51), randomintrange(-50, 51), randomintrange(-50, 51)), (x, y, z));
    while (true) {
        var_d5cdf67a50a74a7a = anglestoforward(self.angles) * randomfloatrange(-1 * level.var_fc4bb27a820f54dd.var_3bc74411a49ef743, level.var_fc4bb27a820f54dd.var_3bc74411a49ef743);
        var_983148e6d0c8d005 = anglestoright(self.angles) * randomfloatrange(-1 * level.var_fc4bb27a820f54dd.var_3bc74411a49ef743, level.var_fc4bb27a820f54dd.var_3bc74411a49ef743);
        var_9a1f339b9a782980 = anglestoup(self.angles) * randomfloat(level.var_fc4bb27a820f54dd.var_3bc74411a49ef743);
        self physics_applyimpulse(self.origin + (randomintrange(-50, 51), randomintrange(-50, 51), randomintrange(-50, 51)), var_d5cdf67a50a74a7a + var_983148e6d0c8d005 + var_9a1f339b9a782980);
        wait 0.05;
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x308a
// Size: 0x89
function function_6d23aa882f67a716(eattacker) {
    thread function_b74de7f059051392(self.origin);
    if (!isdefined(eattacker) && isdefined(self.owner)) {
        eattacker = self.owner;
    }
    radiusdamage(self.origin, level.var_fc4bb27a820f54dd.var_94ca860762f3c07b, level.var_fc4bb27a820f54dd.var_f96af6af4b041aa9, level.var_fc4bb27a820f54dd.var_f94808af4addfa87, eattacker, "MOD_EXPLOSIVE");
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x311b
// Size: 0x2a
function function_b74de7f059051392(position) {
    vfx = spawnscriptable("scriptable_redeploy_drone_explosion", position);
    waitframe();
    vfx freescriptable();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x314d
// Size: 0x2e
function function_cf65fbc1c077fadb(attacker, v_pos) {
    wait 0.15;
    if (scripts\mp\utility\player::isreallyalive(attacker)) {
        attacker dodamage(9999, v_pos);
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3183
// Size: 0x97
function function_f0567cda220a6f7d(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    canusecallback = utility::function_6a11999c562cf4ab("redeploy_drone", "can_use_callback");
    if (isdefined(canusecallback) && [[ canusecallback ]](instance, player) == 0) {
        player notify("redeploy_drone_use_blocked");
        return;
    }
    player notify("redeploy_drone_use");
    if (isdefined(instance)) {
        instance notify("redeploy_drone_scriptable_used", player);
    }
    player thread function_ea7ddf2defb7947a(instance);
    player thread function_1b9a6266f1942fac(instance);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3222
// Size: 0xa2
function function_ea7ddf2defb7947a(instance) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    instance endon("death");
    level thread scripts\mp\gametypes\br_analytics::function_e77f36370162406c(self, instance);
    threshold_sq = squared(19);
    while (distance2dsquared(self.origin, instance.origin) > threshold_sq) {
        waitframe();
    }
    while (distance2dsquared(self.origin, instance.origin) < threshold_sq) {
        waitframe();
    }
    self notify("redeploy_drone_launch");
    function_eac929bddf9ce05a(instance);
    thread function_b4d6206c99452cac();
    thread function_d52ae9fc3100cecf();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32cc
// Size: 0x132
function function_b4d6206c99452cac() {
    level endon("game_ended");
    self setclientomnvar("ui_br_altimeter_state", 2);
    while (isdefined(self)) {
        if (self isskydiving()) {
            self waittill("skydive_end");
            break;
        }
        var_aa4f5ea34dfe428b = istrue(self.inlaststand);
        var_d4ba664e8cdd1e0a = isdefined(self.ffsm_state) && (self.ffsm_state == 5 || self.ffsm_state == 6 || self.ffsm_state == 3);
        bisland = self isonground() || self isswimming() || self ishanging();
        var_a2b5f51a86d266ad = self isonladder();
        var_d6442d18b46a7a10 = self function_9cc921a57ff4deb5();
        var_b48e997e59346e83 = !scripts\cp_mp\utility\player_utility::isreallyalive(self);
        binvehicle = self function_793f941d7dff15ed();
        if (var_aa4f5ea34dfe428b || var_d4ba664e8cdd1e0a || bisland || var_a2b5f51a86d266ad || var_d6442d18b46a7a10 || var_b48e997e59346e83 || binvehicle) {
            break;
        }
        waitframe();
    }
    if (isdefined(self)) {
        self setclientomnvar("ui_br_altimeter_state", 0);
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3406
// Size: 0x29
function function_eac929bddf9ce05a(instance) {
    if (istrue(instance.var_d77822da7628823)) {
        scripts\cp_mp\challenges::function_8359cadd253f9604(self, "redeploy_beacon", 1);
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3437
// Size: 0x1ec
function function_d52ae9fc3100cecf() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (!self isonground()) {
        nearbyplayers = playersincylinder(self.origin, level.var_fc4bb27a820f54dd.var_f06709293dd563e6, undefined, level.var_fc4bb27a820f54dd.var_9a279e924352be3b);
        teamcompare = self.team;
        foreach (targetplayer in nearbyplayers) {
            sameteam = teamcompare == targetplayer.team;
            if (sameteam) {
                continue;
            }
            var_cda71aec07aab082 = !scripts\mp\utility\player::isreallyalive(targetplayer) || istrue(targetplayer.inlaststand);
            if (var_cda71aec07aab082) {
                continue;
            }
            var_744496cccbbfcb78 = targetplayer isparachuting() || targetplayer isinfreefall();
            if (var_744496cccbbfcb78) {
                continue;
            }
            time = gettime();
            var_8edff54c680323 = isdefined(targetplayer.heardparachuteoverheadtime) && time - targetplayer.heardparachuteoverheadtime < level.var_fc4bb27a820f54dd.var_b24b7a96d6c8e3c8;
            if (var_8edff54c680323) {
                continue;
            }
            targetplayer.heardparachuteoverheadtime = time;
            if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
                operatorteam = scripts\mp\gametypes\br_public::brgetoperatorteam(targetplayer);
                if (!isdefined(operatorteam)) {
                    operatorteam = "allies";
                }
                var_7570afa45d86040f = game["voice"][operatorteam];
                targetplayer queuedialogforplayer(level.activeparachutersfactionvo[var_7570afa45d86040f], "respawning_enemy_in_area", 2);
                continue;
            }
            scripts\mp\gametypes\br_public::brleaderdialog("respawning_enemy_in_area", 1, [targetplayer]);
        }
        waitframe();
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x362b
// Size: 0x2f
function function_1b9a6266f1942fac(instance) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("redeploy_drone_launch");
    instance waittill("redeploy_drone_destroyed");
    self function_61195b9ee307ad14();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3662
// Size: 0xf9
function function_c4f705b1e3e908de() {
    level endon("game_ended");
    level waittill("br_circle_set");
    while (level.br_circle.circleindex != level.var_fc4bb27a820f54dd.var_73610df6cb8260e6) {
        wait level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04;
    }
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        if (scriptable getscriptablepartstate("redeploy_drone") == "available" || scriptable getscriptablepartstate("redeploy_drone") == "deploy" || scriptable getscriptablepartstate("redeploy_drone") == "retract") {
            scriptable thread function_bfa2960787851ba9();
            wait randomintrange(5, 10);
        }
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3763
// Size: 0x562
function redeploy_drone_repopulation_watcher(redeploy_drone) {
    level endon("game_ended");
    level endon("respawn_redeploy_drones");
    v_origin = redeploy_drone.origin;
    wait level.var_fc4bb27a820f54dd.var_4b39ba581f4e16ef;
    var_daad7d20d7a17c02 = undefined;
    var_9225dfdb20269b5a = undefined;
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        if (isdefined(redeploy_drone) && scriptable == redeploy_drone) {
            continue;
        }
        if (istrue(scriptable.b_occupied)) {
            continue;
        }
        if (istrue(scriptable.b_used)) {
            continue;
        }
        if (scriptable.script_noteworthy != "redeploy_drone_spawn" && scriptable.script_noteworthy != "redeploy_drone_relocate") {
            continue;
        }
        if (scriptable getscriptablepartstate("redeploy_drone") == "available" || scriptable getscriptablepartstate("redeploy_drone") == "deploy" || scriptable getscriptablepartstate("redeploy_drone") == "retract") {
            continue;
        }
        if (scriptable function_e745a94784401dfb()) {
            /#
                scriptable function_7fa5478ed150d979();
            #/
            continue;
        }
        if (scriptable function_77e61741cc59c806()) {
            /#
                scriptable function_ef3ab989669b4682();
            #/
            continue;
        }
        distance_sq = distance2dsquared(v_origin, scriptable.origin);
        if (!isdefined(var_9225dfdb20269b5a) || distance_sq < var_9225dfdb20269b5a) {
            var_9225dfdb20269b5a = distance_sq;
            var_daad7d20d7a17c02 = scriptable;
        }
    }
    if (!isdefined(var_daad7d20d7a17c02)) {
        return;
    }
    var_daad7d20d7a17c02.b_occupied = 1;
    var_daad7d20d7a17c02.b_used = 1;
    if (isdefined(redeploy_drone)) {
        redeploy_drone.b_occupied = 0;
    }
    var_9602b340166dcdd7 = scripts\mp\gametypes\br_circle::getsafecircleorigin();
    var_a4233c478eba62a0 = v_origin + vectornormalize(v_origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], v_origin[2])) * 20000;
    v_spawn_angles = vectortoangles(v_origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], v_origin[2]));
    drone = spawn("script_model", var_a4233c478eba62a0);
    drone setmodel("veh9_mil_air_drone_redeploy_relocate");
    drone.angles = v_spawn_angles;
    drone.speed = 0;
    drone health_init();
    drone setcandamage(1);
    drone forcenetfieldhighlod(1);
    scripts\mp\weapons::function_e00b77a9cb4d8322(drone);
    level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c[level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c.size] = drone;
    if (level.var_3976c9c03dc06d9b) {
        drone scripts\cp_mp\emp_debuff::set_apply_emp_callback(&function_6ee9e5ec63dd6ef1);
        drone.var_3545410459b16762 = &function_6ee9e5ec63dd6ef1;
    }
    if (isdefined(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b)) {
        level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b[level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b.size] = drone;
    }
    /#
        if (getdvarint(@"hash_d7987b5db214b981", 0)) {
            debug::debug_sphere(drone, 25, (1, 0, 0), undefined, "<dev string:x1c>", "<dev string:x47>");
            debug::draw_angles(drone, undefined, 150, undefined, "<dev string:x1c>", "<dev string:x47>");
        }
    #/
    drone thread function_6d9358d777958a1b(var_daad7d20d7a17c02);
    drone thread function_53a07930f4fc0e08(var_daad7d20d7a17c02);
    drone thread function_314cdfb5c5633b1(undefined, var_daad7d20d7a17c02);
    drone thread function_bb75b8cfbaa352ce(var_daad7d20d7a17c02);
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        if (drone.health <= 0) {
            if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
                level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
            }
            return;
        }
        wait 0.05;
    }
    drone cable_deploy();
    if (!isalive(drone)) {
        if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
            level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
        }
        return;
    }
    drone notify("relocation_complete");
    var_daad7d20d7a17c02.health = drone.health;
    if (isdefined(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b)) {
        level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = array_remove(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b, drone);
    }
    scripts\mp\weapons::function_1a33bd42949ccbda(drone);
    if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
        level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
    }
    drone delete();
    var_daad7d20d7a17c02 function_ca6ea48c877cd367();
    var_daad7d20d7a17c02 thread function_7f00c76550370a80();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ccd
// Size: 0x87
function get_closest_redeploy_drone(v_pos) {
    var_68b0d61f8e38270b = level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c;
    if (scripts\engine\utility::issharedfuncdefined(#"hash_7c77f410582a71b4", #"hash_3dd4fa0f710a2eff")) {
        var_c93c1ecdfdd31cc2 = [[ scripts\engine\utility::getsharedfunc(#"hash_7c77f410582a71b4", #"hash_3dd4fa0f710a2eff") ]]();
        var_68b0d61f8e38270b = array_combine(var_68b0d61f8e38270b, var_c93c1ecdfdd31cc2);
    }
    var_4469d6df2830d072 = sortbydistance(var_68b0d61f8e38270b, v_pos)[0];
    return var_4469d6df2830d072;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d5d
// Size: 0x32
function precision_airstrike_death(owner) {
    wait 0.3;
    if (!isdefined(self) || self.health <= 0) {
        owner.var_3efdaabc0f66846d++;
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d97
// Size: 0xbc
function dropbag_collision_watcher() {
    self waittill("collision", body0, body1, flag0, flag1, position, normal, impulse, ent);
    scr_drone = get_closest_redeploy_drone(position);
    if (isdefined(scr_drone) && distancesquared(position, scr_drone.origin) < squared(150)) {
        if (!istrue(scr_drone.var_d77822da7628823)) {
            level thread redeploy_drone_repopulation_watcher(scr_drone);
        }
        scr_drone redeploy_drone_destroyed(self.owner, undefined, 1);
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5b
// Size: 0x6d
function function_19e2fe45e130973f(position) {
    scr_drone = get_closest_redeploy_drone(position);
    if (isdefined(scr_drone) && distancesquared(position, scr_drone.origin) < squared(150)) {
        if (!istrue(scr_drone.var_d77822da7628823)) {
            level thread redeploy_drone_repopulation_watcher(scr_drone);
        }
        scr_drone redeploy_drone_destroyed(self.owner, undefined, 1);
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed0
// Size: 0x2
function function_2ad170b9d70c7062() {
    
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eda
// Size: 0x96
function function_7f00c76550370a80() {
    /#
        if (getdvarint(@"hash_20d28f147758431b", 0) && level.mapname == "<dev string:xa8>") {
            return;
        }
    #/
    level endon("game_ended");
    if (!isdefined(self) || !isdefined(self.origin)) {
        return;
    }
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() != "limbo") {
        var_b88f8ecd6f2078c3 = namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(self.origin);
        if (var_b88f8ecd6f2078c3 > 0) {
            wait var_b88f8ecd6f2078c3;
            if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
                return;
            }
        }
    }
    thread redeploy_drone_relocate();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3f78
// Size: 0x372
function redeploy_drone_relocate(scr_override, b_immediate, var_3d94e3b5be6fd3d1, var_169a75a90e9dbc44, var_32611311fef143b) {
    level endon("game_ended");
    if (!istrue(b_immediate)) {
        while (exclusion_zones::function_de57b9616f575a63((self.origin[0], self.origin[1], self.origin[2] - 2727)) != -1) {
            wait 1;
        }
        while (true) {
            if (!isdefined(level.br_circle) || !isdefined(level.br_circle.circleindex)) {
                var_42de8ecd1b474886 = 0;
            } else {
                var_42de8ecd1b474886 = level.br_circle.circleindex;
            }
            i_wait = level.var_fc4bb27a820f54dd.var_ab77bcfbf6ec9587 - level.var_fc4bb27a820f54dd.var_7e1e2deb54381dce * var_42de8ecd1b474886;
            if (i_wait < level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04) {
                i_wait = level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04;
            }
            wait i_wait;
            if (exclusion_zones::function_de57b9616f575a63((self.origin[0], self.origin[1], self.origin[2] - 2727)) != -1) {
                while (exclusion_zones::function_de57b9616f575a63((self.origin[0], self.origin[1], self.origin[2] - 2727)) != -1) {
                    wait 1;
                }
                continue;
            }
            break;
        }
    }
    function_f632348cbb773537(level.var_5161e88c4d5e0d35, self);
    if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    var_daad7d20d7a17c02 = undefined;
    var_9225dfdb20269b5a = undefined;
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        if (istrue(scriptable.b_occupied)) {
            continue;
        }
        if (scriptable.script_noteworthy != "redeploy_drone_spawn" && scriptable.script_noteworthy != "redeploy_drone_relocate") {
            continue;
        }
        if (scriptable getscriptablepartstate("redeploy_drone") == "available" || scriptable getscriptablepartstate("redeploy_drone") == "deploy" || scriptable getscriptablepartstate("redeploy_drone") == "retract") {
            continue;
        }
        if (scriptable function_e745a94784401dfb()) {
            /#
                scriptable function_7fa5478ed150d979();
            #/
            continue;
        }
        if (scriptable function_77e61741cc59c806()) {
            /#
                scriptable function_ef3ab989669b4682();
            #/
            continue;
        }
        distance_sq = distance2dsquared(self.origin, scriptable.origin);
        if (!isdefined(var_9225dfdb20269b5a) || distance_sq < var_9225dfdb20269b5a) {
            var_9225dfdb20269b5a = distance_sq;
            var_daad7d20d7a17c02 = scriptable;
        }
    }
    if (isdefined(scr_override)) {
        var_daad7d20d7a17c02 = scr_override;
    }
    if (!isdefined(var_daad7d20d7a17c02)) {
        thread function_bfa2960787851ba9();
        return;
    }
    function_7fa5478ed150d979();
    var_a94c8546fb678b4b = function_ce1ac8102a9fc02e(self.origin, self, var_daad7d20d7a17c02, var_32611311fef143b, var_3d94e3b5be6fd3d1);
    if (!istrue(var_a94c8546fb678b4b)) {
        return;
    }
    var_daad7d20d7a17c02 function_ca6ea48c877cd367();
    if (!istrue(var_169a75a90e9dbc44)) {
        var_daad7d20d7a17c02 thread function_7f00c76550370a80();
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x42f2
// Size: 0x38d
function function_ce1ac8102a9fc02e(spawn_position, var_76bfd75ccab42a13, var_daad7d20d7a17c02, var_32611311fef143b, var_3d94e3b5be6fd3d1, movement_parameters) {
    if (!isdefined(movement_parameters)) {
        movement_parameters = function_8a5c9896b0d26b24();
    }
    var_daad7d20d7a17c02.b_occupied = 1;
    var_daad7d20d7a17c02.b_used = 1;
    drone = spawn("script_model", spawn_position);
    var_32611311fef143b = default_to(var_32611311fef143b, 0);
    model_name = function_4e6c2482a4483a69(var_32611311fef143b);
    drone setmodel(model_name);
    if (isdefined(var_76bfd75ccab42a13)) {
        drone.angles = var_76bfd75ccab42a13.angles;
        drone.speed = 0;
        drone.health = var_76bfd75ccab42a13.health;
        drone.type = var_76bfd75ccab42a13.type;
    } else {
        drone.speed = movement_parameters.var_73e374ce21fb4fb5;
        drone health_init();
    }
    drone setcandamage(1);
    drone forcenetfieldhighlod(1);
    drone.var_3d94e3b5be6fd3d1 = var_3d94e3b5be6fd3d1;
    scripts\mp\weapons::function_e00b77a9cb4d8322(drone);
    level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c[level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c.size] = drone;
    if (level.var_3976c9c03dc06d9b) {
        drone scripts\cp_mp\emp_debuff::set_apply_emp_callback(&function_6ee9e5ec63dd6ef1);
        drone.var_3545410459b16762 = &function_6ee9e5ec63dd6ef1;
    }
    drone thread function_bb75b8cfbaa352ce(var_daad7d20d7a17c02, var_3d94e3b5be6fd3d1);
    if (isdefined(var_76bfd75ccab42a13)) {
        drone cable_retract();
    }
    if (!isalive(drone)) {
        if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
            level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
        }
        return false;
    }
    drone setscriptablepartstate("redeploy_drone_cable_sfx", "retract_stop");
    drone thread function_6d9358d777958a1b(var_daad7d20d7a17c02, movement_parameters);
    drone thread function_53a07930f4fc0e08(var_daad7d20d7a17c02, movement_parameters);
    drone thread function_314cdfb5c5633b1(var_76bfd75ccab42a13, var_daad7d20d7a17c02);
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        if (drone.health <= 0) {
            if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
                level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
            }
            return false;
        }
        wait 0.05;
    }
    drone cable_deploy();
    if (!isalive(drone)) {
        if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
            level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
        }
        return false;
    }
    drone notify("relocation_complete");
    var_daad7d20d7a17c02.health = drone.health;
    scripts\mp\weapons::function_1a33bd42949ccbda(drone);
    if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
        level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
    }
    drone delete();
    return true;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4688
// Size: 0xdf
function function_bfa2960787851ba9(var_32611311fef143b, i_wait, var_754583532638fbd) {
    level endon("game_ended");
    var_32611311fef143b = default_to(var_32611311fef143b, 0);
    if (!isdefined(i_wait)) {
        if (!isdefined(level.br_circle) || !isdefined(level.br_circle.circleindex)) {
            var_42de8ecd1b474886 = 0;
        } else {
            var_42de8ecd1b474886 = level.br_circle.circleindex;
        }
        i_wait = level.var_fc4bb27a820f54dd.var_ab77bcfbf6ec9587 - level.var_fc4bb27a820f54dd.var_7e1e2deb54381dce * var_42de8ecd1b474886;
        if (i_wait < level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04) {
            i_wait = level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04;
        }
    }
    wait i_wait;
    function_26aa223d0b9d14ba(var_32611311fef143b, var_754583532638fbd);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x476f
// Size: 0x356
function function_26aa223d0b9d14ba(var_32611311fef143b, var_754583532638fbd) {
    level endon("game_ended");
    if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    s_despawn = spawnstruct();
    if (istrue(level.var_2df69b8e552238b6)) {
        var_9602b340166dcdd7 = level.br_level.br_circlecenters[level.br_circle.circleindex + 1];
    } else {
        var_9602b340166dcdd7 = scripts\mp\gametypes\br_circle::getsafecircleorigin();
    }
    s_despawn.origin = self.origin + vectornormalize(self.origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], self.origin[2])) * 20000;
    s_despawn.angles = vectortoangles(self.origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], self.origin[2]));
    function_7fa5478ed150d979();
    model_name = function_4e6c2482a4483a69(var_32611311fef143b);
    drone = spawn("script_model", self.origin);
    drone setmodel(model_name);
    drone.angles = self.angles;
    drone.speed = 0;
    drone.health = self.health;
    drone.type = self.type;
    drone forcenetfieldhighlod(1);
    scripts\mp\weapons::function_e00b77a9cb4d8322(drone);
    level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c[level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c.size] = drone;
    if (level.var_3976c9c03dc06d9b) {
        drone scripts\cp_mp\emp_debuff::set_apply_emp_callback(&function_6ee9e5ec63dd6ef1);
        drone.var_3545410459b16762 = &function_6ee9e5ec63dd6ef1;
    }
    drone thread function_bb75b8cfbaa352ce();
    if (!istrue(var_754583532638fbd)) {
        drone cable_retract();
    }
    if (!isalive(drone)) {
        if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
            level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
        }
        return;
    }
    drone thread function_6d9358d777958a1b(s_despawn);
    drone thread function_53a07930f4fc0e08(s_despawn);
    drone thread function_314cdfb5c5633b1(self);
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        if (drone.health <= 0) {
            if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
                level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
            }
            return;
        }
        wait 0.05;
    }
    drone notify("relocation_complete");
    scripts\mp\weapons::function_1a33bd42949ccbda(drone);
    if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone)) {
        level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, drone);
    }
    drone delete();
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4acd
// Size: 0x2cd
function function_bb75b8cfbaa352ce(var_daad7d20d7a17c02, var_3d94e3b5be6fd3d1) {
    self endon("entitydeleted");
    self endon("relocation_complete");
    while (true) {
        self waittill("damage", idamage, eattacker, direction_vec, damagelocation, smeansofdeath, modelname, tagname, partname, dflags, objweapon);
        if (isplayer(eattacker)) {
            eattacker namespace_e072c8407b2a861c::updatehitmarker("standard", self.health == 0, 0, 1, "hitequip");
        } else if (isdefined(eattacker.owner) && isplayer(eattacker.owner)) {
            eattacker.owner namespace_e072c8407b2a861c::updatehitmarker("standard", self.health == 0, 0, 1, "hitequip");
        }
        if (isdefined(eattacker.model) && eattacker.model == "veh8_mil_air_lbravo_mp_flyable" || eattacker.model == "veh8_mil_air_lbravo_mp_flyable_mg" || eattacker.model == "veh9_mil_air_heli_medium_vehphys_mp") {
            level thread function_cf65fbc1c077fadb(eattacker, self.origin);
        }
        if (isdefined(smeansofdeath) && smeansofdeath == "MOD_EXPLOSIVE_BULLET" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_EXPLOSIVE") {
            idamage = int(idamage * level.var_fc4bb27a820f54dd.var_4b2cdacf483dccc4);
        }
        if (isdefined(modelname) && modelname == "ks_airstrike_target_br_ch3") {
            idamage = level.var_fc4bb27a820f54dd.var_71ba1ddbe86cab15;
        }
        self.health -= idamage;
        if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "toma_proj_mp") {
            self.health = 0;
        }
        if (self.health <= 0) {
            if (array_contains(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, self)) {
                level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c = array_remove(level.var_fc4bb27a820f54dd.var_858ba27e4dbd844c, self);
            }
            if (!istrue(var_3d94e3b5be6fd3d1)) {
                level thread redeploy_drone_repopulation_watcher(self);
            }
            function_d0250169e6dfa8e4(eattacker, modelname);
            if (isdefined(var_daad7d20d7a17c02)) {
                var_daad7d20d7a17c02.b_occupied = 0;
            }
            return;
        }
    }
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4da2
// Size: 0xa8
function function_d0250169e6dfa8e4(eattacker, modelname) {
    if (isdefined(modelname) && modelname == "ks_airstrike_target_br_ch3") {
        eattacker.var_3efdaabc0f66846d++;
    }
    self.owner = eattacker;
    var_9a6c1b85896a116e = {#was_relocating:1, #circle_index:isdefined(level.br_circle) ? utility::getintorzero(level.br_circle.circleindex) : -1, #pos:self.origin};
    function_e47fae0ab5c70a88();
    level thread scripts\mp\gametypes\br_analytics::function_bfc305f32a65dee5(var_9a6c1b85896a116e);
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e52
// Size: 0xb0
function function_77e61741cc59c806() {
    var_f04a5854e7607231 = sqrt(level.var_fc4bb27a820f54dd.var_8a13be89e30d617);
    var_ee6ee60e25f972ad = sortbydistancecullbyradius(level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c, self.origin, var_f04a5854e7607231);
    foreach (scriptable in var_ee6ee60e25f972ad) {
        if (scriptable == self) {
            continue;
        }
        if (istrue(scriptable.b_occupied)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4f0b
// Size: 0x2d8
function function_6d9358d777958a1b(var_daad7d20d7a17c02, movement_parameters) {
    level endon("game_ended");
    self endon("entitydeleted");
    if (!isdefined(movement_parameters)) {
        movement_parameters = function_8a5c9896b0d26b24();
    }
    self.v_destination = var_daad7d20d7a17c02.origin;
    self.drone_arrived = 0;
    /#
        utility::function_2bf8ec790b5a10f8(@"hash_d7987b5db214b981", &debug::debug_line, [self, var_daad7d20d7a17c02.origin, (1, 0, 0), undefined, "<dev string:x1c>", "<dev string:xbb>"]);
    #/
    while (self.speed < movement_parameters.var_73e374ce21fb4fb5) {
        self.speed += 1;
        if (self.speed > movement_parameters.var_73e374ce21fb4fb5) {
            self.speed = movement_parameters.var_73e374ce21fb4fb5;
        }
        self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.05, 0, 0);
        wait 0.05;
    }
    var_a15c0fcf14bbd67b = squared(movement_parameters.var_64ab0a075a4d97e4);
    while (distancesquared(self.origin, self.v_destination) > var_a15c0fcf14bbd67b) {
        self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.05, 0, 0);
        wait 0.05;
    }
    self notify("redeploy_drone_arrive");
    self.drone_arrived = 1;
    while (true) {
        var_4e8a734825248b09 = distance(self.origin, self.v_destination);
        if (var_4e8a734825248b09 < 0.1) {
            break;
        }
        self.speed = var_4e8a734825248b09 * movement_parameters.var_f9b853a2bbd2f0d8;
        self.speed = clamp(self.speed, movement_parameters.var_5f59cdfbf4669cc3, movement_parameters.var_73e374ce21fb4fb5);
        self.speed = min(self.speed, var_4e8a734825248b09);
        self moveto(self.origin + vectornormalize(self.v_destination - self.origin) * self.speed, 0.05, 0, 0);
        wait 0.05;
    }
    self moveto(self.v_destination, 0.05, 0, 0);
    wait 0.05;
    self.speed = 0;
    self.v_destination = undefined;
    self.var_3b4fee20d214bd9b = 1;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51eb
// Size: 0x90
function function_8a5c9896b0d26b24() {
    var_db362b4f739b7928 = spawnstruct();
    var_db362b4f739b7928.var_5f59cdfbf4669cc3 = 0;
    var_db362b4f739b7928.var_73e374ce21fb4fb5 = level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5;
    var_db362b4f739b7928.var_64ab0a075a4d97e4 = 500;
    var_db362b4f739b7928.var_f9b853a2bbd2f0d8 = 0.1;
    var_db362b4f739b7928.var_27ac068509a4d0ed = 30;
    var_db362b4f739b7928.var_ae12b50991636b8c = 0.025;
    var_db362b4f739b7928.var_92f5e0dfc7e45f70 = 2;
    return var_db362b4f739b7928;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5284
// Size: 0x25e
function function_e8bfdc1f36c0be7c(target_position, var_db362b4f739b7928) {
    if (istrue(var_db362b4f739b7928.var_1f674850357ba893)) {
        if (istrue(self.drone_arrived)) {
            return;
        }
        self endon("redeploy_drone_arrive");
    }
    level endon("game_ended");
    self endon("entitydeleted");
    if (!isdefined(var_db362b4f739b7928)) {
        var_db362b4f739b7928 = function_8a5c9896b0d26b24();
    }
    v_diff = vectornormalize(target_position - self.origin);
    var_da83f385e7e33e1 = vectortoangles(v_diff)[1] - self.angles[1];
    if (var_da83f385e7e33e1 < -180) {
        var_da83f385e7e33e1 += 360;
    }
    if (var_da83f385e7e33e1 > 180) {
        var_da83f385e7e33e1 -= 360;
    }
    var_3b7468ecd13ad07b = vectordot(v_diff, anglestoforward(self.angles));
    var_bcef23e599e4cc3c = vectordot(v_diff, anglestoright(self.angles));
    f_frames = abs(var_da83f385e7e33e1);
    var_be553a9ce54d449 = f_frames - 90;
    if (var_be553a9ce54d449 > 0) {
        var_39fb5d4ca8578c6 = var_be553a9ce54d449 / f_frames;
        self rotateby((var_db362b4f739b7928.var_27ac068509a4d0ed * var_3b7468ecd13ad07b + var_db362b4f739b7928.var_27ac068509a4d0ed / 2, var_da83f385e7e33e1 * var_39fb5d4ca8578c6, var_db362b4f739b7928.var_27ac068509a4d0ed * var_bcef23e599e4cc3c), var_be553a9ce54d449 * var_db362b4f739b7928.var_ae12b50991636b8c, var_be553a9ce54d449 / 2 * var_db362b4f739b7928.var_ae12b50991636b8c, 0);
        wait var_be553a9ce54d449 * var_db362b4f739b7928.var_ae12b50991636b8c;
        var_452972b9d736dfd6 = f_frames - var_be553a9ce54d449;
        self rotateto((var_db362b4f739b7928.var_27ac068509a4d0ed, vectortoangles(v_diff)[1], 0), var_452972b9d736dfd6 * var_db362b4f739b7928.var_ae12b50991636b8c, 0, var_452972b9d736dfd6 / 2 * var_db362b4f739b7928.var_ae12b50991636b8c);
        wait var_452972b9d736dfd6 * var_db362b4f739b7928.var_ae12b50991636b8c;
        return;
    }
    f_halftime = f_frames / 2 * var_db362b4f739b7928.var_ae12b50991636b8c;
    if (f_halftime < 1) {
        f_halftime = 1;
    }
    self rotateby((var_db362b4f739b7928.var_27ac068509a4d0ed / 2 * var_3b7468ecd13ad07b, var_da83f385e7e33e1 / 2, var_db362b4f739b7928.var_27ac068509a4d0ed / 2 * var_bcef23e599e4cc3c), f_halftime, f_halftime / 2, 0);
    wait f_halftime;
    self rotateto((var_db362b4f739b7928.var_27ac068509a4d0ed, vectortoangles(v_diff)[1], 0), f_halftime, 0, f_halftime / 2);
    wait f_halftime;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x54ea
// Size: 0x173
function function_53a07930f4fc0e08(var_daad7d20d7a17c02, var_db362b4f739b7928) {
    level endon("game_ended");
    self endon("entitydeleted");
    if (!isdefined(var_db362b4f739b7928)) {
        var_db362b4f739b7928 = function_8a5c9896b0d26b24();
    }
    function_e8bfdc1f36c0be7c(var_daad7d20d7a17c02.origin, var_db362b4f739b7928);
    if (!istrue(self.drone_arrived)) {
        self waittill("redeploy_drone_arrive");
    }
    var_da83f385e7e33e1 = var_daad7d20d7a17c02.angles[1] - self.angles[1];
    if (var_da83f385e7e33e1 < -180) {
        var_da83f385e7e33e1 += 360;
    }
    if (var_da83f385e7e33e1 > 180) {
        var_da83f385e7e33e1 -= 360;
    }
    var_3b7468ecd13ad07b = vectordot(anglestoforward(self.angles), anglestoforward(var_daad7d20d7a17c02.angles));
    var_bcef23e599e4cc3c = vectordot(anglestoright(self.angles), anglestoforward(var_daad7d20d7a17c02.angles));
    f_halftime = var_db362b4f739b7928.var_92f5e0dfc7e45f70 / 2;
    self rotateby((-1 * var_db362b4f739b7928.var_27ac068509a4d0ed * var_3b7468ecd13ad07b - var_db362b4f739b7928.var_27ac068509a4d0ed, var_da83f385e7e33e1 / 2, var_db362b4f739b7928.var_27ac068509a4d0ed * var_bcef23e599e4cc3c), f_halftime, f_halftime / 2, 0);
    wait f_halftime;
    self rotateto((0, var_daad7d20d7a17c02.angles[1], 0), f_halftime, 0, f_halftime / 2);
    wait f_halftime;
    self.var_f44262daab1a384a = 1;
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5665
// Size: 0x8a
function function_314cdfb5c5633b1(var_76bfd75ccab42a13, var_359e64e7a629dd94) {
    self endon("entitydeleted");
    wait 1;
    self setscriptablepartstate("redeploy_drone_relocation_sfx", "relocation_loop");
    if (isdefined(var_76bfd75ccab42a13)) {
        var_76bfd75ccab42a13 setscriptablepartstate("redeploy_drone_sfx", "disabled");
    }
    self waittill("redeploy_drone_arrive");
    if (isdefined(var_359e64e7a629dd94)) {
        var_359e64e7a629dd94 setscriptablepartstate("redeploy_drone_sfx", "relocation_sfx_end");
        wait 0.5;
        var_359e64e7a629dd94 setscriptablepartstate("redeploy_drone_sfx", "engine_idle_sfx");
    }
    self setscriptablepartstate("redeploy_drone_relocation_sfx", "relocation_end");
}

// Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56f7
// Size: 0x9b
function function_4e6c2482a4483a69(var_32611311fef143b) {
    model_name = "veh9_mil_air_drone_redeploy_relocate";
    switch (var_32611311fef143b) {
    case 0:
        model_name = "veh9_mil_air_drone_redeploy_relocate";
        break;
    case 1:
        model_name = "veh9_mil_air_drone_redeploy_relocate_extended";
        break;
    case 2:
        model_name = "veh9_mil_air_drone_redeploy_relocate_short";
        break;
    case 3:
        model_name = "veh9_mil_air_drone_redeploy_relocate_very_short";
        break;
    default:
        assertmsg("<dev string:xd4>");
        break;
    }
    return model_name;
}

/#

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x579b
    // Size: 0x5
    function function_b1eab7c7fda1fb57() {
        
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x57a8
    // Size: 0x7f
    function debug_init() {
        level waittill("<dev string:xf6>");
        level thread function_db5c75f2a84ff03d();
        function_2bf8ec790b5a10f8(@"hash_20d28f147758431b", &function_3b88aadd61acb2f7);
        function_2bf8ec790b5a10f8(@"hash_1b823e69b7bcb477", &function_ae4ed007ee115b61);
        function_2bf8ec790b5a10f8(@"hash_7206433d469d7d0a", &function_f17472706da6eab0);
        function_2bf8ec790b5a10f8(@"hash_44c9b804cfee044b", &function_12bab4323f6ad87d);
        function_2bf8ec790b5a10f8(@"hash_bf9414a8359d7c0", &function_df335ef8c85195e3);
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x582f
    // Size: 0x86
    function function_db5c75f2a84ff03d() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x108>");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x121>", "<dev string:x12a>", &function_b1ad7f49e2d9a2c1);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x143>", "<dev string:x15c>", &function_bb29c4b9f489b197);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x185>", "<dev string:x1a3>", &function_79db3fe8077d4858);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x1d1>", "<dev string:x1e4>", &function_6f727cad8b163563);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x207>", "<dev string:x213>", &function_16a89c1bb0d4c2b1);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x58bd
    // Size: 0x28
    function function_b1ad7f49e2d9a2c1() {
        if (!getdvarint(@"hash_d7987b5db214b981", 0)) {
            function_d8b0e8ca68b581f3();
            return;
        }
        function_42b57a2447545237();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x58ed
    // Size: 0x7f
    function function_d8b0e8ca68b581f3() {
        setdvar(@"hash_d7987b5db214b981", 1);
        iprintlnbold("<dev string:x22f>");
        foreach (drone in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            drone function_a615190cb6a4e817();
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5974
    // Size: 0x28
    function function_42b57a2447545237() {
        setdvar(@"hash_d7987b5db214b981", 0);
        iprintlnbold("<dev string:x25c>");
        level notify("<dev string:x1c>");
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x59a4
    // Size: 0x28
    function function_bb29c4b9f489b197() {
        if (!getdvarint(@"hash_1b823e69b7bcb477", 0)) {
            function_ae4ed007ee115b61();
            return;
        }
        function_688b987090050bdd();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x59d4
    // Size: 0x2a
    function function_ae4ed007ee115b61() {
        setdvar(@"hash_1b823e69b7bcb477", 1);
        iprintlnbold("<dev string:x28a>");
        level thread function_29896330c83a80fa();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x5a06
    // Size: 0x18a
    function function_29896330c83a80fa(v_position, i_radius) {
        level endon("<dev string:x2c7>");
        level endon("<dev string:x2d5>");
        var_271f7ba625d29bdd = getdvarint(@"hash_9bd3724f70106775", 9000);
        while (true) {
            scr_closest = level.players[0] utility::function_4676b0931a17998a(level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c);
            foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
                if (scriptable == scr_closest) {
                    sphere(scriptable.origin, 200, (1, 1, 1), 0, 2);
                    cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_271f7ba625d29bdd, (0, 0, 1), 0, 2);
                    continue;
                }
                cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_271f7ba625d29bdd, (0.5, 0.5, 0.5), 0, 2);
            }
            waitframe();
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5b98
    // Size: 0x28
    function function_688b987090050bdd() {
        setdvar(@"hash_1b823e69b7bcb477", 0);
        iprintlnbold("<dev string:x310>");
        level notify("<dev string:x2d5>");
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5bc8
    // Size: 0x28
    function function_79db3fe8077d4858() {
        if (!getdvarint(@"hash_7206433d469d7d0a", 0)) {
            function_f17472706da6eab0();
            return;
        }
        function_aa257341263c992a();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5bf8
    // Size: 0x2a
    function function_f17472706da6eab0() {
        setdvar(@"hash_7206433d469d7d0a", 1);
        iprintlnbold("<dev string:x34e>");
        level thread function_7269acc313c13ac3();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x5c2a
    // Size: 0x22c
    function function_7269acc313c13ac3(v_position, i_radius) {
        level endon("<dev string:x2c7>");
        level endon("<dev string:x390>");
        var_53f65fa15502d74e = getdvarint(@"hash_59c137234dad4ad6", 7000);
        while (true) {
            var_7e3573e6ecff532d = -1;
            scr_closest = undefined;
            foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
                v_player = anglestoforward(level.players[0] getplayerangles());
                var_d9b55f33c875d95d = vectornormalize(scriptable.origin - level.players[0] geteye());
                f_dot = vectordot(v_player, var_d9b55f33c875d95d);
                if (f_dot >= var_7e3573e6ecff532d) {
                    var_7e3573e6ecff532d = f_dot;
                    scr_closest = scriptable;
                }
            }
            foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
                if (scriptable == scr_closest) {
                    sphere(scriptable.origin, 200, (1, 1, 1), 0, 2);
                    cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_53f65fa15502d74e, (1, 1, 0), 0, 2);
                    continue;
                }
                cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_53f65fa15502d74e, (0.5, 0.5, 0.5), 0, 2);
            }
            waitframe();
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5e5e
    // Size: 0x28
    function function_aa257341263c992a() {
        setdvar(@"hash_7206433d469d7d0a", 0);
        iprintlnbold("<dev string:x3d0>");
        level notify("<dev string:x390>");
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5e8e
    // Size: 0x28
    function function_6f727cad8b163563() {
        if (!getdvarint(@"hash_44c9b804cfee044b", 0)) {
            function_12bab4323f6ad87d();
            return;
        }
        function_9b4f358177d29219();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5ebe
    // Size: 0x80
    function function_12bab4323f6ad87d() {
        setdvar(@"hash_44c9b804cfee044b", 1);
        iprintlnbold("<dev string:x413>");
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable thread function_ae07af550fa417d9();
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5f46
    // Size: 0x163
    function function_ae07af550fa417d9() {
        switch (self.var_e02f90c16d8ae6d5) {
        case #"hash_126fff7ad2aa45":
        case #"hash_296fec58e16e327":
        case #"hash_2dc2bd39328def65":
        case #"hash_2fa4167540164873":
        case #"hash_3990683480267242":
        case #"hash_588c5c47805606eb":
        case #"hash_5f33d5485b7f33ed":
        case #"hash_5ff12d0a2c109d2c":
        case #"hash_6dc36f3e31f59c8b":
        case #"hash_d4e7d6c49368be7f":
            debug::debug_print3d(self.var_7a6430ba88c4d983 + (0, 0, 200), self.var_e02f90c16d8ae6d5, (1, 1, 1), undefined, "<dev string:x51c>", undefined, undefined, 10);
            debug::debug_sphere(self.var_7a6430ba88c4d983, 2, (1, 1, 1), undefined, "<dev string:x51c>");
            break;
        default:
            debug::debug_print3d(self.var_7a6430ba88c4d983 + (0, 0, 200), self.var_e02f90c16d8ae6d5, (1, 1, 1), undefined, "<dev string:x51c>", undefined, undefined, 10);
            debug::debug_sphere(self.var_7a6430ba88c4d983, 2, (1, 0, 0), undefined, "<dev string:x51c>");
            break;
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x60b1
    // Size: 0x28
    function function_9b4f358177d29219() {
        setdvar(@"hash_44c9b804cfee044b", 0);
        iprintlnbold("<dev string:x551>");
        level notify("<dev string:x51c>");
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x60e1
    // Size: 0x28
    function function_d6b87dd0429c8c1d() {
        if (!getdvarint(@"hash_a64dca6283ab8a08", 0)) {
            function_7abc6a18a0ca949f();
            return;
        }
        function_b7153d299dabc423();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6111
    // Size: 0x2a
    function function_7abc6a18a0ca949f() {
        setdvar(@"hash_a64dca6283ab8a08", 1);
        iprintlnbold("<dev string:x589>");
        level thread function_b30fb80a22d3bc1a();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6143
    // Size: 0x46
    function function_b30fb80a22d3bc1a() {
        level endon("<dev string:x2c7>");
        level endon("<dev string:x5ad>");
        while (true) {
            trace = level.players[0] trace::player_viewangles();
            iprintlnbold(trace["<dev string:x5df>"]);
            waitframe();
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6191
    // Size: 0x28
    function function_b7153d299dabc423() {
        setdvar(@"hash_a64dca6283ab8a08", 0);
        iprintlnbold("<dev string:x5ee>");
        level notify("<dev string:x5ad>");
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x61c1
    // Size: 0x28
    function function_16a89c1bb0d4c2b1() {
        if (!getdvarint(@"hash_bf9414a8359d7c0", 0)) {
            function_df335ef8c85195e3();
            return;
        }
        function_2fb292208b9284c7();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x61f1
    // Size: 0x93
    function function_df335ef8c85195e3() {
        setdvar(@"hash_bf9414a8359d7c0", 1);
        iprintlnbold("<dev string:x613>");
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable.health = 1;
            scriptable.maxhealth = 1;
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x628c
    // Size: 0x7e
    function function_2fb292208b9284c7() {
        setdvar(@"hash_bf9414a8359d7c0", 0);
        iprintlnbold("<dev string:x63b>");
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable health_init();
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6312
    // Size: 0x3dd
    function function_3b88aadd61acb2f7() {
        if (level.mapname != "<dev string:xa8>") {
            return;
        }
        level notify("<dev string:x664>");
        level endon("<dev string:x664>");
        scr_static = spawnscriptable("<dev string:x68e>", (0, 0, 2740));
        var_730315a2d2560fad = spawnscriptable("<dev string:x68e>", (0, 0, 0));
        var_730312a2d2560914 = spawnscriptable("<dev string:x68e>", (0, 0, 0));
        scr_static.var_47d27267be4655fb = 1;
        var_730315a2d2560fad.var_47d27267be4655fb = 1;
        var_730312a2d2560914.var_47d27267be4655fb = 1;
        scr_static health_init();
        var_730315a2d2560fad health_init();
        var_730312a2d2560914 health_init();
        level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c[level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c.size] = scr_static;
        level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c[level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c.size] = var_730315a2d2560fad;
        level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c[level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c.size] = var_730312a2d2560914;
        var_730315a2d2560fad.i_random = randomint(360);
        var_730315a2d2560fad.origin = scr_static.origin + 5500 * anglestoforward((0, var_730315a2d2560fad.i_random, 0));
        var_730312a2d2560914.i_random = var_730315a2d2560fad.i_random + randomintrange(90, 270);
        if (var_730312a2d2560914.i_random >= 360) {
            var_730312a2d2560914.i_random -= 360;
        }
        var_730312a2d2560914.origin = scr_static.origin + 5500 * anglestoforward((0, var_730312a2d2560914.i_random, 0));
        scr_static function_ca6ea48c877cd367();
        scr_static setscriptablepartstate("<dev string:x6ab>", "<dev string:x6c1>");
        scr_static setscriptablepartstate("<dev string:x6d4>", "<dev string:x6ea>");
        scripts\mp\weapons::function_e00b77a9cb4d8322(scr_static);
        var_730315a2d2560fad function_f5c0566b1aa605fb();
        var_730312a2d2560914 function_ca6ea48c877cd367();
        var_730312a2d2560914 setscriptablepartstate("<dev string:x6ab>", "<dev string:x6c1>");
        var_730312a2d2560914 setscriptablepartstate("<dev string:x6d4>", "<dev string:x6ea>");
        scripts\mp\weapons::function_e00b77a9cb4d8322(var_730312a2d2560914);
        while (true) {
            scr_static thread redeploy_drone_relocate();
            wait 6;
            var_730312a2d2560914 redeploy_drone_relocate();
            wait 6;
            var_730312a2d2560914.i_random = var_730315a2d2560fad.i_random + randomintrange(90, 270);
            if (var_730312a2d2560914.i_random >= 360) {
                var_730312a2d2560914.i_random -= 360;
            }
            var_730312a2d2560914.origin = scr_static.origin + 5500 * anglestoforward((0, var_730312a2d2560914.i_random, 0));
            var_730312a2d2560914 function_f5c0566b1aa605fb();
            var_730312a2d2560914 setscriptablepartstate("<dev string:x6ab>", "<dev string:x6f5>");
            scr_static thread redeploy_drone_relocate();
            wait 6;
            var_730315a2d2560fad redeploy_drone_relocate();
            wait 6;
            var_730315a2d2560fad.i_random = var_730312a2d2560914.i_random + randomintrange(90, 270);
            if (var_730315a2d2560fad.i_random >= 360) {
                var_730315a2d2560fad.i_random -= 360;
            }
            var_730315a2d2560fad.origin = scr_static.origin + 5500 * anglestoforward((0, var_730315a2d2560fad.i_random, 0));
            var_730315a2d2560fad function_f5c0566b1aa605fb();
            var_730315a2d2560fad setscriptablepartstate("<dev string:x6ab>", "<dev string:x6f5>");
        }
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x66f7
    // Size: 0x20
    function function_f868abadfcd3f180(instance, time) {
        wait time;
        instance redeploy_drone_destroyed();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x671f
    // Size: 0x51
    function function_f5c0566b1aa605fb() {
        self setscriptablepartstate("<dev string:x701>", "<dev string:x713>");
        self setscriptablepartstate("<dev string:x722>", "<dev string:x6f5>");
        self setscriptablepartstate("<dev string:x73e>", "<dev string:x6f5>");
        self.b_occupied = 0;
        scripts\mp\weapons::function_1a33bd42949ccbda(self);
        function_20998d024463786f();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6778
    // Size: 0x22
    function function_5d3b11328dcb5023() {
        self.var_b1841dac996ed625 = (0, 1, 0);
        function_a615190cb6a4e817();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x67a2
    // Size: 0x22
    function function_20998d024463786f() {
        self.var_b1841dac996ed625 = (1, 1, 0);
        function_a615190cb6a4e817();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x67cc
    // Size: 0x22
    function function_763b92766c8f0070() {
        self.var_b1841dac996ed625 = (0, 1, 1);
        function_a615190cb6a4e817();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x67f6
    // Size: 0x22
    function function_ef3ab989669b4682() {
        self.var_b1841dac996ed625 = (0, 0, 1);
        function_a615190cb6a4e817();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6820
    // Size: 0x22
    function function_b286b55f5ce15dd5() {
        self.var_b1841dac996ed625 = (1, 0, 0);
        function_a615190cb6a4e817();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x684a
    // Size: 0x22
    function function_95d6afd76d60638b() {
        self.var_b1841dac996ed625 = (1, 0.5, 0);
        function_a615190cb6a4e817();
    }

    // Namespace namespace_93577502ddc60c0d / namespace_2c2703f78fc59600
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6874
    // Size: 0x71
    function function_a615190cb6a4e817() {
        if (!getdvarint(@"hash_d7987b5db214b981", 0)) {
            return;
        }
        self notify("<dev string:x47>");
        debug::debug_sphere(self, 100, self.var_b1841dac996ed625, undefined, "<dev string:x1c>", "<dev string:x47>");
        debug::debug_line(self, self.origin - (0, 0, 2700), self.var_b1841dac996ed625, undefined, "<dev string:x1c>", "<dev string:x47>");
    }

#/
