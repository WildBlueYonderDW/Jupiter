#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\starts.gsc;
#using scripts\common\lighting.gsc;

#namespace namespace_726729b14b4a7e1e;

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e2
// Size: 0x61
function main() {
    level.var_bc1ebbcfcb8b1cc = 0;
    function_e11e77f687b7b626();
    function_9c946a04ddaf2d6c(level.var_e5f14f6658a0a0ea);
    level.var_6d38a19a6da9bc01 = (-21.1347, -26.3083, 0);
    level.var_38a05abad5d6656b = (-25.1347, -112, 0);
    level.var_ee8a6b555302846f = level.var_6d38a19a6da9bc01;
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44b
// Size: 0x4c
function function_e11e77f687b7b626() {
    function_1d630e974680d15e();
    function_5304c669ebdedf09();
    level.var_4cd5a01344e3772c = function_829bef6070a83a91("intro_tunnel_light");
    level.var_6710405865d176f0 = function_829bef6070a83a91("dark_tunnel_light");
    level.var_e5f14f6658a0a0ea = function_829bef6070a83a91("alarm_light");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49f
// Size: 0x81
function function_829bef6070a83a91(targetname) {
    var_6a49b47c2bc1134 = getentarray(targetname, "targetname");
    foreach (l in var_6a49b47c2bc1134) {
        l.og_intensity = l getlightintensity();
        l setlightintensity(0);
    }
    return var_6a49b47c2bc1134;
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x529
// Size: 0x5c
function function_feb0fab3be7205f2(var_6a49b47c2bc1134, intensity) {
    foreach (l in var_6a49b47c2bc1134) {
        l setlightintensity(intensity);
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x58d
// Size: 0x68
function function_12e0aa50739e007b(var_6a49b47c2bc1134, frac) {
    foreach (l in var_6a49b47c2bc1134) {
        l setlightintensity(frac * l.og_intensity);
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fd
// Size: 0x6f
function function_678ef11d2cfc2e2e() {
    setsaveddvar(@"hash_dab366f405822e6c", 0.002);
    function_c758b824ee6d21b1(1);
    function_12e0aa50739e007b(level.var_6710405865d176f0, 1);
    function_12e0aa50739e007b(level.var_4cd5a01344e3772c, 0);
    if (flag("lighting_intro_tunnel_flag")) {
        flag_clear("lighting_intro_tunnel_flag");
    }
    flag_set("lighting_dark_tunnel_flag");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x674
// Size: 0x75
function function_abb1267ad3428() {
    setsaveddvar(@"hash_dab366f405822e6c", 0.003);
    function_c758b824ee6d21b1(0);
    function_18f08f56aec273e6();
    function_12e0aa50739e007b(level.var_4cd5a01344e3772c, 1);
    function_12e0aa50739e007b(level.var_6710405865d176f0, 0);
    if (flag("lighting_dark_tunnel_flag")) {
        flag_clear("lighting_dark_tunnel_flag");
    }
    flag_set("lighting_intro_tunnel_flag");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f1
// Size: 0x83
function function_230ecfc530cd108a() {
    function_abb1267ad3428();
    thread function_5a765152015c6681();
    flag_wait("infil_vehicle_stop_at_gate");
    wait 2.7;
    thread function_46eb014f0b3ba202();
    visionsetnaked("sp_jup_flashback_intro_tunnels_high_exposure", 3);
    wait 10.45;
    function_1a63eead5c113374();
    visionsetnaked("sp_jup_flashback_intro_tunnels", 3.5);
    flag_wait("infil_vehicle_stopping");
    thread function_b7da49934e2d4c32();
    visionsetnaked("", 0.05);
    function_678ef11d2cfc2e2e();
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77c
// Size: 0xd3
function function_5a765152015c6681() {
    function_9985ab0a5b897efb(level.var_63508d83319fe95b, "infil_veh");
    level.var_b59cced033fde586["infil_veh_01"] function_f5600319797ffa1e(level.var_b59cced033fde586["infil_veh_01"].og_intensity);
    level.var_b59cced033fde586["infil_veh_02"] function_f5600319797ffa1e(level.var_b59cced033fde586["infil_veh_02"].og_intensity);
    level.var_b59cced033fde586["infil_veh_03"] function_f5600319797ffa1e(level.var_b59cced033fde586["infil_veh_03"].og_intensity);
    level.var_b59cced033fde586["infil_veh_04"] function_f5600319797ffa1e(level.var_b59cced033fde586["infil_veh_04"].og_intensity);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x857
// Size: 0x10a
function function_46eb014f0b3ba202() {
    setsaveddvar(@"sm_spotDistCull", "1500");
    function_67d35fd53f94e241("infil_veh");
    level.var_b59cced033fde586["infil_veh_01"] thread function_70a9f70afd49dead(level.var_b59cced033fde586["infil_veh_01"].og_intensity, 0, 3);
    level.var_b59cced033fde586["infil_veh_02"] thread function_70a9f70afd49dead(level.var_b59cced033fde586["infil_veh_02"].og_intensity, 0, 3);
    level.var_b59cced033fde586["infil_veh_03"] thread function_70a9f70afd49dead(level.var_b59cced033fde586["infil_veh_03"].og_intensity, 0, 3);
    level.var_b59cced033fde586["infil_veh_04"] thread function_70a9f70afd49dead(level.var_b59cced033fde586["infil_veh_04"].og_intensity, 0, 3);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x969
// Size: 0x2
function function_b7da49934e2d4c32() {
    
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x973
// Size: 0x8c
function function_403b8070ead43a7() {
    if (starts::is_after_start("infil_garage")) {
        function_678ef11d2cfc2e2e();
        return;
    }
    function_abb1267ad3428();
    function_9985ab0a5b897efb(level.var_63508d83319fe95b, "infil_veh");
    thread function_46eb014f0b3ba202();
    visionsetnaked("sp_jup_flashback_intro_tunnels_high_exposure", 3);
    wait 10.45;
    visionsetnaked("sp_jup_flashback_intro_tunnels", 3.5);
    flag_wait("infil_vehicle_stopping");
    function_b7da49934e2d4c32();
    visionsetnaked("", 0.05);
    function_678ef11d2cfc2e2e();
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa07
// Size: 0x48
function count_down_thread() {
    self notify("count_down_thread");
    self endon("count_down_thread");
    t = 0;
    while (true) {
        /#
            printtoscreen2d(500, 500, t);
        #/
        t += 0.05;
        wait 0.05;
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa57
// Size: 0x40
function function_c758b824ee6d21b1(var_ba5d5068ba9fdd0f) {
    if (var_ba5d5068ba9fdd0f == level.var_bc1ebbcfcb8b1cc) {
        return;
    }
    while (gettime() < 500) {
        waitframe();
    }
    visionsetalternate(var_ba5d5068ba9fdd0f, 0.05);
    level.var_bc1ebbcfcb8b1cc = var_ba5d5068ba9fdd0f;
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9f
// Size: 0x3e
function function_18f08f56aec273e6() {
    if (level.var_ee8a6b555302846f != level.var_6d38a19a6da9bc01) {
        setsundirection(anglestoforward(level.var_6d38a19a6da9bc01));
        level.var_ee8a6b555302846f = level.var_6d38a19a6da9bc01;
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae5
// Size: 0x3e
function function_1a63eead5c113374() {
    if (level.var_ee8a6b555302846f != level.var_38a05abad5d6656b) {
        setsundirection(anglestoforward(level.var_38a05abad5d6656b));
        level.var_ee8a6b555302846f = level.var_38a05abad5d6656b;
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2b
// Size: 0x1f
function function_7ba7b6df6537fc07() {
    if (starts::is_after_start("stadium_combat_stairs")) {
        function_18f08f56aec273e6();
        return;
    }
    function_1a63eead5c113374();
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb52
// Size: 0x56
function stairs_sun_switch_thread() {
    level notify("stairs_sun_switch_thread");
    level endon("stairs_sun_switch_thread");
    volume = getent("sun_switch_volume", "targetname");
    if (!isdefined(volume)) {
        return;
    }
    while (true) {
        if (level.player istouching(volume)) {
            function_18f08f56aec273e6();
            return;
        }
        wait 1;
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbb0
// Size: 0xba
function function_9c946a04ddaf2d6c(var_bf385726b0a8eea3) {
    if (!isdefined(var_bf385726b0a8eea3) || var_bf385726b0a8eea3.size <= 0) {
        return;
    }
    foreach (light in var_bf385726b0a8eea3) {
        light setlightcolor((1, 1, 1));
        light setlightintensity(3);
        light.og_intensity = light getlightintensity();
        light setlightintensity(0);
        light thread fb_alarm_light_strobe(0.05, 0.05, 0.05, 0.05, 2, 1);
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc72
// Size: 0xd9
function fb_alarm_light_strobe(ontime, offtime, var_49f028f834d4e71b, var_e76de926e3aee959, count, var_4e7f85c4bd662075) {
    self notify("fb_alarm_light_strobe");
    self endon("fb_alarm_light_strobe");
    self endon("death");
    var_3caa669e71b5cd31 = randomfloatrange(0.05, 0.35);
    wait var_3caa669e71b5cd31;
    while (true) {
        for (i = 0; i < count; i++) {
            wait offtime;
            if (var_49f028f834d4e71b <= 0) {
                self setlightintensity(self.og_intensity);
            } else {
                scripts\common\lighting::function_70a9f70afd49dead(var_49f028f834d4e71b, self.og_intensity);
            }
            wait ontime;
            if (var_e76de926e3aee959 <= 0) {
                self setlightintensity(0);
                continue;
            }
            scripts\common\lighting::function_70a9f70afd49dead(var_e76de926e3aee959, 0);
        }
        wait var_4e7f85c4bd662075;
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd53
// Size: 0x12d
function function_1d630e974680d15e() {
    var_747e06c0b98abc58 = getentarray("cinematic_light", "targetname");
    level.var_b59cced033fde586 = [];
    level.var_e841a10ca12d3ced = [];
    foreach (light in var_747e06c0b98abc58) {
        light.og_intensity = light getlightintensity();
        light setlightintensity(0);
        if (isdefined(light.script_parameters) && light.script_parameters != "") {
            level.var_b59cced033fde586[light.script_parameters] = light;
        }
        light.scene_shots = light function_2db8baa8be717dce();
        level.var_e841a10ca12d3ced[level.var_e841a10ca12d3ced.size] = light;
    }
    if (getdvarint(@"hash_e6afce2cf5cf7515") == 1) {
        function_318f3b408eb88511(level.var_e841a10ca12d3ced, "sh000");
        function_862591b7b92c10c7();
        return;
    }
    function_97479c7df424d62a();
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe88
// Size: 0x64
function function_862591b7b92c10c7() {
    models = getentarray("capture_only", "targetname");
    foreach (m in models) {
        m show();
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef4
// Size: 0x64
function function_97479c7df424d62a() {
    models = getentarray("capture_only", "targetname");
    foreach (m in models) {
        m hide();
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf60
// Size: 0x24
function function_2db8baa8be717dce() {
    if (!isdefined(self.script_noteworthy)) {
        return [];
    }
    return strtok(self.script_noteworthy, " ");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf8d
// Size: 0x9b
function function_318f3b408eb88511(var_6a49b47c2bc1134, scene_shot) {
    foreach (light in var_6a49b47c2bc1134) {
        if (array_contains(light.scene_shots, scene_shot)) {
            if (abs(light getlightintensity() - light.og_intensity) > 1e-05) {
                light setlightintensity(light.og_intensity);
            }
        }
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1030
// Size: 0x7c
function function_4f68acac1881a018(var_6a49b47c2bc1134, scene_shot) {
    ret_list = [];
    foreach (light in var_6a49b47c2bc1134) {
        if (array_contains(light.scene_shots, scene_shot)) {
            ret_list[ret_list.size] = light;
        }
    }
    return ret_list;
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10b5
// Size: 0x89
function function_d2f026db9170974b(var_6a49b47c2bc1134, scene_shot) {
    foreach (light in var_6a49b47c2bc1134) {
        if (array_contains(light.scene_shots, scene_shot)) {
            if (abs(light getlightintensity()) > 1e-05) {
                light setlightintensity(0);
            }
        }
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1146
// Size: 0x18
function function_f5600319797ffa1e(intensity) {
    if (isdefined(self)) {
        self setlightintensity(intensity);
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1166
// Size: 0x84
function function_70a9f70afd49dead(from, to, time) {
    if (!isdefined(self)) {
        return;
    }
    steps = int(time * 20);
    curr = from;
    var_fe747a03f612e963 = (to - curr) / steps;
    for (i = 0; i < steps; i++) {
        self setlightintensity(curr + i * var_fe747a03f612e963);
        wait 0.05;
    }
    self setlightintensity(to);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11f2
// Size: 0xb7
function function_250adab5270ce6c8(anime) {
    hasxcam = 0;
    var_c29be8a72c384d19 = 0;
    if (isdefined(level.scr_xcam) && isdefined(level.scr_xcam[anime])) {
        hasxcam = 1;
    }
    if (isdefined(level.scr_anim) && isdefined(level.scr_anim["player_rig"]) && isdefined(level.scr_anim["player_rig"][anime])) {
        var_c29be8a72c384d19 = 1;
    }
    if (hasxcam) {
        return getxcamlength(level.scr_xcam[anime]);
    } else if (var_c29be8a72c384d19) {
        return getanimlength(level.scr_anim["player_rig"][anime]);
    }
    return 0;
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b2
// Size: 0x66
function function_5304c669ebdedf09() {
    var_973bdf858940ca5 = function_90e107731c52501b("infil_veh");
    if (!isdefined(var_973bdf858940ca5)) {
        return;
    }
    var_3b1a5914c5ccb346 = function_90e107731c52501b("exfil_heli");
    if (!isdefined(var_3b1a5914c5ccb346)) {
        return;
    }
    level.var_15793ff8dfdb8f8b = [];
    level.var_15793ff8dfdb8f8b["infil_veh"] = var_973bdf858940ca5;
    level.var_15793ff8dfdb8f8b["exfil_heli"] = var_3b1a5914c5ccb346;
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1320
// Size: 0xb8
function function_90e107731c52501b(animname) {
    var_18d9e97e9af188d6 = animname + "_light_origin";
    var_78e7c15b32cbe1e8 = getent(var_18d9e97e9af188d6, "targetname");
    if (!isdefined(var_78e7c15b32cbe1e8)) {
        return undefined;
    }
    lights = var_78e7c15b32cbe1e8 get_linked_ents();
    foreach (light in lights) {
        light linkto(var_78e7c15b32cbe1e8);
        if (light.classname == "reflection_probe") {
            var_78e7c15b32cbe1e8.probe = light;
        }
    }
    return var_78e7c15b32cbe1e8;
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13e1
// Size: 0x75
function function_9985ab0a5b897efb(ent, var_fa890e641f17ea50) {
    if (!isdefined(level.var_15793ff8dfdb8f8b)) {
        return;
    }
    level.var_15793ff8dfdb8f8b[var_fa890e641f17ea50].origin = ent.origin;
    level.var_15793ff8dfdb8f8b[var_fa890e641f17ea50].angles = ent.angles;
    level.var_15793ff8dfdb8f8b[var_fa890e641f17ea50] linkto(ent);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x145e
// Size: 0x5d
function function_67d35fd53f94e241(var_fa890e641f17ea50) {
    if (!isdefined(level.var_15793ff8dfdb8f8b)) {
        return;
    }
    if (isdefined(level.var_15793ff8dfdb8f8b[var_fa890e641f17ea50]) && isdefined(level.var_15793ff8dfdb8f8b[var_fa890e641f17ea50].probe)) {
        level.var_15793ff8dfdb8f8b[var_fa890e641f17ea50].probe hide();
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14c3
// Size: 0x1ef
function function_b0a2ca3b6db38274(anime) {
    anim_length = function_250adab5270ce6c8(anime) + function_e18b3e7308279868(anime);
    switch (anime) {
    case #"hash_6f7c9dfd5086c4bf": 
        function_c6f71099276d841c();
        wait anim_length;
        function_c24d6f32279228e5();
        break;
    case #"hash_6f7c98fd5086bce0": 
        function_f8b1c9cad0773e57();
        wait anim_length;
        function_13053854dac1bd52();
        break;
    case #"hash_6f732bfd507f5584": 
        function_b456cf8d3d4c8173();
        wait anim_length;
        function_972ed233b777a446();
        break;
    case #"hash_6f7328fd507f50cb": 
        function_5c75c82922d8930();
        wait anim_length;
        function_dcd6515083cb8e91();
        break;
    case #"hash_6f7631fd50819d8d": 
        function_681617dea0879536();
        wait anim_length;
        function_14290a4a4e047333();
        break;
    case #"hash_6f762cfd508195ae": 
        function_b7c163f598700371();
        wait anim_length;
        function_759131da5b821990();
        break;
    case #"hash_6f6c9ffd5079fbf2": 
        function_d511d9259ed3bbdd();
        wait anim_length;
        function_7a71bbf415db2a24();
        break;
    case #"hash_6f6c9cfd5079f739": 
        function_c52d1240529591ea();
        wait anim_length;
        function_8cd15f52085ae59f();
        break;
    case #"hash_6f7025fd507d0d7b": 
        function_c874455412898a20();
        wait anim_length;
        function_493923fdb6acbac1();
        break;
    case #"hash_6f7028fd507d1234": 
        function_cd2a2a37a828de63();
        wait anim_length;
        function_29f7e4ee39b4a4f6();
        break;
    case #"hash_6f6693fd50756be0": 
        function_df29a84633d973b7();
        wait anim_length;
        function_60e4c8c57a9a99b2();
        break;
    case #"hash_6f6698fd507573bf": 
        function_e90eaad1f7fb4bfc();
        wait anim_length;
        function_cea0b55048ca9c5();
        break;
    case #"hash_6f6999fd5077b3e9": 
        function_f1b070ff3fa8e81a();
        wait anim_length;
        function_29ce70da176f630f();
        break;
    case #"hash_6f699cfd5077b8a2": 
        function_fca5f2df20a8018d();
        wait anim_length;
        function_9c9dc1bf49aa3414();
        break;
    default: 
        break;
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ba
// Size: 0x122
function function_e18b3e7308279868(anime) {
    switch (anime) {
    case #"hash_6f7c9dfd5086c4bf": 
        return -0.05;
    case #"hash_6f7c98fd5086bce0": 
        return -0.05;
    case #"hash_6f732bfd507f5584": 
        return -0.05;
    case #"hash_6f7328fd507f50cb": 
        return -0.05;
    case #"hash_6f7631fd50819d8d": 
        return -0.05;
    case #"hash_6f762cfd508195ae": 
        return -0.05;
    case #"hash_6f6c9ffd5079fbf2": 
        return -0.05;
    case #"hash_6f6c9cfd5079f739": 
        return -0.05;
    case #"hash_6f7025fd507d0d7b": 
        return -0.05;
    case #"hash_6f7028fd507d1234": 
        return -0.05;
    case #"hash_6f6693fd50756be0": 
        return -0.05;
    case #"hash_6f6698fd507573bf": 
        return -0.05;
    case #"hash_6f6999fd5077b3e9": 
        return -0.05;
    case #"hash_6f699cfd5077b8a2": 
        return -0.05;
    default: 
        return -0.05;
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e4
// Size: 0x35
function function_ee3c8174ce5e31ca() {
    if (isplatformxb3() || isplatformps4()) {
        setsaveddvar(@"hash_6e3f8cef6be16b33", 1);
        setsaveddvar(@"hash_b8c4ce378e61b803", 2);
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1821
// Size: 0x34
function function_99823bb15eb428fd() {
    if (isplatformxb3() || isplatformps4()) {
        setsaveddvar(@"hash_6e3f8cef6be16b33", 0);
        setsaveddvar(@"hash_b8c4ce378e61b803", 1);
    }
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185d
// Size: 0x7e
function function_c6f71099276d841c() {
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro10");
    function_ee3c8174ce5e31ca();
    setsaveddvar(@"sm_spotDistCull", "350");
    setsaveddvar(@"sm_spotUpdateLimit", "8");
    setsaveddvar(@"hash_5d66c2ef5a9612e0", 0);
    setsaveddvar(@"hash_eca4b727b01fd254", 0.57);
    setsaveddvar(@"hash_f9190cd77b0b2463", 2.5);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e3
// Size: 0x2c
function function_c24d6f32279228e5() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro10");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro15");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1917
// Size: 0x2a
function function_f8b1c9cad0773e57() {
    setsaveddvar(@"hash_eca4b727b01fd254", 4.783);
    setsaveddvar(@"hash_f9190cd77b0b2463", 4.1);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1949
// Size: 0x2c
function function_13053854dac1bd52() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro15");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro20");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x197d
// Size: 0x2a
function function_b456cf8d3d4c8173() {
    setsaveddvar(@"hash_eca4b727b01fd254", 2.164);
    setsaveddvar(@"hash_f9190cd77b0b2463", 3.758);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19af
// Size: 0x2c
function function_972ed233b777a446() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro20");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro25");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19e3
// Size: 0x2a
function function_5c75c82922d8930() {
    setsaveddvar(@"hash_eca4b727b01fd254", 1.936);
    setsaveddvar(@"hash_f9190cd77b0b2463", 2.391);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a15
// Size: 0x2c
function function_dcd6515083cb8e91() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro25");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro30");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a49
// Size: 0x2a
function function_681617dea0879536() {
    setsaveddvar(@"hash_eca4b727b01fd254", 5.466);
    setsaveddvar(@"hash_f9190cd77b0b2463", 11.046);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7b
// Size: 0x2c
function function_14290a4a4e047333() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro30");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro35");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aaf
// Size: 0x2a
function function_b7c163f598700371() {
    setsaveddvar(@"hash_eca4b727b01fd254", 2.505);
    setsaveddvar(@"hash_f9190cd77b0b2463", 6.377);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae1
// Size: 0x2c
function function_759131da5b821990() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro35");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro40");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b15
// Size: 0x2a
function function_d511d9259ed3bbdd() {
    setsaveddvar(@"hash_eca4b727b01fd254", 3.986);
    setsaveddvar(@"hash_f9190cd77b0b2463", 2.733);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b47
// Size: 0x2c
function function_7a71bbf415db2a24() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro40");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro45");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7b
// Size: 0x2a
function function_c52d1240529591ea() {
    setsaveddvar(@"hash_eca4b727b01fd254", 1.139);
    setsaveddvar(@"hash_f9190cd77b0b2463", 3.075);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bad
// Size: 0x2c
function function_8cd15f52085ae59f() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro45");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro50");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1be1
// Size: 0x2a
function function_c874455412898a20() {
    setsaveddvar(@"hash_eca4b727b01fd254", 1.367);
    setsaveddvar(@"hash_f9190cd77b0b2463", 4.214);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c13
// Size: 0x2c
function function_493923fdb6acbac1() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro50");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro55");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c47
// Size: 0x2a
function function_cd2a2a37a828de63() {
    setsaveddvar(@"hash_eca4b727b01fd254", 1.253);
    setsaveddvar(@"hash_f9190cd77b0b2463", 7.63);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c79
// Size: 0x2c
function function_29f7e4ee39b4a4f6() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro55");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro60");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cad
// Size: 0x2a
function function_df29a84633d973b7() {
    setsaveddvar(@"hash_eca4b727b01fd254", 0.683);
    setsaveddvar(@"hash_f9190cd77b0b2463", 3.416);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cdf
// Size: 0x2c
function function_60e4c8c57a9a99b2() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro60");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro65");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d13
// Size: 0x2a
function function_e90eaad1f7fb4bfc() {
    setsaveddvar(@"hash_eca4b727b01fd254", 1.367);
    setsaveddvar(@"hash_f9190cd77b0b2463", 6.833);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d45
// Size: 0x2c
function function_cea0b55048ca9c5() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro65");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro70");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d79
// Size: 0x2a
function function_f1b070ff3fa8e81a() {
    setsaveddvar(@"hash_eca4b727b01fd254", 2.961);
    setsaveddvar(@"hash_f9190cd77b0b2463", 6.377);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dab
// Size: 0x2c
function function_29ce70da176f630f() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro70");
    function_318f3b408eb88511(level.var_e841a10ca12d3ced, "midtro75");
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ddf
// Size: 0x2a
function function_fca5f2df20a8018d() {
    setsaveddvar(@"hash_eca4b727b01fd254", 2.505);
    setsaveddvar(@"hash_f9190cd77b0b2463", 14.577);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e11
// Size: 0x57
function function_9c9dc1bf49aa3414() {
    function_d2f026db9170974b(level.var_e841a10ca12d3ced, "midtro75");
    setsaveddvar(@"sm_spotDistCull", "1200");
    setsaveddvar(@"sm_spotUpdateLimit", "6");
    function_99823bb15eb428fd();
    setsaveddvar(@"hash_5d66c2ef5a9612e0", 1);
}

// Namespace namespace_726729b14b4a7e1e / namespace_76454a31ef8a1d50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e70
// Size: 0x12
function function_e672a8b815c0a7f0() {
    setsaveddvar(@"sm_sunStageBounds", 0);
}

