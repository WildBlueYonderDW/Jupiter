// mwiii decomp prototype
#using script_77c18cdedec620b3;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using script_3214e6fcdce468a7;
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_263974019a8ba3fa;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_7ab5b649fa408138;
#using scripts\engine\scriptable.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\weapons.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\cp_mp\parachute.gsc;
#using script_610f57bddd265be2;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_58f20490049af6ac;
#using script_5762ac2f22202ba2;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_93577502ddc60c0d;

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x8dc
// Size: 0xc
function autoexec main() {
    level thread function_deee3b97bf9c0945();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ef
// Size: 0x4c
function function_deee3b97bf9c0945() {
    waitframe();
    if (!getdvarint(@"hash_eb0811ead28c4f53", 0)) {
        return;
    }
    if (level.gametype == "ob") {
        return;
    }
    if (isdefined(level.var_2f26ac0d970dddb0) && !level.var_2f26ac0d970dddb0) {
        return;
    }
    init();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x942
// Size: 0x11a
function init() {
    /#
        level thread debug_init();
    #/
    function_c592e91fc6604ad0();
    namespace_17c25f0877bfb620::scriptable_adddamagedcallback(&function_d01754fc00a031f4);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("redeploy_drone_interact", &function_f0567cda220a6f7d);
    if (level.var_fc4bb27a820f54dd.var_1bb94b0f20fb3532) {
        namespace_7052decdced06e44::function_4f7660cfd85cd517("redeploy_drone", &function_fb714d8704f1953a);
        namespace_7052decdced06e44::function_412f527ef0863f0e("redeploy_drone", &function_9858fb14ddbabacf);
    }
    utility::registersharedfunc("redeploy_drone", "precision_airstrike_death", &precision_airstrike_death);
    utility::registersharedfunc("redeploy_drone", "get_closest_redeploy_drone", &get_closest_redeploy_drone);
    utility::registersharedfunc("redeploy_drone", "dropbag_collision_watcher", &dropbag_collision_watcher);
    utility::registersharedfunc("redeploy_drone", "redeploy_drone_repopulation_watcher", &redeploy_drone_repopulation_watcher);
    utility::registersharedfunc("redeploy_drone", "redeploy_drone_destroyed", &redeploy_drone_destroyed);
    namespace_3c37cb17ade254d::registersharedfunc("little_bird", "handleWorldCollision", &function_19e2fe45e130973f);
    namespace_3c37cb17ade254d::registersharedfunc("veh9_palfa", "handleWorldCollision", &function_19e2fe45e130973f);
    function_f1aed36ab4598ea("eqp_redeploy_drone");
    level thread function_23f7acaab482446();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa63
// Size: 0x461
function function_c592e91fc6604ad0() {
    level.var_fc4bb27a820f54dd = spawnstruct();
    level.var_fc4bb27a820f54dd.var_5103bc8aadf9af64 = getdvarint(@"hash_27f51798e10e62a0", 4);
    level.var_fc4bb27a820f54dd.var_1131f855e49656bf = getdvarint(@"hash_2af4efaafae6489b", 270);
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
    level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45 = getanimlength(scriptables%veh9_mil_air_drone_redeploy_extend_hook_01_alt);
    level.var_fc4bb27a820f54dd.var_8a066943bb13715f = getanimlength(scriptables%veh9_mil_air_drone_redeploy_retract_hook_01_alt);
    level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c = function_fb714d8704f1953a(undefined);
    level.var_fc4bb27a820f54dd.var_c6be6bfbfaa2f523 = level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c;
    level.var_fc4bb27a820f54dd.var_5715be6ca445d02e = level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c;
    level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3 = 1;
    if (isdefined(level.br_level) && isdefined(level.br_level.c130_speedoverride)) {
        level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3 = level.br_level.c130_speedoverride / 3044;
    }
    level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = [];
    level.var_5161e88c4d5e0d35 = function_e4c99b0f178ffb98("redeployDroneRelocate", 1, level.framedurationseconds);
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecb
// Size: 0x1b
function function_fb714d8704f1953a(var_cab957adc8d7710f) {
    return getentitylessscriptablearray("scriptable_scriptable_redeploy_drone", "classname");
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeee
// Size: 0x3b
function function_23f7acaab482446() {
    waitframe();
    function_22627cfd727f11c3();
    while (!isdefined(level.br_ac130)) {
        wait(0.05);
    }
    level notify("respawn_redeploy_drones");
    level thread respawn_redeploy_drones();
    level thread function_c4f705b1e3e908de();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf30
// Size: 0x137
function function_22627cfd727f11c3() {
    if (!level.var_fc4bb27a820f54dd.var_5715be6ca445d02e.size) {
        return;
    }
    function_aa6c956fa42c8dfd();
    if (!level.var_fc4bb27a820f54dd.var_1bb94b0f20fb3532) {
        function_4255350c89e0fecb();
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_5715be6ca445d02e) {
            scriptable thread function_5a9c3fcb3fdcc242();
        }
    }
    for (i = 0; i < level.var_fc4bb27a820f54dd.var_5715be6ca445d02e.size; i++) {
        if (level.var_fc4bb27a820f54dd.var_5715be6ca445d02e[i] getscriptablepartstate("redeploy_drone") != "available") {
            level.var_fc4bb27a820f54dd.var_5715be6ca445d02e = array_remove(level.var_fc4bb27a820f54dd.var_5715be6ca445d02e, level.var_fc4bb27a820f54dd.var_5715be6ca445d02e[i]);
            i--;
        }
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106e
// Size: 0x54
function function_9858fb14ddbabacf(var_cab957adc8d7710f, var_bfbbca1bb1c06680) {
    var_bfbbca1bb1c06680 thread function_5a9c3fcb3fdcc242();
    size = level.var_fc4bb27a820f54dd.var_5715be6ca445d02e.size;
    level.var_fc4bb27a820f54dd.var_5715be6ca445d02e[size] = var_bfbbca1bb1c06680;
    return var_bfbbca1bb1c06680;
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ca
// Size: 0x3e
function function_5a9c3fcb3fdcc242() {
    function_ca6ea48c877cd367();
    self setscriptablepartstate("redeploy_drone_sfx", "engine_idle_sfx");
    function_81acd562e1d05436();
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(self);
    namespace_4b0406965e556711::gameflagwait("infil_animatic_complete");
    thread function_7f00c76550370a80();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110f
// Size: 0x1d4
function respawn_redeploy_drones() {
    level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = array_removeundefined(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b);
    for (i = 0; i < level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b.size; i++) {
        drone = level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b[i];
        level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = array_remove(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b, drone);
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
    if (!level.var_fc4bb27a820f54dd.var_1bb94b0f20fb3532 && namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart")) {
        function_4255350c89e0fecb();
    }
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_5715be6ca445d02e) {
        if (getdvarint(@"hash_8cc1035ee7514c26", 0)) {
            scriptable thread function_105f0caaa61e873();
        } else {
            scriptable thread function_5a9c3fcb3fdcc242();
        }
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ea
// Size: 0x1f0
function function_4255350c89e0fecb() {
    var_a26e1f7ae26e56dc = namespace_3c37cb17ade254d::array_randomize(level.var_fc4bb27a820f54dd.var_c6be6bfbfaa2f523);
    var_767801e3c9d8e2d5 = namespace_4b0406965e556711::gameflag("prematch_done");
    level.var_fc4bb27a820f54dd.var_5715be6ca445d02e = [];
    var_e88fb483d3da40e9 = 0;
    foreach (scriptable in var_a26e1f7ae26e56dc) {
        if (isdefined(scriptable.script_noteworthy) && scriptable.script_noteworthy != "redeploy_drone_spawn") {
            continue;
        }
        if (var_e88fb483d3da40e9 >= level.var_fc4bb27a820f54dd.var_5103bc8aadf9af64) {
            /#
                scriptable thread function_ef3ab989669b4682();
            #/
        } else if (var_767801e3c9d8e2d5 && scriptable function_e745a94784401dfb()) {
            /#
                scriptable thread function_ef3ab989669b4682();
            #/
        } else {
            var_7c6a1a7581e76afc = 1;
            foreach (other in var_a26e1f7ae26e56dc) {
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
                level.var_fc4bb27a820f54dd.var_5715be6ca445d02e[var_e88fb483d3da40e9] = scriptable;
                var_e88fb483d3da40e9++;
            }
        }
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e1
// Size: 0x228
function function_cc4a3e17d7bec89c() {
    minx = level.mapcorners[0].origin[0];
    maxx = level.mapcorners[1].origin[0];
    miny = level.mapcorners[1].origin[1];
    maxy = level.mapcorners[0].origin[1];
    var_9f3d56ff7b8de6bc = anglestoforward(level.br_ac130.angles) * -1;
    var_14b0893f906b0201 = (minx - self.origin[0]) / var_9f3d56ff7b8de6bc[0];
    var_c2bb2ab2a7f5a762 = (maxx - self.origin[0]) / var_9f3d56ff7b8de6bc[0];
    var_2e632dcaca182cfb = (miny - self.origin[1]) / var_9f3d56ff7b8de6bc[1];
    var_ce3dc05d719b04a3 = (maxy - self.origin[1]) / var_9f3d56ff7b8de6bc[1];
    t = -1;
    if (var_14b0893f906b0201 > 0 && (t < 0 || var_14b0893f906b0201 < t)) {
        t = var_14b0893f906b0201;
    }
    if (var_c2bb2ab2a7f5a762 > 0 && (t < 0 || var_c2bb2ab2a7f5a762 < t)) {
        t = var_c2bb2ab2a7f5a762;
    }
    if (var_2e632dcaca182cfb > 0 && (t < 0 || var_2e632dcaca182cfb < t)) {
        t = var_2e632dcaca182cfb;
    }
    if (var_ce3dc05d719b04a3 > 0 && (t < 0 || var_ce3dc05d719b04a3 < t)) {
        t = var_ce3dc05d719b04a3;
    }
    if (t >= 0) {
        t = t + distance2d(self.origin, level.br_ac130.origin);
        spawnx = self.origin[0] + t * var_9f3d56ff7b8de6bc[0];
        spawny = self.origin[1] + t * var_9f3d56ff7b8de6bc[1];
        var_6300d0f047679b46 = level.br_ac130.origin[2];
        return (spawnx, spawny, var_6300d0f047679b46);
    }
    return undefined;
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1711
// Size: 0x324
function function_105f0caaa61e873() {
    namespace_4b0406965e556711::gameflagwait("infil_animatic_complete");
    v_spawn = function_cc4a3e17d7bec89c();
    if (!isdefined(v_spawn)) {
        var_bcef23e599e4cc3c = vectordot(anglestoright(level.br_ac130.angles), vectornormalize(self.origin - level.br_ac130.origin));
        v_spawn = level.br_ac130.origin + anglestoforward(level.br_ac130.angles) * -1 * (distance(level.br_ac130.origin, self.origin) - 40000) + anglestoright(level.br_ac130.angles) * 15000 * var_bcef23e599e4cc3c;
    }
    var_57318a9f25cee67d = 100;
    var_570e949f25a8b4c3 = namespace_5078ee98abb32db9::getc130height() - 4000;
    var_5731809f25ced07f = var_57318a9f25cee67d + var_570e949f25a8b4c3 / 2;
    var_fe7278bc3929329e = (var_570e949f25a8b4c3 - var_57318a9f25cee67d) / 2;
    var_3b7468ecd13ad07b = vectordot(anglestoforward(level.br_ac130.angles), vectornormalize(v_spawn - level.br_ac130.origin));
    var_bfff077aec6dc176 = var_5731809f25ced07f + var_fe7278bc3929329e * var_3b7468ecd13ad07b;
    v_spawn = v_spawn + (0, 0, -1 * var_bfff077aec6dc176);
    drone = spawn("script_model", v_spawn);
    drone setmodel("veh9_mil_air_drone_redeploy_relocate");
    drone.angles = vectortoangles(self.origin - drone.origin);
    drone.speed = level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5 * 5 * level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3;
    drone.health = level.var_fc4bb27a820f54dd.var_1131f855e49656bf;
    drone setcandamage(1);
    drone forcenetfieldhighlod(1);
    /#
        if (getdvarint(@"hash_d7987b5db214b981", 0)) {
            debug::debug_sphere(drone, 25, (1, 0, 0), undefined, "veh9_mil_air_drone_redeploy_relocate", "entitydeleted");
            debug::draw_angles(drone, undefined, 150, undefined, "veh9_mil_air_drone_redeploy_relocate", "entitydeleted");
        }
    #/
    drone thread namespace_2c2703f78fc59600::function_6d9358d777958a1b(self);
    drone thread namespace_2c2703f78fc59600::function_53a07930f4fc0e08(self);
    drone thread namespace_2c2703f78fc59600::function_314cdfb5c5633b1();
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        if (drone.health <= 0) {
            return;
        }
        wait(0.05);
    }
    drone function_cdc6aa9c291d7b94();
    if (!isalive(drone)) {
        return;
    }
    drone notify("relocation_complete");
    self.health = drone.health;
    drone delete();
    function_ca6ea48c877cd367();
    thread function_7f00c76550370a80();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3c
// Size: 0x188
function function_aa6c956fa42c8dfd() {
    var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_aiclip", 1:"physicscontents_water"]);
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        trace = namespace_2a184fc4902783dc::ray_trace(scriptable.origin, scriptable.origin + (0, 0, -3000), undefined, var_1bfa180c6fdd09dd, 1, 1, 0);
        scriptable.var_e02f90c16d8ae6d5 = trace["surfacetype"];
        scriptable.var_7a6430ba88c4d983 = trace["position"];
    }
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_c6be6bfbfaa2f523) {
        trace = namespace_2a184fc4902783dc::ray_trace(scriptable.origin, scriptable.origin + (0, 0, -3000), undefined, var_1bfa180c6fdd09dd, 1, 1, 0);
        scriptable.var_e02f90c16d8ae6d5 = trace["surfacetype"];
        scriptable.var_7a6430ba88c4d983 = trace["position"];
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcb
// Size: 0x1a5
function function_ca6ea48c877cd367() {
    self setscriptablepartstate("redeploy_drone", "available");
    self.b_occupied = 1;
    self.b_used = 1;
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(self);
    /#
        function_5d3b11328dcb5023();
    #/
    if (!isdefined(self.var_7a6430ba88c4d983)) {
        /#
            assertmsg("Redeploy Drone @ " + self.origin + " missing self.v_surf_pos");
        #/
        self.var_7a6430ba88c4d983 = self.origin - (0, 0, 2727);
    }
    var_f252b4de7806249 = spawnscriptable("scriptable_redeploy_drone_anchor_impact", self.var_7a6430ba88c4d983);
    waitframe();
    /#
        if (!isdefined(self.var_e02f90c16d8ae6d5)) {
            self.var_e02f90c16d8ae6d5 = "<unknown string>";
        }
    #/
    switch (self.var_e02f90c16d8ae6d5) {
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
    waitframe();
    var_f252b4de7806249 freescriptable();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d77
// Size: 0x42
function function_7fa5478ed150d979() {
    level notify("redeploy_drone_kill_callout_" + self.origin);
    self setscriptablepartstate("redeploy_drone", "unavailable");
    self.b_occupied = 0;
    namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(self);
    /#
        function_b286b55f5ce15dd5();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc0
// Size: 0x1e
function function_e745a94784401dfb() {
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        return 0;
    }
    return !namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(self.origin);
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de6
// Size: 0x30
function function_cdc6aa9c291d7b94() {
    self setscriptablepartstate("redeploy_drone_relocation_sfx", "deploy");
    thread function_b366b00d0743a5ce();
    wait(level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45);
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1d
// Size: 0x2e
function function_b366b00d0743a5ce() {
    var_b366b00d0743a5ce = spawnscriptable("scriptable_redeploy_drone_deploy", self.origin);
    wait(0.8);
    var_b366b00d0743a5ce freescriptable();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e52
// Size: 0x45
function function_ea7450d7dc038c68() {
    self setscriptablepartstate("redeploy_drone_relocation_sfx", "retract");
    wait(level.var_fc4bb27a820f54dd.var_8a066943bb13715f - 0.7);
    self setscriptablepartstate("redeploy_drone_cable_sfx", "retract_stop");
    wait(0.7);
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9e
// Size: 0x67
function function_81acd562e1d05436() {
    /#
        if (getdvarint(@"hash_bf9414a8359d7c0", 0)) {
            self.health = 1;
            self.maxhealth = 1;
            return;
        }
    #/
    self.health = level.var_fc4bb27a820f54dd.var_1131f855e49656bf;
    self.maxhealth = level.var_fc4bb27a820f54dd.var_1131f855e49656bf;
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0c
// Size: 0x301
function function_d01754fc00a031f4(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (!isdefined(instance) || !isdefined(instance.classname) || instance.classname != "scriptable_scriptable_redeploy_drone") {
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
    instance.health = instance.health - idamage;
    if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "toma_proj_mp") {
        instance.health = 0;
    }
    if (instance.health <= 0) {
        if (!istrue(instance.var_3d94e3b5be6fd3d1)) {
            level thread redeploy_drone_repopulation_watcher(instance);
        }
        if (isdefined(vehicleowner)) {
            instance redeploy_drone_destroyed(vehicleowner, einflictor.model);
        } else {
            instance redeploy_drone_destroyed(eattacker, einflictor.model);
        }
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2214
// Size: 0x15c
function redeploy_drone_destroyed(eattacker, modelname, var_aae73b7b727db0c4) {
    self setscriptablepartstate("redeploy_drone", "unavailable");
    self setscriptablepartstate("redeploy_drone_sfx", "disabled");
    namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(self);
    /#
        function_20998d024463786f();
    #/
    self.b_occupied = 0;
    self notify("redeploy_drone_destroyed");
    if (istrue(var_aae73b7b727db0c4)) {
        function_6d23aa882f67a716(eattacker);
        return;
    }
    drone = spawn("script_model", self.origin);
    drone setmodel("veh9_mil_air_drone_redeploy_relocate");
    drone.angles = self.angles;
    drone.speed = 0;
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(drone);
    if (isdefined(modelname) && modelname == "ks_airstrike_target_br_ch3") {
        eattacker.var_3efdaabc0f66846d++;
    }
    drone.owner = eattacker;
    drone function_e47fae0ab5c70a88(self);
    var_9a6c1b85896a116e = {was_relocating:0, circle_index:isdefined(level.br_circle) ? utility::getintorzero(level.br_circle.circleindex) : -1, pos:self.origin};
    level thread namespace_a011fbf6d93f25e5::function_bfc305f32a65dee5(var_9a6c1b85896a116e);
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2377
// Size: 0x58
function function_e47fae0ab5c70a88(var_5c5b88ce7ae1228e) {
    level endon("game_ended");
    waitframe();
    self setscriptablepartstate("redeploy_drone_relocation_smoke_vfx", "enabled");
    self physics_registerforcollisioncallback();
    thread function_26aacbd66ab5c92();
    self waittill("collision");
    function_6d23aa882f67a716();
    wait(0.2);
    namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(self);
    self delete();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d6
// Size: 0x24b
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
    while (1) {
        var_d5cdf67a50a74a7a = anglestoforward(self.angles) * randomfloatrange(-1 * level.var_fc4bb27a820f54dd.var_3bc74411a49ef743, level.var_fc4bb27a820f54dd.var_3bc74411a49ef743);
        var_983148e6d0c8d005 = anglestoright(self.angles) * randomfloatrange(-1 * level.var_fc4bb27a820f54dd.var_3bc74411a49ef743, level.var_fc4bb27a820f54dd.var_3bc74411a49ef743);
        var_9a1f339b9a782980 = anglestoup(self.angles) * randomfloat(level.var_fc4bb27a820f54dd.var_3bc74411a49ef743);
        self physics_applyimpulse(self.origin + (randomintrange(-50, 51), randomintrange(-50, 51), randomintrange(-50, 51)), var_d5cdf67a50a74a7a + var_983148e6d0c8d005 + var_9a1f339b9a782980);
        wait(0.05);
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2628
// Size: 0x9f
function function_6d23aa882f67a716(eattacker) {
    vfx = spawnscriptable("scriptable_redeploy_drone_explosion", self.origin);
    waitframe();
    if (!isdefined(eattacker) && isdefined(self.owner)) {
        eattacker = self.owner;
    }
    radiusdamage(self.origin, level.var_fc4bb27a820f54dd.var_94ca860762f3c07b, level.var_fc4bb27a820f54dd.var_f96af6af4b041aa9, level.var_fc4bb27a820f54dd.var_f94808af4addfa87, eattacker, "MOD_EXPLOSIVE");
    vfx freescriptable();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ce
// Size: 0x2f
function function_cf65fbc1c077fadb(attacker, v_pos) {
    wait(0.15);
    if (namespace_7e17181d03156026::isreallyalive(attacker)) {
        attacker dodamage(9999, v_pos);
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2704
// Size: 0x50
function function_f0567cda220a6f7d(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    player notify("redeploy_drone_use");
    player thread function_ea7ddf2defb7947a(instance);
    player thread function_1b9a6266f1942fac(instance);
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275b
// Size: 0x99
function function_ea7ddf2defb7947a(instance) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    instance endon("death");
    level thread namespace_a011fbf6d93f25e5::function_e77f36370162406c(self);
    var_b3d3238c9bc3d1a5 = squared(19);
    while (distance2dsquared(self.origin, instance.origin) > var_b3d3238c9bc3d1a5) {
        waitframe();
    }
    while (distance2dsquared(self.origin, instance.origin) < var_b3d3238c9bc3d1a5) {
        waitframe();
    }
    self notify("redeploy_drone_launch");
    thread function_b4d6206c99452cac();
    thread function_d52ae9fc3100cecf();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27fb
// Size: 0x138
function function_b4d6206c99452cac() {
    level endon("game_ended");
    self setclientomnvar("ui_br_altimeter_state", 2);
    while (isdefined(self)) {
        if (self isskydiving()) {
            self waittill("skydive_end");
            break;
        } else {
            var_aa4f5ea34dfe428b = istrue(self.inlaststand);
            var_d4ba664e8cdd1e0a = isdefined(self.ffsm_state) && (self.ffsm_state == 5 || self.ffsm_state == 6 || self.ffsm_state == 3);
            var_31c5dac60b438208 = self isonground() || self isswimming() || self function_415fe9eeca7b2e2b();
            var_a2b5f51a86d266ad = self isonladder();
            var_d6442d18b46a7a10 = self function_9cc921a57ff4deb5();
            var_b48e997e59346e83 = !namespace_f8065cafc523dba5::isreallyalive(self);
            binvehicle = self function_793f941d7dff15ed();
            if (var_aa4f5ea34dfe428b || var_d4ba664e8cdd1e0a || var_31c5dac60b438208 || var_a2b5f51a86d266ad || var_d6442d18b46a7a10 || var_b48e997e59346e83 || binvehicle) {
                break;
            } else {
                waitframe();
            }
        }
    }
    if (isdefined(self)) {
        self setclientomnvar("ui_br_altimeter_state", 0);
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x293a
// Size: 0x1f7
function function_d52ae9fc3100cecf() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (!self isonground()) {
        nearbyplayers = playersincylinder(self.origin, level.var_fc4bb27a820f54dd.var_f06709293dd563e6, undefined, level.var_fc4bb27a820f54dd.var_9a279e924352be3b);
        var_55b4fa124c5108ff = self.team;
        foreach (targetplayer in nearbyplayers) {
            var_8b1b7044e27e6a56 = var_55b4fa124c5108ff == targetplayer.team;
            if (var_8b1b7044e27e6a56) {
                continue;
            }
            var_cda71aec07aab082 = !namespace_7e17181d03156026::isreallyalive(targetplayer) || istrue(targetplayer.inlaststand);
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
            if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
                var_95ce4f91d0f58568 = namespace_d3d40f75bb4e4c32::brgetoperatorteam(targetplayer);
                if (!isdefined(var_95ce4f91d0f58568)) {
                    var_95ce4f91d0f58568 = "allies";
                }
                var_7570afa45d86040f = game["voice"][var_95ce4f91d0f58568];
                targetplayer queuedialogforplayer(level.activeparachutersfactionvo[var_7570afa45d86040f], "respawning_enemy_in_area", 2);
            } else {
                namespace_d3d40f75bb4e4c32::brleaderdialog("respawning_enemy_in_area", 1, [0:targetplayer]);
            }
        }
        waitframe();
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b38
// Size: 0x30
function function_1b9a6266f1942fac(instance) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("redeploy_drone_launch");
    instance waittill("redeploy_drone_destroyed");
    self function_61195b9ee307ad14();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6f
// Size: 0xfb
function function_c4f705b1e3e908de() {
    level endon("game_ended");
    level waittill("br_circle_set");
    while (level.br_circle.circleindex != level.var_fc4bb27a820f54dd.var_73610df6cb8260e6) {
        wait(level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04);
    }
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        if (scriptable getscriptablepartstate("redeploy_drone") == "available" || scriptable getscriptablepartstate("redeploy_drone") == "deploy" || scriptable getscriptablepartstate("redeploy_drone") == "retract") {
            scriptable thread function_bfa2960787851ba9();
            wait(randomintrange(5, 10));
        }
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c71
// Size: 0x437
function redeploy_drone_repopulation_watcher(redeploy_drone) {
    level endon("game_ended");
    level endon("respawn_redeploy_drones");
    v_origin = redeploy_drone.origin;
    wait(level.var_fc4bb27a820f54dd.var_4b39ba581f4e16ef);
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
        } else if (scriptable function_77e61741cc59c806()) {
            /#
                scriptable function_ef3ab989669b4682();
            #/
        } else {
            distance_sq = distance2dsquared(v_origin, scriptable.origin);
            if (!isdefined(var_9225dfdb20269b5a) || distance_sq < var_9225dfdb20269b5a) {
                var_9225dfdb20269b5a = distance_sq;
                var_daad7d20d7a17c02 = scriptable;
            }
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
    var_9602b340166dcdd7 = namespace_c5622898120e827f::getsafecircleorigin();
    var_a4233c478eba62a0 = v_origin + vectornormalize(v_origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], v_origin[2])) * 20000;
    v_spawn_angles = vectortoangles(v_origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], v_origin[2]));
    drone = spawn("script_model", var_a4233c478eba62a0);
    drone setmodel("veh9_mil_air_drone_redeploy_relocate");
    drone.angles = v_spawn_angles;
    drone.speed = 0;
    drone function_81acd562e1d05436();
    drone setcandamage(1);
    drone forcenetfieldhighlod(1);
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(drone);
    if (isdefined(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b)) {
        level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b[level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b.size] = drone;
    }
    /#
        if (getdvarint(@"hash_d7987b5db214b981", 0)) {
            debug::debug_sphere(drone, 25, (1, 0, 0), undefined, "veh9_mil_air_drone_redeploy_relocate", "entitydeleted");
            debug::draw_angles(drone, undefined, 150, undefined, "veh9_mil_air_drone_redeploy_relocate", "entitydeleted");
        }
    #/
    drone thread function_6d9358d777958a1b(var_daad7d20d7a17c02);
    drone thread function_53a07930f4fc0e08(var_daad7d20d7a17c02);
    drone thread function_314cdfb5c5633b1(undefined, var_daad7d20d7a17c02);
    drone thread function_bb75b8cfbaa352ce(var_daad7d20d7a17c02);
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        if (drone.health <= 0) {
            return;
        }
        wait(0.05);
    }
    drone function_cdc6aa9c291d7b94();
    if (!isalive(drone)) {
        return;
    }
    drone notify("relocation_complete");
    var_daad7d20d7a17c02.health = drone.health;
    if (isdefined(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b)) {
        level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = array_remove(level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b, drone);
    }
    namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(drone);
    drone delete();
    var_daad7d20d7a17c02 function_ca6ea48c877cd367();
    var_daad7d20d7a17c02 thread function_7f00c76550370a80();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30af
// Size: 0x27
function get_closest_redeploy_drone(v_pos) {
    return sortbydistance(level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c, v_pos)[0];
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30de
// Size: 0x33
function precision_airstrike_death(owner) {
    wait(0.3);
    if (!isdefined(self) || self.health <= 0) {
        owner.var_3efdaabc0f66846d++;
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3118
// Size: 0xb5
function dropbag_collision_watcher() {
    ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
    var_320408384dd779ea = get_closest_redeploy_drone(position);
    if (isdefined(var_320408384dd779ea) && distancesquared(position, var_320408384dd779ea.origin) < squared(150)) {
        level thread redeploy_drone_repopulation_watcher(var_320408384dd779ea);
        var_320408384dd779ea redeploy_drone_destroyed(self.owner, undefined, 1);
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d4
// Size: 0x5e
function function_19e2fe45e130973f(position) {
    var_320408384dd779ea = get_closest_redeploy_drone(position);
    if (isdefined(var_320408384dd779ea) && distancesquared(position, var_320408384dd779ea.origin) < squared(150)) {
        level thread redeploy_drone_repopulation_watcher(var_320408384dd779ea);
        var_320408384dd779ea redeploy_drone_destroyed(self.owner, undefined, 1);
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3239
// Size: 0x3
function function_2ad170b9d70c7062() {
    
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3243
// Size: 0x87
function function_7f00c76550370a80() {
    /#
        if (getdvarint(@"hash_20d28f147758431b", 0) && level.mapname == "<unknown string>") {
            return;
        }
    #/
    level endon("game_ended");
    if (!isdefined(self) || !isdefined(self.origin)) {
        return;
    }
    var_b88f8ecd6f2078c3 = namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(self.origin);
    if (var_b88f8ecd6f2078c3 > 0) {
        wait(var_b88f8ecd6f2078c3);
        if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
            return;
        }
    }
    thread redeploy_drone_relocate();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32d1
// Size: 0x49d
function redeploy_drone_relocate(var_b015ea7a084074e8, b_immediate, var_3d94e3b5be6fd3d1, var_169a75a90e9dbc44) {
    level endon("game_ended");
    if (!istrue(b_immediate)) {
        while (namespace_dc84b0aa8d501507::function_de57b9616f575a63((self.origin[0], self.origin[1], self.origin[2] - 2727)) != -1) {
            wait(1);
        }
        while (1) {
            var_42de8ecd1b474886 = ter_op(isdefined(level.br_circle.circleindex), level.br_circle.circleindex, 0);
            var_85698bd598b163f0 = level.var_fc4bb27a820f54dd.var_ab77bcfbf6ec9587 - level.var_fc4bb27a820f54dd.var_7e1e2deb54381dce * var_42de8ecd1b474886;
            if (var_85698bd598b163f0 < level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04) {
                var_85698bd598b163f0 = level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04;
            }
            wait(var_85698bd598b163f0);
            if (namespace_dc84b0aa8d501507::function_de57b9616f575a63((self.origin[0], self.origin[1], self.origin[2] - 2727)) != -1) {
                while (namespace_dc84b0aa8d501507::function_de57b9616f575a63((self.origin[0], self.origin[1], self.origin[2] - 2727)) != -1) {
                    wait(1);
                }
            } else {
                break;
            }
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
        } else if (scriptable function_77e61741cc59c806()) {
            /#
                scriptable function_ef3ab989669b4682();
            #/
        } else {
            distance_sq = distance2dsquared(self.origin, scriptable.origin);
            if (!isdefined(var_9225dfdb20269b5a) || distance_sq < var_9225dfdb20269b5a) {
                var_9225dfdb20269b5a = distance_sq;
                var_daad7d20d7a17c02 = scriptable;
            }
        }
    }
    if (isdefined(var_b015ea7a084074e8)) {
        var_daad7d20d7a17c02 = var_b015ea7a084074e8;
    }
    if (!isdefined(var_daad7d20d7a17c02)) {
        thread function_bfa2960787851ba9();
        return;
    }
    var_daad7d20d7a17c02.b_occupied = 1;
    var_daad7d20d7a17c02.b_used = 1;
    function_7fa5478ed150d979();
    drone = spawn("script_model", self.origin);
    drone setmodel("veh9_mil_air_drone_redeploy_relocate");
    drone.angles = self.angles;
    drone.speed = 0;
    drone.health = self.health;
    drone setcandamage(1);
    drone forcenetfieldhighlod(1);
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(drone);
    drone thread function_bb75b8cfbaa352ce(var_daad7d20d7a17c02, var_3d94e3b5be6fd3d1);
    drone function_ea7450d7dc038c68();
    if (!isalive(drone)) {
        return;
    }
    drone setscriptablepartstate("redeploy_drone_cable_sfx", "retract_stop");
    drone thread function_6d9358d777958a1b(var_daad7d20d7a17c02);
    drone thread function_53a07930f4fc0e08(var_daad7d20d7a17c02);
    drone thread function_314cdfb5c5633b1(self, var_daad7d20d7a17c02);
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        if (drone.health <= 0) {
            return;
        }
        wait(0.05);
    }
    drone function_cdc6aa9c291d7b94();
    if (!isalive(drone)) {
        return;
    }
    drone notify("relocation_complete");
    var_daad7d20d7a17c02.health = drone.health;
    namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(drone);
    drone delete();
    var_daad7d20d7a17c02 function_ca6ea48c877cd367();
    if (!istrue(var_169a75a90e9dbc44)) {
        var_daad7d20d7a17c02 thread function_7f00c76550370a80();
    }
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3775
// Size: 0x287
function function_bfa2960787851ba9() {
    level endon("game_ended");
    var_42de8ecd1b474886 = ter_op(isdefined(level.br_circle.circleindex), level.br_circle.circleindex, 0);
    var_85698bd598b163f0 = level.var_fc4bb27a820f54dd.var_ab77bcfbf6ec9587 - level.var_fc4bb27a820f54dd.var_7e1e2deb54381dce * var_42de8ecd1b474886;
    if (var_85698bd598b163f0 < level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04) {
        var_85698bd598b163f0 = level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04;
    }
    wait(var_85698bd598b163f0);
    if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    var_10b874aa4bb07a07 = spawnstruct();
    if (istrue(level.var_2df69b8e552238b6)) {
        var_9602b340166dcdd7 = level.br_level.br_circlecenters[level.br_circle.circleindex + 1];
    } else {
        var_9602b340166dcdd7 = namespace_c5622898120e827f::getsafecircleorigin();
    }
    var_10b874aa4bb07a07.origin = self.origin + vectornormalize(self.origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], self.origin[2])) * 20000;
    var_10b874aa4bb07a07.angles = vectortoangles(self.origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], self.origin[2]));
    function_7fa5478ed150d979();
    drone = spawn("script_model", self.origin);
    drone setmodel("veh9_mil_air_drone_redeploy_relocate");
    drone.angles = self.angles;
    drone.speed = 0;
    drone.health = self.health;
    drone forcenetfieldhighlod(1);
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(drone);
    drone thread function_bb75b8cfbaa352ce();
    drone function_ea7450d7dc038c68();
    if (!isalive(drone)) {
        return;
    }
    drone thread function_6d9358d777958a1b(var_10b874aa4bb07a07);
    drone thread function_53a07930f4fc0e08(var_10b874aa4bb07a07);
    drone thread function_314cdfb5c5633b1(self);
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        if (drone.health <= 0) {
            return;
        }
        wait(0.05);
    }
    drone notify("relocation_complete");
    namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(drone);
    drone delete();
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a03
// Size: 0x28b
function function_bb75b8cfbaa352ce(var_daad7d20d7a17c02, var_3d94e3b5be6fd3d1) {
    self endon("entitydeleted");
    self endon("relocation_complete");
    while (1) {
        objweapon = dflags = partname = tagname = modelname = smeansofdeath = damagelocation = direction_vec = eattacker = idamage = self waittill("damage");
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
        self.health = self.health - idamage;
        if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "toma_proj_mp") {
            self.health = 0;
        }
        if (self.health <= 0) {
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

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c95
// Size: 0xa8
function function_d0250169e6dfa8e4(eattacker, modelname) {
    if (isdefined(modelname) && modelname == "ks_airstrike_target_br_ch3") {
        eattacker.var_3efdaabc0f66846d++;
    }
    self.owner = eattacker;
    function_e47fae0ab5c70a88();
    var_9a6c1b85896a116e = {was_relocating:1, circle_index:isdefined(level.br_circle) ? utility::getintorzero(level.br_circle.circleindex) : -1, pos:self.origin};
    level thread namespace_a011fbf6d93f25e5::function_bfc305f32a65dee5(var_9a6c1b85896a116e);
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d44
// Size: 0xb4
function function_77e61741cc59c806() {
    var_f04a5854e7607231 = sqrt(level.var_fc4bb27a820f54dd.var_8a13be89e30d617);
    var_ee6ee60e25f972ad = sortbydistancecullbyradius(level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c, self.origin, var_f04a5854e7607231);
    foreach (scriptable in var_ee6ee60e25f972ad) {
        if (scriptable == self) {
            continue;
        }
        if (istrue(scriptable.b_occupied)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e00
// Size: 0x3a6
function function_6d9358d777958a1b(var_daad7d20d7a17c02) {
    level endon("game_ended");
    self endon("entitydeleted");
    self.v_destination = var_daad7d20d7a17c02.origin;
    self.var_cffc989cec7d81ff = 0;
    /#
        utility::function_2bf8ec790b5a10f8(@"hash_d7987b5db214b981", &debug::debug_line, [0:self, 1:var_daad7d20d7a17c02.origin, 2:(1, 0, 0), 3:undefined, 4:"veh9_mil_air_drone_redeploy_relocate", 5:"<unknown string>"]);
    #/
    while (self.speed < level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5) {
        self.speed = self.speed + 1;
        if (self.speed > level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5) {
            self.speed = level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5;
        }
        self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.05, 0, 0);
        wait(0.05);
    }
    if (self.speed > level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5) {
        while (distancesquared(self.origin, self.v_destination) > squared(self.speed * 20 * level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3)) {
            self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.05, 0, 0);
            wait(0.05);
        }
        self notify("redeploy_drone_arrive");
        self.var_cffc989cec7d81ff = 1;
        while (distancesquared(self.origin, self.v_destination) > 0.01) {
            self moveto(self.origin + (self.v_destination - self.origin) * 0.05 / level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3, 0.05, 0, 0);
            self.speed = self.speed * 0.95;
            wait(0.05);
        }
    } else {
        while (distancesquared(self.origin, self.v_destination) > 500 * 500) {
            self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.05, 0, 0);
            wait(0.05);
        }
        self notify("redeploy_drone_arrive");
        self.var_cffc989cec7d81ff = 1;
        while (distancesquared(self.origin, self.v_destination) > 0.01) {
            self moveto(self.origin + (self.v_destination - self.origin) * 0.1, 0.05, 0, 0);
            self.speed = self.speed * 0.9;
            wait(0.05);
        }
    }
    self moveto(self.v_destination, 0.05, 0, 0);
    wait(0.05);
    self.speed = 0;
    self.v_destination = undefined;
    self.var_3b4fee20d214bd9b = 1;
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41ad
// Size: 0x2bb
function function_53a07930f4fc0e08(var_daad7d20d7a17c02) {
    level endon("game_ended");
    self endon("entitydeleted");
    var_b082d9fe8938e33d = vectornormalize(var_daad7d20d7a17c02.origin - self.origin);
    var_da83f385e7e33e1 = vectortoangles(var_b082d9fe8938e33d)[1] - self.angles[1];
    if (var_da83f385e7e33e1 < -180) {
        var_da83f385e7e33e1 = var_da83f385e7e33e1 + 360;
    }
    if (var_da83f385e7e33e1 > 180) {
        var_da83f385e7e33e1 = var_da83f385e7e33e1 - 360;
    }
    var_3b7468ecd13ad07b = vectordot(var_b082d9fe8938e33d, anglestoforward(self.angles));
    var_bcef23e599e4cc3c = vectordot(var_b082d9fe8938e33d, anglestoright(self.angles));
    var_4d03beb0293b1b14 = abs(var_da83f385e7e33e1);
    var_be553a9ce54d449 = var_4d03beb0293b1b14 - 90;
    if (var_be553a9ce54d449 > 0) {
        var_39fb5d4ca8578c6 = var_be553a9ce54d449 / var_4d03beb0293b1b14;
        self rotateby((30 * var_3b7468ecd13ad07b + 15, var_da83f385e7e33e1 * var_39fb5d4ca8578c6, 30 * var_bcef23e599e4cc3c), var_be553a9ce54d449 * 0.025, var_be553a9ce54d449 / 2 * 0.025, 0);
        wait(var_be553a9ce54d449 * 0.025);
        var_452972b9d736dfd6 = var_4d03beb0293b1b14 - var_be553a9ce54d449;
        self rotateto((30, vectortoangles(var_b082d9fe8938e33d)[1], 0), var_452972b9d736dfd6 * 0.025, 0, var_452972b9d736dfd6 / 2 * 0.025);
        wait(var_452972b9d736dfd6 * 0.025);
    } else {
        var_3b290cb32f6fc162 = var_4d03beb0293b1b14 / 2 * 0.025;
        if (var_3b290cb32f6fc162 < 1) {
            var_3b290cb32f6fc162 = 1;
        }
        self rotateby((15 * var_3b7468ecd13ad07b, var_da83f385e7e33e1 / 2, 15 * var_bcef23e599e4cc3c), var_3b290cb32f6fc162, var_3b290cb32f6fc162 / 2, 0);
        wait(var_3b290cb32f6fc162);
        self rotateto((30, vectortoangles(var_b082d9fe8938e33d)[1], 0), var_3b290cb32f6fc162, 0, var_3b290cb32f6fc162 / 2);
        wait(var_3b290cb32f6fc162);
    }
    if (!istrue(self.var_cffc989cec7d81ff)) {
        self waittill("redeploy_drone_arrive");
    }
    var_da83f385e7e33e1 = var_daad7d20d7a17c02.angles[1] - self.angles[1];
    if (var_da83f385e7e33e1 < -180) {
        var_da83f385e7e33e1 = var_da83f385e7e33e1 + 360;
    }
    if (var_da83f385e7e33e1 > 180) {
        var_da83f385e7e33e1 = var_da83f385e7e33e1 - 360;
    }
    var_3b7468ecd13ad07b = vectordot(anglestoforward(self.angles), anglestoforward(var_daad7d20d7a17c02.angles));
    var_bcef23e599e4cc3c = vectordot(anglestoright(self.angles), anglestoforward(var_daad7d20d7a17c02.angles));
    var_3b290cb32f6fc162 = 1;
    self rotateby((-30 * var_3b7468ecd13ad07b - 30, var_da83f385e7e33e1 / 2, 30 * var_bcef23e599e4cc3c), var_3b290cb32f6fc162, var_3b290cb32f6fc162 / 2, 0);
    wait(var_3b290cb32f6fc162);
    self rotateto((0, var_daad7d20d7a17c02.angles[1], 0), var_3b290cb32f6fc162, 0, var_3b290cb32f6fc162 / 2);
    wait(var_3b290cb32f6fc162);
    self.var_f44262daab1a384a = 1;
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446f
// Size: 0x8b
function function_314cdfb5c5633b1(var_76bfd75ccab42a13, var_359e64e7a629dd94) {
    self endon("entitydeleted");
    wait(1);
    self setscriptablepartstate("redeploy_drone_relocation_sfx", "relocation_loop");
    if (isdefined(var_76bfd75ccab42a13)) {
        var_76bfd75ccab42a13 setscriptablepartstate("redeploy_drone_sfx", "disabled");
    }
    self waittill("redeploy_drone_arrive");
    if (isdefined(var_359e64e7a629dd94)) {
        var_359e64e7a629dd94 setscriptablepartstate("redeploy_drone_sfx", "relocation_sfx_end");
        wait(0.5);
        var_359e64e7a629dd94 setscriptablepartstate("redeploy_drone_sfx", "engine_idle_sfx");
    }
    self setscriptablepartstate("redeploy_drone_relocation_sfx", "relocation_end");
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4501
// Size: 0x6
function function_b1eab7c7fda1fb57() {
    /#
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450e
// Size: 0x80
function debug_init() {
    /#
        level waittill("<unknown string>");
        level thread function_db5c75f2a84ff03d();
        function_2bf8ec790b5a10f8(@"hash_20d28f147758431b", &function_3b88aadd61acb2f7);
        function_2bf8ec790b5a10f8(@"hash_1b823e69b7bcb477", &function_ae4ed007ee115b61);
        function_2bf8ec790b5a10f8(@"hash_7206433d469d7d0a", &function_f17472706da6eab0);
        function_2bf8ec790b5a10f8(@"hash_44c9b804cfee044b", &function_12bab4323f6ad87d);
        function_2bf8ec790b5a10f8(@"hash_bf9414a8359d7c0", &function_df335ef8c85195e3);
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4595
// Size: 0x87
function function_db5c75f2a84ff03d() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_b1ad7f49e2d9a2c1);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_bb29c4b9f489b197);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_79db3fe8077d4858);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6f727cad8b163563);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_16a89c1bb0d4c2b1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4623
// Size: 0x29
function function_b1ad7f49e2d9a2c1() {
    /#
        if (!getdvarint(@"hash_d7987b5db214b981", 0)) {
            function_d8b0e8ca68b581f3();
        } else {
            function_42b57a2447545237();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4653
// Size: 0x81
function function_d8b0e8ca68b581f3() {
    /#
        setdvar(@"hash_d7987b5db214b981", 1);
        iprintlnbold("<unknown string>");
        foreach (drone in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            drone function_a615190cb6a4e817();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46db
// Size: 0x29
function function_42b57a2447545237() {
    /#
        setdvar(@"hash_d7987b5db214b981", 0);
        iprintlnbold("<unknown string>");
        level notify("veh9_mil_air_drone_redeploy_relocate");
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x470b
// Size: 0x29
function function_bb29c4b9f489b197() {
    /#
        if (!getdvarint(@"hash_1b823e69b7bcb477", 0)) {
            function_ae4ed007ee115b61();
        } else {
            function_688b987090050bdd();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x473b
// Size: 0x2b
function function_ae4ed007ee115b61() {
    /#
        setdvar(@"hash_1b823e69b7bcb477", 1);
        iprintlnbold("<unknown string>");
        level thread function_29896330c83a80fa();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x476d
// Size: 0x18e
function function_29896330c83a80fa(v_position, var_ae2730e7eecf1623) {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        var_271f7ba625d29bdd = getdvarint(@"hash_9bd3724f70106775", 9000);
        while (1) {
            var_ddd75f8a20f9aa1b = level.players[0] utility::function_4676b0931a17998a(level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c);
            foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
                if (scriptable == var_ddd75f8a20f9aa1b) {
                    sphere(scriptable.origin, 200, (1, 1, 1), 0, 2);
                    cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_271f7ba625d29bdd, (0, 0, 1), 0, 2);
                } else {
                    cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_271f7ba625d29bdd, (0.5, 0.5, 0.5), 0, 2);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4902
// Size: 0x29
function function_688b987090050bdd() {
    /#
        setdvar(@"hash_1b823e69b7bcb477", 0);
        iprintlnbold("<unknown string>");
        level notify("<unknown string>");
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4932
// Size: 0x29
function function_79db3fe8077d4858() {
    /#
        if (!getdvarint(@"hash_7206433d469d7d0a", 0)) {
            function_f17472706da6eab0();
        } else {
            function_aa257341263c992a();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4962
// Size: 0x2b
function function_f17472706da6eab0() {
    /#
        setdvar(@"hash_7206433d469d7d0a", 1);
        iprintlnbold("<unknown string>");
        level thread function_7269acc313c13ac3();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4994
// Size: 0x236
function function_7269acc313c13ac3(v_position, var_ae2730e7eecf1623) {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        var_53f65fa15502d74e = getdvarint(@"hash_59c137234dad4ad6", 7000);
        while (1) {
            var_7e3573e6ecff532d = -1;
            var_ddd75f8a20f9aa1b = undefined;
            foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
                v_player = anglestoforward(level.players[0] getplayerangles());
                var_d9b55f33c875d95d = vectornormalize(scriptable.origin - level.players[0] geteye());
                var_1330bb9a5254d545 = vectordot(v_player, var_d9b55f33c875d95d);
                if (var_1330bb9a5254d545 >= var_7e3573e6ecff532d) {
                    var_7e3573e6ecff532d = var_1330bb9a5254d545;
                    var_ddd75f8a20f9aa1b = scriptable;
                }
            }
            foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
                if (scriptable == var_ddd75f8a20f9aa1b) {
                    sphere(scriptable.origin, 200, (1, 1, 1), 0, 2);
                    cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_53f65fa15502d74e, (1, 1, 0), 0, 2);
                } else {
                    cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_53f65fa15502d74e, (0.5, 0.5, 0.5), 0, 2);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bd1
// Size: 0x29
function function_aa257341263c992a() {
    /#
        setdvar(@"hash_7206433d469d7d0a", 0);
        iprintlnbold("<unknown string>");
        level notify("<unknown string>");
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c01
// Size: 0x29
function function_6f727cad8b163563() {
    /#
        if (!getdvarint(@"hash_44c9b804cfee044b", 0)) {
            function_12bab4323f6ad87d();
        } else {
            function_9b4f358177d29219();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c31
// Size: 0x82
function function_12bab4323f6ad87d() {
    /#
        setdvar(@"hash_44c9b804cfee044b", 1);
        iprintlnbold("<unknown string>");
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable thread function_ae07af550fa417d9();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cba
// Size: 0x164
function function_ae07af550fa417d9() {
    /#
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
            debug::debug_print3d(self.var_7a6430ba88c4d983 + (0, 0, 200), self.var_e02f90c16d8ae6d5, (1, 1, 1), undefined, "<unknown string>", undefined, undefined, 10);
            debug::debug_sphere(self.var_7a6430ba88c4d983, 2, (1, 1, 1), undefined, "<unknown string>");
            break;
        default:
            debug::debug_print3d(self.var_7a6430ba88c4d983 + (0, 0, 200), self.var_e02f90c16d8ae6d5, (1, 1, 1), undefined, "<unknown string>", undefined, undefined, 10);
            debug::debug_sphere(self.var_7a6430ba88c4d983, 2, (1, 0, 0), undefined, "<unknown string>");
            break;
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e25
// Size: 0x29
function function_9b4f358177d29219() {
    /#
        setdvar(@"hash_44c9b804cfee044b", 0);
        iprintlnbold("<unknown string>");
        level notify("<unknown string>");
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e55
// Size: 0x29
function function_d6b87dd0429c8c1d() {
    /#
        if (!getdvarint(@"hash_a64dca6283ab8a08", 0)) {
            function_7abc6a18a0ca949f();
        } else {
            function_b7153d299dabc423();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e85
// Size: 0x2b
function function_7abc6a18a0ca949f() {
    /#
        setdvar(@"hash_a64dca6283ab8a08", 1);
        iprintlnbold("<unknown string>");
        level thread function_b30fb80a22d3bc1a();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4eb7
// Size: 0x46
function function_b30fb80a22d3bc1a() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            trace = level.players[0] trace::function_559be9820cd98ca4();
            iprintlnbold(trace["<unknown string>"]);
            waitframe();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f04
// Size: 0x29
function function_b7153d299dabc423() {
    /#
        setdvar(@"hash_a64dca6283ab8a08", 0);
        iprintlnbold("<unknown string>");
        level notify("<unknown string>");
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f34
// Size: 0x29
function function_16a89c1bb0d4c2b1() {
    /#
        if (!getdvarint(@"hash_bf9414a8359d7c0", 0)) {
            function_df335ef8c85195e3();
        } else {
            function_2fb292208b9284c7();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f64
// Size: 0x95
function function_df335ef8c85195e3() {
    /#
        setdvar(@"hash_bf9414a8359d7c0", 1);
        iprintlnbold("<unknown string>");
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable.health = 1;
            scriptable.maxhealth = 1;
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5000
// Size: 0x80
function function_2fb292208b9284c7() {
    /#
        setdvar(@"hash_bf9414a8359d7c0", 0);
        iprintlnbold("<unknown string>");
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable function_81acd562e1d05436();
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5087
// Size: 0x3b5
function function_3b88aadd61acb2f7() {
    /#
        if (level.mapname != "<unknown string>") {
            return;
        }
        level notify("<unknown string>");
        level endon("<unknown string>");
        var_d10e850ebd58d1ee = spawnscriptable("<unknown string>", (0, 0, 2740));
        var_730315a2d2560fad = spawnscriptable("<unknown string>", (0, 0, 0));
        var_730312a2d2560914 = spawnscriptable("<unknown string>", (0, 0, 0));
        var_d10e850ebd58d1ee function_81acd562e1d05436();
        var_730315a2d2560fad function_81acd562e1d05436();
        var_730312a2d2560914 function_81acd562e1d05436();
        level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c[level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c.size] = var_d10e850ebd58d1ee;
        level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c[level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c.size] = var_730315a2d2560fad;
        level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c[level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c.size] = var_730312a2d2560914;
        var_730315a2d2560fad.var_337be55e5dba8832 = randomint(360);
        var_730315a2d2560fad.origin = var_d10e850ebd58d1ee.origin + 5500 * anglestoforward((0, var_730315a2d2560fad.var_337be55e5dba8832, 0));
        var_730312a2d2560914.var_337be55e5dba8832 = var_730315a2d2560fad.var_337be55e5dba8832 + randomintrange(90, 270);
        if (var_730312a2d2560914.var_337be55e5dba8832 >= 360) {
            var_730312a2d2560914.var_337be55e5dba8832 = var_730312a2d2560914.var_337be55e5dba8832 - 360;
        }
        var_730312a2d2560914.origin = var_d10e850ebd58d1ee.origin + 5500 * anglestoforward((0, var_730312a2d2560914.var_337be55e5dba8832, 0));
        var_d10e850ebd58d1ee function_ca6ea48c877cd367();
        var_d10e850ebd58d1ee setscriptablepartstate("<unknown string>", "<unknown string>");
        var_d10e850ebd58d1ee setscriptablepartstate("<unknown string>", "<unknown string>");
        namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(var_d10e850ebd58d1ee);
        var_730315a2d2560fad function_f5c0566b1aa605fb();
        var_730312a2d2560914 function_ca6ea48c877cd367();
        var_730312a2d2560914 setscriptablepartstate("<unknown string>", "<unknown string>");
        var_730312a2d2560914 setscriptablepartstate("<unknown string>", "<unknown string>");
        namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(var_730312a2d2560914);
        while (1) {
            var_d10e850ebd58d1ee thread redeploy_drone_relocate();
            wait(6);
            var_730312a2d2560914 redeploy_drone_relocate();
            wait(6);
            var_730312a2d2560914.var_337be55e5dba8832 = var_730315a2d2560fad.var_337be55e5dba8832 + randomintrange(90, 270);
            if (var_730312a2d2560914.var_337be55e5dba8832 >= 360) {
                var_730312a2d2560914.var_337be55e5dba8832 = var_730312a2d2560914.var_337be55e5dba8832 - 360;
            }
            var_730312a2d2560914.origin = var_d10e850ebd58d1ee.origin + 5500 * anglestoforward((0, var_730312a2d2560914.var_337be55e5dba8832, 0));
            var_730312a2d2560914 function_f5c0566b1aa605fb();
            var_730312a2d2560914 setscriptablepartstate("<unknown string>", "<unknown string>");
            var_d10e850ebd58d1ee thread redeploy_drone_relocate();
            wait(6);
            var_730315a2d2560fad redeploy_drone_relocate();
            wait(6);
            var_730315a2d2560fad.var_337be55e5dba8832 = var_730312a2d2560914.var_337be55e5dba8832 + randomintrange(90, 270);
            if (var_730315a2d2560fad.var_337be55e5dba8832 >= 360) {
                var_730315a2d2560fad.var_337be55e5dba8832 = var_730315a2d2560fad.var_337be55e5dba8832 - 360;
            }
            var_730315a2d2560fad.origin = var_d10e850ebd58d1ee.origin + 5500 * anglestoforward((0, var_730315a2d2560fad.var_337be55e5dba8832, 0));
            var_730315a2d2560fad function_f5c0566b1aa605fb();
            var_730315a2d2560fad setscriptablepartstate("<unknown string>", "<unknown string>");
        }
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5443
// Size: 0x21
function function_f868abadfcd3f180(instance, time) {
    /#
        wait(time);
        instance redeploy_drone_destroyed();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x546b
// Size: 0x52
function function_f5c0566b1aa605fb() {
    /#
        self setscriptablepartstate("<unknown string>", "<unknown string>");
        self setscriptablepartstate("<unknown string>", "<unknown string>");
        self setscriptablepartstate("<unknown string>", "<unknown string>");
        self.b_occupied = 0;
        namespace_3bbb5a98b932c46f::function_1a33bd42949ccbda(self);
        function_20998d024463786f();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54c4
// Size: 0x23
function function_5d3b11328dcb5023() {
    /#
        self.var_b1841dac996ed625 = (0, 1, 0);
        function_a615190cb6a4e817();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54ee
// Size: 0x23
function function_20998d024463786f() {
    /#
        self.var_b1841dac996ed625 = (1, 1, 0);
        function_a615190cb6a4e817();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5518
// Size: 0x23
function function_763b92766c8f0070() {
    /#
        self.var_b1841dac996ed625 = (0, 1, 1);
        function_a615190cb6a4e817();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5542
// Size: 0x23
function function_ef3ab989669b4682() {
    /#
        self.var_b1841dac996ed625 = (0, 0, 1);
        function_a615190cb6a4e817();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x556c
// Size: 0x23
function function_b286b55f5ce15dd5() {
    /#
        self.var_b1841dac996ed625 = (1, 0, 0);
        function_a615190cb6a4e817();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5596
// Size: 0x23
function function_95d6afd76d60638b() {
    /#
        self.var_b1841dac996ed625 = (1, 0.5, 0);
        function_a615190cb6a4e817();
    #/
}

// Namespace namespace_93577502ddc60c0d/namespace_2c2703f78fc59600
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55c0
// Size: 0x72
function function_a615190cb6a4e817() {
    /#
        if (!getdvarint(@"hash_d7987b5db214b981", 0)) {
            return;
        }
        self notify("entitydeleted");
        debug::debug_sphere(self, 100, self.var_b1841dac996ed625, undefined, "veh9_mil_air_drone_redeploy_relocate", "entitydeleted");
        debug::debug_line(self, self.origin - (0, 0, 2700), self.var_b1841dac996ed625, undefined, "veh9_mil_air_drone_redeploy_relocate", "entitydeleted");
    #/
}

