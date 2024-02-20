// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\anim_scene.gsc;
#using scripts\engine\scriptable.gsc;

#namespace namespace_a6891c3d100a6a05;

// Namespace namespace_a6891c3d100a6a05/namespace_82f05772526a4798
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b2
// Size: 0x3d
function main() {
    function_c25a40ae517ef340();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("usable_left", &function_e8e4bb2f83e5055a);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("usable_right", &function_e8e4bb2f83e5055a);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("usable_front", &function_e8e4bb2f83e5055a);
}

// Namespace namespace_a6891c3d100a6a05/namespace_82f05772526a4798
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f6
// Size: 0x30d
function function_a6891c3d100a6a05(samsite, player, dir) {
    level endon("game_ended");
    samsite setscriptablepartstate("usable_left", "unusable");
    samsite setscriptablepartstate("usable_front", "unusable");
    samsite setscriptablepartstate("usable_right", "unusable");
    samsite.scenenode = spawnstruct();
    samsite.scenenode.origin = samsite.origin;
    samsite.scenenode.angles = samsite.angles;
    if (isdefined(level.var_187bff90aa51742f)) {
        if (isdefined(player)) {
            player thread [[ level.var_187bff90aa51742f ]]();
        }
    }
    actorplayer = anim_scene_create_actor(player, "player_rig_sm", 1);
    c4 = spawn("script_model", actorplayer.entity gettagorigin("tag_accessory_right"));
    c4 hide();
    c4.angles = actorplayer.entity gettagangles("tag_accessory_right");
    c4 dontinterpolate();
    c4 linkto(actorplayer.entity, "tag_accessory_right");
    if (isdefined(level.var_2179c46fc54fd9ce)) {
        c4 setmodel(level.var_2179c46fc54fd9ce);
    } else {
        c4 setmodel("offhand_2h_c4_prop_cp");
    }
    thread function_dabfdf04f879bc4f(c4);
    c4 thread function_e9508a0db7cc3e83();
    if (istrue(level.var_5c9a3961728ac52f)) {
        player.var_385a26c0bfc712b4 = 1;
    }
    if (dir == "right") {
        var_db3b2bd857f61ae6 = samsite.scenenode anim_scene([0:actorplayer], "samsite_plant_l");
    } else if (dir == "left") {
        var_db3b2bd857f61ae6 = samsite.scenenode anim_scene([0:actorplayer], "samsite_plant_r");
    } else {
        var_db3b2bd857f61ae6 = samsite.scenenode anim_scene([0:actorplayer], "samsite_plant_f");
    }
    if (istrue(level.var_5c9a3961728ac52f)) {
        player.var_385a26c0bfc712b4 = 0;
        c4.var_7b0e1793e94cafb4 = var_db3b2bd857f61ae6;
    }
    c4 unlink();
    actorplayer = undefined;
    var_2ce69f8431572669 = undefined;
    if (isdefined(level.var_d73f1dd12f69b96e)) {
        if (isdefined(player)) {
            player thread [[ level.var_d73f1dd12f69b96e ]]();
        }
    }
    if (isdefined(level.var_3f4534fb14cca909)) {
        var_d451d5dcb3dd5dc9 = [[ level.var_3f4534fb14cca909 ]](c4, samsite, player);
        if (!istrue(var_d451d5dcb3dd5dc9)) {
            c4 hide();
            return;
        }
    } else {
        function_236a1fe93e41c498(c4);
    }
    c4 setscriptablepartstate("effects", "explode");
    if (isdefined(level.var_fa3f2cef70b746cf)) {
        if (isdefined(player)) {
            player thread [[ level.var_fa3f2cef70b746cf ]]();
        }
    }
    wait(0.5);
    c4 delete();
}

// Namespace namespace_a6891c3d100a6a05/namespace_82f05772526a4798
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60a
// Size: 0x1f
function function_e9508a0db7cc3e83() {
    wait(1);
    if (soundexists("weap_samsite_plant_c4")) {
        self playsound("weap_samsite_plant_c4");
    }
}

// Namespace namespace_a6891c3d100a6a05/namespace_82f05772526a4798
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x630
// Size: 0x1d
function function_dabfdf04f879bc4f(c4) {
    c4 endon("death");
    wait(1);
    c4 show();
}

// Namespace namespace_a6891c3d100a6a05/namespace_82f05772526a4798
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x654
// Size: 0x74
function function_e8e4bb2f83e5055a(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    dir = "left";
    if (part == "usable_right") {
        dir = "right";
    } else if (part == "usable_front") {
        dir = "front";
    }
    function_a6891c3d100a6a05(instance, player, dir);
}

// Namespace namespace_a6891c3d100a6a05/namespace_82f05772526a4798
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cf
// Size: 0x13b
function function_236a1fe93e41c498(c4) {
    currenttime = gettime();
    var_f28399727742eb23 = int(currenttime + 5000);
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    while (var_c301d652d9a73075 > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        if (var_c301d652d9a73075 < 1500) {
            if (var_c301d652d9a73075 <= 250) {
                if (soundexists("breach_warning_beep_05")) {
                    c4 playsound("breach_warning_beep_05");
                }
            } else if (var_c301d652d9a73075 < 500) {
                if (soundexists("breach_warning_beep_04")) {
                    c4 playsound("breach_warning_beep_04");
                }
            } else if (var_c301d652d9a73075 < 1500) {
                if (soundexists("breach_warning_beep_03")) {
                    c4 playsound("breach_warning_beep_03");
                }
            } else if (soundexists("breach_warning_beep_02")) {
                c4 playsound("breach_warning_beep_02");
            }
            wait(0.25);
        } else if (var_c301d652d9a73075 < 3500) {
            if (soundexists("breach_warning_beep_02")) {
                c4 playsound("breach_warning_beep_02");
            }
            wait(0.5);
        } else {
            if (soundexists("breach_warning_beep_01")) {
                c4 playsound("breach_warning_beep_01");
            }
            wait(1);
        }
        if (var_c301d652d9a73075 < 0) {
            break;
        }
    }
}

// Namespace namespace_a6891c3d100a6a05/namespace_82f05772526a4798
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x811
// Size: 0x13e
function function_c25a40ae517ef340() {
    level.scr_animtree["player_rig_sm"] = %script_model;
    level.scr_anim["player_rig_sm"]["samsite_plant_l"] = script_model%iw9_sam_breach_charge_left;
    level.scr_eventanim["player_rig_sm"]["samsite_plant_l"] = %"iw9_sam_breach_charge_left";
    level.scr_anim["player_rig_sm"]["samsite_plant_r"] = script_model%iw9_sam_breach_charge_right;
    level.scr_eventanim["player_rig_sm"]["samsite_plant_r"] = %"iw9_sam_breach_charge_right";
    level.scr_anim["player_rig_sm"]["samsite_plant_f"] = script_model%iw9_cp_sam_breach_charge_front;
    level.scr_eventanim["player_rig_sm"]["samsite_plant_f"] = %"hash_7e94c3dd66a3eca0";
    level.scr_animtree["c4_prop"] = %script_model;
    level.scr_anim["c4_prop"]["samsite_plant_l"] = script_model%iw9_cp_sam_breach_charge_left_c4;
    level.scr_anim["c4_prop"]["samsite_plant_r"] = script_model%iw9_cp_sam_breach_charge_right_c4;
    level.scr_anim["c4_prop"]["samsite_plant_f"] = script_model%iw9_cp_sam_breach_charge_front_c4;
}

