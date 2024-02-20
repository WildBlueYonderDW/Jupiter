// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_48814951e916af89;
#using script_3314add7998ab13;
#using scripts\mp\objidpoolmanager.gsc;
#using script_2c17aa19d1e937b2;
#using script_7b8639f512d4cfe4;

#namespace namespace_ae057c3bf5e89076;

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x366
// Size: 0x31
function function_b0154b5bd3ac71d5() {
    level.var_5c9a3961728ac52f = 1;
    level.var_2179c46fc54fd9ce = "offhand_2h_c4_prop_mp";
    namespace_82f05772526a4798::main();
    level.var_3f4534fb14cca909 = &function_151037a96443f076;
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e
// Size: 0xba
function function_94a776d7d4f1eb0b(var_f3a69ef1f5cbb40d) {
    turret = namespace_f70554b797fd58c2::function_fefa23bed4e70fb2(var_f3a69ef1f5cbb40d, "military_samsite_01_rig_skeleton_ob", "iw9_tur_samsite_ob");
    function_f7c5fc38fdc4df8c(turret);
    turret.target_entity = spawn("script_model", turret.origin + (0, 0, 900) + anglestoforward(turret.angles) * 1000);
    turret settargetentity(turret.target_entity);
    turret setscriptablepartstate("usable_left", "usable");
    turret setscriptablepartstate("usable_front", "usable");
    turret setscriptablepartstate("usable_right", "usable");
    return turret;
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460
// Size: 0x269
function function_151037a96443f076(c4, samsite, player) {
    if (!istrue(c4.var_7b0e1793e94cafb4)) {
        samsite function_e70d07a164d078c2("plant");
        return 0;
    }
    level notify("planted_bomb_on_sam_site");
    samsite.entity notify("samsite_bomb_planted");
    samsite.entity function_af9898234bbdbb22();
    samsite endon("samsite_cancel_bomb_countdown");
    samsite setscriptablepartstate("danger_indicator", "danger");
    currenttime = gettime();
    totaltime = 15000;
    var_f28399727742eb23 = int(currenttime + totaltime);
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    samsite function_e70d07a164d078c2("defuse");
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
    samsite notify("samsite_bomb_detonated");
    samsite.entity notify("samsite_bomb_detonated");
    samsite.entity thread namespace_f70554b797fd58c2::function_6c86d07047fae506(player, "samsite_base_ob", "military_samsite_01_damaged_rig_skeleton_ob");
    earthquake(0.6, 0.7, samsite.origin, 1000);
    playrumbleonposition("grenade_rumble", samsite.origin);
    radiusdamage(samsite.origin, 256, 100, 50, undefined, "MOD_EXPLOSIVE");
    samsite setscriptablepartstate("danger_indicator", "safe");
    return 1;
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d1
// Size: 0xbb
function function_e70d07a164d078c2(state) {
    turret = self;
    ent = function_fb532e39e9edebf5(turret);
    ent.var_f236a45969f96bb4 = state;
    if (state == "plant") {
        turret setscriptablepartstate("usable_left", "usable");
        turret setscriptablepartstate("usable_front", "usable");
        turret setscriptablepartstate("usable_right", "usable");
    } else {
        turret setscriptablepartstate("usable_left", "unusable");
        turret setscriptablepartstate("usable_front", "unusable");
        turret setscriptablepartstate("usable_right", "unusable");
    }
    turret setscriptablepartstate("usable_front", "unusable");
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x793
// Size: 0x36
function function_fb532e39e9edebf5(turret) {
    if (is_equal(turret.classname, "misc_turret")) {
        return turret;
    } else {
        return turret.entity;
    }
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d0
// Size: 0x51
function function_f7c5fc38fdc4df8c(turret) {
    if (!isdefined(turret)) {
        return;
    }
    turret.var_692fc766d262881a = turret function_5970ddc4fd448e37(1);
    turret.var_692fc666d26285e7 = turret function_5970ddc4fd448e37(2);
    turret.var_692fc566d26283b4 = turret function_5970ddc4fd448e37(3);
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828
// Size: 0x63
function function_5970ddc4fd448e37(num) {
    missile = spawn("script_model", self gettagorigin("mg0" + num));
    missile setmodel("military_missile_rig_skeleton");
    missile.angles = self gettagangles("mg0" + num);
    missile linkto(self, "mg0" + num);
    return missile;
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x893
// Size: 0x1a0
function function_44e4433ebac52609(target_location, target_ent) {
    self endon("death");
    self.target_entity.origin = target_location;
    missile = undefined;
    if (isdefined(self.var_692fc766d262881a)) {
        missile = self.var_692fc766d262881a;
        self.var_692fc766d262881a notify("launched");
        self.var_692fc766d262881a = undefined;
    } else if (isdefined(self.var_692fc666d26285e7)) {
        missile = self.var_692fc666d26285e7;
        self.var_692fc666d26285e7 notify("launched");
        self.var_692fc666d26285e7 = undefined;
    } else if (isdefined(self.var_692fc566d26283b4)) {
        missile = self.var_692fc566d26283b4;
        self.var_692fc566d26283b4 notify("launched");
        self.var_692fc566d26283b4 = undefined;
    }
    self setscriptablepartstate("launch", "on");
    if (!isdefined(missile)) {
        return;
    }
    missile unlink();
    missile.launched = 1;
    var_3865e73449a5a438 = makeweapon("iw9_la_samsite_ob");
    magicbullet(var_3865e73449a5a438, missile.origin, missile.origin);
    playsoundatpos(missile.origin + (0, 30, 0), "weap_samsite_fire_npc");
    missile setscriptablepartstate("military_samsite_missile", "on");
    wait(0.5);
    earthquake(0.4, 1, missile.origin, 1200);
    thread function_553d6a4e19405e47(missile, target_ent);
    thread function_73a478934698f758(missile, target_ent);
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3a
// Size: 0x284
function function_553d6a4e19405e47(missile, target_ent) {
    self endon("death");
    missile endon("death");
    if (!isdefined(target_ent)) {
        return;
    }
    var_2a21fcae30f2c84e = gettime();
    var_fb8c2b90b2beb9c4 = vectornormalize(missile.angles) * (0, 0, 600);
    rotating = 0;
    var_ced3edd86756c529 = 0;
    var_2a449b1405c42b63 = 0;
    var_3a0916f1986edcdc = 0;
    var_c4f320df999cb4f5 = 0;
    while (1) {
        if (!isdefined(target_ent)) {
            return;
        }
        current_time = gettime();
        if (current_time - var_2a21fcae30f2c84e < 20) {
            dir = vectornormalize(anglestoforward(missile.angles));
            missile.origin = missile.origin + dir * 175;
        } else {
            if (!is_equal(var_ced3edd86756c529, 3)) {
                if (is_equal(var_ced3edd86756c529, 0)) {
                    rotating = 1;
                    var_e8a5fecb73de77d4 = gettime();
                    var_ced3edd86756c529 = 1;
                    var_2a449b1405c42b63 = gettime();
                    missile rotateto(vectortoangles(target_ent.origin - missile.origin), 0.25, 0, 0);
                } else if (is_equal(var_ced3edd86756c529, 1) && gettime() - var_2a449b1405c42b63 > 250) {
                    var_ced3edd86756c529 = 2;
                    var_3a0916f1986edcdc = gettime();
                    missile rotateto(vectortoangles(target_ent.origin - missile.origin), 0.25, 0, 0);
                } else if (is_equal(var_ced3edd86756c529, 2) && gettime() - var_c4f320df999cb4f5 > 250) {
                    var_ced3edd86756c529 = 3;
                    var_c4f320df999cb4f5 = gettime();
                    missile rotateto(vectortoangles(target_ent.origin - missile.origin), 0.25, 0, 0);
                }
            } else if (gettime() - var_e8a5fecb73de77d4 > 750) {
                missile.angles = vectortoangles(target_ent.origin - missile.origin);
            }
            dir = vectornormalize(anglestoforward(missile.angles));
            missile.origin = missile.origin + dir * 175;
        }
        wait(0.05);
    }
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc5
// Size: 0xa4
function function_73a478934698f758(missile, target_ent) {
    self endon("death");
    start_time = gettime();
    while (1) {
        if (!isdefined(target_ent)) {
            break;
        }
        dist = distancesquared(missile.origin, target_ent.origin);
        if (dist < 90000) {
            target_ent notify("sam_missile_explode");
            break;
        }
        if ((gettime() - start_time) / 1000 > 15) {
            target_ent notify("sam_missile_explode");
            break;
        }
        wait(0.1);
    }
    if (isdefined(missile)) {
        missile delete();
    }
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd70
// Size: 0x120
function function_f72a6146b33f7d1(var_a465314411ea4812, var_cc2e8c4fd6d487bc) {
    self.var_6434265aea7ab063 = namespace_6c8a837ec98fe0b8::requestobjectiveid(0);
    waitframe();
    icon = function_53c4c53197386572(var_a465314411ea4812, "ui_map_icon_obj_sam_site");
    namespace_6c8a837ec98fe0b8::objective_set_play_intro(self.var_6434265aea7ab063, 1);
    namespace_6c8a837ec98fe0b8::objective_set_play_outro(self.var_6434265aea7ab063, 0);
    namespace_6c8a837ec98fe0b8::objective_add_objective(self.var_6434265aea7ab063, "current");
    namespace_6c8a837ec98fe0b8::update_objective_position(self.var_6434265aea7ab063, self.origin + (0, 0, 64));
    namespace_6c8a837ec98fe0b8::update_objective_icon(self.var_6434265aea7ab063, icon);
    namespace_6c8a837ec98fe0b8::objective_playermask_showtoall(self.var_6434265aea7ab063);
    namespace_6c8a837ec98fe0b8::update_objective_setbackground(self.var_6434265aea7ab063, 1);
    if (isdefined(var_cc2e8c4fd6d487bc)) {
        var_cc2e8c4fd6d487bc.var_79c8996a40bba4ae = function_53c4c53197386572(var_cc2e8c4fd6d487bc.var_79c8996a40bba4ae, []);
        var_cc2e8c4fd6d487bc.var_79c8996a40bba4ae = array_add(var_cc2e8c4fd6d487bc.var_79c8996a40bba4ae, self.var_6434265aea7ab063);
    }
    return self.var_6434265aea7ab063;
}

// Namespace namespace_ae057c3bf5e89076/namespace_c5d39841678f2fb1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe98
// Size: 0x13
function function_af9898234bbdbb22() {
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_6434265aea7ab063);
}

