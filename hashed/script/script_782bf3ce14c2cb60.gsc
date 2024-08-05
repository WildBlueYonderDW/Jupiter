#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\common\lighting.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\anim.gsc;
#using scripts\sp\anim.gsc;
#using scripts\common\scene.gsc;
#using scripts\engine\math.gsc;

#namespace namespace_139d8770a579bb50;

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b1
// Size: 0x1d
function main() {
    post_load_precache(&function_bf161307a213ad69);
    scripts\common\lighting::light_init();
    thread function_b5f7fb0fd62c4ce();
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6
// Size: 0x2
function function_bf161307a213ad69() {
    
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e0
// Size: 0x26
function init_flags() {
    utility::flag_init("hideout_bathroom_flag");
    utility::flag_init("hideout_bathroom_flag_corridor_enter");
    utility::flag_init("park_dof_scripting_enabled");
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40e
// Size: 0x202
function function_b5f7fb0fd62c4ce() {
    flag_wait("park_dof_scripting_enabled");
    setsaveddvar(@"r_dof_physical_enable", 1);
    level.player enablephysicaldepthoffieldscripting();
    while (flag("park_dof_scripting_enabled")) {
        if (level.player getstance() == "crouch") {
            flag_clear("park_dof_scripting_enabled");
            break;
        }
        playerpos = level.player.origin + (0, 0, 62);
        yaw = getplayeryaw(level.player);
        pitch = getplayerpitch(level.player);
        cameraangles = (pitch, yaw, 0);
        forward = vectornormalize(anglestoforward(cameraangles));
        raystart = playerpos + forward * 20;
        rayend = playerpos + forward * 10000;
        result = ray_trace_detail(raystart, rayend);
        var_c0eb0a6fb2a4ace2 = distance(result["position"], raystart);
        down = (0, 0, -1);
        downdot = pow(clamp(vectordot(down, forward), 0, 1), 4);
        fstop = math::lerp(2, 15, downdot);
        level.player setphysicaldepthoffield(fstop, var_c0eb0a6fb2a4ace2, 100, 100, result["position"]);
        wait 0.1;
        if (flag("flg_park_blended") || flag("blending_anim_starting") || flag("flg_park_final_blend_in_progress")) {
            flag_clear("park_dof_scripting_enabled");
        }
    }
    level.player disablephysicaldepthoffieldscripting();
    thread function_b5f7fb0fd62c4ce();
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x618
// Size: 0xee
function function_6825c9f91759a193() {
    function_238c2a0aae70e973("horizon light 001", 0, 100000);
    function_238c2a0aae70e973("horizon light 002", 0, 100000);
    function_238c2a0aae70e973("horizon light 003", 0, 100000);
    function_238c2a0aae70e973("horizon light 004", 0, 100000);
    function_238c2a0aae70e973("horizon light 005", 0, 100000);
    function_238c2a0aae70e973("horizon light 006", 0, 100000);
    function_238c2a0aae70e973("horizon light 007", 0, 100000);
    function_238c2a0aae70e973("horizon light 008", 0, 100000);
    function_238c2a0aae70e973("horizon light 009", 0, 100000);
    function_238c2a0aae70e973("horizon light 010", 0, 100000);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_001", 0, 0);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_002", 0, 0);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_003", 0, 0);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_004", 0, 0);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70e
// Size: 0x62
function function_95cf17c99337346c() {
    function_238c2a0aae70e973("light_000_intro_igc_cafe_001", 0, 8);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_002", 0, 50);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_003", 0, 15);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_004", 0, 10);
    function_238c2a0aae70e973("soap_house_005", 0, 0.15);
    function_238c2a0aae70e973("soap_house_006", 0, 0.15);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x778
// Size: 0x3e
function function_3b4d555ff8ee0131() {
    function_238c2a0aae70e973("light_000_intro_igc_cafe_001", 2, 0);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_002", 2, 0);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_003", 2, 0);
    function_238c2a0aae70e973("light_000_intro_igc_cafe_004", 2, 0);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7be
// Size: 0x11
function function_12890444d983f3b5() {
    function_238c2a0aae70e973("light_IGC_park_target_001", 0, 5);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d7
// Size: 0x10
function function_a5c7dce5a458f75e() {
    function_238c2a0aae70e973("light_IGC_park_target_001", 0, 0);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ef
// Size: 0x11
function function_476b266a5d575d91() {
    function_238c2a0aae70e973("light_IGC_park_target_001", 6, 0);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x808
// Size: 0x11
function function_ddc443dca27ceeaa() {
    function_238c2a0aae70e973("light_igc_storefront_001", 0, 10);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x821
// Size: 0x11
function function_336d1a39589b061c() {
    function_238c2a0aae70e973("light_igc_storefront_001", 2, 0);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83a
// Size: 0x26
function function_272906e3119dd8e0() {
    function_238c2a0aae70e973("soap_house_005", 0, 0.1);
    function_238c2a0aae70e973("soap_house_006", 0, 0.05);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x868
// Size: 0xb3
function function_5ccdc11fd0355883() {
    wait 3;
    function_238c2a0aae70e973("light_igc_tunnel_005", 0, 30);
    function_238c2a0aae70e973("light_igc_tunnel_004", 0, 40);
    function_238c2a0aae70e973("light_igc_tunnel_003", 0, 15);
    function_238c2a0aae70e973("light_igc_tunnel_002", 0, 8);
    function_238c2a0aae70e973("light_igc_tunnel_001", 0, 200);
    function_238c2a0aae70e973("tunnel_intro_IGC_fill_001", 0, 5);
    function_238c2a0aae70e973("tunnel_intro_IGC_fill_002", 0, 0.5);
    function_238c2a0aae70e973("tunnel_intro_IGC_fill_003", 0, 50);
    function_238c2a0aae70e973("tunnel_intro_IGC_fill_004", 0, 8);
    setsaveddvar(@"r_ssrFadeInStrength", 0);
    wait 15;
    setsaveddvar(@"r_ssrFadeInStrength", 2);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x923
// Size: 0x89
function function_4dfbcdf6e57930e7() {
    function_238c2a0aae70e973("light_igc_tunnel_005", 1, 0);
    function_238c2a0aae70e973("light_igc_tunnel_004", 1, 0);
    function_238c2a0aae70e973("light_igc_tunnel_003", 1, 0);
    function_238c2a0aae70e973("light_igc_tunnel_002", 1, 0);
    function_238c2a0aae70e973("light_igc_tunnel_001", 1, 0);
    function_238c2a0aae70e973("tunnel_intro_IGC_fill_001", 1, 0);
    function_238c2a0aae70e973("tunnel_intro_IGC_fill_002", 1, 0);
    function_238c2a0aae70e973("tunnel_intro_IGC_fill_003", 1, 0);
    function_238c2a0aae70e973("tunnel_intro_IGC_fill_004", 1, 0);
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b4
// Size: 0x2
function function_e5983d2bf6e3dc1f() {
    
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9be
// Size: 0x14
function function_703a09200ce52e48() {
    utility::flag_wait("hideout_bathroom_flag");
    wait 0.2;
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9da
// Size: 0x15
function function_b88dea8ecd8304e4() {
    level flag_wait("hideout_bathroom_flag_corridor_enter");
    wait 0.2;
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f7
// Size: 0x2
function function_e16657777a0e7bf0() {
    
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa01
// Size: 0x2
function function_e1665a777a0e8289() {
    
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0b
// Size: 0x2
function function_dc0cd3c8aaa45469() {
    
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa15
// Size: 0x2
function function_dc0cd0c8aaa44dd0() {
    
}

// Namespace namespace_139d8770a579bb50 / namespace_f44a09c9acebf9a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1f
// Size: 0x2
function function_f4c36c92e884a00f() {
    
}

