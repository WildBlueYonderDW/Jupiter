// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_7ab5b649fa408138;
#using script_4c770a9a4ad7659c;
#using scripts\engine\scriptable.gsc;
#using script_7f5e7a3cb514aca5;
#using scripts\cp_mp\parachute.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_41d841f881f9d22e;

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667
// Size: 0xc
function main() {
    level thread function_deee3b97bf9c0945();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67a
// Size: 0x1e
function function_deee3b97bf9c0945() {
    waitframe();
    if (!getdvarint(@"hash_eb0811ead28c4f53", 0)) {
        return;
    }
    init();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f
// Size: 0x3c
function init() {
    /#
        level thread debug_init();
    #/
    function_c592e91fc6604ad0();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("redeploy_drone_interact", &function_f0567cda220a6f7d);
    function_f1aed36ab4598ea("mp_jup_ob_redeploy_drone");
    level thread function_23f7acaab482446();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e2
// Size: 0x32c
function function_c592e91fc6604ad0() {
    level.var_fc4bb27a820f54dd = spawnstruct();
    level.var_fc4bb27a820f54dd.var_5103bc8aadf9af64 = getdvarint(@"hash_27f51798e10e62a0", 4);
    level.var_fc4bb27a820f54dd.var_43c609d0bf76cedc = getdvarint(@"hash_fc06cf8b2e6ff7c8", 100);
    level.var_fc4bb27a820f54dd.var_3bc74411a49ef743 = getdvarint(@"hash_4d3f3ddcf9c9ae8f", 2000);
    level.var_fc4bb27a820f54dd.var_94ca860762f3c07b = getdvarint(@"hash_2044315c6a32e0cf", 512);
    level.var_fc4bb27a820f54dd.var_f94808af4addfa87 = getdvarint(@"hash_3d4c3c323e772733", 10);
    level.var_fc4bb27a820f54dd.var_f96af6af4b041aa9 = getdvarint(@"hash_3d7052323e9fd24d", 50);
    level.var_fc4bb27a820f54dd.var_73610df6cb8260e6 = getdvarint(@"hash_19bb495fc007952", 3);
    level.var_fc4bb27a820f54dd.var_4b2cdacf483dccc4 = getdvarfloat(@"hash_590a91e3623c94d", 4);
    level.var_fc4bb27a820f54dd.var_ab77bcfbf6ec9587 = getdvarint(@"hash_3cd8f7500c4cffcb", 15);
    level.var_fc4bb27a820f54dd.var_7e1e2deb54381dce = getdvarint(@"hash_7a6046af43f645a", 5);
    level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04 = getdvarint(@"hash_67144a280e505eb0", 10);
    level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5 = getdvarint(@"hash_e0052f554fb1d69", 50);
    var_e375f6bd7e1961c9 = getdvarint(@"hash_9bd3724f70106775", 30000);
    level.var_fc4bb27a820f54dd.var_d1343ed4c5b69716 = squared(var_e375f6bd7e1961c9);
    var_d961317263b789a2 = getdvarint(@"hash_59c137234dad4ad6", 8000);
    level.var_fc4bb27a820f54dd.var_8a13be89e30d617 = squared(var_d961317263b789a2);
    level.var_fc4bb27a820f54dd.var_f06709293dd563e6 = getmatchrulesdata("commonOption", "parachuteOverheadWarningRadius");
    level.var_fc4bb27a820f54dd.var_9a279e924352be3b = getmatchrulesdata("commonOption", "parachuteOverheadWarningHeight");
    level.var_fc4bb27a820f54dd.var_b24b7a96d6c8e3c8 = getmatchrulesdata("commonOption", "parachuteOverheadWarningTimeoutMs");
    level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45 = getanimlength(scriptables%veh9_mil_air_drone_redeploy_extend_hook_01);
    level.var_fc4bb27a820f54dd.var_8a066943bb13715f = getanimlength(scriptables%veh9_mil_air_drone_redeploy_retract_hook_01);
    level.var_fc4bb27a820f54dd.var_1c9f02381dcb3a4c = [];
    level.var_fc4bb27a820f54dd.var_5715be6ca445d02e = getentitylessscriptablearray("scriptable_ob_redeploy_drone", "classname");
    level.var_fc4bb27a820f54dd.var_8dfc726e5b63525b = [];
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa15
// Size: 0x71
function function_23f7acaab482446() {
    waitframe();
    function_aa6c956fa42c8dfd();
    function_4255350c89e0fecb();
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        scriptable function_5a9c3fcb3fdcc242();
    }
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8d
// Size: 0x1ad
function function_4255350c89e0fecb() {
    var_a26e1f7ae26e56dc = namespace_3c37cb17ade254d::array_randomize(level.var_fc4bb27a820f54dd.var_5715be6ca445d02e);
    level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c = [];
    var_e88fb483d3da40e9 = 0;
    foreach (scriptable in var_a26e1f7ae26e56dc) {
        if (var_e88fb483d3da40e9 >= level.var_fc4bb27a820f54dd.var_5103bc8aadf9af64) {
            /#
                scriptable thread function_ef3ab989669b4682();
            #/
        } else if (scriptable function_e745a94784401dfb()) {
            /#
                scriptable thread function_ef3ab989669b4682();
            #/
        } else {
            var_7c6a1a7581e76afc = 1;
            foreach (other in var_a26e1f7ae26e56dc) {
                if (!array_contains(level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c, other)) {
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
                level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c[var_e88fb483d3da40e9] = scriptable;
                var_e88fb483d3da40e9++;
            }
        }
    }
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc41
// Size: 0x79
function function_e745a94784401dfb() {
    var_6fd2d9a208cef69b = 0;
    foreach (circle in level.radiation.instances) {
        var_6fd2d9a208cef69b = circle namespace_6d781a0248843409::function_1b4f63fa623de69a(self.origin);
    }
    return var_6fd2d9a208cef69b;
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc2
// Size: 0xd8
function function_5a9c3fcb3fdcc242() {
    function_ca6ea48c877cd367();
    self setscriptablepartstate("redeploy_drone_sfx", "engine_idle_sfx");
    self setscriptablepartstate("redeploy_drone_vfx", "enabled");
    self setscriptablepartstate("redeploy_drone_interact", "available");
    thread function_8a47414d4d7859df();
    if (getdvarint(@"hash_94cc2e00dc85444b", 1) && !isdefined(self.temp)) {
        drone = spawn("script_model", self.origin);
        drone setmodel("jup_ob_mil_air_drone_redeploy_relocate_lights");
        drone.angles = self.angles;
        drone.speed = 0;
        drone forcenetfieldhighlod(1);
        drone notsolid();
        self.temp = drone;
    }
    callback::callback("on_spawn_redeploy_drone");
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda1
// Size: 0x2b2
function function_105f0caaa61e873() {
    wait(23);
    var_bcef23e599e4cc3c = vectordot(anglestoright(level.br_ac130.angles), vectornormalize(self.origin - level.br_ac130.origin));
    v_spawn = level.br_ac130.origin + anglestoforward(level.br_ac130.angles) * -1 * (distance(level.br_ac130.origin, self.origin) - 45000) + anglestoright(level.br_ac130.angles) * 15000 * var_bcef23e599e4cc3c;
    var_57318a9f25cee67d = 100;
    var_570e949f25a8b4c3 = namespace_5078ee98abb32db9::getc130height() - 4000;
    var_5731809f25ced07f = var_57318a9f25cee67d + var_570e949f25a8b4c3 / 2;
    var_fe7278bc3929329e = (var_570e949f25a8b4c3 - var_57318a9f25cee67d) / 2;
    var_3b7468ecd13ad07b = vectordot(anglestoforward(level.br_ac130.angles), vectornormalize(v_spawn - level.br_ac130.origin));
    var_bfff077aec6dc176 = var_5731809f25ced07f + var_fe7278bc3929329e * var_3b7468ecd13ad07b;
    v_spawn = v_spawn + (0, 0, -1 * var_bfff077aec6dc176);
    drone = spawn("script_model", v_spawn);
    drone setmodel("jup_ob_mil_air_drone_redeploy_relocate_lights");
    drone.angles = vectortoangles(self.origin - drone.origin);
    drone.speed = level.var_fc4bb27a820f54dd.var_73e374ce21fb4fb5 * 4 * level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3;
    drone forcenetfieldhighlod(1);
    /#
        drone thread debug_sphere(undefined, 25, (1, 0, 0));
    #/
    /#
        drone thread function_7844a7477ac10fa5((1, 0, 0));
    #/
    drone thread function_6d9358d777958a1b(self);
    drone thread function_53a07930f4fc0e08(self);
    drone thread function_314cdfb5c5633b1();
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        wait(0.05);
    }
    drone notify("relocation_complete");
    drone delete();
    function_cdc6aa9c291d7b94();
    if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    function_ca6ea48c877cd367();
    thread function_8a47414d4d7859df();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105a
// Size: 0xdf
function function_aa6c956fa42c8dfd() {
    var_1bfa180c6fdd09dd = physics_createcontents([0:"physicscontents_aiclip", 1:"physicscontents_water"]);
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_5715be6ca445d02e) {
        trace = namespace_2a184fc4902783dc::ray_trace(scriptable.origin, scriptable.origin + (0, 0, -3000), undefined, var_1bfa180c6fdd09dd, 1, 1, 0);
        scriptable.var_e02f90c16d8ae6d5 = trace["surfacetype"];
        scriptable.var_7a6430ba88c4d983 = trace["position"];
    }
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1140
// Size: 0x178
function function_ca6ea48c877cd367() {
    self setscriptablepartstate("redeploy_drone", "available");
    self.b_occupied = 1;
    self.b_used = 1;
    /#
        function_5d3b11328dcb5023();
    #/
    if (!isdefined(self.var_7a6430ba88c4d983)) {
        self.var_7a6430ba88c4d983 = self.origin - (0, 0, 2727);
    }
    var_f252b4de7806249 = spawnscriptable("ob_redeploy_drone_anchor_impact", self.var_7a6430ba88c4d983);
    waitframe();
    /#
        if (!isdefined(self.var_e02f90c16d8ae6d5)) {
            self.var_e02f90c16d8ae6d5 = "deploy";
        }
    #/
    if (isdefined(self.var_e02f90c16d8ae6d5)) {
        switch (self.var_e02f90c16d8ae6d5) {
        case #"hash_296fec58e16e327":
        case #"hash_2fa4167540164873":
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
        case #"hash_2dc2bd39328def65":
        case #"hash_3990683480267242":
            var_f252b4de7806249 setscriptablepartstate("redeploy_drone_anchor_impact", "impact_water");
            break;
        }
    }
    waitframe();
    var_f252b4de7806249 freescriptable();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12bf
// Size: 0x65
function function_7fa5478ed150d979() {
    self setscriptablepartstate("redeploy_drone", "unavailable");
    self.b_occupied = 0;
    /#
        function_b286b55f5ce15dd5();
    #/
    if (getdvarint(@"hash_94cc2e00dc85444b", 1) && isdefined(self.temp)) {
        if (isdefined(self.temp)) {
            self.temp delete();
        }
    }
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132b
// Size: 0xc1
function function_cdc6aa9c291d7b94() {
    thread function_b366b00d0743a5ce();
    if (getdvarint(@"hash_94cc2e00dc85444b", 1) && !isdefined(self.temp)) {
        drone = spawn("script_model", self.origin);
        drone setmodel("jup_ob_mil_air_drone_redeploy_relocate_lights");
        drone.angles = self.angles;
        drone.speed = 0;
        drone forcenetfieldhighlod(1);
        drone notsolid();
        self.temp = drone;
    }
    self setscriptablepartstate("redeploy_drone", "deploy");
    /#
        function_95d6afd76d60638b();
    #/
    wait(level.var_fc4bb27a820f54dd.var_2eb08138d7d6ee45);
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f3
// Size: 0x3c
function function_b366b00d0743a5ce() {
    var_b366b00d0743a5ce = spawnscriptable("ob_redeploy_drone_deploy", self.origin - (0, 0, 2727));
    wait(0.8);
    var_b366b00d0743a5ce freescriptable();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1436
// Size: 0x4f
function function_ea7450d7dc038c68() {
    self setscriptablepartstate("redeploy_drone", "retract");
    /#
        function_95d6afd76d60638b();
    #/
    wait(level.var_fc4bb27a820f54dd.var_8a066943bb13715f - 0.7);
    self setscriptablepartstate("redeploy_drone_cable_sfx", "retract_stop");
    wait(0.7);
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x148c
// Size: 0x114
function redeploy_drone_destroyed(eattacker, modelname) {
    if (getdvarint(@"hash_94cc2e00dc85444b", 1) && isdefined(self.temp)) {
        self.temp delete();
    }
    self setscriptablepartstate("redeploy_drone", "unavailable");
    self setscriptablepartstate("redeploy_drone_sfx", "disabled");
    self setscriptablepartstate("redeploy_drone_cable_sfx", "disabled");
    self setscriptablepartstate("redeploy_drone_anchor_sfx", "disabled");
    /#
        function_20998d024463786f();
    #/
    self.b_occupied = 0;
    drone = spawn("script_model", self.origin);
    drone setmodel("jup_ob_mil_air_drone_redeploy_relocate_lights");
    drone.angles = self.angles;
    drone.speed = 0;
    self notify("redeploy_drone_destroyed");
    if (isdefined(modelname) && modelname == "ks_airstrike_target_br_ch3") {
        eattacker.var_3efdaabc0f66846d++;
    }
    drone function_e47fae0ab5c70a88();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a7
// Size: 0x47
function function_e47fae0ab5c70a88() {
    level endon("game_ended");
    waitframe();
    self setscriptablepartstate("redeploy_drone_relocation_smoke_vfx", "enabled");
    self physics_registerforcollisioncallback();
    thread function_26aacbd66ab5c92();
    self waittill("collision");
    function_6d23aa882f67a716();
    wait(0.2);
    self delete();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f5
// Size: 0x244
function function_26aacbd66ab5c92() {
    level endon("game_ended");
    self endon("collision");
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1840
// Size: 0x77
function function_6d23aa882f67a716() {
    vfx = spawnscriptable("ob_redeploy_drone_explosion", self.origin);
    waitframe();
    radiusdamage(self.origin, level.var_fc4bb27a820f54dd.var_94ca860762f3c07b, level.var_fc4bb27a820f54dd.var_f96af6af4b041aa9, level.var_fc4bb27a820f54dd.var_f94808af4addfa87, undefined, "MOD_EXPLOSIVE");
    vfx freescriptable();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18be
// Size: 0x48
function function_f0567cda220a6f7d(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    player thread function_ea7ddf2defb7947a(instance);
    player thread function_1b9a6266f1942fac(instance);
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190d
// Size: 0xc5
function function_ea7ddf2defb7947a(instance) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    instance endon("death");
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
    self waittill("ascender_detached");
    if (instance.origin[2] - self.origin[2] < 300) {
        self function_c664a2459d6f3eaa("sndevent_redeploydrone_launch_player");
    }
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d9
// Size: 0xa
function function_b4d6206c99452cac() {
    level endon("game_ended");
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ea
// Size: 0x1e0
function function_d52ae9fc3100cecf() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (!self isonground()) {
        nearbyplayers = utility::playersincylinder(self.origin, level.var_fc4bb27a820f54dd.var_f06709293dd563e6, undefined, level.var_fc4bb27a820f54dd.var_9a279e924352be3b);
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
            var_95ce4f91d0f58568 = namespace_54d20dd0dd79277f::getteamdata(self.targetplayer.team, "players");
            var_7570afa45d86040f = game["voice"][var_95ce4f91d0f58568];
            targetplayer queuedialogforplayer(level.activeparachutersfactionvo[var_7570afa45d86040f], "respawning_enemy_in_area", 2);
        }
        waitframe();
    }
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd1
// Size: 0x30
function function_1b9a6266f1942fac(instance) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("redeploy_drone_launch");
    instance waittill("redeploy_drone_destroyed");
    self function_61195b9ee307ad14();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c08
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0a
// Size: 0x3
function function_2ad170b9d70c7062() {
    
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d14
// Size: 0xba
function function_8a47414d4d7859df() {
    /#
        if (getdvarint(@"hash_20d28f147758431b", 0) && level.mapname == "death_or_disconnect") {
            return;
        }
    #/
    level endon("game_ended");
    var_6fd2d9a208cef69b = 0;
    while (!var_6fd2d9a208cef69b) {
        foreach (circle in level.radiation.instances) {
            var_6fd2d9a208cef69b = circle namespace_6d781a0248843409::function_1b4f63fa623de69a(self.origin);
        }
        wait(1);
    }
    thread redeploy_drone_relocate();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd5
// Size: 0x410
function redeploy_drone_relocate() {
    level endon("game_ended");
    level notify("forced_kill_callout_" + self.origin);
    namespace_ede58c1e66c2c280::function_6bc4f6b579285f79();
    var_42de8ecd1b474886 = 0;
    var_85698bd598b163f0 = level.var_fc4bb27a820f54dd.var_ab77bcfbf6ec9587 - level.var_fc4bb27a820f54dd.var_7e1e2deb54381dce * var_42de8ecd1b474886;
    if (var_85698bd598b163f0 < level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04) {
        var_85698bd598b163f0 = level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04;
    }
    wait(var_85698bd598b163f0);
    if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    var_daad7d20d7a17c02 = undefined;
    var_9225dfdb20269b5a = undefined;
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_5715be6ca445d02e) {
        if (istrue(scriptable.b_occupied)) {
            continue;
        }
        if (scriptable getscriptablepartstate("redeploy_drone") == "available" || scriptable getscriptablepartstate("redeploy_drone") == "deploy" || scriptable getscriptablepartstate("redeploy_drone") == "retract") {
            continue;
        }
        if (isdefined(level.var_24b61da48c7bdf06.radiation) && level.var_24b61da48c7bdf06.radiation namespace_6d781a0248843409::function_1b4f63fa623de69a(scriptable.origin)) {
            continue;
        }
        var_a1b92276657285b7 = distance(scriptable.origin, self.origin) / 489.7;
        var_a1b92276657285b7 = var_a1b92276657285b7 + 3;
        var_2f7cdde7f272c34c = level.var_24b61da48c7bdf06.radiation namespace_6d781a0248843409::function_fde05749af14d99c(scriptable.origin);
        if (var_2f7cdde7f272c34c <= var_a1b92276657285b7) {
            continue;
        }
        if (scriptable function_77e61741cc59c806()) {
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
    if (!isdefined(var_daad7d20d7a17c02)) {
        self setscriptablepartstate("redeploy_drone_interact", "disabled");
        function_ea7450d7dc038c68();
        thread function_f0ab4e5f3c9004e5();
        return;
    }
    var_daad7d20d7a17c02.b_occupied = 1;
    var_daad7d20d7a17c02.b_used = 1;
    function_ea7450d7dc038c68();
    if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    self setscriptablepartstate("redeploy_drone_cable_sfx", "retract_stop");
    function_7fa5478ed150d979();
    drone = spawn("script_model", self.origin);
    drone setmodel("jup_ob_mil_air_drone_redeploy_relocate_lights");
    drone.angles = self.angles;
    drone.speed = 0;
    drone setcandamage(1);
    drone forcenetfieldhighlod(1);
    /#
        drone thread debug_sphere(undefined, 25, (1, 0, 0));
    #/
    /#
        drone thread function_7844a7477ac10fa5((1, 0, 0));
    #/
    drone thread function_6d9358d777958a1b(var_daad7d20d7a17c02);
    drone thread function_53a07930f4fc0e08(var_daad7d20d7a17c02);
    drone thread function_314cdfb5c5633b1(self, var_daad7d20d7a17c02);
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        wait(0.05);
    }
    drone notify("relocation_complete");
    drone callback::callback("on_redeploy_drone_relocated");
    drone delete();
    var_daad7d20d7a17c02 function_cdc6aa9c291d7b94();
    if (var_daad7d20d7a17c02 getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    var_daad7d20d7a17c02 function_ca6ea48c877cd367();
    var_daad7d20d7a17c02 thread function_8a47414d4d7859df();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ec
// Size: 0x100
function function_f0ab4e5f3c9004e5() {
    level notify("forced_kill_callout_" + self.origin);
    namespace_ede58c1e66c2c280::function_6bc4f6b579285f79();
    if (getdvarint(@"hash_94cc2e00dc85444b", 1) && isdefined(self.temp)) {
        self.temp delete();
    }
    self setscriptablepartstate("redeploy_drone", "unavailable");
    self setscriptablepartstate("redeploy_drone_sfx", "disabled");
    self setscriptablepartstate("redeploy_drone_cable_sfx", "disabled");
    self setscriptablepartstate("redeploy_drone_anchor_sfx", "disabled");
    /#
        function_20998d024463786f();
    #/
    self.b_occupied = 0;
    drone = spawn("script_model", self.origin);
    drone setmodel("jup_ob_mil_air_drone_redeploy_relocate_lights");
    drone.angles = self.angles;
    drone.speed = 0;
    self notify("redeploy_drone_destroyed");
    drone function_e47fae0ab5c70a88();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f3
// Size: 0x21e
function function_bfa2960787851ba9() {
    level endon("game_ended");
    var_42de8ecd1b474886 = 0;
    var_85698bd598b163f0 = level.var_fc4bb27a820f54dd.var_ab77bcfbf6ec9587 - level.var_fc4bb27a820f54dd.var_7e1e2deb54381dce * var_42de8ecd1b474886;
    if (var_85698bd598b163f0 < level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04) {
        var_85698bd598b163f0 = level.var_fc4bb27a820f54dd.var_b09e88ff96d15c04;
    }
    wait(var_85698bd598b163f0);
    if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    var_10b874aa4bb07a07 = spawnstruct();
    var_9602b340166dcdd7 = namespace_c5622898120e827f::getsafecircleorigin();
    var_10b874aa4bb07a07.origin = self.origin + vectornormalize(self.origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], self.origin[2])) * 20000;
    var_10b874aa4bb07a07.angles = vectortoangles(self.origin - (var_9602b340166dcdd7[0], var_9602b340166dcdd7[1], self.origin[2]));
    function_ea7450d7dc038c68();
    if (self getscriptablepartstate("redeploy_drone") == "unavailable") {
        return;
    }
    function_7fa5478ed150d979();
    drone = spawn("script_model", self.origin);
    drone setmodel("jup_ob_mil_air_drone_redeploy_relocate_lights");
    drone.angles = self.angles;
    drone.speed = 0;
    drone forcenetfieldhighlod(1);
    /#
        drone thread debug_sphere(undefined, 25, (1, 0, 0));
    #/
    /#
        drone thread function_7844a7477ac10fa5((1, 0, 0));
    #/
    drone thread function_6d9358d777958a1b(var_10b874aa4bb07a07);
    drone thread function_53a07930f4fc0e08(var_10b874aa4bb07a07);
    drone thread function_314cdfb5c5633b1(self);
    while (!isdefined(drone.var_3b4fee20d214bd9b) || !isdefined(drone.var_f44262daab1a384a)) {
        wait(0.05);
    }
    drone notify("relocation_complete");
    drone delete();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2518
// Size: 0x41
function function_d0250169e6dfa8e4(eattacker, modelname) {
    if (isdefined(modelname) && modelname == "ks_airstrike_target_br_ch3") {
        eattacker.var_3efdaabc0f66846d++;
    }
    self.owner = eattacker;
    function_e47fae0ab5c70a88();
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2560
// Size: 0xa6
function function_77e61741cc59c806() {
    foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
        if (scriptable == self) {
            continue;
        }
        if (istrue(scriptable.b_occupied)) {
            if (distance2dsquared(self.origin, scriptable.origin) < level.var_fc4bb27a820f54dd.var_8a13be89e30d617) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x260e
// Size: 0x33d
function function_6d9358d777958a1b(var_daad7d20d7a17c02) {
    level endon("game_ended");
    self endon("entitydeleted");
    self.v_destination = var_daad7d20d7a17c02.origin;
    /#
        thread function_b29b629016747e8c(var_daad7d20d7a17c02);
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
        while (distance2dsquared(self.origin, self.v_destination) > squared(self.speed * 20 * level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3)) {
            self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.05, 0, 0);
            wait(0.05);
        }
        self notify("redeploy_drone_arrive");
        while (distance2dsquared(self.origin, self.v_destination) > 0.01) {
            self moveto(self.origin + (self.v_destination - self.origin) * 0.05 / level.var_fc4bb27a820f54dd.var_ccd62f7f63fb25b3, 0.05, 0, 0);
            self.speed = self.speed * 0.95;
            wait(0.05);
        }
    } else {
        while (distance2dsquared(self.origin, self.v_destination) > 500 * 500) {
            self moveto(self.origin + self.speed * vectornormalize(self.v_destination - self.origin), 0.05, 0, 0);
            wait(0.05);
        }
        self notify("redeploy_drone_arrive");
        while (distance2dsquared(self.origin, self.v_destination) > 0.01) {
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2952
// Size: 0x2ae
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
    self waittill("redeploy_drone_arrive");
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c07
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c99
// Size: 0x6
function function_b1eab7c7fda1fb57() {
    /#
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca6
// Size: 0x80
function debug_init() {
    /#
        level waittill("relocation_end");
        level thread function_db5c75f2a84ff03d();
        function_dee4eb3645627eea(@"hash_20d28f147758431b", &function_3b88aadd61acb2f7);
        function_dee4eb3645627eea(@"hash_1b823e69b7bcb477", &function_ae4ed007ee115b61);
        function_dee4eb3645627eea(@"hash_7206433d469d7d0a", &function_f17472706da6eab0);
        function_dee4eb3645627eea(@"hash_44c9b804cfee044b", &function_12bab4323f6ad87d);
        function_dee4eb3645627eea(@"hash_61419e769e38b201", &function_f2d4069ca59a8db6);
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2d
// Size: 0x9d
function function_db5c75f2a84ff03d() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_b1ad7f49e2d9a2c1);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_bb29c4b9f489b197);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_79db3fe8077d4858);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6f727cad8b163563);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a093df9d6f259949);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_185952854ebaec16);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd1
// Size: 0x25
function function_dee4eb3645627eea(dvar, func) {
    /#
        if (getdvarint(dvar, 0)) {
            [[ func ]]();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dfd
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e2d
// Size: 0x22
function function_d8b0e8ca68b581f3() {
    /#
        setdvar(@"hash_d7987b5db214b981", 1);
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e56
// Size: 0x21
function function_42b57a2447545237() {
    /#
        setdvar(@"hash_d7987b5db214b981", 0);
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7e
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2eae
// Size: 0x2b
function function_ae4ed007ee115b61() {
    /#
        setdvar(@"hash_1b823e69b7bcb477", 1);
        iprintlnbold("<unknown string>");
        level thread function_29896330c83a80fa();
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee0
// Size: 0x236
function function_29896330c83a80fa(v_position, var_ae2730e7eecf1623) {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        var_271f7ba625d29bdd = getdvarint(@"hash_9bd3724f70106775", 30000);
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
                    cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_271f7ba625d29bdd, (0, 0, 1), 0, 2);
                } else {
                    cylinder(scriptable.origin - (0, 0, 10), scriptable.origin + (0, 0, 10), var_271f7ba625d29bdd, (0.5, 0.5, 0.5), 0, 2);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x311d
// Size: 0x29
function function_688b987090050bdd() {
    /#
        setdvar(@"hash_1b823e69b7bcb477", 0);
        iprintlnbold("<unknown string>");
        level notify("<unknown string>");
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x314d
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x317d
// Size: 0x2b
function function_f17472706da6eab0() {
    /#
        setdvar(@"hash_7206433d469d7d0a", 1);
        iprintlnbold("<unknown string>");
        level thread function_7269acc313c13ac3();
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31af
// Size: 0x236
function function_7269acc313c13ac3(v_position, var_ae2730e7eecf1623) {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        var_53f65fa15502d74e = getdvarint(@"hash_59c137234dad4ad6", 8000);
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33ec
// Size: 0x29
function function_aa257341263c992a() {
    /#
        setdvar(@"hash_7206433d469d7d0a", 0);
        iprintlnbold("<unknown string>");
        level notify("<unknown string>");
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x341c
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x344c
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34d5
// Size: 0x16d
function function_ae07af550fa417d9() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
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
                print3d(self.var_7a6430ba88c4d983 + (0, 0, 200), self.var_e02f90c16d8ae6d5, (1, 1, 1), 1, 10, 2, 1);
                sphere(self.var_7a6430ba88c4d983, 20, (1, 1, 1), 0, 2);
                break;
            default:
                print3d(self.var_7a6430ba88c4d983 + (0, 0, 200), self.var_e02f90c16d8ae6d5, (1, 0, 0), 1, 10, 2, 1);
                sphere(self.var_7a6430ba88c4d983, 20, (1, 0, 0), 0, 2);
                break;
            }
            waitframe();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3649
// Size: 0x29
function function_9b4f358177d29219() {
    /#
        setdvar(@"hash_d7987b5db214b981", 0);
        iprintlnbold("<unknown string>");
        level notify("<unknown string>");
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3679
// Size: 0x66
function function_a093df9d6f259949() {
    /#
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable thread function_73d6b1775a971305();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36e6
// Size: 0x14
function function_73d6b1775a971305() {
    /#
        function_cdc6aa9c291d7b94();
        function_ca6ea48c877cd367();
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3701
// Size: 0x66
function function_185952854ebaec16() {
    /#
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable thread function_ea7450d7dc038c68();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x376e
// Size: 0x38d
function function_3b88aadd61acb2f7() {
    /#
        if (level.mapname != "death_or_disconnect") {
            return;
        }
        level notify("<unknown string>");
        level endon("<unknown string>");
        var_d10e850ebd58d1ee = spawnscriptable("<unknown string>", (0, 0, 2740));
        var_730315a2d2560fad = spawnscriptable("<unknown string>", (0, 0, 0));
        var_730312a2d2560914 = spawnscriptable("<unknown string>", (0, 0, 0));
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
        var_730315a2d2560fad function_f5c0566b1aa605fb();
        var_730312a2d2560914 function_ca6ea48c877cd367();
        var_730312a2d2560914 setscriptablepartstate("<unknown string>", "<unknown string>");
        var_730312a2d2560914 setscriptablepartstate("<unknown string>", "<unknown string>");
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

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b02
// Size: 0x21
function function_f868abadfcd3f180(instance, time) {
    /#
        wait(time);
        instance redeploy_drone_destroyed();
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b2a
// Size: 0x4a
function function_f5c0566b1aa605fb() {
    /#
        self setscriptablepartstate("<unknown string>", "<unknown string>");
        self setscriptablepartstate("<unknown string>", "<unknown string>");
        self setscriptablepartstate("<unknown string>", "<unknown string>");
        self.b_occupied = 0;
        function_20998d024463786f();
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b7b
// Size: 0x1a
function function_5d3b11328dcb5023() {
    /#
        function_a615190cb6a4e817((0, 1, 0));
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b9c
// Size: 0x1a
function function_20998d024463786f() {
    /#
        function_a615190cb6a4e817((1, 1, 0));
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bbd
// Size: 0x1a
function function_763b92766c8f0070() {
    /#
        function_a615190cb6a4e817((0, 1, 1));
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bde
// Size: 0x1a
function function_ef3ab989669b4682() {
    /#
        function_a615190cb6a4e817((0, 0, 1));
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bff
// Size: 0x1a
function function_b286b55f5ce15dd5() {
    /#
        function_a615190cb6a4e817((1, 0, 0));
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c20
// Size: 0x1a
function function_95d6afd76d60638b() {
    /#
        function_a615190cb6a4e817((1, 0.5, 0));
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c41
// Size: 0x54
function function_a615190cb6a4e817(var_743336c0d463ff1) {
    /#
        self notify("<unknown string>");
        thread debug_sphere(self.origin, 100, var_743336c0d463ff1);
        thread debug_line(self.origin, self.origin - (0, 0, 2700), var_743336c0d463ff1);
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3c9c
// Size: 0x4f
function debug_line(var_b668cc19c2cf6623, var_b668cd19c2cf6856, var_743336c0d463ff1) {
    /#
        self endon("<unknown string>");
        while (isdefined(self)) {
            if (getdvarint(@"hash_d7987b5db214b981", 0)) {
                line(var_b668cc19c2cf6623, var_b668cd19c2cf6856, var_743336c0d463ff1, 1, 0, 2);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3cf2
// Size: 0x69
function debug_sphere(v_pos, var_ae2730e7eecf1623, var_743336c0d463ff1) {
    /#
        self endon("<unknown string>");
        while (isdefined(self)) {
            if (getdvarint(@"hash_d7987b5db214b981", 0)) {
                if (isdefined(v_pos)) {
                    sphere(v_pos, var_ae2730e7eecf1623, var_743336c0d463ff1, 0, 2);
                } else {
                    sphere(self.origin, var_ae2730e7eecf1623, var_743336c0d463ff1, 0, 2);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d62
// Size: 0x5d
function function_b29b629016747e8c(var_daad7d20d7a17c02) {
    /#
        self endon("<unknown string>");
        while (isdefined(self)) {
            if (getdvarint(@"hash_d7987b5db214b981", 0)) {
                line(self.origin, var_daad7d20d7a17c02.origin, (1, 1, 0), 1, 0, 2);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3dc6
// Size: 0xaf
function function_7844a7477ac10fa5(var_743336c0d463ff1) {
    /#
        if (!getdvarint(@"hash_d7987b5db214b981", 0)) {
            return;
        }
        while (isdefined(self)) {
            if (getdvarint(@"hash_d7987b5db214b981", 0)) {
                line(self.origin, self.origin + anglestoforward(self.angles) * 100, var_743336c0d463ff1, 1, 0, 2);
                line(self.origin - anglestoright(self.angles) * 75, self.origin + anglestoright(self.angles) * 75, var_743336c0d463ff1, 1, 0, 2);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_41d841f881f9d22e/namespace_8278a08f2bc341ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e7c
// Size: 0xd6
function function_f2d4069ca59a8db6() {
    /#
        if (!getdvarint(@"hash_d7987b5db214b981", 0)) {
            return;
        }
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_5715be6ca445d02e) {
            scriptable function_5a9c3fcb3fdcc242();
        }
        foreach (scriptable in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            scriptable function_cdc6aa9c291d7b94();
            scriptable function_ca6ea48c877cd367();
        }
    #/
}

