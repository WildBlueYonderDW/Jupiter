// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\math.gsc;
#using script_2304453c69e996e2;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_adca7bd47b8c5e04;

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x262
// Size: 0x388
function function_403ee60da9709c3d(var_da9f2b894ff73151, turret_team, var_93e8e9bf1e00cacc, var_d553022aa7804f03, var_d64785dc8db57f2) {
    if (isdefined(var_d553022aa7804f03)) {
        var_61fb8854bb511fa2 = var_d553022aa7804f03;
    } else {
        var_61fb8854bb511fa2 = &function_1742ecf6da004355;
    }
    var_bd437e647db702f9 = namespace_1f188a13f7e79610::function_d93ec4635290febd();
    var_96313beda58b49fd = [];
    switch (var_bd437e647db702f9) {
    case #"hash_66c8846b85d8c948":
        var_96313beda58b49fd = [0:"tag_turret_front", 1:"tag_turret_rear"];
        break;
    case #"hash_174ce9a6344b18a4":
        var_96313beda58b49fd = [0:"tag_turret"];
        break;
    case #"hash_343a0ff44c1e5130":
        var_96313beda58b49fd = [0:"tag_turret"];
        break;
    default:
        return;
    }
    if (!isdefined(level._effect["turret_muzflash"])) {
        level._effect["turret_muzflash"] = loadfx("vfx/core/muzflash/minigun_flash_cheap.vfx");
    }
    self.turrets = [];
    foreach (index, var_7fd2fb13f979337c in var_96313beda58b49fd) {
        self.turrets[index] = spawnturret("misc_turret", self gettagorigin(var_7fd2fb13f979337c), "chopper_support_turret_mp");
        if (isdefined(self.turrets[index])) {
            self.turrets[index] setmodel("veh9_mil_air_heli_hind_turret_mp");
            self.turrets[index].team = self.team;
            self.turrets[index].angles = self.angles;
            if (self.var_f1b55da19f091702) {
                self.turrets[index].turreton = 0;
            } else {
                self.turrets[index].turreton = 1;
            }
            self.turrets[index].name = "heli_turret";
            self.turrets[index].current_target = undefined;
            self.turrets[index].var_7fd2fb13f979337c = var_7fd2fb13f979337c;
            self.turrets[index] linkto(self, var_7fd2fb13f979337c, (0, 0, 0), (0, 0, 0));
            self.turrets[index] setturretteam(turret_team);
            self.turrets[index] setturretmodechangewait(0);
            self.turrets[index] setmode("manual");
            self.turrets[index] maketurretinoperable();
            self.turrets[index] makeunusable();
            var_da9f2b894ff73151 = "magicturretsettings:" + var_da9f2b894ff73151;
            settings_bundle = getscriptbundle(var_da9f2b894ff73151);
            var_323c60a9fe03ff28 = getscriptbundlenames("magicturretsettings");
            self.turrets[index] function_9e96cdf67b925aa0(settings_bundle);
            self.turrets[index].team = turret_team;
            self.turrets[index].var_93e8e9bf1e00cacc = var_93e8e9bf1e00cacc;
            self.turrets[index].var_61fb8854bb511fa2 = var_61fb8854bb511fa2;
            self.turrets[index] function_a03f94132845002a(self, var_d64785dc8db57f2);
        }
    }
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f1
// Size: 0x66
function function_ed737153dc8baac7(var_61fb8854bb511fa2) {
    foreach (turret in self.turrets) {
        turret.var_61fb8854bb511fa2 = var_61fb8854bb511fa2;
    }
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x65e
// Size: 0x44
function private function_a03f94132845002a(vehicle, var_d64785dc8db57f2) {
    vehicle endon("death");
    vehicle endon("crashing");
    vehicle endon("entitydeleted");
    childthread function_de3fc172a25ca50b();
    childthread function_be442ba784aa304a(vehicle, var_d64785dc8db57f2);
    childthread function_8e6c75e710d28c52(vehicle);
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6a9
// Size: 0x12b
function private function_8e6c75e710d28c52(vehicle) {
    vehicle endon("death");
    vehicle endon("crashing");
    vehicle endon("entitydeleted");
    self endon("death");
    self setcandamage(1);
    self.maxhealth = 1000;
    self.health = 1000;
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = amount = self waittill("damage");
        if (isdefined(attacker) && !array_contains(level.players, attacker)) {
            self.health = self.health + amount;
            waitframe();
            continue;
        }
        waitframe();
    }
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7db
// Size: 0x183
function private function_be442ba784aa304a(vehicle, var_d64785dc8db57f2, var_629bbdfb1cbfadb4) {
    vehicle endon("death");
    vehicle endon("crashing");
    vehicle endon("entitydeleted");
    self endon("death");
    var_629bbdfb1cbfadb4 = function_53c4c53197386572(var_629bbdfb1cbfadb4, 3);
    self.groundtargetent = spawn("script_model", self.origin);
    self.groundtargetent setmodel("tag_origin");
    self.groundtargetent dontinterpolate();
    self settargetentity(self.groundtargetent);
    wait(randomfloatrange(1, 3));
    while (1) {
        if (istrue(self.turreton)) {
            current_target = [[ self.var_61fb8854bb511fa2 ]](vehicle);
            if (isdefined(current_target)) {
                if (istrue(var_d64785dc8db57f2)) {
                    if (!vehicle namespace_c908de38bcdbd93d::function_618e0f50b9b8b310(current_target)) {
                        wait(var_629bbdfb1cbfadb4);
                        continue;
                    }
                }
                vehicle notify("target_acquired");
                vehicle.current_target = current_target;
                if (function_93ff5e5ba263fc6d(vehicle, current_target) < self.var_cc99a14e60508d29) {
                    waitframe();
                    continue;
                }
                childthread function_f2ad42531b9ae44c(vehicle, current_target, self.var_d2e7d6658b0a045a, self.var_4738777de7c10ddc, self.var_abee6a592f03fd9e, self.var_433171aa24dce75e, self.var_cc3cb55a3ae27b6c, self.var_60fce4cc4f6acabc, self.var_35635307ee241aae);
                function_f6c09d12e004b5ab(vehicle, current_target);
            }
        }
        wait(randomfloatrange(self.var_22724a721b4b206e, self.var_224f3c721b24b9ec));
    }
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x965
// Size: 0x3b0
function private function_1742ecf6da004355(vehicle) {
    vehicle endon("death");
    vehicle endon("crashing");
    vehicle endon("entitydeleted");
    self endon("death");
    canseetarget = 0;
    var_c3fbb6661b91750f = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 0, 1, 0, 1, 1);
    var_b9d5783a4f34efbc = [0:vehicle, 1:self];
    sorted_players = sortbydistancecullbyradius(level.players, self.origin, self.var_afe179941cf6c18b);
    if (sorted_players.size > 0) {
        foreach (player in sorted_players) {
            if (isinlaststand(player) || istrue(player.ignoreme) || istrue(player.notarget)) {
                continue;
            }
            var_540088a9ca3d97d6 = player.origin - vehicle.origin;
            dot = function_c1aa7c066ec92ca5(var_540088a9ca3d97d6, anglestoforward(vehicle.angles), 1);
            if (dot < self.var_cc99a14e60508d29) {
                continue;
            }
            if (istrue(player namespace_f8065cafc523dba5::isinvehicle())) {
                var_281dedd57c723e4f = player namespace_f8065cafc523dba5::getvehicle();
                var_b9d5783a4f34efbc[var_b9d5783a4f34efbc.size] = var_281dedd57c723e4f;
                var_53023fda76fa64fe = var_281dedd57c723e4f getlinkedchildren();
                if (isdefined(var_53023fda76fa64fe) && var_53023fda76fa64fe.size > 0) {
                    var_b9d5783a4f34efbc = array_combine(var_b9d5783a4f34efbc, var_53023fda76fa64fe);
                }
            }
            if (player tagexists("j_head")) {
                canseetarget = namespace_2a184fc4902783dc::ray_trace_passed(vehicle gettagorigin(self.var_7fd2fb13f979337c), player gettagorigin("j_head"), var_b9d5783a4f34efbc, var_c3fbb6661b91750f);
            }
            if (istrue(canseetarget)) {
                return player;
            }
        }
    }
    var_c3897b359eecba09 = [];
    foreach (var_152b8f126af5871d in self.var_93e8e9bf1e00cacc) {
        var_c3897b359eecba09 = array_combine(var_c3897b359eecba09, getaiarray(var_152b8f126af5871d));
    }
    if (var_c3897b359eecba09.size > 0) {
        var_a82fef516b506159 = sortbydistancecullbyradius(var_c3897b359eecba09, self.origin, self.var_afe179941cf6c18b);
        if (var_a82fef516b506159.size > 0) {
            foreach (non_player in var_a82fef516b506159) {
                var_540088a9ca3d97d6 = non_player.origin - vehicle.origin;
                dot = function_c1aa7c066ec92ca5(var_540088a9ca3d97d6, anglestoforward(vehicle.angles), 1);
                if (dot < self.var_cc99a14e60508d29) {
                    continue;
                }
                if (isdefined(non_player.vehicle) && isdefined(non_player.vehicle_position)) {
                    var_b9d5783a4f34efbc[var_b9d5783a4f34efbc.size] = non_player.vehicle;
                    var_53023fda76fa64fe = non_player.vehicle getlinkedchildren();
                    if (isdefined(var_53023fda76fa64fe) && var_53023fda76fa64fe.size > 0) {
                        var_b9d5783a4f34efbc = array_combine(var_b9d5783a4f34efbc, var_53023fda76fa64fe);
                    }
                }
                canseetarget = namespace_2a184fc4902783dc::ray_trace_passed(vehicle gettagorigin(self.var_7fd2fb13f979337c), non_player geteye(), var_b9d5783a4f34efbc, var_c3fbb6661b91750f);
                if (istrue(canseetarget)) {
                    return non_player;
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd1d
// Size: 0x41e
function private function_f2ad42531b9ae44c(vehicle, current_target, var_d2e7d6658b0a045a, var_4738777de7c10ddc, var_abee6a592f03fd9e, var_433171aa24dce75e, var_cc3cb55a3ae27b6c, var_60fce4cc4f6acabc, var_35635307ee241aae) {
    self endon("stop_turret_burst");
    var_3dcdf4612dca3c06 = randomintrange(self.var_a9b3f28f2a95607c, self.var_a990e08f2a6ef12e);
    if (var_d2e7d6658b0a045a == "scaleByTime") {
        var_f9cf7a09079abea = var_3dcdf4612dca3c06 * self.var_badbf9244b36bc31 * 1000;
        end_time = gettime() + var_f9cf7a09079abea;
    }
    for (i = 0; i < var_3dcdf4612dca3c06; i++) {
        if (!isdefined(current_target) || isplayer(current_target) && isinlaststand(current_target)) {
            break;
        }
        var_32b3fa46a054cbf0 = vehicle gettagorigin(self.var_7fd2fb13f979337c);
        targetposition = current_target getcentroid();
        var_734a884df1a36225 = targetposition - var_32b3fa46a054cbf0;
        targetdistance = length(var_734a884df1a36225);
        var_734a884df1a36225 = var_734a884df1a36225 / targetdistance;
        var_a755bac7dc657f85 = vectorcross((0, 0, 1), var_734a884df1a36225);
        var_f7f57f4d1c626c29 = vectorcross(var_734a884df1a36225, var_a755bac7dc657f85);
        var_d8b5bab86498e0a7 = randomfloatrange(0, 360);
        var_3e36f65cdc207066 = axistoangles(var_734a884df1a36225, var_a755bac7dc657f85 * -1, var_f7f57f4d1c626c29);
        var_e2bb8be14a3105f3 = vectornormalize((0, randomfloatrange(-1, 1), randomfloatrange(-1, 1)));
        targetoffset = rotatevector(var_e2bb8be14a3105f3, var_3e36f65cdc207066);
        switch (var_d2e7d6658b0a045a) {
        case #"hash_34770b8adabe2feb":
            /#
                assert(var_abee6a592f03fd9e);
            #/
            var_362ee16d64be3e63 = clamp((targetdistance - var_4738777de7c10ddc) / var_abee6a592f03fd9e, 0, 1);
            var_ccb927b274a239bc = math::lerp(var_433171aa24dce75e, var_cc3cb55a3ae27b6c, var_362ee16d64be3e63);
            var_aeedb4904a14565e = math::lerp(var_60fce4cc4f6acabc, var_35635307ee241aae, var_362ee16d64be3e63);
            var_c9b00e5616b7a312 = randomfloatrange(var_ccb927b274a239bc, var_aeedb4904a14565e);
            var_16839d44a9ece48c = targetposition + targetoffset * var_c9b00e5616b7a312;
            break;
        case #"hash_c088e0bbec822829":
            var_a1fe6527c984c385 = clamp((end_time - gettime()) / var_f9cf7a09079abea, 0, 1);
            var_ccb927b274a239bc = math::lerp(var_433171aa24dce75e, var_cc3cb55a3ae27b6c, var_a1fe6527c984c385);
            var_aeedb4904a14565e = math::lerp(var_60fce4cc4f6acabc, var_35635307ee241aae, var_a1fe6527c984c385);
            var_c9b00e5616b7a312 = randomfloatrange(var_ccb927b274a239bc, var_aeedb4904a14565e);
            var_16839d44a9ece48c = targetposition + targetoffset * var_c9b00e5616b7a312;
            break;
        default:
            var_c9b00e5616b7a312 = randomfloatrange(var_433171aa24dce75e, var_60fce4cc4f6acabc);
            var_16839d44a9ece48c = targetposition + targetoffset * var_c9b00e5616b7a312;
            break;
        }
        /#
            var_d16fa005c2c5291d = getdvarint(@"hash_a5451df7c00d0400", 0);
            if (var_d16fa005c2c5291d) {
                duration = 800;
                line(targetposition, targetposition + var_a755bac7dc657f85 * 30, (1, 0, 0), 1, 0, duration);
                line(targetposition, targetposition + var_734a884df1a36225 * 30, (0, 1, 0), 1, 0, duration);
                line(targetposition, targetposition + var_f7f57f4d1c626c29 * 30, (0, 0, 1), 1, 0, duration);
                line(targetposition, var_16839d44a9ece48c, (1, 1, 0), 1, 0, duration);
                sphere(targetposition, var_ccb927b274a239bc, (0.17, 1, 1), 0, duration);
                sphere(targetposition, var_aeedb4904a14565e, (0, 0, 1), 0, duration);
            }
        #/
        self.groundtargetent dontinterpolate();
        self.groundtargetent.origin = var_16839d44a9ece48c;
        self shootturret("tag_flash", 6);
        playfxontag(getfx("turret_muzflash"), self, "tag_flash");
        wait(self.var_badbf9244b36bc31);
    }
    self notify("turret_burst_complete");
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1142
// Size: 0x4b
function private function_f6c09d12e004b5ab(vehicle, current_target) {
    self endon("turret_burst_complete");
    while (1) {
        if (function_93ff5e5ba263fc6d(vehicle, current_target) < self.var_cc99a14e60508d29) {
            self notify("stop_turret_burst");
            return;
        }
        wait(self.var_badbf9244b36bc31);
    }
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1194
// Size: 0x296
function function_9e96cdf67b925aa0(settings_bundle) {
    hasturret = function_53c4c53197386572(settings_bundle.hasturret, 0);
    var_afe179941cf6c18b = function_53c4c53197386572(settings_bundle.var_7479df798e99a702, 2560);
    var_c8e4f9c808bc6727 = function_53c4c53197386572(settings_bundle.var_1677a5799ea2d883, 45);
    var_badbf9244b36bc31 = function_53c4c53197386572(settings_bundle.firedelay, 0.1);
    var_5e757e98f6d8d75d = function_53c4c53197386572(settings_bundle.var_39457beebb58fd74, 12);
    var_5e528898f6b2a5a3 = function_53c4c53197386572(settings_bundle.var_396869eebb7f1d96, 16);
    var_22724a721b4b206e = function_53c4c53197386572(settings_bundle.var_f355db9e56c3e274, 2);
    var_224f3c721b24b9ec = function_53c4c53197386572(settings_bundle.var_f378c99e56ea0296, 4);
    var_d2e7d6658b0a045a = function_53c4c53197386572(settings_bundle.var_d2e7d6658b0a045a, "None");
    var_4738777de7c10ddc = function_53c4c53197386572(settings_bundle.var_4738777de7c10ddc, 1500);
    var_abee6a592f03fd9e = function_53c4c53197386572(settings_bundle.var_abee6a592f03fd9e, 4000);
    var_433171aa24dce75e = function_53c4c53197386572(settings_bundle.var_433171aa24dce75e, 20);
    var_60fce4cc4f6acabc = function_53c4c53197386572(settings_bundle.var_60fce4cc4f6acabc, 25);
    var_cc3cb55a3ae27b6c = function_53c4c53197386572(settings_bundle.var_cc3cb55a3ae27b6c, 50);
    var_35635307ee241aae = function_53c4c53197386572(settings_bundle.var_35635307ee241aae, 60);
    self.hasturret = hasturret;
    self.var_afe179941cf6c18b = var_afe179941cf6c18b;
    self.var_b115239d8d69db01 = var_afe179941cf6c18b;
    self.var_c8e4f9c808bc6727 = var_c8e4f9c808bc6727;
    self.var_cc99a14e60508d29 = cos(var_c8e4f9c808bc6727);
    self.var_badbf9244b36bc31 = var_badbf9244b36bc31;
    self.var_a9b3f28f2a95607c = var_5e757e98f6d8d75d;
    self.var_a990e08f2a6ef12e = var_5e528898f6b2a5a3;
    self.var_d2e7d6658b0a045a = var_d2e7d6658b0a045a;
    self.var_22724a721b4b206e = var_22724a721b4b206e;
    self.var_224f3c721b24b9ec = var_224f3c721b24b9ec;
    self.var_4738777de7c10ddc = var_4738777de7c10ddc;
    self.var_abee6a592f03fd9e = var_abee6a592f03fd9e;
    self.var_433171aa24dce75e = var_433171aa24dce75e;
    self.var_60fce4cc4f6acabc = var_60fce4cc4f6acabc;
    self.var_cc3cb55a3ae27b6c = var_cc3cb55a3ae27b6c;
    self.var_35635307ee241aae = var_35635307ee241aae;
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1431
// Size: 0x16
function function_bfab431f8bd39c4e(range) {
    self.var_afe179941cf6c18b = range;
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x144e
// Size: 0x15
function function_1b48b098cbce981() {
    self.var_afe179941cf6c18b = self.var_b115239d8d69db01;
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146a
// Size: 0xd
function function_917a46654478df92() {
    self.turreton = 0;
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x147e
// Size: 0xe
function function_f50612d93c098113() {
    self.turreton = 1;
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1493
// Size: 0x10c
function function_de3fc172a25ca50b() {
    while (1) {
        var_22724a721b4b206e = getdvarfloat(@"hash_26a1c7b26c4d5065", -1);
        if (var_22724a721b4b206e != -1 && self.var_22724a721b4b206e != var_22724a721b4b206e) {
            self.var_22724a721b4b206e = var_22724a721b4b206e;
            if (self.var_224f3c721b24b9ec < self.var_22724a721b4b206e) {
                setdvar(@"hash_34f933a0fc55b25f", self.var_22724a721b4b206e + 1);
            }
        }
        var_224f3c721b24b9ec = getdvarfloat(@"hash_34f933a0fc55b25f", -1);
        if (var_224f3c721b24b9ec != -1 && self.var_224f3c721b24b9ec != var_224f3c721b24b9ec && var_224f3c721b24b9ec > self.var_22724a721b4b206e) {
            self.var_224f3c721b24b9ec = var_224f3c721b24b9ec;
        }
        var_c8e4f9c808bc6727 = getdvarfloat(@"hash_b59235a8286b8e3d", -1);
        if (var_c8e4f9c808bc6727 != -1 && self.var_c8e4f9c808bc6727 != var_c8e4f9c808bc6727) {
            self.var_c8e4f9c808bc6727 = var_c8e4f9c808bc6727;
            self.var_cc99a14e60508d29 = cos(var_c8e4f9c808bc6727);
        }
        waitframe();
    }
}

// Namespace namespace_adca7bd47b8c5e04/namespace_d80401e4aca8c66f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15a6
// Size: 0x4e
function private function_93ff5e5ba263fc6d(attacker, targ) {
    var_540088a9ca3d97d6 = targ.origin - attacker.origin;
    return function_c1aa7c066ec92ca5(var_540088a9ca3d97d6, anglestoforward(attacker.angles), 1);
}

