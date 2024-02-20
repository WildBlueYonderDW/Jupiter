// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\anim_scene.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\flags.gsc;
#using script_67fb1233e876ed8;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_5def7af2a9f04234;
#using script_3ff084f114b7f6c9;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_2583ee5680cf4736;
#using script_509a782dd5b89cf1;
#using script_1f97a44d1761c919;
#using scripts\mp\anim.gsc;
#using script_189b67b2735b981d;
#using script_16ea1b94f0f381b3;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_38eb8f4be20d54f4;

#namespace uav_tower;

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x905
// Size: 0x478
function init(var_7b60fa5a9f22356) {
    if (!function_fcd65de73a5fd25() || isdefined(level.var_a1141d47ab94d2a1)) {
        return;
    }
    if (getdvarint(@"hash_2b66f14a52279087", 0) && getdvarint(@"hash_89be1a979c1ec008", 0)) {
        namespace_4b0406965e556711::function_1240434f4201ac9d("ssc_initialized");
        namespace_7052decdced06e44::function_4f7660cfd85cd517("uav_tower", &function_e6c1c35181a2870f);
        namespace_7052decdced06e44::function_412f527ef0863f0e("uav_tower", &function_dc8fd3d5775fe8bd);
        namespace_7052decdced06e44::function_eded5b87f8f7bdfd("uav_tower", &function_b0ce2500fdbd63b1);
    }
    if (istrue(var_7b60fa5a9f22356)) {
        level endon("game_ended");
        level waittill("prematch_done");
    }
    script_model_anims();
    level.var_cb86ca442250ca58 = getdvarfloat(@"hash_401140680b9e3119", 3.4);
    level.var_6acf91bbf5273e8f = getdvarint(@"hash_bd581b3a13b81db8", 5000);
    level.var_39f69f7dfc40a323 = getdvarint(@"hash_e466d59282ecb790", 3000);
    level.var_ab2c4542c95656cb = getdvarint(@"hash_d6193a209d3948a4", 3);
    level.var_20ebe48820fd70a2 = getdvarint(@"hash_62ba9cf492c77f30", 40);
    level.var_c5bbb7914cb760cf = getdvarint(@"hash_25af310c5bc4bc7c", 3);
    level.var_eb56ea0bfdaa4011 = getdvarint(@"hash_4704cc015db60ad2", 3);
    level.var_174fe9ecce8fb96b = randomintrange(level.var_c5bbb7914cb760cf, level.var_eb56ea0bfdaa4011 + 1);
    level.var_8703df33a53750c6 = getdvarint(@"hash_f741c76d2b72d5c5", 1);
    level.var_81018c8d037da6c8 = getdvarint(@"hash_d78433447211bc33", 1);
    level.var_79228b5606945e9f = getdvarint(@"hash_2fd1561a14bc4d7d", 1);
    level.var_815479da1dafbdb0 = getdvarint(@"hash_45f42bcb4e5d758d", 1);
    level.var_66bf5bfca21a8d52 = getdvarint(@"hash_c7c9d45312dd7ec", 1);
    level.var_d507e35282b50614 = getdvarint(@"hash_87edec4ce0d7b969", 200);
    level.var_db9587440497015c = getdvarint(@"hash_86826c94b10ecab", 1);
    level.var_9f740c9281d0c7f4 = getdvarint(@"hash_5569456c0eff0d5b", 1);
    level.var_21da00da533a4de5 = getdvarint(@"hash_2d4b53ed39fc8215", 1);
    level.var_6bacc8cb646fa5cd = getdvarint(@"hash_21c230525b7cf2be", 1);
    level.var_684d782689230a50 = getdvarint(@"hash_9d7a6b692b6e84ae", 1);
    level.var_7916385e2124e7a7 = getdvarint(@"hash_ba964de8526de5bd", 138);
    level.var_4414dbbf9d80d75d = [];
    level.var_1245cb2a7bf020f7 = getdvarint(@"hash_42ba93b094050d0", 0);
    level.var_38c78bab762bfff6 = [];
    level.var_116a5f32aeb86391 = [];
    level.var_a1141d47ab94d2a1 = [];
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_uav_tower", &function_888a7cb98b23e26a);
    if (!getdvarint(@"hash_2b66f14a52279087", 0) || !getdvarint(@"hash_89be1a979c1ec008", 0)) {
        level thread function_d45b1fddb87cf6bc();
    }
    thread function_2a905da0882c958();
    if (utility::ismp()) {
        namespace_3c37cb17ade254d::registersharedfunc("uav_tower", "tower_disable", &tower_disable);
    }
    level callback::add("ob_content_process_create_script", &function_c2c04f8e7be26a06);
    if (getdvarint(@"hash_132aa99ae926c59c", 1)) {
        namespace_c5622898120e827f::function_eca79fa0f341ee08(14, &dangercircletick, &function_1a1709943670772a);
    }
    if (level.var_21da00da533a4de5) {
        var_b2c90dc03f470a24 = function_e6c1c35181a2870f("uav_tower");
        foreach (tower in var_b2c90dc03f470a24) {
            tower.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(tower.origin);
        }
    }
    namespace_76a219af07c28c13::registerTeamAssimilateCallback(&function_6bdc6f56944dc3aa);
    if (level.var_9f740c9281d0c7f4) {
        /#
            assert(isdefined(game["dialog"]));
        #/
        game["dialog"]["uav_tower_use_first_person"] = "uav1_grav_klls";
        game["dialog"]["uav_tower_use_friendly"] = "uav1_grav_kllc";
        game["dialog"]["uav_tower_use_enemy"] = "uav1_grav_klnc";
    }
    /#
        level thread function_83565380b036f12d();
    #/
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd84
// Size: 0x120
function script_model_anims() {
    level.scr_animtree["uav_tower"] = %script_model;
    level.scr_anim["uav_tower"]["use_uav_tower_enter"] = script_model%dmz_uav_tower_enter;
    level.scr_eventanim["uav_tower"]["use_uav_tower_enter"] = %"use_uav_tower_enter";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_enter"] = "dmz_uav_tower_enter";
    level.scr_anim["uav_tower"]["use_uav_tower_idle"] = script_model%dmz_uav_tower_idle;
    level.scr_eventanim["uav_tower"]["use_uav_tower_idle"] = %"use_uav_tower_idle";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_idle"] = "dmz_uav_tower_idle";
    level.scr_anim["uav_tower"]["use_uav_tower_exit"] = script_model%dmz_uav_tower_exit;
    level.scr_eventanim["uav_tower"]["use_uav_tower_exit"] = %"use_uav_tower_exit";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_exit"] = "dmz_uav_tower_exit";
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeab
// Size: 0x351
function create_player_rig(animname, spawnpos, var_b7850001037aa074, uav_tower) {
    self.animname = animname;
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    self function_b88c89bb7cd1ab8e(spawnpos);
    player_rig = spawn("script_arms", self.origin, 0, 0, self);
    self.player_rig = player_rig;
    player_rig.origin = spawnpos;
    player_rig.angles = var_b7850001037aa074;
    player_rig.player = self;
    player_rig hide(1);
    player_rig.animname = animname;
    player_rig useanimtree(%script_model);
    player_rig.updatedversion = 1;
    self playerlinktoabsolute(player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
    if (isdefined(uav_tower) && isdefined(uav_tower.var_bf8e5f003146af44)) {
        player_rig linkto(uav_tower.var_bf8e5f003146af44);
    }
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(self)) {
        self unlink();
        thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    }
    if (isdefined(player_rig) && player_rig islinked()) {
        player_rig unlink();
    }
    if (isdefined(player_rig)) {
        player_rig delete();
    }
    if (isdefined(uav_tower) && isdefined(uav_tower.var_bf8e5f003146af44)) {
        parent = uav_tower.var_bf8e5f003146af44;
        if (isdefined(parent.velocity)) {
            var_d4011888837b9a54 = coordtransformtranspose(parent.velocity, (0, 0, 0), parent.angles);
            var_d4011888837b9a54 = (var_d4011888837b9a54[0], var_d4011888837b9a54[1], 0);
            var_1a80c18d4526e773 = coordtransform(var_d4011888837b9a54, (0, 0, 0), parent.angles);
            var_4eba8b5ab3b85e92 = getdvarfloat(@"hash_70433558c51dfcfd", 5);
            var_5480d8da1dde6edf = anglestoforward(self.angles) * (var_4eba8b5ab3b85e92 * -1, var_4eba8b5ab3b85e92 * -1, 0);
            test_origin = self.origin + var_1a80c18d4526e773 * function_676cfe2ab64ea758() / 1000 * 0.25 + var_5480d8da1dde6edf;
            var_fa7b2449d54de556 = test_origin + (0, 0, 50);
            var_314f52cc1171a153 = test_origin - (0, 0, 50);
            traceresult = namespace_2a184fc4902783dc::capsule_trace(var_fa7b2449d54de556, var_314f52cc1171a153, 10, 72, undefined, self);
            var_e594f77b6a33eb8b = traceresult["position"];
            self setvelocity(var_1a80c18d4526e773 * 0.5);
            verticaloffset = getdvarfloat(@"hash_6b0f27e366b9165f", 2);
            offset = (0, 0, verticaloffset);
            self setorigin(var_e594f77b6a33eb8b + offset);
        }
        self setstance("stand");
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1203
// Size: 0x42
function function_dc8fd3d5775fe8bd(var_cab957adc8d7710f, var_73bdebbc7da468a3) {
    if (!isdefined(level.var_d08063417d1d4dc7)) {
        level.var_d08063417d1d4dc7 = [];
    }
    level.var_d08063417d1d4dc7[level.var_d08063417d1d4dc7.size] = var_73bdebbc7da468a3;
    return var_73bdebbc7da468a3;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x9a
function function_b0ce2500fdbd63b1(var_cab957adc8d7710f) {
    level endon("game_ended");
    level waittill("prematch_done");
    waitframe();
    if (!isdefined(level.var_d08063417d1d4dc7) || level.var_d08063417d1d4dc7.size == 0) {
        return;
    }
    foreach (loc in level.var_d08063417d1d4dc7) {
        function_a517440c8faa2939(loc);
    }
    level.var_d08063417d1d4dc7 = undefined;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ee
// Size: 0x51
function function_a517440c8faa2939(var_73bdebbc7da468a3, var_73aa4684ecff09e9) {
    /#
        assert(isdefined(level.var_a1141d47ab94d2a1));
    #/
    var_b9ab8417f086258b = level.var_a1141d47ab94d2a1.size;
    var_85bb401958c65b45 = function_858af52a8e277a68(var_73bdebbc7da468a3, var_b9ab8417f086258b, var_73aa4684ecff09e9);
    return var_85bb401958c65b45;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1347
// Size: 0x21c
function function_858af52a8e277a68(var_73bdebbc7da468a3, identifier, var_73aa4684ecff09e9) {
    if (!isdefined(var_73bdebbc7da468a3.angles)) {
        var_73bdebbc7da468a3.angles = (0, 0, 0);
    }
    scriptablename = "dmz_uav_tower";
    if (isdefined(var_73aa4684ecff09e9)) {
        scriptablename = var_73aa4684ecff09e9;
    }
    scriptable = spawnscriptable(scriptablename, var_73bdebbc7da468a3.origin, var_73bdebbc7da468a3.angles);
    scriptable setscriptablepartstate("dmz_uav_tower_laptop", "laptop_closed");
    if (!istrue(level.var_1245cb2a7bf020f7)) {
        scriptable setscriptablepartstate("objective", "inactive");
    }
    var_73bdebbc7da468a3.var_107d6e8fc82a82a8 = scriptable;
    scriptable.var_73bdebbc7da468a3 = var_73bdebbc7da468a3;
    scriptable.identifier = identifier;
    scriptable.var_1dbfb72730034336 = 0;
    scriptable.var_e5a6fe7ed1143956 = -1;
    if (level.var_684d782689230a50) {
        var_73bdebbc7da468a3.var_107d6e8fc82a82a8 namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_dc9f963b97f73b1a);
        var_73bdebbc7da468a3.var_107d6e8fc82a82a8.var_3545410459b16762 = &function_dc9f963b97f73b1a;
    }
    if (!isdefined(var_73bdebbc7da468a3.poi) && isdefined(var_73bdebbc7da468a3.fortress) && isdefined(var_73bdebbc7da468a3.fortress.poiName)) {
        var_73bdebbc7da468a3.poi = var_73bdebbc7da468a3.fortress.poiName;
    }
    level.var_a1141d47ab94d2a1[level.var_a1141d47ab94d2a1.size] = var_73bdebbc7da468a3;
    if (istrue(level.var_815479da1dafbdb0)) {
        scriptable.var_d265a28ac03abc14 = [];
    }
    scriptable namespace_5775ad2badedbcaa::function_e6c63f16f2258b80(&function_aaf7a2b88614befa);
    /#
        if (issharedfuncdefined("laptop_closed", "HINT_NOICON")) {
            [[ getsharedfunc("laptop_closed", "HINT_NOICON") ]]("players", "ui_dmz_uav_tower_screen", undefined, "crouch", undefined, undefined, var_73bdebbc7da468a3.poi, var_73bdebbc7da468a3.origin);
        }
    #/
    return scriptable;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x156b
// Size: 0xc1
function private function_aaf7a2b88614befa(usable, player) {
    if (isdefined(player)) {
        var_4e58252555a3aca1 = player function_26fc3305456d700f(usable);
        if (!isdefined(var_4e58252555a3aca1) || var_4e58252555a3aca1 <= 0) {
            return {string:"DMZ/ACTIVATE_UAV_TOWER", type:"HINT_BUTTON"};
        } else {
            var_25be13388ebc5ccc = var_4e58252555a3aca1 * getdvarint(@"hash_bb0a8c315698fa34", 10);
            return {params:[0:var_25be13388ebc5ccc], string:"DMZ/ACTIVATE_UAV_TOWER_COST", type:"HINT_BUTTON"};
        }
    }
    return {string:"", type:"HINT_NOICON"};
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1634
// Size: 0x31
function private function_fe7e4144e9133c3a() {
    if (!isdefined(level.var_fe7e4144e9133c3a)) {
        level.var_fe7e4144e9133c3a = getdvarint(@"hash_7131733d65e51232", 0);
    }
    return level.var_fe7e4144e9133c3a;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166d
// Size: 0x5f
function function_e6c1c35181a2870f(var_cab957adc8d7710f) {
    var_b2c90dc03f470a24 = getstructarray(var_cab957adc8d7710f, "targetname");
    if (!isdefined(var_b2c90dc03f470a24) || var_b2c90dc03f470a24.size < 1) {
        var_b2c90dc03f470a24 = getstructarray("dmz_uav_tower", "targetname");
    }
    if (isdefined(level.var_3e175c0b6527751f)) {
        var_b2c90dc03f470a24 = [[ level.var_3e175c0b6527751f ]]();
    }
    return var_b2c90dc03f470a24;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d4
// Size: 0x13
function function_c2c04f8e7be26a06(var_d27680ff86693f5c) {
    function_d45b1fddb87cf6bc();
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ee
// Size: 0x2fa
function function_d45b1fddb87cf6bc() {
    level endon("game_ended");
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    var_b2c90dc03f470a24 = function_e6c1c35181a2870f("uav_tower");
    if (var_b2c90dc03f470a24.size == 0) {
        return;
    }
    var_57f36abbeac85747 = getdvarint(@"hash_939ab4119a3db356", 0);
    var_fe7e4144e9133c3a = function_fe7e4144e9133c3a();
    var_b9ab8417f086258b = 0;
    if (!var_57f36abbeac85747 && !var_fe7e4144e9133c3a) {
        var_1a7a45589889fd67 = [];
        var_34965515ac54e0b5 = [];
        var_371c833eba04930e = issharedfuncdefined("poi", "poi_isPOIActive", 0);
        for (var_33860cceecb7379a = 0; var_33860cceecb7379a < var_b2c90dc03f470a24.size; var_33860cceecb7379a++) {
            var_d233486a875a4ba8 = var_b2c90dc03f470a24[var_33860cceecb7379a];
            if (!isdefined(var_d233486a875a4ba8.poi)) {
                continue;
            }
            if (!isdefined(var_1a7a45589889fd67[var_d233486a875a4ba8.poi])) {
                var_1a7a45589889fd67[var_d233486a875a4ba8.poi] = [];
                var_34965515ac54e0b5[var_34965515ac54e0b5.size] = var_d233486a875a4ba8.poi;
            }
            var_1a7a45589889fd67[var_d233486a875a4ba8.poi][var_1a7a45589889fd67[var_d233486a875a4ba8.poi].size] = var_d233486a875a4ba8;
        }
        var_34965515ac54e0b5 = array_randomize(var_34965515ac54e0b5);
        var_4b30d157cdb30549 = 0;
        foreach (var_7e5c3e3c0f4fb904 in var_34965515ac54e0b5) {
            if (var_4b30d157cdb30549 == level.var_174fe9ecce8fb96b) {
                break;
            }
            if (var_371c833eba04930e && ![[ getsharedfunc("poi", "poi_isPOIActive") ]](var_7e5c3e3c0f4fb904)) {
                continue;
            }
            var_4b30d157cdb30549++;
            var_dc97ba189a64519e = var_1a7a45589889fd67[var_7e5c3e3c0f4fb904];
            var_8703df33a53750c6 = getdvarint(function_2ef675c13ca1c4af(@"hash_72de7f7dbae2d115", var_7e5c3e3c0f4fb904), level.var_8703df33a53750c6);
            var_81018c8d037da6c8 = getdvarint(function_2ef675c13ca1c4af(@"hash_ea59c77e13b98a07", var_7e5c3e3c0f4fb904), level.var_81018c8d037da6c8);
            var_b677145bce94aeb6 = randomintrange(var_8703df33a53750c6, var_81018c8d037da6c8 + 1);
            if (var_b677145bce94aeb6 > var_dc97ba189a64519e.size) {
                var_b677145bce94aeb6 = var_dc97ba189a64519e.size;
            }
            var_dc97ba189a64519e = array_slice(array_randomize(var_dc97ba189a64519e), 0, var_b677145bce94aeb6);
            for (var_33860cceecb7379a = 0; var_33860cceecb7379a < var_dc97ba189a64519e.size; var_33860cceecb7379a++) {
                var_73bdebbc7da468a3 = var_dc97ba189a64519e[var_33860cceecb7379a];
                function_858af52a8e277a68(var_73bdebbc7da468a3, var_b9ab8417f086258b);
                var_b9ab8417f086258b++;
            }
        }
        return;
    } else if (!var_fe7e4144e9133c3a) {
        var_636432a951d1b72f = randomintrange(level.var_8703df33a53750c6, level.var_81018c8d037da6c8 + 1);
        if (var_636432a951d1b72f < var_b2c90dc03f470a24.size) {
            var_b2c90dc03f470a24 = array_slice(array_randomize(var_b2c90dc03f470a24), 0, var_636432a951d1b72f);
        }
    }
    for (var_33860cceecb7379a = 0; var_33860cceecb7379a < var_b2c90dc03f470a24.size; var_33860cceecb7379a++) {
        var_73bdebbc7da468a3 = var_b2c90dc03f470a24[var_33860cceecb7379a];
        function_858af52a8e277a68(var_73bdebbc7da468a3, var_b9ab8417f086258b);
        var_b9ab8417f086258b++;
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ef
// Size: 0x1b9
function function_444bbcc637c82fc2(scriptable, playerteam, var_b608af6e8d86fe42) {
    scriptable endon("death");
    scriptable endon("tower_disable");
    level endon("game_ended");
    if (issharedfuncdefined("player", "showMiniMap")) {
        players = level.players;
        if (issharedfuncdefined("game", "getTeamData")) {
            players = [[ getsharedfunc("game", "getTeamData") ]](playerteam, "players");
        }
        foreach (player in players) {
            player [[ getsharedfunc("player", "showMiniMap") ]]();
        }
    }
    radius = int(level.var_6acf91bbf5273e8f * ter_op(isdefined(level.var_c0fe6cb6face684e) && var_b608af6e8d86fe42, level.var_c0fe6cb6face684e, 1));
    if (istrue(level.var_1245cb2a7bf020f7)) {
        if (issharedfuncdefined("uav_tower", "onTowerPingStart")) {
            [[ getsharedfunc("uav_tower", "onTowerPingStart") ]](scriptable, radius, level.var_ab2c4542c95656cb);
        }
    }
    while (1) {
        triggerportableradarpingteam(scriptable.origin, playerteam, radius, level.var_39f69f7dfc40a323, scriptable.var_e5a6fe7ed1143956);
        namespace_2c99f682179581bf::function_e457560e955be5f5(playerteam, scriptable.origin, radius, (level.var_39f69f7dfc40a323 + 50) / 1000);
        wait(level.var_ab2c4542c95656cb);
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1baf
// Size: 0x187
function tower_disable(scriptable, var_ee39591fdb9b143b) {
    player = scriptable.var_27e49251bb3376ea;
    if (issharedfuncdefined("player", "hideMiniMap") && isdefined(player)) {
        players = level.players;
        if (issharedfuncdefined("game", "getTeamData")) {
            players = [[ getsharedfunc("game", "getTeamData") ]](player.team, "players");
        }
        foreach (var_736d8d9188ccbd45 in players) {
            var_736d8d9188ccbd45 [[ getsharedfunc("player", "hideMiniMap") ]]();
        }
    }
    scriptable function_1d71dc9529bef550(var_ee39591fdb9b143b);
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("uav_tower_duration_ended", scriptable.var_dcc5f31ec71d6d8a);
    scriptable setscriptablepartstate("dmz_uav_tower_antenna", "active_end");
    if (!istrue(level.var_1245cb2a7bf020f7)) {
        scriptable setscriptablepartstate("objective", "inactive");
    }
    scriptable.var_27e49251bb3376ea = undefined;
    scriptable.var_dcc5f31ec71d6d8a = undefined;
    level.var_116a5f32aeb86391 = array_remove(level.var_116a5f32aeb86391, scriptable);
    if (level.var_66bf5bfca21a8d52) {
        scriptable function_c3476653bc728729();
    }
    scriptable notify("tower_disable");
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d3d
// Size: 0x81
function function_9a71dd352fe6da4b(scriptable, var_b608af6e8d86fe42) {
    scriptable endon("death");
    scriptable endon("tower_disable");
    level endon("game_ended");
    wait(level.var_20ebe48820fd70a2 * ter_op(isdefined(level.var_1408c77a4f773854) && istrue(var_b608af6e8d86fe42), level.var_1408c77a4f773854, 1));
    if (issharedfuncdefined("uav_tower", "tower_disable")) {
        [[ getsharedfunc("uav_tower", "tower_disable") ]](scriptable, "timeout");
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc5
// Size: 0xc0
function function_550deeac761ab7b9(scriptable) {
    scriptable endon("death");
    level endon("game_ended");
    if (!istrue(level.var_815479da1dafbdb0)) {
        level.var_38c78bab762bfff6[scriptable.index] = 1;
        wait(level.var_20ebe48820fd70a2 + level.var_79228b5606945e9f);
        level.var_38c78bab762bfff6[scriptable.index] = 0;
    } else {
        playerteam = self.team;
        scriptable.var_d265a28ac03abc14[playerteam] = 1;
        scriptable waittill_any_timeout_1(level.var_20ebe48820fd70a2, "tower_disable");
        wait(level.var_79228b5606945e9f);
        scriptable.var_d265a28ac03abc14[playerteam] = 0;
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8c
// Size: 0x37b
function function_888a7cb98b23e26a(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!function_a9c1f9543f60e5c6(player)) {
        return;
    }
    canuse = !isdefined(level.var_38c78bab762bfff6[instance.index]) || !level.var_38c78bab762bfff6[instance.index];
    if (istrue(level.var_815479da1dafbdb0)) {
        canuse = !isdefined(instance.var_d265a28ac03abc14[player.team]) || !instance.var_d265a28ac03abc14[player.team];
    }
    var_4c63764d12ed5def = 1;
    cost = player function_26fc3305456d700f(instance);
    if (cost > 0) {
        var_4c63764d12ed5def = istrue(player.plundercount >= cost);
        if (canuse && !var_4c63764d12ed5def) {
            canuse = 0;
        }
    }
    if (canuse) {
        instance setscriptablepartstate("dmz_uav_tower", "unusable");
        instance.var_118719db7c3b0eef = player.team;
        if (istrue(level.var_1245cb2a7bf020f7)) {
            if (namespace_3c37cb17ade254d::issharedfuncdefined("uav_tower", "onCapturedChange")) {
                [[ namespace_3c37cb17ade254d::getsharedfunc("uav_tower", "onCapturedChange") ]](instance, 1);
            }
        }
        state = instance getscriptablepartstate("dmz_uav_tower_laptop");
        if (state == "laptop_closed" && !istrue(instance.var_1dbfb72730034336)) {
            instance setscriptablepartstate("dmz_uav_tower_laptop", "laptop_opened");
        }
        instance.var_b14a331ba425c286 = 0;
        instance function_678ea4319b42dfed(player);
        player setclientomnvar("ui_dmz_uav_tower_screen", 0);
        instance setscriptablepartstate("dmz_uav_tower", "usable");
        if (cost > 0) {
            var_4c63764d12ed5def = istrue(player.plundercount >= cost);
            if (var_4c63764d12ed5def && istrue(instance.var_b14a331ba425c286)) {
                players = level.players;
                instance thread function_a301051f63fbbff9(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, players);
            } else {
                if (var_4c63764d12ed5def && !istrue(instance.var_b14a331ba425c286)) {
                    goto LOC_0000028b;
                }
                if (soundexists("ui_select_purchase_deny") && level.var_db9587440497015c) {
                    player playlocalsound("ui_select_purchase_deny");
                }
                if (isdefined(level.showerrormessagefunc)) {
                    player [[ level.showerrormessagefunc ]]("DMZ/INSUFFICIENT_MONEY_UAV_TOWER");
                LOC_0000028b:
                }
            LOC_0000028b:
            }
        LOC_0000028b:
        } else if (isdefined(instance.var_b14a331ba425c286) && instance.var_b14a331ba425c286) {
            players = level.players;
            instance thread function_a301051f63fbbff9(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, players);
        } else {
            instance setscriptablepartstate("dmz_uav_tower", "usable");
        }
    } else if (!var_4c63764d12ed5def) {
        if (soundexists("ui_select_purchase_deny") && level.var_db9587440497015c) {
            player playlocalsound("ui_select_purchase_deny");
        }
        if (isdefined(level.showerrormessagefunc)) {
            player [[ level.showerrormessagefunc ]]("DMZ/INSUFFICIENT_MONEY_UAV_TOWER");
        }
    } else {
        if (soundexists("br_pickup_deny") && level.var_db9587440497015c) {
            player playlocalsound("br_pickup_deny");
        }
        if (isdefined(level.showerrormessagefunc)) {
            player [[ level.showerrormessagefunc ]]("DMZ/INACTIVE_UAV_TOWER");
        }
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220e
// Size: 0xba
function function_678ea4319b42dfed(player) {
    if (istrue(self.var_45e35ef2a973ecb)) {
        self.var_b14a331ba425c286 = 1;
        return;
    }
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_interrupt");
    player playlocalsound("uav_tower_foley");
    player playsound("uav_tower_foley_npc", player, player);
    thread function_796d1da742e2a88a(player);
    typingAnimStart(player);
    player setclientomnvar("ui_dmz_uav_tower_screen", 1);
    thread function_667fd79f2b5d6436(player);
    function_e71d6089ebd93181(player);
    function_b61464b3867d7ba3(player);
    player notify("interact_finished");
    waitframe();
    player function_3c288bbdd4016fd4(1);
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(player)) {
        player notify("remove_rig");
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22cf
// Size: 0x28
function private function_a39eabffc4fe3719() {
    return self.origin + rotatevector((-1.279, -55.632, 0), self.angles);
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22ff
// Size: 0x1e
function private function_af548fb33b12cba1() {
    return combineangles(self.angles, (0, 90, 0));
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2325
// Size: 0x2d
function function_6a7cbe567872ae7f() {
    self endon("watch_gunless_weapon");
    waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "interact_interrupt");
    if (isdefined(self)) {
        thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2359
// Size: 0x32b
function typingAnimStart(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player function_3c288bbdd4016fd4(0);
    player.linktoent = player spawn_tag_origin(player.origin, player getplayerangles(0));
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 0, 0, 1, 0);
    goalpos = function_a39eabffc4fe3719();
    var_bb4c5aaff39749f7 = (10, 0, 0);
    var_de179dc7a706ad8f = combineangles((0, 90, 0), var_bb4c5aaff39749f7);
    goalangles = combineangles(self.angles, var_de179dc7a706ad8f);
    var_57c87883ae437750 = 0.5;
    if (isdefined(self.var_bf8e5f003146af44)) {
        player.linktoent childthread function_1f6d35ecbf0ed006(self, (-1.279, -55.632, 0), var_de179dc7a706ad8f, var_57c87883ae437750);
    } else {
        player.linktoent moveto(goalpos, var_57c87883ae437750, 0.1, 0.1);
        player.linktoent rotateto(goalangles, var_57c87883ae437750, 0.1, 0.1);
    }
    player setstance("crouch");
    player thread function_6a7cbe567872ae7f();
    var_cd9982adb17761a8 = gettime();
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = max(0, var_57c87883ae437750 - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000);
    wait(var_218f64cb035d54be);
    player unlink();
    if (player.linktoent islinked()) {
        player.linktoent unlink();
    }
    player.linktoent delete();
    player.linktoent = undefined;
    player setorigin(function_a39eabffc4fe3719());
    player setplayerangles(function_af548fb33b12cba1());
    animname = "use_uav_tower_enter";
    player notify("watch_gunless_weapon");
    player thread create_player_rig("uav_tower", function_a39eabffc4fe3719(), function_af548fb33b12cba1(), self);
    player.player_rig showonlytoplayer(player);
    if (!isdefined(self.animstruct)) {
        if (isdefined(self.var_bf8e5f003146af44)) {
            animstruct = spawn_tag_origin();
        } else {
            animstruct = spawnstruct();
        }
        animstruct.origin = self.origin;
        animstruct.angles = combineangles(self.angles, combineangles((0, 180, 0), (0, 90, 0)));
        self.animstruct = animstruct;
    }
    if (isdefined(self.var_bf8e5f003146af44)) {
        self.animstruct linkto(self.var_bf8e5f003146af44);
    }
    self.animstruct namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, animname);
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x268b
// Size: 0x18b
function private function_1f6d35ecbf0ed006(uav_tower, goaloffset, goalangles, var_57c87883ae437750) {
    start_time_ms = gettime();
    end_time_ms = gettime() + var_57c87883ae437750 * 1000;
    startoffset = rotatevectorinverted(self.origin - uav_tower.origin, uav_tower.angles);
    startangles = function_848155be2b7da2cb(uav_tower.angles, self.angles);
    var_2ae616b335d7e33d = uav_tower.origin;
    while (isdefined(self) && gettime() < end_time_ms) {
        var_7aeab0bcca4b2d64 = gettime() + function_676cfe2ab64ea758();
        t = (var_7aeab0bcca4b2d64 - start_time_ms) / var_57c87883ae437750 * 1000;
        deltapos = uav_tower.origin - var_2ae616b335d7e33d;
        targetoffset = vectorlerp(startoffset, goaloffset, t);
        self.origin = uav_tower.origin + rotatevector(targetoffset, uav_tower.angles) + deltapos;
        var_eeabf9578a5f3207 = combineangles(uav_tower.angles, anglelerpquatfrac(startangles, goalangles, t));
        self.angles = var_eeabf9578a5f3207;
        var_2ae616b335d7e33d = uav_tower.origin;
        waitframe();
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x281d
// Size: 0xaa
function function_667fd79f2b5d6436(player) {
    player endon("interact_interrupt");
    waitframe();
    player notifyonplayercommand("interact_cancelled", "+weapnext");
    self.cancel = 0;
    msg = player waittill_any_timeout_1(level.var_cb86ca442250ca58, "interact_cancelled");
    self.cancel = 1;
    player notifyonplayercommandremove("interact_cancelled", "+weapnext");
    if (msg == "interact_cancelled") {
        player stoplocalsound("uav_tower_foley");
        wait(0.25);
        player setclientomnvar("ui_dmz_uav_tower_screen", 0);
    } else {
        self.var_b14a331ba425c286 = 1;
        player notify("interact_begin_exit");
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ce
// Size: 0x96
function function_796d1da742e2a88a(player) {
    player endon("interact_cancelled");
    player endon("interact_finished");
    player namespace_3c37cb17ade254d::waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "last_stand_start");
    if (!isdefined(player)) {
        return;
    }
    player notify("interact_interrupt");
    player stopanimscriptsceneevent();
    player stoplocalsound("uav_tower_foley");
    if (isdefined(player.linktoent)) {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
    }
    player notify("remove_rig");
    player function_3c288bbdd4016fd4(1);
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x296b
// Size: 0x5e
function function_e71d6089ebd93181(player, instance) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_begin_exit");
    player endon("interact_cancelled");
    while (isreallyalive(player)) {
        self.animstruct namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "use_uav_tower_idle");
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29d0
// Size: 0x76
function function_b61464b3867d7ba3(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_interrupt");
    if (isreallyalive(player)) {
        self.animstruct namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "use_uav_tower_exit");
    }
    if (isent(self.animstruct)) {
        self.animstruct delete();
        self.animstruct = undefined;
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a4d
// Size: 0x156
function function_3c288bbdd4016fd4(isallowed) {
    if (!isallowed) {
        val::set("typing", "allow_jump", 0);
        val::set("typing", "gesture", 0);
        val::set("typing", "melee", 0);
        val::set("typing", "mantle", 0);
        val::set("typing", "offhand_weapons", 0);
        val::set("typing", "allow_movement", 0);
        val::set("typing", "sprint", 0);
        val::set("typing", "fire", 0);
        val::set("typing", "reload", 0);
        val::set("typing", "weapon_pickup", 0);
        val::set("typing", "weapon_switch", 0);
        val::set("typing", "offhand_weapons", 0);
        val::set("typing", "execution_victim", 0);
        val::set("typing", "supers", 0);
        val::set("typing", "usability", 0);
        self setclientomnvar("ui_br_inventory_disabled", 1);
        self function_35501b42058d4de9();
    } else {
        val::function_c9d0b43701bdba00("typing");
        self setclientomnvar("ui_br_inventory_disabled", 0);
        self function_bb04491d50d9e43e();
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2baa
// Size: 0x6b4
function function_a301051f63fbbff9(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, streakinfo, players) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    level notify("uav_tower_activated", instance);
    if (isdefined(instance.var_27e49251bb3376ea)) {
        if (issharedfuncdefined("uav_tower", "tower_disable")) {
            [[ getsharedfunc("uav_tower", "tower_disable") ]](instance, "different_team_activated");
        }
    }
    cost = player function_26fc3305456d700f(instance);
    if (cost > 0) {
        player function_1dd4b75d0a512fcc(cost, instance);
    }
    instance.uavUsed = 1;
    instance setscriptablepartstate("dmz_uav_tower_antenna", "active_start");
    instance setscriptablepartstate("objective", "active");
    player thread function_550deeac761ab7b9(instance);
    if (!istrue(level.var_1245cb2a7bf020f7)) {
        instance setscriptablepartstate("objective", "active");
        player thread function_550deeac761ab7b9(instance);
    }
    instance.var_27e49251bb3376ea = player;
    instance.var_dcc5f31ec71d6d8a = player.team;
    instance function_fca5bdbe24070d20("objective", instance.var_dcc5f31ec71d6d8a);
    level.var_116a5f32aeb86391 = array_add(level.var_116a5f32aeb86391, instance);
    instance thread function_449f829c0284b870(instance);
    thread namespace_27c74152ccb91331::function_952d1a246a3ece86(player);
    if (issharedfuncdefined("pmc_missions", "onUAVTowerUsed")) {
        [[ getsharedfunc("pmc_missions", "onUAVTowerUsed") ]](player, instance.identifier);
    }
    var_b608af6e8d86fe42 = 0;
    if (player namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_uav_buff")) {
        var_b608af6e8d86fe42 = 1;
    }
    if (level.var_66bf5bfca21a8d52) {
        instance function_86a96e658bbd0cba(player.team, var_b608af6e8d86fe42);
        if (isdefined(instance.var_73bdebbc7da468a3) && istrue(instance.var_73bdebbc7da468a3.var_62bd5c5aa7a876db)) {
            instance thread function_e1a473f05677516b();
        }
    }
    instance thread function_444bbcc637c82fc2(instance, player.team, var_b608af6e8d86fe42);
    instance thread function_9a71dd352fe6da4b(instance, var_b608af6e8d86fe42);
    instance function_1d71dc9529bef550(undefined);
    instance.var_4d984be3d3c4de23 = gettime();
    if (issharedfuncdefined("game", "getSquadmates")) {
        var_607da387f3617ed1 = [[ getsharedfunc("game", "getSquadmates") ]](player.team, player.var_ff97225579de16a, 1);
        foreach (ent in var_607da387f3617ed1) {
            if (!isdefined(ent.var_c26450f6e6e47b84)) {
                ent.var_c26450f6e6e47b84 = 0;
            }
            ent.var_c26450f6e6e47b84++;
            if (isdefined(level.var_8c835bdf5cb251a3[#"hash_541f0b57f321a27"])) {
                var_e48c641d05a213f1 = 1;
                if (istrue(getdvarint(@"hash_17570581e6190ae0", 0)) && (level.var_d507e35282b50614 == 0 || istrue(instance.var_609d30214a3a142e))) {
                    var_e48c641d05a213f1 = 0;
                }
                if (var_e48c641d05a213f1) {
                    ent namespace_53fc9ddbb516e6e1::function_e800498086e36c29(#"hash_541f0b57f321a27");
                }
            }
        }
        players = undefined;
        if (!isdefined(instance.var_73bdebbc7da468a3.poi) && isdefined(instance.var_73bdebbc7da468a3.var_fb927887f6e39e4e)) {
            instance.var_73bdebbc7da468a3.poi = namespace_37f0fb6355a4618a::function_55cf921efa4cbd09(instance.origin, 0, 0, 1);
        }
        if (isdefined(instance.var_73bdebbc7da468a3.poi)) {
            players = level.poi[instance.var_73bdebbc7da468a3.poi]["players"];
            players = array_remove_array(players, var_607da387f3617ed1);
            if (level.var_6bacc8cb646fa5cd) {
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("uav_tower_used_others", players);
            }
        }
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("uav_tower_used", var_607da387f3617ed1);
        if (level.var_db9587440497015c && level.var_d507e35282b50614 && !istrue(instance.var_609d30214a3a142e)) {
            wait(1);
        }
        if (issharedfuncdefined("hud", "showBrDMZSplash")) {
            if (isdefined(instance.var_73bdebbc7da468a3.poi)) {
                if (issharedfuncdefined("hud", "showBrDMZSplash")) {
                    if (isdefined(players)) {
                        [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_uav_tower_activated_others", players, instance.var_73bdebbc7da468a3.poi);
                    }
                    [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_uav_tower_activated_team", var_607da387f3617ed1, instance.var_73bdebbc7da468a3.poi);
                } else if (issharedfuncdefined("hud", "showDMZSplash")) {
                    if (level.var_6bacc8cb646fa5cd && isdefined(players)) {
                        [[ getsharedfunc("hud", "showDMZSplash") ]]("dmz_uav_tower_activated_others", players, instance.var_73bdebbc7da468a3.poi);
                    }
                    [[ getsharedfunc("hud", "showDMZSplash") ]]("dmz_uav_tower_activated_team", var_607da387f3617ed1, instance.var_73bdebbc7da468a3.poi);
                }
            }
        }
        if (level.var_9f740c9281d0c7f4) {
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("uav_tower_use_friendly", player.team, player, 1, undefined, 2);
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("uav_tower_use_first_person", player, 1, undefined, 2);
            team_players = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
            var_42cf18bb4b294dce = namespace_7e17181d03156026::getplayersinradius(instance.origin, level.var_6acf91bbf5273e8f * 1.1, undefined, team_players);
            foreach (player in var_42cf18bb4b294dce) {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("uav_tower_use_enemy", player, 1, undefined, 2);
            }
        }
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3265
// Size: 0x13e
function function_2a905da0882c958() {
    level endon("game_ended");
    while (1) {
        for (i = 0; i < level.var_a1141d47ab94d2a1.size; i++) {
            if (isdefined(level.var_a1141d47ab94d2a1[i]) && isdefined(level.var_a1141d47ab94d2a1[i].var_107d6e8fc82a82a8)) {
                instance = level.var_a1141d47ab94d2a1[i].var_107d6e8fc82a82a8;
                state = instance getscriptablepartstate("dmz_uav_tower_laptop");
                if (!istrue(instance.uavUsed) || state == "laptop_closed") {
                    players = playersnear(instance.origin, 400);
                    if (isdefined(players) && players.size > 0) {
                        if (state == "laptop_closed" && !istrue(instance.var_1dbfb72730034336)) {
                            instance setscriptablepartstate("dmz_uav_tower_laptop", "laptop_opened");
                        }
                    } else if (state == "laptop_opened" && !istrue(instance.uavUsed)) {
                        instance setscriptablepartstate("dmz_uav_tower_laptop", "laptop_closed");
                    }
                }
            }
            wait(0.25);
        }
        wait(0.25);
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33aa
// Size: 0x16
function function_fcd65de73a5fd25() {
    return getdvarint(@"hash_5af0f9b3aea8fda6", 1) == 1;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33c8
// Size: 0xde
function function_a9c1f9543f60e5c6(player) {
    if (isdefined(player) && istrue(player.var_859654e0445a36d9)) {
        if (isdefined(level.showerrormessagefunc) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
            player [[ level.showerrormessagefunc ]](level.br_pickups.var_355cddb773cb000d);
        }
        return 0;
    }
    if (player isthrowinggrenade() || player isswitchingweapon() || isdefined(player getheldoffhand()) && !isnullweapon(player getheldoffhand())) {
        if (isdefined(level.showerrormessagefunc) && isdefined(level.br_pickups.var_859f4bd204f1259)) {
            player [[ level.showerrormessagefunc ]](level.br_pickups.var_859f4bd204f1259);
        }
        return 0;
    }
    return 1;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ae
// Size: 0x38
function function_449f829c0284b870(instance) {
    level endon("game_ended");
    wait(1);
    instance setscriptablepartstate("activated_oneshot_audio", "on");
    instance setscriptablepartstate("activated_alarm_tell", "on");
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ed
// Size: 0xbb
function function_1dd4b75d0a512fcc(amount, data) {
    var_b44212e15fce8588 = namespace_c6ccccd95254983f::playerplunderevent(amount, 4, undefined, data);
    if (isdefined(var_b44212e15fce8588)) {
        if (soundexists("ui_select_purchase_confirm") && level.var_db9587440497015c && level.var_d507e35282b50614 && !istrue(data.var_609d30214a3a142e)) {
            self playlocalsound("ui_select_purchase_confirm");
        }
        var_b70c878de3673730 = "highestPurchaseCost";
        if (!isdefined(self.pers[var_b70c878de3673730]) || self.pers[var_b70c878de3673730] < amount) {
            self.pers[var_b70c878de3673730] = amount;
        }
    }
    namespace_c6ccccd95254983f::function_5a2284274d70f7d(4, amount);
    return var_b44212e15fce8588;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b0
// Size: 0x20e
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    var_52d59c928eb97c81 = var_e86632d645c137d0 + var_5d954f1724092f5a;
    if (isdefined(level.var_a1141d47ab94d2a1)) {
        foreach (tower in level.var_a1141d47ab94d2a1) {
            if (istrue(tower.var_107d6e8fc82a82a8.var_92fd088d7ad6690d)) {
                continue;
            }
            var_b1e1b0a993dbd52a = 1;
            if (distance2dsquared(var_819edacdacb810e4, tower.var_107d6e8fc82a82a8.origin) > var_52d59c928eb97c81 * var_52d59c928eb97c81) {
                var_b1e1b0a993dbd52a = 0;
            }
            if (!var_b1e1b0a993dbd52a && !tower.var_107d6e8fc82a82a8.var_1dbfb72730034336) {
                tower_disable(tower.var_107d6e8fc82a82a8, "in_gas");
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("dmz_uav_tower", "unusable");
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("objective", "none");
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("dmz_uav_tower_laptop", "laptop_closed");
                tower.var_107d6e8fc82a82a8.var_1dbfb72730034336 = 1;
                level.var_4414dbbf9d80d75d[level.var_4414dbbf9d80d75d.size] = tower;
            } else if (var_b1e1b0a993dbd52a && tower.var_107d6e8fc82a82a8.var_1dbfb72730034336) {
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("dmz_uav_tower", "usable");
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("objective", "inactive");
                tower.var_107d6e8fc82a82a8.var_1dbfb72730034336 = 0;
                level.var_4414dbbf9d80d75d = array_remove(level.var_4414dbbf9d80d75d, tower);
            }
        }
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c5
// Size: 0x22d
function function_1a1709943670772a() {
    if (isdefined(level.var_a1141d47ab94d2a1)) {
        foreach (tower in level.var_a1141d47ab94d2a1) {
            if (istrue(tower.var_107d6e8fc82a82a8.var_92fd088d7ad6690d)) {
                continue;
            }
            if (!namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(tower.var_107d6e8fc82a82a8.origin) && !tower.var_107d6e8fc82a82a8.var_1dbfb72730034336) {
                tower_disable(tower.var_107d6e8fc82a82a8, "in_gas");
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("dmz_uav_tower", "unusable");
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("objective", "none");
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("dmz_uav_tower_laptop", "laptop_closed");
                tower.var_107d6e8fc82a82a8.var_1dbfb72730034336 = 1;
                level.var_4414dbbf9d80d75d[level.var_4414dbbf9d80d75d.size] = tower;
            } else if (namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(tower.var_107d6e8fc82a82a8.origin) && tower.var_107d6e8fc82a82a8.var_1dbfb72730034336) {
                if (level.var_d507e35282b50614 > 0 && !istrue(tower.var_107d6e8fc82a82a8.var_609d30214a3a142e)) {
                    tower.var_107d6e8fc82a82a8 setscriptablepartstate("dmz_uav_tower", "usable_cost");
                } else {
                    tower.var_107d6e8fc82a82a8 setscriptablepartstate("dmz_uav_tower", "usable");
                }
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("objective", "inactive");
                tower.var_107d6e8fc82a82a8.var_1dbfb72730034336 = 0;
                level.var_4414dbbf9d80d75d = array_remove(level.var_4414dbbf9d80d75d, tower);
            }
        }
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39f9
// Size: 0xe9
function function_907613649c1c683d(var_47ca96f0337924ef) {
    if (isdefined(level.var_a1141d47ab94d2a1)) {
        foreach (tower in level.var_a1141d47ab94d2a1) {
            if (tower.var_107d6e8fc82a82a8.var_1dbfb72730034336) {
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("dmz_uav_tower", "usable");
                tower.var_107d6e8fc82a82a8 setscriptablepartstate("objective", "inactive");
                if (istrue(var_47ca96f0337924ef)) {
                    tower.var_107d6e8fc82a82a8.var_1dbfb72730034336 = 0;
                }
                level.var_4414dbbf9d80d75d = array_remove(level.var_4414dbbf9d80d75d, tower);
            }
        }
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ae9
// Size: 0xc8
function function_86a96e658bbd0cba(team, var_b608af6e8d86fe42) {
    radius = int(level.var_6acf91bbf5273e8f * ter_op(isdefined(level.var_c0fe6cb6face684e) && var_b608af6e8d86fe42, level.var_c0fe6cb6face684e, 1));
    function_6b6b6273f8180522("active_uav_tower_radius", self.origin, radius);
    function_6988310081de7b45();
    if (isdefined(team)) {
        foreach (player in namespace_54d20dd0dd79277f::getteamdata(team, "players")) {
            function_d7d113d56ef0ef5b(player);
        }
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb8
// Size: 0x3d
function function_e1a473f05677516b() {
    self endon("death");
    self endon("tower_disable");
    level endon("game_ended");
    while (1) {
        function_6e148c8da2e4db13(self.origin);
        waitframe();
        if (!function_acaa75ca8754452e()) {
            break;
        }
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bfc
// Size: 0x13
function function_c3476653bc728729() {
    if (function_acaa75ca8754452e()) {
        function_af5604ce591768e1();
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c16
// Size: 0xb6
function function_6bdc6f56944dc3aa(player, oldteam, newteam) {
    if (level.var_66bf5bfca21a8d52) {
        foreach (tower in level.var_116a5f32aeb86391) {
            if (isdefined(tower.var_dcc5f31ec71d6d8a)) {
                if (tower.var_dcc5f31ec71d6d8a == oldteam) {
                    tower function_cfd53c8f6878014f(player);
                }
                if (tower.var_dcc5f31ec71d6d8a == newteam) {
                    tower function_d7d113d56ef0ef5b(player);
                }
            }
        }
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd3
// Size: 0x4f
function function_26fc3305456d700f(instance) {
    if (isdefined(level.var_d507e35282b50614) && level.var_d507e35282b50614 > 0 && !istrue(instance.var_609d30214a3a142e)) {
        return int(level.var_d507e35282b50614 * function_e1693023b9a46a8a());
    }
    return 0;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2a
// Size: 0xc4
function function_e1693023b9a46a8a() {
    var_4e5b987a9eefeb1c = 1;
    var_c6df0612e7a6c4b2 = 1;
    if (isdefined(level.var_667c8146dba70095) && array_contains_key(level.var_667c8146dba70095, self.guid)) {
        foreach (source in level.var_667c8146dba70095[self.guid]) {
            if (istrue(source["additive"])) {
                var_4e5b987a9eefeb1c = var_4e5b987a9eefeb1c + source["modifier"];
            } else {
                var_c6df0612e7a6c4b2 = var_c6df0612e7a6c4b2 * source["modifier"];
            }
        }
    }
    return var_4e5b987a9eefeb1c * var_c6df0612e7a6c4b2;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df6
// Size: 0xe6
function function_5ee813ae390b4ce5(source, modifier, additive, var_16289364ee019877) {
    if (!isdefined(level.var_667c8146dba70095)) {
        level.var_667c8146dba70095 = [];
    }
    if (!array_contains_key(level.var_667c8146dba70095, self.guid)) {
        level.var_667c8146dba70095[self.guid] = [];
    }
    /#
        assert(istrue(var_16289364ee019877) || !array_contains_key(level.var_667c8146dba70095[self.guid], source));
    #/
    level.var_667c8146dba70095[self.guid][source] = [];
    level.var_667c8146dba70095[self.guid][source]["additive"] = istrue(additive);
    level.var_667c8146dba70095[self.guid][source]["modifier"] = modifier;
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee3
// Size: 0x68
function function_ade912f6ea99fe68(source) {
    if (isdefined(level.var_667c8146dba70095) && array_contains_key(level.var_667c8146dba70095, self.guid) && array_contains_key(level.var_667c8146dba70095[self.guid], source)) {
        level.var_667c8146dba70095[self.guid][source] = undefined;
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f52
// Size: 0x3f
function function_9ecd5a6088d14c68() {
    if (isdefined(level.var_667c8146dba70095) && array_contains_key(level.var_667c8146dba70095, self.guid)) {
        level.var_667c8146dba70095[self.guid] = undefined;
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f98
// Size: 0x209
function function_1d71dc9529bef550(var_351a92897da4ba3a) {
    var_6bc7cdb2fec919e7 = self;
    eventparams = [];
    eventparams[eventparams.size] = "player_activated_xuid";
    var_b623d27dffe292fb = var_6bc7cdb2fec919e7.var_27e49251bb3376ea;
    if (!isdefined(var_b623d27dffe292fb)) {
        playerxuid = "";
    } else {
        playerxuid = var_b623d27dffe292fb getxuid();
    }
    eventparams[eventparams.size] = playerxuid;
    eventparams[eventparams.size] = "team_activated";
    if (isdefined(var_b623d27dffe292fb) && isdefined(var_b623d27dffe292fb.team)) {
        teamname = var_b623d27dffe292fb.team;
    } else {
        teamname = "neutral";
    }
    eventparams[eventparams.size] = teamname;
    eventparams[eventparams.size] = "cost_activated";
    if (teamname == "neutral") {
        cost = 0;
    } else {
        cost = var_b623d27dffe292fb function_26fc3305456d700f(var_6bc7cdb2fec919e7);
    }
    eventparams[eventparams.size] = cost;
    eventparams[eventparams.size] = "tower_x";
    var_7be56aeeada95aa = var_6bc7cdb2fec919e7.origin[0];
    eventparams[eventparams.size] = var_7be56aeeada95aa;
    eventparams[eventparams.size] = "tower_y";
    var_7be57aeeada97dd = var_6bc7cdb2fec919e7.origin[1];
    eventparams[eventparams.size] = var_7be57aeeada97dd;
    eventparams[eventparams.size] = "tower_z";
    var_7be54aeeada9144 = var_6bc7cdb2fec919e7.origin[2];
    eventparams[eventparams.size] = var_7be54aeeada9144;
    eventparams[eventparams.size] = "last_time_activated";
    var_4d984be3d3c4de23 = -1;
    if (isdefined(var_6bc7cdb2fec919e7.var_4d984be3d3c4de23)) {
        var_4d984be3d3c4de23 = int((gettime() - var_6bc7cdb2fec919e7.var_4d984be3d3c4de23) / 1000);
    }
    eventparams[eventparams.size] = var_4d984be3d3c4de23;
    eventparams[eventparams.size] = "disable_reason";
    var_ee39591fdb9b143b = "none";
    if (isdefined(var_351a92897da4ba3a)) {
        var_ee39591fdb9b143b = var_351a92897da4ba3a;
    }
    eventparams[eventparams.size] = var_ee39591fdb9b143b;
    if (!isdefined(var_b623d27dffe292fb)) {
        var_b623d27dffe292fb = namespace_d576b6dc7cef9c62::gethostplayer();
    }
    if (isdefined(var_b623d27dffe292fb)) {
        var_b623d27dffe292fb dlog_recordplayerevent("dlog_event_br_uav_tower", eventparams);
    }
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a8
// Size: 0x2e
function function_dc9f963b97f73b1a(data) {
    tower_disable(self, "EMP_" + data.reason);
    thread UAVTowerDisableForTime(data);
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41dd
// Size: 0xd7
function UAVTowerDisableForTime(data) {
    self notify("UAVTowerDisableForTime");
    self endon("UAVTowerDisableForTime");
    self setscriptablepartstate("dmz_uav_tower", "unusable");
    if (!isdefined(self.var_bc40e6506a04d555)) {
        self.var_bc40e6506a04d555 = spawn("trigger_radius", self.origin, 0, level.var_7916385e2124e7a7, 62);
        namespace_f1565a2788ab1e89::makeenterexittrigger(self.var_bc40e6506a04d555, &function_2a4470bcf739b0e3, &playerExitUAVTowerDisabled);
    }
    self.var_bc40e6506a04d555.endtime = int(gettime() + function_a5b14435e3229bed(data.time));
    wait(data.time);
    self setscriptablepartstate("dmz_uav_tower", "usable");
    self.var_bc40e6506a04d555 delete();
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42bb
// Size: 0x61
function function_2a4470bcf739b0e3(player, trigger) {
    self endon("playerExitUAVTowerDisabled");
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("uav_offline", trigger.endtime);
    timeleft = function_c89ed1840c8d0f0f(trigger.endtime - gettime());
    wait(timeleft);
    waitframe();
    thread playerExitUAVTowerDisabled(player, trigger);
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4323
// Size: 0x28
function playerExitUAVTowerDisabled(player, trigger) {
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    self notify("playerExitUAVTowerDisabled");
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4352
// Size: 0xa0
function function_83565380b036f12d() {
    /#
        thread function_853901492bb15e03();
        waitframe();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("uav_tower_activated");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("activated_alarm_tell", @"hash_1583aa42d0c9d90a");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("dmz_uav_tower_enter", @"hash_1583aa42d0c9d90a");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_c658346ed64f29db");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_158fdc0be6244136");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_ce4d8222d33e9051");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_710ff2c3b923a971");
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace uav_tower/namespace_872204d77e9872c0
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x43f9
// Size: 0x474
function private function_853901492bb15e03() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_1583aa42d0c9d90a", 0)) {
                setdvar(@"hash_1583aa42d0c9d90a", 0);
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    [[ getsharedfunc("<unknown string>", "<unknown string>") ]]("<unknown string>", level.players, 0);
                }
            }
            if (getdvarint(@"hash_4d4dcdd9dd9dd058", 0)) {
                setdvar(@"hash_4d4dcdd9dd9dd058", 0);
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", level.players);
                if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
                    [[ getsharedfunc("<unknown string>", "<unknown string>") ]]("<unknown string>", level.players, 0);
                }
            }
            if (getdvarint(@"hash_c658346ed64f29db", 0)) {
                setdvar(@"hash_c658346ed64f29db", 0);
                foreach (player in level.players) {
                    if (!isdefined(player) || !isdefined(player.origin)) {
                        continue;
                    }
                    forward = anglestoforward(player getplayerangles());
                    pos = player.origin + forward * 300;
                    pos = drop_to_ground(pos, 100);
                    var_c6b1e251542cdf92 = spawnstruct();
                    var_c6b1e251542cdf92.origin = pos;
                    var_c6b1e251542cdf92.angles = (0, 0, 0);
                    function_858af52a8e277a68(var_c6b1e251542cdf92, level.var_a1141d47ab94d2a1.size);
                }
            }
            if (getdvarint(@"hash_158fdc0be6244136", 0)) {
                setdvar(@"hash_158fdc0be6244136", 0);
                foreach (player in level.players) {
                    if (!isdefined(player) || !isdefined(player.origin)) {
                        continue;
                    }
                    var_57e8b855b89fa39a = sortbydistance(level.var_a1141d47ab94d2a1, player.origin)[0];
                    if (isdefined(var_57e8b855b89fa39a)) {
                        var_57e8b855b89fa39a function_678ea4319b42dfed(player);
                    }
                }
            }
            if (getdvarint(@"hash_ce4d8222d33e9051", 0)) {
                setdvar(@"hash_ce4d8222d33e9051", 0);
                foreach (player in level.players) {
                    if (!isdefined(player) || !isdefined(player.origin)) {
                        continue;
                    }
                    var_b608af6e8d86fe42 = 0;
                    if (player namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("<unknown string>")) {
                        var_b608af6e8d86fe42 = 1;
                    }
                    radius = int(level.var_6acf91bbf5273e8f * ter_op(isdefined(level.var_c0fe6cb6face684e) && var_b608af6e8d86fe42, level.var_c0fe6cb6face684e, 1));
                    triggerportableradarpingteam(player.origin, player.team, radius, level.var_39f69f7dfc40a323);
                }
            }
            if (getdvarint(@"hash_710ff2c3b923a971", 0)) {
                setdvar(@"hash_710ff2c3b923a971", 0);
                foreach (player in level.players) {
                    if (!isdefined(player) || !isdefined(player.origin)) {
                        continue;
                    }
                    player namespace_53fc9ddbb516e6e1::function_e800498086e36c29(#"hash_541f0b57f321a27");
                }
            }
            if (getdvarint(@"hash_9705adb45ef93ac", 0)) {
                setdvar(@"hash_9705adb45ef93ac", 0);
                function_907613649c1c683d(0);
            }
            waitframe();
        }
    #/
}

