#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\common\values.gsc;
#using scripts\sp\player_rig.gsc;

#namespace player_rig;

// Namespace player_rig / scripts\sp\player_rig
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0x12a
function init_player_rig(var_6aaf40d85156ec33, var_2ae369ca3c8d94ba, var_5e666ed18b1e0d1f, var_b6bb7fc75fe93f49) {
    /#
        setdvarifuninitialized(@"hash_36a6e170933fe94b", 0);
    #/
    var_b6bb7fc75fe93f49 = default_to(var_b6bb7fc75fe93f49, 1);
    if (istrue(var_b6bb7fc75fe93f49)) {
        if (isdefined(var_6aaf40d85156ec33)) {
            precachemodel(var_6aaf40d85156ec33);
        }
        if (isdefined(var_2ae369ca3c8d94ba)) {
            precachemodel(var_2ae369ca3c8d94ba);
        }
        if (isdefined(var_5e666ed18b1e0d1f)) {
            precachemodel(var_5e666ed18b1e0d1f);
        }
    }
    if (isdefined(var_6aaf40d85156ec33)) {
        level.scr_animtree["player_rig"] = %player;
        level.scr_model["player_rig"] = var_6aaf40d85156ec33;
    } else {
        level.scr_animtree["player_rig"] = undefined;
        level.scr_model["player_rig"] = undefined;
    }
    if (isdefined(var_2ae369ca3c8d94ba)) {
        level.scr_animtree["player_legs"] = %player;
        level.scr_model["player_legs"] = var_2ae369ca3c8d94ba;
    } else {
        level.scr_animtree["player_legs"] = undefined;
        level.scr_model["player_legs"] = undefined;
    }
    if (isdefined(var_5e666ed18b1e0d1f)) {
        init_player_body(var_5e666ed18b1e0d1f);
        return;
    }
    level.scr_animtree["player_body"] = undefined;
    level.scr_model["player_body"] = undefined;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x503
// Size: 0x26
function init_player_rig_no_precache(var_6aaf40d85156ec33, var_2ae369ca3c8d94ba, var_5e666ed18b1e0d1f) {
    init_player_rig(var_6aaf40d85156ec33, var_2ae369ca3c8d94ba, var_5e666ed18b1e0d1f, 0);
}

// Namespace player_rig / scripts\sp\player_rig
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x531
// Size: 0x2e
function init_player_body(var_5e666ed18b1e0d1f) {
    level.scr_model["player_body"] = var_5e666ed18b1e0d1f;
    level.scr_animtree["player_body"] = %generic_human;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x567
// Size: 0x6a
function private function_e92e6ad1059c8eec() {
    var_554cb117b3f17b8a = self;
    if (!isdefined(var_554cb117b3f17b8a) || !isdefined(var_554cb117b3f17b8a.animname)) {
        return;
    }
    if (!is_equal(var_554cb117b3f17b8a.model, level.scr_model[var_554cb117b3f17b8a.animname])) {
        var_554cb117b3f17b8a setmodel(level.scr_model[var_554cb117b3f17b8a.animname]);
    }
}

// Namespace player_rig / scripts\sp\player_rig
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9
// Size: 0xfc
function get_player_rig(var_3e3e6fc934c518cb, var_a871c06af7cb87c6) {
    if (!isdefined(level.player_rig)) {
        level.player_rig = spawn_anim_model("player_rig");
        level.player_rig dontcastshadows();
        level.player_rig.noragdoll = 1;
        var_3e3e6fc934c518cb = 1;
        if (default_to(var_a871c06af7cb87c6, 0)) {
            level.player_rig hide();
        }
    }
    level.player_rig function_e92e6ad1059c8eec();
    if (istrue(var_3e3e6fc934c518cb)) {
        level.player_rig.origin = level.player.origin;
        level.player_rig.angles = level.player.angles;
    }
    /#
        level.player_rig thread function_8bb6a2e80cd8890d("<dev string:x1c>");
    #/
    return level.player_rig;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6de
// Size: 0xd3
function get_player_legs(var_3e3e6fc934c518cb, var_a871c06af7cb87c6) {
    if (!isdefined(level.player_legs)) {
        level.player_legs = spawn_anim_model("player_legs");
        level.player_legs.noragdoll = 1;
        var_3e3e6fc934c518cb = 1;
    }
    level.player_legs function_e92e6ad1059c8eec();
    if (istrue(var_3e3e6fc934c518cb)) {
        level.player_legs.origin = level.player.origin;
        level.player_legs.angles = level.player.angles;
    }
    /#
        level.player_rig thread function_8bb6a2e80cd8890d("<dev string:x27>");
    #/
    return level.player_legs;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7ba
// Size: 0xd3
function get_player_body(var_3e3e6fc934c518cb, var_a871c06af7cb87c6) {
    if (!isdefined(level.player_body)) {
        level.player_body = spawn_anim_model("player_body");
        level.player_body.noragdoll = 1;
        var_3e3e6fc934c518cb = 1;
    }
    level.player_body function_e92e6ad1059c8eec();
    if (istrue(var_3e3e6fc934c518cb)) {
        level.player_body.origin = level.player.origin;
        level.player_body.angles = level.player.angles;
    }
    /#
        level.player_rig thread function_8bb6a2e80cd8890d("<dev string:x33>");
    #/
    return level.player_body;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x896
// Size: 0xdc
function function_8ded956fcab6f73a(var_3e3e6fc934c518cb, var_a871c06af7cb87c6, var_c9de2828f59f19e5) {
    result = [];
    if (isdefined(level.scr_model["player_rig"])) {
        result["player_rig"] = get_player_rig(var_3e3e6fc934c518cb, var_a871c06af7cb87c6);
    }
    if (isdefined(level.scr_model["player_legs"])) {
        result["player_legs"] = get_player_legs();
    }
    if (isdefined(level.scr_model["player_body"])) {
        result["player_body"] = get_player_body();
    }
    if (isdefined(var_c9de2828f59f19e5)) {
        foreach (entity in result) {
            entity useanimtree(var_c9de2828f59f19e5);
        }
    }
    return result;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x97b
// Size: 0x9f
function link_player_to_arms(r, l, u, d, linktag) {
    linktag = default_to(linktag, "tag_player");
    if (!isdefined(r)) {
        r = 30;
    }
    if (!isdefined(l)) {
        l = 30;
    }
    if (!isdefined(u)) {
        u = 30;
    }
    if (!isdefined(d)) {
        d = 30;
    }
    player_rig = get_player_rig();
    player_rig show();
    level.player playerlinktoabsolute(player_rig, linktag);
    level.player playerlinktodelta(player_rig, linktag, 1, r, l, u, d, 1);
}

// Namespace player_rig / scripts\sp\player_rig
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa22
// Size: 0x57
function blend_player_to_arms(time, linktag) {
    linktag = default_to(linktag, "tag_player");
    if (!isdefined(time)) {
        time = 0.7;
    }
    player_rig = get_player_rig();
    player_rig show();
    level.player playerlinktoblend(player_rig, linktag, time);
}

// Namespace player_rig / scripts\sp\player_rig
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa81
// Size: 0xa7
function set_player_rig_allows(allows) {
    assert(isdefined(level.player_rig));
    if (!isdefined(allows)) {
        if (isdefined(level.var_102b18b5f7ed65ed)) {
            allows = level.var_102b18b5f7ed65ed;
        } else {
            allows = ["weapon", "offhand_weapons", "melee", "sprint", "allow_jump", "mantle"];
            if (isdefined(level.crafting)) {
                allows = array_add(allows, "crafting");
            }
        }
    }
    level.player_rig.allows = allows;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb30
// Size: 0x79
function function_73341653f76b4e43(allows) {
    assert(isdefined(level.player_rig));
    assert(isdefined(level.player_rig.allows));
    level.player val::reset_all("player_rig");
    level.player val::set_array("player_rig", level.player_rig.allows, 0);
}

// Namespace player_rig / scripts\sp\player_rig
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xbb1
// Size: 0x135
function function_3a20b806b3b70617(stance, var_1c5d1595dab3ef39, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570) {
    rig = self;
    if (istrue(var_1c5d1595dab3ef39)) {
        stance = default_to(stance, "stand");
        curstance = level.player getstance();
        var_c9da1b495d3ed8f = 0;
        if (istrue(var_e123fee5ae019570) || istrue(var_ec165a067af34f8f) || istrue(var_8831fc7320076829)) {
            var_c9da1b495d3ed8f = level.blendinfo["weaponDropTime"];
        }
        if (curstance != stance) {
            var_40a0d79a69cf53b0 = 0;
            switch (curstance) {
            case #"hash_d91940431ed7c605":
                switch (stance) {
                case #"hash_3fed0cbd303639eb":
                    var_40a0d79a69cf53b0 = 0.5;
                    break;
                case #"hash_c6775c88e38f7803":
                    var_40a0d79a69cf53b0 = 0.75;
                    break;
                }
                break;
            case #"hash_3fed0cbd303639eb":
                if (stance == "stand") {
                    var_40a0d79a69cf53b0 = 0.2;
                }
                break;
            }
            var_c9da1b495d3ed8f = max(var_c9da1b495d3ed8f, var_40a0d79a69cf53b0);
        }
        rig delaycall(var_c9da1b495d3ed8f, &show);
        return;
    }
    rig show();
}

// Namespace player_rig / scripts\sp\player_rig
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xcee
// Size: 0x75
function function_6feda95d063a745e(anime, var_b85605ef08d6e4c2, rightarc, leftarc, toparc, bottomarc, var_562ff78798cbfcc8, var_984ba707a4ae718e, var_26967d556f885965, linktag) {
    return link_player_to_rig(anime, undefined, 1, 0.5, var_b85605ef08d6e4c2, rightarc, leftarc, toparc, bottomarc, var_562ff78798cbfcc8, var_984ba707a4ae718e, var_26967d556f885965, 1, undefined, undefined, undefined, undefined, linktag);
}

// Namespace player_rig / scripts\sp\player_rig
// Params 19, eflags: 0x0
// Checksum 0x0, Offset: 0xd6c
// Size: 0x795
function link_player_to_rig(anime, stance, var_e773bead7741b3b3, blendtime, var_b85605ef08d6e4c2, rightarc, leftarc, toparc, bottomarc, var_562ff78798cbfcc8, var_984ba707a4ae718e, var_26967d556f885965, smart, var_1c5d1595dab3ef39, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570, linktag, var_765a3c961826133b) {
    linktag = default_to(linktag, "tag_player");
    rig = scripts\sp\player_rig::get_player_rig(1);
    rig endon("unlink_player");
    rig.linktag = linktag;
    playerstartpos = level.player.origin;
    if (isdefined(var_984ba707a4ae718e)) {
        rig [[ var_984ba707a4ae718e ]]();
    }
    if (!isdefined(rig.allows)) {
        if (istrue(var_ec165a067af34f8f)) {
            set_player_rig_allows(["offhand_weapons", "melee", "sprint", "allow_jump", "mantle"]);
        } else {
            set_player_rig_allows();
        }
    }
    var_99d6396b75b98227 = [rig];
    if (isdefined(var_765a3c961826133b)) {
        var_99d6396b75b98227 = array_combine(var_99d6396b75b98227, var_765a3c961826133b);
    }
    foreach (var_6291cdac6d67ebb6 in var_99d6396b75b98227) {
        var_6291cdac6d67ebb6.origin = level.player.origin;
        var_6291cdac6d67ebb6.angles = level.player.angles;
        var_6291cdac6d67ebb6 hide();
    }
    if (!istrue(var_26967d556f885965)) {
        thread delete_live_grenades();
    }
    level.player setcinematicmotionoverride("disabled");
    if (isdefined(anime) && !istrue(var_1c5d1595dab3ef39)) {
        thread scripts\common\anim::anim_first_frame_solo(rig, anime);
    }
    if (isdefined(anime) && (istrue(smart) || istrue(var_1c5d1595dab3ef39))) {
        function_dba8ec1939d3f1a(anime, rig.animname, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570);
        blendtime = level.blendinfo["blendTime"];
        if (istrue(level.blendinfo["weaponDropQuick"])) {
            level.player enablequickweaponswitch(1);
        }
    } else {
        level.player enablequickweaponswitch(1);
    }
    rig.ogstance = level.player getstance();
    if (!isdefined(stance)) {
        stance = "stand";
    }
    if (isdefined(level.blendinfo) && isdefined(level.blendinfo["stances"])) {
        if (level.blendinfo["stances"][0] != "none") {
            stance = level.blendinfo["stances"][0];
        }
        if (level.blendinfo["stances"][1] != "none") {
            rig.var_5296297044db37d9 = level.blendinfo["stances"][1];
        }
    }
    rig.stance = stance;
    switch (stance) {
    case #"hash_c6775c88e38f7803":
        rig.allows = array_combine_unique(rig.allows, ["crouch", "prone"]);
        break;
    case #"hash_3fed0cbd303639eb":
        rig.allows = array_combine_unique(rig.allows, ["stand", "prone"]);
        break;
    case #"hash_d91940431ed7c605":
        rig.allows = array_combine_unique(rig.allows, ["crouch", "stand"]);
        break;
    }
    level.player setstance(stance, 1);
    level.player function_73341653f76b4e43();
    if (istrue(var_ec165a067af34f8f)) {
        level.player thread player_gesture_force("proto_vm_gesture_gun_drop");
        var_19f3850fcede775c = level.player getgestureanimlength("proto_vm_gesture_gun_drop");
        level.player delaythread(var_19f3850fcede775c - 0.05, &player_gesture_force, "proto_vm_gesture_gun_loop");
    }
    if (!isdefined(var_e773bead7741b3b3)) {
        var_e773bead7741b3b3 = 1;
    }
    if (!isdefined(blendtime)) {
        blendtime = 0.2;
    }
    if (!isdefined(rightarc)) {
        rightarc = 45;
    }
    if (!isdefined(leftarc)) {
        leftarc = 45;
    }
    if (!isdefined(toparc)) {
        toparc = 15;
    }
    if (!isdefined(bottomarc)) {
        bottomarc = 15;
    }
    if (var_e773bead7741b3b3) {
        if (rightarc == 0 && leftarc == 0 && toparc == 0 && bottomarc == 0) {
            level.player val::set("link_player_to_rig_blend", "freezecontrols_allowlook", 1);
        }
        level.player playerlinktoblend(rig, linktag, blendtime);
        wait blendtime;
        waitframe();
    }
    if (istrue(var_b85605ef08d6e4c2)) {
        level.player playerlinktoabsolute(rig, linktag);
    } else {
        if (!isdefined(var_562ff78798cbfcc8)) {
            var_562ff78798cbfcc8 = 0;
        }
        if (blendtime > 0 || istrue(var_1c5d1595dab3ef39)) {
            level.player playerlinktodelta(rig, linktag, 1, 170, 170, 170, 170, var_562ff78798cbfcc8);
            level.player lerpviewangleclamp(blendtime, blendtime * 0.5, blendtime * 0.25, 0, 0, 0, 0, 1);
            if (rightarc || leftarc || toparc || bottomarc) {
                level.player delaycall(blendtime, &lerpviewangleclamp, 1, 0.5, 0.25, rightarc, leftarc, toparc, bottomarc, 1);
            }
        } else {
            level.player playerlinktoabsolute(rig, linktag);
            level.player delaycall(0.05, &playerlinktodelta, rig, linktag, 1, rightarc, leftarc, toparc, bottomarc, var_562ff78798cbfcc8);
        }
    }
    foreach (var_6291cdac6d67ebb6 in var_99d6396b75b98227) {
        var_6291cdac6d67ebb6 thread function_3a20b806b3b70617(stance, var_1c5d1595dab3ef39, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570);
    }
    level.player delaythread(blendtime, &val::reset_all, "link_player_to_rig_blend");
    nvidiaansel_scriptdisable(1);
    /#
        if (getdvarint(@"hash_398da46238160a6", 0)) {
            if (playerstartpos != level.player.origin) {
                draw_arrow_time(playerstartpos, level.player.origin, (1, 1, 1), 20);
                print3d(playerstartpos + (0, 0, -2), "<dev string:x3f>" + distance2d(playerstartpos, level.player.origin), (1, 1, 1), 1, 0.1, 400, 1);
            }
            print3d(playerstartpos, "<dev string:x46>" + blendtime, (1, 1, 1), 1, 0.1, 400, 1);
        }
    #/
    level.player notify("linked_to_rig");
    return rig;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x150a
// Size: 0x246
function unlink_player_from_rig(var_1b2bf4bf5e71b6a4, var_5296297044db37d9, var_cc25a02716e677a4, var_dfb81d6b53106f39, var_4309472ee3acca19, cinematicmotionoverride) {
    rig = level.player_rig;
    rig notify("unlink_player");
    if (!is_equal(level.player getlinkedparent(), rig)) {
        assert(!isdefined(rig), "Player unlinked from rig, but rig still exists!");
        return;
    }
    level.player val::reset_all("player_rig");
    if (istrue(var_1b2bf4bf5e71b6a4)) {
        var_5296297044db37d9 = rig.ogstance;
    }
    if (isdefined(rig.var_5296297044db37d9)) {
        var_5296297044db37d9 = rig.var_5296297044db37d9;
    }
    if (isdefined(var_5296297044db37d9)) {
        if (istrue(var_cc25a02716e677a4)) {
            level.player setstance(var_5296297044db37d9, 1, 1, 1);
            up = anglestoup(level.player.angles);
            viewheight = level.player getplayerviewheight(rig.ogstance);
            if (default_to(rig.linktag, "tag_player") == "tag_camera") {
                new_origin = drop_to_ground(level.player.origin, 0, (viewheight + 5) * -1, up);
            } else {
                new_origin = drop_to_ground(level.player.origin + up * viewheight, 0, viewheight * -1, up);
            }
            level.player setorigin(new_origin, 1);
        } else if (var_5296297044db37d9 != rig.stance) {
            level.player setstance(var_5296297044db37d9);
        }
    }
    if (istrue(var_4309472ee3acca19)) {
        level.player unlink();
    } else {
        level.player function_af4b9b0f0e7c6c42(0.2);
    }
    level.player enablequickweaponswitch(0);
    cinematicmotionoverride = default_to(cinematicmotionoverride, "iw9_playermotion");
    level.player setcinematicmotionoverride(cinematicmotionoverride);
    if (!istrue(var_dfb81d6b53106f39)) {
        rig delete();
    }
    nvidiaansel_scriptdisable(0);
}

// Namespace player_rig / scripts\sp\player_rig
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1758
// Size: 0x100
function anim_lerp_from_player_pos(anime, move_time, rotate_time, var_d286adff9af13a98, var_2bbc0f0a7e8daaac) {
    assert(isdefined(level.player_rig), "level.player_rig must be defined for anim_lerp_from_player_pos() to work. Try calling link_player_to_rig() before using this function.");
    rig = level.player_rig;
    if (function_f1e7ee8ddeece062(anime)) {
        animation = function_c099f6fd9c19f5a6(anime, self.origin, self.angles, rig.animname);
    } else {
        animation = level.scr_anim[rig.animname][anime];
    }
    function_de21a1093ee0487f(animation, move_time, rotate_time, var_d286adff9af13a98, var_2bbc0f0a7e8daaac);
    level.var_46355d1369785029 thread scripts\common\anim::anim_single_solo(rig, anime);
    rig thread waittillmatch_notify("single anim", "end", "anim_end");
    rig waittill_any("anim_end", "unlink_player");
    animation_lerp_from_player_pos_end();
}

// Namespace player_rig / scripts\sp\player_rig
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1860
// Size: 0x256
function function_de21a1093ee0487f(animation, move_time, rotate_time, var_d286adff9af13a98, var_2bbc0f0a7e8daaac) {
    assert(isdefined(level.player_rig), "level.player_rig must be defined for anim_lerp_from_player_pos() to work. Try calling link_player_to_rig() before using this function.");
    animation_lerp_from_player_pos_end();
    rig = level.player_rig;
    anim_origin = getstartorigin(self.origin, self.angles, animation);
    var_4f78ec6eaad4e275 = getstartangles(self.origin, self.angles, animation);
    rotation = level.player.angles - var_4f78ec6eaad4e275;
    node_origin = level.player.origin + rotatevector(self.origin - anim_origin, rotation);
    var_9cfe111ea9df5b56 = level.player.angles + self.angles - var_4f78ec6eaad4e275;
    level.var_46355d1369785029 = spawn_script_origin(node_origin, var_9cfe111ea9df5b56);
    level.var_46355d1369785029 endon("animation_lerp_from_player_pos_end");
    /#
        level.var_46355d1369785029.playerstartpos = level.player.origin;
    #/
    anim_length = getanimlength(animation);
    if (!isdefined(var_d286adff9af13a98)) {
        var_d286adff9af13a98 = 0.5;
    }
    if (!isdefined(var_2bbc0f0a7e8daaac)) {
        var_2bbc0f0a7e8daaac = 0;
    }
    if (!isdefined(move_time)) {
        move_time = anim_length;
    }
    assert(move_time <= anim_length + var_2bbc0f0a7e8daaac, "Parameter move_time must be less than or equal to total anim length");
    level.var_46355d1369785029 moveto(self.origin, move_time, move_time * var_d286adff9af13a98, move_time * (1 - var_d286adff9af13a98));
    if (!isdefined(rotate_time)) {
        rotate_time = anim_length;
    }
    assert(rotate_time <= anim_length + var_2bbc0f0a7e8daaac, "Parameter rotate_time must be less than or equal to total anim length");
    level.var_46355d1369785029 rotateto(self.angles, rotate_time, rotate_time * var_d286adff9af13a98, rotate_time * (1 - var_d286adff9af13a98));
    if (var_2bbc0f0a7e8daaac > 0) {
        rig.origin = level.player.origin;
    }
    rig linkto(level.var_46355d1369785029);
    wait var_2bbc0f0a7e8daaac;
}

// Namespace player_rig / scripts\sp\player_rig
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1abe
// Size: 0x125
function animation_lerp_from_player_pos_end() {
    if (isdefined(level.var_46355d1369785029)) {
        level.var_46355d1369785029 notify("animation_lerp_from_player_pos_end");
        /#
            if (getdvarint(@"hash_398da46238160a6", 0) && level.var_46355d1369785029.playerstartpos != level.player.origin) {
                draw_arrow_time(level.var_46355d1369785029.playerstartpos, level.player.origin, (1, 1, 1), 20);
                print3d(level.var_46355d1369785029.playerstartpos + (0, 0, -2), "<dev string:x3f>" + distance2d(level.var_46355d1369785029.playerstartpos, level.player.origin), (1, 1, 1), 1, 0.1, 400, 1);
            }
        #/
        level.var_46355d1369785029 delete();
        level.var_46355d1369785029 = undefined;
    }
}

// Namespace player_rig / scripts\sp\player_rig
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1beb
// Size: 0x18
function player_rig_allow_weapon(rig) {
    player_rig_allow_internal(rig, "weapon");
}

// Namespace player_rig / scripts\sp\player_rig
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0b
// Size: 0x8c
function player_rig_allow_internal(rig, allow_name) {
    assert(isdefined(level.player_rig));
    assert(rig == level.player_rig);
    assert(array_contains(rig.allows, allow_name));
    rig.allows = array_remove(rig.allows, allow_name);
    level.player thread val::set("player_rig", allow_name, 1);
}

// Namespace player_rig / scripts\sp\player_rig
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9f
// Size: 0x3aa
function function_98fabc06359d4d0c(anime, stance, var_435a21fd34cf3104, var_e2140d070bb088bd, linkedents, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570, var_26967d556f885965) {
    if (!isdefined(level.player_rig)) {
        get_player_rig();
    }
    if (!isdefined(stance)) {
        stance = "stand";
    }
    var_b85605ef08d6e4c2 = 1;
    if (!isdefined(var_435a21fd34cf3104)) {
        var_435a21fd34cf3104 = [undefined, undefined, undefined, undefined];
    } else {
        var_b85605ef08d6e4c2 = 0;
    }
    if (!isdefined(var_e2140d070bb088bd)) {
        var_e2140d070bb088bd = [];
    }
    if (!isarray(var_e2140d070bb088bd)) {
        var_e2140d070bb088bd = [var_e2140d070bb088bd];
    }
    if (!isdefined(linkedents)) {
        linkedents = [];
    }
    if (!isarray(linkedents)) {
        linkedents = [linkedents];
    }
    var_ec165a067af34f8f = ter_op(isdefined(var_ec165a067af34f8f), var_ec165a067af34f8f, 1);
    var_8831fc7320076829 = ter_op(isdefined(var_8831fc7320076829), var_8831fc7320076829, 0);
    var_e123fee5ae019570 = ter_op(isdefined(var_e123fee5ae019570), var_e123fee5ae019570, 0);
    var_4f51ef0bd97a4707 = anime;
    if (function_f1e7ee8ddeece062(anime)) {
        animation = function_c099f6fd9c19f5a6(anime, self.origin, self.angles, "player_rig");
        var_4f51ef0bd97a4707 = function_56bd620e57a834af(anime, "player_rig", animation);
    }
    anim_first_frame_solo(level.player_rig, var_4f51ef0bd97a4707);
    link_player_to_rig(var_4f51ef0bd97a4707, stance, 0, 0, var_b85605ef08d6e4c2, var_435a21fd34cf3104[0], var_435a21fd34cf3104[1], var_435a21fd34cf3104[2], var_435a21fd34cf3104[3], 1, undefined, var_26967d556f885965, undefined, 1, var_ec165a067af34f8f, var_8831fc7320076829, var_e123fee5ae019570);
    thread anim_lerp_from_player_pos(var_4f51ef0bd97a4707, level.blendinfo["blendTime"], level.blendinfo["blendTime"], 0.8, level.blendinfo["weaponDropTime"]);
    if (isdefined(var_e2140d070bb088bd)) {
        foreach (model in var_e2140d070bb088bd) {
            if (level.player_rig == model) {
                var_e2140d070bb088bd = array_remove(var_e2140d070bb088bd, model);
            }
        }
    }
    if (isdefined(linkedents)) {
        foreach (model in linkedents) {
            if (level.player_rig == model) {
                linkedents = array_remove(linkedents, model);
                continue;
            }
            model linkto(level.var_46355d1369785029);
        }
    }
    anim_first_frame(var_e2140d070bb088bd, anime);
    delaythread(level.blendinfo["weaponDropTime"], &anim_single, var_e2140d070bb088bd, anime);
    level.var_46355d1369785029 anim_first_frame(linkedents, anime);
    level.var_46355d1369785029 delaythread(level.blendinfo["weaponDropTime"], &anim_single, linkedents, anime);
    wait level.blendinfo["weaponDropTime"];
    level.player_rig notify("link_blend_weapon_dropped");
    if (istrue(var_ec165a067af34f8f) && isdefined(level.blendinfo["blendOutTime"])) {
        level.player delaythread(level.blendinfo["blendOutTime"], &player_gesture_force, "proto_vm_gesture_gun_raise");
    }
    level.player_rig waittill_any("anim_end", "unlink_player");
    if (istrue(var_ec165a067af34f8f) && !isdefined(level.blendinfo["blendOutTime"])) {
        level.player thread player_gesture_force("proto_vm_gesture_gun_raise");
    }
}

/#

    // Namespace player_rig / scripts\sp\player_rig
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x2051
    // Size: 0xc0
    function private function_8bb6a2e80cd8890d(display) {
        self notify("<dev string:x52>");
        self endon("<dev string:x52>");
        self endon("<dev string:x60>");
        if (!getdvarint(@"hash_36a6e170933fe94b", 0)) {
            return;
        }
        while (true) {
            waitframe();
            print3d(self.origin, display + "<dev string:x66>" + self getentitynumber() + "<dev string:x69>" + int(self.origin[0]) + "<dev string:x6c>" + int(self.origin[1]) + "<dev string:x6c>" + int(self.origin[2]) + "<dev string:x6f>", (1, 1, 1), 1, 0.5, 1);
        }
    }

#/
