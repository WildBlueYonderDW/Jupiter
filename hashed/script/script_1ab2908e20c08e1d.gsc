// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_7b2517368c79e5bc;
#using scripts\mp\utility\player.gsc;

#namespace inhibitor;

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x307
// Size: 0x37
function function_3670f4d8dcce3aec() {
    level._effect["inhibitor_pulse"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_sporecontrol_inhibitor_pulse.vfx");
    level._effect["inhibitor_idle"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_sporecontrol_inhibitor_idle.vfx");
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345
// Size: 0x6a
function function_427def4c56968d9f(grenade) {
    grenade endon("death");
    grenade thread function_f8d8329a90d0eb79(grenade.var_134c468e6279cca3);
    function_acccb8cab20190d9(grenade);
    grenade thread function_554cebc2d67c5e02(self);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("entity", "trackEntityLimit")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("entity", "trackEntityLimit") ]](grenade, self);
        grenade thread function_36645b2e031dc50b();
    }
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b6
// Size: 0x1f9
function function_acccb8cab20190d9(grenade) {
    level endon("game_ended");
    self endon("disconnect");
    grenade endon("death");
    var_5f0b7d8e7d0627b8 = getdvarint(@"hash_d57482b850330a6", 150);
    while (1) {
        grenade childthread function_53b45ece303b029c(self);
        hitnormal = position = velocity = surfacetype = var_b3fcd958f4d7876e = var_82d5e3b42d0191c9 = grenade waittill("missile_stuck");
        ignoreents = vehicle_getarrayinradius(grenade.origin, 500, 500);
        var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1, 0, 1);
        tracestart = grenade.origin;
        var_3a7f0173b03f5767 = -2000;
        traceend = grenade.origin + (0, 0, var_3a7f0173b03f5767);
        traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, var_fbcabd62b8f66eb8);
        var_cb4d3248c7f2eadf = 0;
        if (isdefined(var_82d5e3b42d0191c9)) {
            if (var_82d5e3b42d0191c9 namespace_1f188a13f7e79610::isvehicle()) {
                if (isdefined(var_b3fcd958f4d7876e)) {
                    var_b3fcd958f4d7876e = namespace_dbbb37eb352edf96::function_8ed0ffa3f8be7c75(var_b3fcd958f4d7876e);
                    var_394b941c42b43ba0 = issubstr(var_b3fcd958f4d7876e, "wheel");
                    if (var_394b941c42b43ba0) {
                        var_cb4d3248c7f2eadf = 1;
                    }
                }
            }
        }
        if (var_cb4d3248c7f2eadf) {
            grenade unlink();
            offsetvec = hitnormal + self gettagorigin("j_spineupper") - grenade.origin;
            neworigin = grenade.origin + vectornormalize(offsetvec) * 10;
            grenade = namespace_68e641469fde3fa7::_launchgrenade("trophy_mp", neworigin, hitnormal * var_5f0b7d8e7d0627b8, undefined, 1, grenade);
        } else {
            break;
        }
    }
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b7
// Size: 0x12f
function function_53b45ece303b029c(player) {
    self endon("death");
    self endon("missile_stuck");
    player endon("disconnect");
    msg = waittill_any_timeout_1(2, "touching_platform");
    if (msg == "timeout") {
        return;
    }
    groundentity = undefined;
    ignoreents = vehicle_getarrayinradius(self.origin, 500, 500);
    ignoreents[ignoreents.size] = self;
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1, 0, 1);
    tracestart = self.origin;
    var_3a7f0173b03f5767 = -2000;
    traceend = self.origin + (0, 0, var_3a7f0173b03f5767);
    traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, var_fbcabd62b8f66eb8);
    if (traceresults["fraction"] < 1) {
        groundentity = traceresults["entity"];
        if (isdefined(groundentity)) {
            if (is_train_ent(groundentity)) {
                self.origin = player.origin;
            }
        }
    }
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed
// Size: 0x163
function function_554cebc2d67c5e02(player) {
    self endon("death");
    grenade = self;
    grenade hide();
    grenade.angles = grenade.angles;
    ground_pos = grenade.origin;
    if (function_f4091cdf59c6f35c(ground_pos)) {
        dir = vectornormalize(grenade.origin - player.origin);
        ground_pos = getgroundposition(grenade.origin - dir * 26, 1);
    }
    var_134c468e6279cca3 = spawn("script_model", ground_pos);
    var_134c468e6279cca3.angles = grenade.angles;
    var_134c468e6279cca3 setmodel("wm_jup_zm_inhibitor_device");
    var_134c468e6279cca3 notsolid();
    grenade.origin = ground_pos;
    var_134c468e6279cca3.grenade = grenade;
    var_134c468e6279cca3.team = self.team;
    grenade.var_134c468e6279cca3 = var_134c468e6279cca3;
    grenade.var_134c468e6279cca3 linkto(grenade, "tag_origin");
    grenade.var_134c468e6279cca3.player_owner = player;
    if (!isdefined(grenade) && isdefined(var_134c468e6279cca3)) {
        var_134c468e6279cca3 delete();
    }
    grenade thread function_fecb0c5ebbe74c13();
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x857
// Size: 0xcd
function function_fecb0c5ebbe74c13() {
    grenade = self;
    grenade.var_134c468e6279cca3 setscriptablepartstate("body", "active_usable");
    foreach (player in level.players) {
        grenade.var_134c468e6279cca3 disablescriptableplayeruse(player);
    }
    grenade.var_134c468e6279cca3 enablescriptableplayeruse(grenade.var_134c468e6279cca3.player_owner);
    scriptable_addusedcallback(&function_f2a91412bc5778c2);
    grenade thread function_85348883faef3ae0();
    grenade thread function_8d6c1168a68452d6();
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92b
// Size: 0xa0
function function_ba64a36771329308() {
    if (!is_equal(self.var_134c468e6279cca3 getscriptablepartstate("state"), "detection")) {
        self.var_134c468e6279cca3 setscriptablepartstate("state", "detection");
        self.var_134c468e6279cca3.angles = (0, 0, 0);
        if (isplayer(self.var_134c468e6279cca3.player_owner)) {
            self.var_134c468e6279cca3 hudoutlineenableforclient(self.var_134c468e6279cca3.player_owner, "shimmer");
        }
    }
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d2
// Size: 0x296
function function_c2380a1826a779f3(var_ab4a81377b413b10) {
    direction = self.var_134c468e6279cca3.origin;
    direction = (direction[1], direction[0], 0);
    if (direction[1] < 0 || direction[0] > 0 && direction[1] > 0) {
        direction = (direction[0], direction[1] * -1, 0);
    } else if (direction[0] < 0) {
        direction = (direction[0] * -1, direction[1], 0);
    }
    if (!is_equal(self.var_134c468e6279cca3 getscriptablepartstate("state"), "fire")) {
        self.var_134c468e6279cca3 setscriptablepartstate("state", "fire");
        if (isplayer(self.var_134c468e6279cca3.player_owner)) {
            self.var_134c468e6279cca3 hudoutlinedisableforclient(self.var_134c468e6279cca3.player_owner);
        }
    }
    self.var_134c468e6279cca3 setscriptablepartstate("sound", "pulse");
    playfxontag(getfx("inhibitor_pulse"), self.var_134c468e6279cca3, "tag_origin");
    foreach (var_ca97c8b14589f30b in var_ab4a81377b413b10) {
        switch (var_ca97c8b14589f30b.identifier) {
        case #"hash_c09cb639830e59e5":
            var_ca97c8b14589f30b namespace_7f0bcee5d45a1dea::callback("inhibitor_interact");
            break;
        case #"hash_77e279e245316bbf":
            if (isdefined(var_ca97c8b14589f30b.control_point)) {
                params = spawnstruct();
                params.eattacker = self.var_134c468e6279cca3.player_owner;
                params.einflictor = self;
                params.idamage = 100;
                params.instance = var_ca97c8b14589f30b.control_point;
                params.instance.var_9f7b53f50c23948e = function_53c4c53197386572(params.instance.var_9f7b53f50c23948e, []);
                params.instance.var_9f7b53f50c23948e = function_6d6af8144a5131f1(params.instance.var_9f7b53f50c23948e, self);
                var_ca97c8b14589f30b.control_point namespace_7f0bcee5d45a1dea::callback("shield_damaged", params);
            }
            break;
        }
    }
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6f
// Size: 0xb8
function function_f4091cdf59c6f35c(spawn_origin) {
    self endon("death");
    var_4172b6056854f2f3 = getentarrayinradius("script_model", "classname", spawn_origin, 20);
    var_ab4a81377b413b10 = [];
    foreach (var_ca97c8b14589f30b in var_4172b6056854f2f3) {
        if (is_equal(var_ca97c8b14589f30b.identifier, "jup_ob_zombie_control_spore") || is_equal(var_ca97c8b14589f30b.identifier, "jup_ob_zombie_inhibitor_interact")) {
            return 1;
        }
    }
    return 0;
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2f
// Size: 0x130
function function_85348883faef3ae0() {
    self endon("death");
    self.var_134c468e6279cca3 setscriptablepartstate("vfx", "active");
    playfxontag(getfx("inhibitor_idle"), self.var_134c468e6279cca3, "tag_origin");
    while (1) {
        if (isdefined(self.var_134c468e6279cca3)) {
            var_4172b6056854f2f3 = getentarrayinradius("script_model", "classname", self.var_134c468e6279cca3.origin, 200);
            var_ab4a81377b413b10 = [];
            foreach (var_ca97c8b14589f30b in var_4172b6056854f2f3) {
                if (is_equal(var_ca97c8b14589f30b.identifier, "jup_ob_zombie_control_spore") || is_equal(var_ca97c8b14589f30b.identifier, "jup_ob_zombie_inhibitor_interact")) {
                    var_ab4a81377b413b10 = function_6d6af8144a5131f1(var_ab4a81377b413b10, var_ca97c8b14589f30b);
                }
            }
            if (var_ab4a81377b413b10.size > 0) {
                function_c2380a1826a779f3(var_ab4a81377b413b10);
            } else {
                function_ba64a36771329308();
            }
        }
        wait(2);
    }
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe66
// Size: 0xab
function function_f2a91412bc5778c2(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!function_621b71c9df814ea4(instance.type)) {
        return;
    }
    var_636981592f381ebf = spawnstruct();
    var_636981592f381ebf.type = "obloot_offhand_inhibitor";
    var_636981592f381ebf.count = 1;
    var_636981592f381ebf.var_a6293f3144240b99 = 0;
    player namespace_2abc885019e1956::function_576728d3d4486bd6(var_636981592f381ebf, 0);
    instance.entity.grenade function_6b4e113e860a21e8();
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf18
// Size: 0x15
function function_8d6c1168a68452d6() {
    self endon("death");
    wait(120);
    thread function_b4ccc4be633a50ed();
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf34
// Size: 0x5f
function function_b4ccc4be633a50ed() {
    self endon("death");
    while (1) {
        players = namespace_7e17181d03156026::getplayersinradius(self.origin, 1500);
        if (is_equal(players.size, 0)) {
            self.var_134c468e6279cca3 setscriptablepartstate("sound", "despawn");
            waitframe();
            function_6b4e113e860a21e8();
        }
        wait(2);
    }
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9a
// Size: 0x42
function function_6b4e113e860a21e8() {
    self endon("death");
    self.var_134c468e6279cca3 stopsoundchannel("explo_atmo_3d");
    waitframe();
    if (isdefined(self.var_134c468e6279cca3)) {
        self.var_134c468e6279cca3 delete();
    }
    self delete();
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe3
// Size: 0x19
function function_621b71c9df814ea4(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "equip_inhibitor";
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1004
// Size: 0x3d
function private function_f8d8329a90d0eb79(var_134c468e6279cca3) {
    self endon("missile_stuck");
    wait(10);
    if (!isdefined(self)) {
        if (isdefined(var_134c468e6279cca3)) {
            var_134c468e6279cca3 delete();
        }
    } else {
        if (isdefined(var_134c468e6279cca3)) {
            var_134c468e6279cca3 delete();
        }
        self delete();
    }
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1048
// Size: 0xa0
function is_train_ent(hitent) {
    if (isdefined(level.wztrain_info)) {
        foreach (ent in level.wztrain_info.train_array) {
            if (ent == hitent) {
                return 1;
            } else if (isdefined(ent.linked_model) && ent.linked_model == hitent) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace inhibitor/namespace_47e14a842b2118bf
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f0
// Size: 0x19
function function_36645b2e031dc50b() {
    self endon("death");
    self waittill("entity_limit_destroy");
    function_6b4e113e860a21e8();
}

