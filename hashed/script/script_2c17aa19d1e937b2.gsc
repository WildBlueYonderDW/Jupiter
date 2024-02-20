// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\common\anim.gsc;

#namespace samsite;

// Namespace samsite/namespace_f70554b797fd58c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x45b
// Size: 0x229
function function_4390cfb8004a4e9c(turret) {
    turret endon("death");
    turret.target_entity = spawn("script_model", turret.origin + (0, 0, 900) + anglestoforward(turret.angles) * 750);
    var_1a8097f1a065c786 = anglestoleft(turret.angles) * 500;
    var_1a2a7c570678a79d = anglestoright(turret.angles) * 500;
    turret settargetentity(turret.target_entity);
    turret.target_entity moveto(turret.origin + (0, 0, 900) + anglestoforward(turret.angles) * 750 + var_1a2a7c570678a79d, 5);
    turret setscriptablepartstate("audio", "rotate_start");
    wait(5);
    turret setscriptablepartstate("audio", "rotate_stop");
    pos = "right";
    while (1) {
        wait(1);
        turret thread function_44e4433ebac52609();
        wait(10);
        turret thread function_44e4433ebac52609();
        wait(10);
        turret thread function_44e4433ebac52609();
        wait(5);
        function_f7c5fc38fdc4df8c(turret);
        wait(1);
        if (pos == "right") {
            turret.target_entity moveto(turret.origin + (0, 0, 900) + anglestoforward(turret.angles) * 1000 + var_1a8097f1a065c786, 5);
            pos = "left";
        } else if (pos == "left") {
            turret.target_entity moveto(turret.origin + (0, 0, 750) + anglestoforward(turret.angles) * 1000 + var_1a2a7c570678a79d, 5);
            pos = "right";
        }
        turret setscriptablepartstate("audio", "rotate_start");
        wait(5);
        turret setscriptablepartstate("audio", "rotate_stop");
    }
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b
// Size: 0x1d6
function function_fefa23bed4e70fb2(struct, model, turretweapon) {
    if (!isdefined(turretweapon)) {
        turretweapon = "iw9_tur_samsite_cp";
    }
    turret = spawnturret("misc_turret", struct.origin, turretweapon);
    if (!isdefined(struct.angles)) {
        struct.angles = (0, 0, 0);
    }
    turret.angles = struct.angles;
    if (!isdefined(model)) {
        model = "military_samsite_01_rig_skeleton";
    }
    turret.team = "axis";
    turret setmodel(model);
    turret settoparc(75);
    turret setbottomarc(0);
    turret setleftarc(360);
    turret setrightarc(360);
    turret makeunusable();
    turret setscriptablepartstate("rocket1", "hidden");
    turret setscriptablepartstate("rocket2", "hidden");
    turret setscriptablepartstate("rocket3", "hidden");
    if (utility::iscp() || getdvar(@"hash_e65e9a96eb2ff62b", "") == "wm" || getdvar(@"hash_e65e9a96eb2ff62b", "") == "ob") {
        turret setscriptablepartstate("usable_left", "usable");
        turret setscriptablepartstate("usable_right", "usable");
        turret setscriptablepartstate("usable_front", "usable");
    } else {
        useent = spawn("script_model", turret.origin + (0, 0, 40));
        useent setmodel("tag_origin");
        useent thread function_d8ca43a821bdfe1a();
        turret.useent = useent;
    }
    return turret;
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x869
// Size: 0x5c
function function_f7c5fc38fdc4df8c(turret, var_b400868723df76a1) {
    if (!isdefined(turret)) {
        return;
    }
    turret.var_692fc766d262881a = turret function_5970ddc4fd448e37(1, var_b400868723df76a1);
    turret.var_692fc666d26285e7 = turret function_5970ddc4fd448e37(2, var_b400868723df76a1);
    turret.var_692fc566d26283b4 = turret function_5970ddc4fd448e37(3, var_b400868723df76a1);
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cc
// Size: 0x85
function function_5970ddc4fd448e37(num, var_b400868723df76a1) {
    missile = spawn("script_model", self gettagorigin("mg0" + num));
    if (isdefined(var_b400868723df76a1)) {
        missile setmodel(var_b400868723df76a1);
    } else {
        missile setmodel("military_missile_rig_skeleton");
    }
    missile.angles = self gettagangles("mg0" + num);
    missile linkto(self, "mg0" + num);
    missile thread function_e6142ecc1a9ce89(self);
    return missile;
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x959
// Size: 0x264
function function_44e4433ebac52609(var_abfe04eb6da78eb9) {
    self endon("death");
    missile = undefined;
    if (isdefined(self.var_692fc766d262881a)) {
        missile = self.var_692fc766d262881a;
        self.var_692fc766d262881a notify("launched");
        self.var_692fc766d262881a = undefined;
        if (!self isnearanyplayer(5000) || istrue(var_abfe04eb6da78eb9)) {
            self.var_692fc766d262881a = function_5970ddc4fd448e37(1);
        }
    } else if (isdefined(self.var_692fc666d26285e7)) {
        missile = self.var_692fc666d26285e7;
        self.var_692fc666d26285e7 notify("launched");
        self.var_692fc666d26285e7 = undefined;
        if (!self isnearanyplayer(5000) || istrue(var_abfe04eb6da78eb9)) {
            self.var_692fc666d26285e7 = function_5970ddc4fd448e37(2);
        }
    } else if (isdefined(self.var_692fc566d26283b4)) {
        missile = self.var_692fc566d26283b4;
        self.var_692fc566d26283b4 notify("launched");
        self.var_692fc566d26283b4 = undefined;
        if (!self isnearanyplayer(5000) || istrue(var_abfe04eb6da78eb9)) {
            self.var_692fc566d26283b4 = function_5970ddc4fd448e37(3);
        } else {
            delaythread(5, &function_ad922931d55b782b);
        }
    }
    self setscriptablepartstate("launch", "on");
    if (!isdefined(missile)) {
        return;
    }
    self.var_da525e753988f579 = missile;
    missile.launched = 1;
    var_3865e73449a5a438 = makeweapon("iw9_la_samsite_cp");
    magicbullet(var_3865e73449a5a438, missile.origin, missile.origin);
    if (namespace_36f464722d326bbe::getgametype() == "wm") {
        playsoundatpos(missile.origin + (0, 30, 0), "jup_samsite_fire_npc");
    } else {
        playsoundatpos(missile.origin + (0, 30, 0), "weap_samsite_fire_npc");
    }
    missile setscriptablepartstate("military_samsite_missile", "on");
    missile unlink();
    wait(0.5);
    earthquake(0.4, 1, missile.origin, 1200);
    missile moveto(missile.origin + anglestoforward(missile.angles) * 40000, 15);
    wait(15);
    if (isdefined(missile)) {
        missile delete();
    }
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc4
// Size: 0xc4
function function_9933b3b407347038(struct) {
    turret = function_fefa23bed4e70fb2(struct);
    function_f7c5fc38fdc4df8c(turret);
    turret.target_entity = spawn("script_model", turret.origin + (0, 0, 900) + anglestoforward(turret.angles) * 1000);
    var_1a8097f1a065c786 = anglestoleft(turret.angles) * 1000;
    var_1a2a7c570678a79d = anglestoright(turret.angles) * 1000;
    turret settargetentity(turret.target_entity);
    turret thread function_fc364b4fcc0d2051();
    return turret;
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc90
// Size: 0x100
function function_c3d7373fda980a33() {
    self endon("launching");
    self endon("death");
    var_9273788590ccd377 = function_37cc51487b6e95dc(self.origin + (0, 0, 800), 12, 512);
    var_2c1824e345806e61 = getclosest(self.target_entity.origin, var_9273788590ccd377);
    var_741f5a182dd662c0 = 0;
    thread function_2add68d4c86e555b();
    while (1) {
        foreach (point in var_9273788590ccd377) {
            if (var_2c1824e345806e61 != point && !var_741f5a182dd662c0) {
                continue;
            } else if (!var_741f5a182dd662c0) {
                var_741f5a182dd662c0 = 1;
                continue;
            }
            self.target_entity moveto(point.origin, 5);
            wait(5);
        }
        waitframe();
    }
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd97
// Size: 0x10a
function function_71cf043af949590c() {
    var_9273788590ccd377 = function_37cc51487b6e95dc(self.origin + (0, 0, 800), 12, 512);
    var_2c1824e345806e61 = getclosest(self.target_entity.origin, var_9273788590ccd377);
    var_741f5a182dd662c0 = 0;
    thread function_2add68d4c86e555b();
    count = 0;
    foreach (point in var_9273788590ccd377) {
        if (var_2c1824e345806e61 != point && !var_741f5a182dd662c0) {
            continue;
        }
        self.target_entity moveto(point.origin, 1.5);
        wait(1.5);
        count++;
        if (count > 2) {
            break;
        }
    }
    self notify("launching");
    wait(1.5);
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea8
// Size: 0x34
function function_2add68d4c86e555b() {
    self endon("death");
    self setscriptablepartstate("audio", "rotate_start");
    self waittill("launching");
    self setscriptablepartstate("audio", "rotate_stop");
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee3
// Size: 0xee
function function_37cc51487b6e95dc(point, num_positions, var_9973f603063c1fed) {
    degs_per_pos = 360 / num_positions;
    positions = [];
    fwd = (1, 0, 0);
    i = 0;
    while (i < 360) {
        altforward = fwd * var_9973f603063c1fed;
        rotated_forward = (cos(i) * altforward[0] - sin(i) * altforward[1], sin(i) * altforward[0] + cos(i) * altforward[1], altforward[2]);
        pos = point + rotated_forward;
        position = spawnstruct();
        position.origin = pos;
        positions[positions.size] = position;
        i = i + degs_per_pos;
    }
    return positions;
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd9
// Size: 0x24a
function function_e6142ecc1a9ce89(var_fac1dd2a5472bece) {
    self endon("death");
    self.health = 999999;
    self setcandamage(1);
    self setcanradiusdamage(1);
    self.var_880a990d25b43aaa = 0;
    self.var_59a09303493e759d = 750;
    self.var_689d46e1e37cc5ad = &function_a00baa7c74f5f04d;
    attacker = undefined;
    while (1) {
        objweapon = dflags = partname = tagname = modelname = meansofdeath = damagelocation = direction_vec = attacker = amount = self waittill("damage");
        if (!isplayer(attacker) || !isexplosivedamagemod(meansofdeath) && meansofdeath != "MOD_IMPACT") {
            if (isplayer(attacker) && isbulletdamage(meansofdeath)) {
                if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                    var_f56fb412974c87c8 = getsharedfunc("damage", "updateDamageFeedback");
                    attacker thread [[ var_f56fb412974c87c8 ]]("hitnobulletdamage");
                }
            }
            self.health = self.health + amount;
            continue;
        }
        if (!isexplosivedamagemod(meansofdeath)) {
            self.health = self.health + amount;
            continue;
        }
        if (isdefined(objweapon) && objweapon.basename == "c4_mp") {
            amount = 350;
        }
        self.var_880a990d25b43aaa = self.var_880a990d25b43aaa + amount;
        if (self.var_880a990d25b43aaa > self.var_59a09303493e759d) {
            break;
        }
    }
    self.health = 0;
    playfx(level._effect["c4_explosion_convoy"], self.origin);
    earthquake(0.35, 1, self.origin, 1024);
    org = self.origin;
    if (isdefined(self)) {
        self delete();
    }
    radiusdamage(org, 350, 300, 300, attacker, "MOD_EXPLOSIVE");
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122a
// Size: 0x2fa
function function_fc364b4fcc0d2051(var_fac1dd2a5472bece) {
    self endon("stop_dmgmonitor");
    self setcandamage(1);
    self setcanradiusdamage(1);
    self.var_880a990d25b43aaa = 0;
    self.var_59a09303493e759d = 750;
    self.var_689d46e1e37cc5ad = &function_a00baa7c74f5f04d;
    attacker = undefined;
    self.health = 9999999;
    while (1) {
        objweapon = dflags = partname = tagname = modelname = meansofdeath = damagelocation = direction_vec = attacker = amount = self waittill("damage");
        if (isdefined(objweapon) && (objweapon.basename == "c4_mp" || objweapon.basename == "c4_cp_noproj")) {
            amount = 1000;
        } else if (!isplayer(attacker) || !isexplosivedamagemod(meansofdeath) && meansofdeath != "MOD_IMPACT") {
            if (isplayer(attacker) && isbulletdamage(meansofdeath)) {
                if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                    var_f56fb412974c87c8 = getsharedfunc("damage", "updateDamageFeedback");
                    attacker thread [[ var_f56fb412974c87c8 ]]("hitnobulletdamage");
                }
            }
            self.health = self.health + amount;
            continue;
        }
        if (!isexplosivedamagemod(meansofdeath)) {
            self.health = self.health + amount;
            continue;
        }
        if (isdefined(objweapon)) {
            var_49e6ef3edadd524e = function_f581838ce4328f7a(objweapon);
            switch (var_49e6ef3edadd524e) {
            case #"hash_fa1e80f6bd5b8e72":
                amount = 755;
                break;
            case #"hash_5d11ac1131cddab1":
            case #"hash_607145e68712971c":
            case #"hash_7c03088193266bc4":
            case #"hash_c9a436974fe60919":
            case #"hash_d2d2f2854b7d8b7d":
            case #"hash_ff28a6c5cf8f547f":
                amount = int(225);
                break;
            case #"hash_326dc2026394652a":
            case #"hash_572e39c5466a5575":
                amount = 380;
                break;
            }
        }
        self.health = self.health + amount;
        if (isbulletdamage(meansofdeath)) {
            amount = min(10, amount);
        }
        self.var_880a990d25b43aaa = self.var_880a990d25b43aaa + amount;
        if (self.var_880a990d25b43aaa > self.var_59a09303493e759d) {
            break;
        }
    }
    if (issharedfuncdefined("challenges", "destroySamSiteNoPlant")) {
        [[ getsharedfunc("challenges", "destroySamSiteNoPlant") ]](level.script, objweapon, attacker);
    }
    function_6c86d07047fae506(attacker);
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152b
// Size: 0x2ff
function function_6c86d07047fae506(attacker, part, var_a69a18b6e859e6b4) {
    if (!isdefined(part)) {
        part = "base";
    }
    self.health = 0;
    self setscriptablepartstate(part, "destroyed");
    thread play_loopsound_in_space("dst_sam_site_fire_lp", self.origin);
    radiusdamage(self.origin, 350, 300, 85);
    if (isdefined(self.var_692fc766d262881a) && !istrue(self.var_692fc766d262881a.launched)) {
        if (isdefined(level._effect["c4_explosion_convoy"])) {
            playfx(level._effect["c4_explosion_convoy"], self.var_692fc766d262881a.origin);
        }
        self.var_692fc766d262881a hide();
    }
    if (isdefined(self.var_692fc666d26285e7) && !istrue(self.var_692fc666d26285e7.launched)) {
        if (isdefined(level._effect["c4_explosion_convoy"])) {
            playfx(level._effect["c4_explosion_convoy"], self.var_692fc666d26285e7.origin);
        }
        self.var_692fc666d26285e7 hide();
    }
    if (isdefined(self.var_692fc566d26283b4) && !istrue(self.var_692fc566d26283b4.launched)) {
        if (isdefined(level._effect["c4_explosion_convoy"])) {
            playfx(level._effect["c4_explosion_convoy"], self.var_692fc566d26283b4.origin);
        }
        self.var_692fc566d26283b4 hide();
    }
    if (isdefined(self.soundent)) {
        self.soundent delete();
    }
    if (isdefined(self.useent)) {
        self.useent delete();
    }
    var_b50986773a4d932 = spawn("script_model", self.origin);
    var_b50986773a4d932.angles = self.angles;
    if (isdefined(var_a69a18b6e859e6b4)) {
        var_b50986773a4d932 setmodel(var_a69a18b6e859e6b4);
    } else {
        var_b50986773a4d932 setmodel("military_samsite_01_damaged_rig_skeleton");
    }
    var_b50986773a4d932 setscriptablepartstate("base", "destroyed");
    if (istrue(level.var_82e220e37dee38e)) {
        var_b50986773a4d932.var_2e1259fb590696e9 = spawn("trigger_radius", self.origin, 0, 96, 512);
        var_b50986773a4d932.var_2e1259fb590696e9.targetname = "sam_dmg";
        var_b50986773a4d932.var_2e1259fb590696e9 thread function_bc293ec7591c985();
    }
    if (!isdefined(level.var_f7f6cf2225966394)) {
        level.var_f7f6cf2225966394 = [];
    }
    level.var_f7f6cf2225966394[level.var_f7f6cf2225966394.size] = var_b50986773a4d932;
    level notify("samsite_destroyed", attacker);
    self notify("samsite_dead", attacker);
    wait(10);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1831
// Size: 0x3e
function function_bc293ec7591c985() {
    self endon("death");
    level endon("game_ended");
    while (1) {
        ent = self waittill("trigger");
        if (isplayer(ent)) {
            thread function_411b78cfc85001b1(ent);
        }
    }
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1876
// Size: 0x5e
function function_411b78cfc85001b1(player) {
    player endon("disconnect");
    if (!istrue(player.onfire)) {
        player.onfire = 1;
        player dodamage(45, player.origin, undefined, undefined, "MOD_TRIGGER_HURT");
        wait(0.5);
        player.onfire = 0;
    }
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18db
// Size: 0x3c
function function_e864db8a259b11d0() {
    if (istrue(self.var_2551d467a1f595b3)) {
        return;
    }
    self.var_2551d467a1f595b3 = 1;
    self thread [[ level.showerrormessagefunc ]]("MP/EXPLOSVE_DAMAGE_ONLY");
    wait(3);
    self.var_2551d467a1f595b3 = undefined;
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191e
// Size: 0x28
function function_a00baa7c74f5f04d(idamage) {
    if (idamage + self.var_880a990d25b43aaa > self.var_59a09303493e759d) {
        return 1;
    }
    return 0;
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194e
// Size: 0x24
function function_ad922931d55b782b() {
    self endon("death");
    while (self isnearanyplayer(5000)) {
        wait(1);
    }
    function_f7c5fc38fdc4df8c(self);
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1979
// Size: 0x68
function function_d8ca43a821bdfe1a() {
    self makeusable();
    self endon("death");
    function_3e95edbf2a19f0a1();
    player = undefined;
    while (1) {
        player = self waittill("trigger");
        if (!player isvalidplayer()) {
            continue;
        }
        break;
    }
    player giveandfireoffhand("c4_mp");
    self makeunusable();
    wait(5);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19e8
// Size: 0x66
function function_7647015ee3137876() {
    if (!isdefined(level.scr_animtree["samsite"])) {
        if (utility::iscp()) {
            function_14c8eb2e0b67d409();
        } else {
            function_3c11327e37345bb2();
        }
    }
    self.animname = "samsite";
    self useanimtree(level.scr_animtree["samsite"]);
    namespace_bc4a4b9456315863::anim_single([0:self], "fire");
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a55
// Size: 0x3a
function function_3c11327e37345bb2() {
    level.scr_animtree["samsite"] = %script_model;
    level.scr_anim["samsite"]["fire"] = level.var_1a209bd995a7fa83["iw9_mp_prop_samsite_launch"];
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a96
// Size: 0x34
function function_14c8eb2e0b67d409() {
    level.scr_animtree["samsite"] = %script_model;
    level.scr_anim["samsite"]["fire"] = script_model%iw9_mp_prop_samsite_launch;
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad1
// Size: 0x36
function isvalidplayer() {
    if (!isplayer(self)) {
        return 0;
    }
    if (!isdefined(self)) {
        return 0;
    }
    if (!isalive(self)) {
        return 0;
    }
    if (self.sessionstate == "spectator") {
        return 0;
    }
    return 1;
}

// Namespace samsite/namespace_f70554b797fd58c2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0f
// Size: 0x64
function function_3e95edbf2a19f0a1() {
    self sethintstring("CP_MISSION_ESC/PLANT_CHARGE");
    self sethinticon("hud_icon_c4_plant");
    self sethintdisplayrange(512);
    self setuserange(150);
    self setcursorhint("HINT_BUTTON");
    self sethintdisplayfov(65);
    self sethintonobstruction("show");
    self sethintrequiresholding(1);
    self setuseholdduration("duration_short");
}

