// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\entity.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\equipment\nvg.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using script_cbb0697de4c5728;
#using script_39ebe40c5c0566e7;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_39a8b103d9252a73;

#namespace player;

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e6
// Size: 0x8e
function getstancecenter() {
    if (self getstance() == "crouch") {
        center = self.origin + 0.5 * (0, 0, 48);
    } else if (self getstance() == "prone") {
        center = self.origin + 0.5 * (0, 0, 20);
    } else {
        center = self.origin + 0.5 * (0, 0, 64);
    }
    return center;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87c
// Size: 0x94
function getstancetop(var_2eea482c1a2f43a9) {
    var_6497396fb64ea3b9 = self getstance();
    if (isdefined(var_2eea482c1a2f43a9)) {
        var_6497396fb64ea3b9 = var_2eea482c1a2f43a9;
    }
    if (var_6497396fb64ea3b9 == "crouch") {
        top = self.origin + (0, 0, 48);
    } else if (var_6497396fb64ea3b9 == "prone") {
        top = self.origin + (0, 0, 20);
    } else {
        top = self.origin + (0, 0, 64);
    }
    return top;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x918
// Size: 0x42
function isreallyalive(player) {
    return isalive(player) && !isdefined(player.fauxdead) && !istrue(player.delayedspawnedplayernotify) && !istrue(player.liveRagdoll);
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x962
// Size: 0x18
function isinlaststand(player) {
    return istrue(player.inlaststand);
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x982
// Size: 0x38
function function_d7afe062ef51bd77(player) {
    return isdefined(player) && isdefined(player.var_2fb534abd9eb93ca) && !player.var_2fb534abd9eb93ca && isinlaststand(player);
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c2
// Size: 0x11d
function function_311066dfee085643(player, damagetype) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isdefined(player.var_fd29493b5da45e74)) {
        return 0;
    }
    if (!isdefined(player.var_fd29493b5da45e74.var_311066dfee085643)) {
        return 0;
    }
    var_1d80fb7b86315948 = player.var_fd29493b5da45e74.var_311066dfee085643;
    if (isdefined(damagetype)) {
        switch (damagetype) {
        case #"hash_145e286717e1f4c3":
            return (var_1d80fb7b86315948 && level.var_409e54f81172d6d8.var_a432242852136190);
        case #"hash_1cb749d9b456c694":
            return (var_1d80fb7b86315948 && level.var_409e54f81172d6d8.var_3a0ae6d2266fe2cb);
        case #"hash_e0788d0d9af05c73":
            return (var_1d80fb7b86315948 && level.var_409e54f81172d6d8.var_ac821e3ea28cfbd8);
        case #"hash_40a94c5d9e4e265b":
            return (var_1d80fb7b86315948 && level.var_409e54f81172d6d8.var_e4740512520ffe8);
        default:
            return var_1d80fb7b86315948;
            break;
        }
    } else {
        return var_1d80fb7b86315948;
    }
    return 0;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae7
// Size: 0x24
function function_ad443bbcdcf37b85(player) {
    return isdefined(player) && isreallyalive(player) && !isinlaststand(player);
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb13
// Size: 0x25
function isarchetype(type) {
    return isdefined(self.loadoutarchetype) && type == self.loadoutarchetype;
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb40
// Size: 0xf
function isplayerads() {
    return self playerads() > 0.5;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb57
// Size: 0x21
function setthirdpersondof(isenabled) {
    if (isenabled) {
        setdof_thirdperson();
    } else {
        setdof_default();
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7f
// Size: 0x1d
function updatesessionstate(sessionstate, statusicon) {
    namespace_f8065cafc523dba5::updatesessionstate(sessionstate, statusicon);
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba3
// Size: 0x110
function getteamarray(team, var_dcc07fcc8a9beb59) {
    teamarray = [];
    if (!isdefined(var_dcc07fcc8a9beb59) || var_dcc07fcc8a9beb59) {
        foreach (player in level.characters) {
            if (isdefined(player.team) && player.team == team) {
                teamarray[teamarray.size] = player;
            }
        }
    } else {
        foreach (player in level.players) {
            if (isdefined(player.team) && player.team == team) {
                teamarray[teamarray.size] = player;
            }
        }
    }
    return teamarray;
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbb
// Size: 0x153
function get_players_watching(var_cc5c77bb957e98b6, var_f76a004f9481f43b) {
    if (!isdefined(var_cc5c77bb957e98b6)) {
        var_cc5c77bb957e98b6 = 0;
    }
    if (!isdefined(var_f76a004f9481f43b)) {
        var_f76a004f9481f43b = 0;
    }
    var_ade4ed7fadba8194 = self getentitynumber();
    var_fe0eb2c2c884f27b = [];
    foreach (player in level.players) {
        if (player == self) {
            continue;
        }
        var_7bec920eea9088e7 = 0;
        if (!var_f76a004f9481f43b) {
            if (isdefined(player.team) && (player.team == "spectator" || player.team == "codcaster" || player.sessionstate == "spectator")) {
                var_13c5603d4beea2fc = player getspectatingplayer();
                if (isdefined(var_13c5603d4beea2fc) && var_13c5603d4beea2fc == self) {
                    var_7bec920eea9088e7 = 1;
                }
            }
            if (player.forcespectatorclient == var_ade4ed7fadba8194) {
                var_7bec920eea9088e7 = 1;
            }
        }
        if (!var_cc5c77bb957e98b6) {
            if (player.killcamentity == var_ade4ed7fadba8194) {
                var_7bec920eea9088e7 = 1;
            }
        }
        if (var_7bec920eea9088e7) {
            var_fe0eb2c2c884f27b[var_fe0eb2c2c884f27b.size] = player;
        }
    }
    return var_fe0eb2c2c884f27b;
}

// Namespace player/namespace_7e17181d03156026
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe16
// Size: 0xf7
function set_visionset_for_watching_players(var_204bd93152055ba6, var_98b0a8ec6eeff568, var_e0d7f346bd955cdc, var_fc0b50f08da38b65, var_cc5c77bb957e98b6, var_f76a004f9481f43b) {
    var_fe0eb2c2c884f27b = get_players_watching(var_cc5c77bb957e98b6, var_f76a004f9481f43b);
    foreach (player in var_fe0eb2c2c884f27b) {
        player notify("changing_watching_visionset");
        if (isdefined(var_fc0b50f08da38b65) && var_fc0b50f08da38b65) {
            player visionsetmissilecamforplayer(var_204bd93152055ba6, var_98b0a8ec6eeff568);
        } else {
            player visionsetnakedforplayer(var_204bd93152055ba6, var_98b0a8ec6eeff568);
        }
        if (var_204bd93152055ba6 != "" && isdefined(var_e0d7f346bd955cdc)) {
            player thread reset_visionset_on_team_change(self, var_98b0a8ec6eeff568 + var_e0d7f346bd955cdc);
            player thread reset_visionset_on_disconnect(self);
            if (player isinkillcam()) {
                player thread reset_visionset_on_spawn();
            }
        }
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf14
// Size: 0x23
function reset_visionset_on_spawn() {
    self endon("disconnect");
    self waittill("spawned");
    self visionsetnakedforplayer("", 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3e
// Size: 0x8f
function reset_visionset_on_team_change(var_d6263ebe22d2bee2, var_e4b1ee6125b0d25b) {
    self endon("changing_watching_visionset");
    time_started = gettime();
    var_388aed5dc0074606 = self.team;
    while (gettime() - time_started < var_e4b1ee6125b0d25b * 1000) {
        if (self.team != var_388aed5dc0074606 || !array_contains(var_d6263ebe22d2bee2 get_players_watching(), self)) {
            self visionsetnakedforplayer("", 0);
            self notify("changing_visionset");
            break;
        }
        waitframe();
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd4
// Size: 0x2c
function reset_visionset_on_disconnect(var_2907df9a672de3d6) {
    self endon("changing_watching_visionset");
    var_2907df9a672de3d6 waittill("disconnect");
    self visionsetnakedforplayer("", 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1007
// Size: 0x27
function restorebasevisionset(fadetime) {
    if (istrue(level.wpinprogress)) {
        return;
    }
    self visionsetnakedforplayer("", fadetime);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1035
// Size: 0x3a
function init_visionsetnight() {
    if (isusingmatchrulesdata()) {
        nvgVisionSet = getmatchrulesdata("commonOption", "nvgVisionSet");
        visionsetnight(nvgVisionSet);
    } else {
        visionsetnight("iw9_mp_nvg_base_color");
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1076
// Size: 0x23
function overridevisionsetnightforlevel(var_f3c168134a5ddae7) {
    /#
        assertex(isdefined(var_f3c168134a5ddae7), "New VisionSet must be passed to function");
    #/
    visionsetnight(var_f3c168134a5ddae7);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a0
// Size: 0xae
function getuniqueid() {
    if (!isdefined(self.pers)) {
        self.pers = [];
    }
    if (isdefined(self.pers["guid"])) {
        return self.pers["guid"];
    }
    var_14ef0ace56787531 = self getguid();
    if (var_14ef0ace56787531 == "0000000000000000") {
        if (isdefined(level.guidgen)) {
            level.guidgen++;
        } else {
            level.guidgen = 1;
        }
        var_14ef0ace56787531 = "script" + level.guidgen;
    }
    self.pers["guid"] = var_14ef0ace56787531;
    return self.pers["guid"];
}

// Namespace player/namespace_7e17181d03156026
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1156
// Size: 0x2e
function getplayersinradius(origin, radius, var_beb392bbb338d308, var_24ee99fa6d091c2a) {
    return namespace_f8065cafc523dba5::getplayersinradius(origin, radius, var_beb392bbb338d308, var_24ee99fa6d091c2a);
}

// Namespace player/namespace_7e17181d03156026
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x118c
// Size: 0x17f
function getplayersinradiusview(origin, radius, var_beb392bbb338d308, var_24ee99fa6d091c2a) {
    var_305f0639560a5707 = [];
    var_e965bce0774276b4 = getplayersinradius(origin, radius, var_beb392bbb338d308, var_24ee99fa6d091c2a);
    foreach (player in var_e965bce0774276b4) {
        var_eab3e7369809e8cc = undefined;
        tracepoints = [0:player gettagorigin("j_head"), 1:player gettagorigin("j_mainroot"), 2:player gettagorigin("tag_origin")];
        for (i = 0; i < tracepoints.size; i++) {
            if (!namespace_2a184fc4902783dc::ray_trace_passed(origin, tracepoints[i], level.characters, namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 1))) {
                continue;
            }
            if (!isdefined(var_eab3e7369809e8cc)) {
                var_305f0639560a5707[var_305f0639560a5707.size] = spawnstruct();
                var_305f0639560a5707[var_305f0639560a5707.size - 1].player = player;
                var_305f0639560a5707[var_305f0639560a5707.size - 1].visiblelocations = [];
                var_eab3e7369809e8cc = 1;
            }
            var_305f0639560a5707[var_305f0639560a5707.size - 1].visiblelocations[var_305f0639560a5707[var_305f0639560a5707.size - 1].visiblelocations.size] = tracepoints[i];
        }
    }
    return var_305f0639560a5707;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1313
// Size: 0x80
function _enablecollisionnotifies(bool) {
    if (!isdefined(self.enabledcollisionnotifies)) {
        self.enabledcollisionnotifies = 0;
    }
    if (bool) {
        if (self.enabledcollisionnotifies == 0) {
            self enablecollisionnotifies(1);
        }
        self.enabledcollisionnotifies++;
    } else {
        if (self.enabledcollisionnotifies == 1) {
            self enablecollisionnotifies(0);
        }
        self.enabledcollisionnotifies--;
    }
    /#
        assert(self.enabledcollisionnotifies >= 0);
    #/
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x139a
// Size: 0x99
function allow_dodge(bool) {
    if (self.loadoutarchetype != "archetype_scout") {
        return;
    }
    if (bool) {
        if (!isdefined(self.disableddodge)) {
            self.disableddodge = 0;
        }
        self.disableddodge--;
        /#
            assert(self.disableddodge >= 0);
        #/
        if (!self.disableddodge) {
            self allowdodge(1);
        }
    } else {
        if (!isdefined(self.disableddodge)) {
            self.disableddodge = 0;
        }
        self.disableddodge++;
        self allowdodge(0);
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143a
// Size: 0x63
function isplayerproxyagent(ent, player) {
    var_873068c8552b41ec = 0;
    if (isagent(ent) && isdefined(ent.agent_type) && ent.agent_type == "playerProxy") {
        if (ent.owner == player) {
            var_873068c8552b41ec = 1;
        }
    }
    return var_873068c8552b41ec;
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14a5
// Size: 0x42
function enableragdollzerog(arg, scale) {
    if (arg) {
        physics_setgravityragdollscalar(scale);
        level.ragdollzerog = 1;
    } else {
        physics_setgravityragdollscalar(1);
        level.ragdollzerog = undefined;
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ee
// Size: 0xd
function isragdollzerog() {
    return istrue(level.ragdollzerog);
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1503
// Size: 0x7e
function _visionsetnaked(visionset, time) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (isai(player)) {
            continue;
        }
        player visionsetnakedforplayer(visionset, time);
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1589
// Size: 0x2aa
function private function_d93211a15c000cd(victim, attacker, var_d198b30dc157c5cd, contentoverride) {
    /#
        assert(isdefined(victim) && isent(victim));
    #/
    deathPos = undefined;
    if (isdefined(victim.origin)) {
        deathPos = victim.origin;
    } else if (isdefined(victim.lastdeathpos)) {
        deathPos = victim.lastdeathpos;
    }
    if (!isdefined(deathPos)) {
        logstring("Undefined deathPos for death ragdoll 3rd person camera.");
        return undefined;
    }
    var_9f18d28ad3fbb53d = undefined;
    if (!isdefined(attacker) || victim == attacker) {
        forwardvector = anglestoforward(victim.angles);
        forwardvector = function_767cea82b001f645(forwardvector);
        var_9f18d28ad3fbb53d = [0:victim];
    } else {
        forwardvector = vectornormalize(deathPos - attacker.origin);
        var_9f18d28ad3fbb53d = [0:victim, 1:attacker];
    }
    baseangles = generateaxisanglesfromforwardvector(forwardvector, (0, 0, 1));
    var_ac59002aa0721741 = 200;
    var_eff05a57ce34e3ea = 30;
    var_519305604d8e28e4 = 360 / var_eff05a57ce34e3ea;
    var_6095efe86105e553 = [];
    for (i = 0; i < var_519305604d8e28e4; i++) {
        var_58f17fbb36dc3c08 = anglestoforward(baseangles + (0, var_eff05a57ce34e3ea * i, 0));
        startposition = deathPos + (0, 0, 12);
        endposition = deathPos + var_58f17fbb36dc3c08 * var_ac59002aa0721741 + (0, 0, 150);
        trace = namespace_2a184fc4902783dc::sphere_trace(startposition, endposition, 2, var_9f18d28ad3fbb53d, contentoverride);
        if (isdefined(trace) && trace["fraction"] > 0.99) {
            var_6095efe86105e553[var_6095efe86105e553.size] = trace["position"];
            if (!istrue(var_d198b30dc157c5cd)) {
                break;
            }
        }
    }
    var_12b614f64a9ba025 = undefined;
    if (var_6095efe86105e553.size > 0) {
        var_12b614f64a9ba025 = var_6095efe86105e553[0];
    } else {
        var_12b614f64a9ba025 = deathPos + anglestoforward(baseangles) * 50 + (0, 0, 80);
    }
    var_50a4e909a80b4aae = vectornormalize(deathPos - var_12b614f64a9ba025);
    var_379de5a38f0e582a = spawnstruct();
    var_379de5a38f0e582a.origin = var_12b614f64a9ba025;
    var_379de5a38f0e582a.angles = vectortoangles(var_50a4e909a80b4aae);
    var_379de5a38f0e582a.distance = var_ac59002aa0721741;
    var_379de5a38f0e582a.var_6095efe86105e553 = var_6095efe86105e553;
    return var_379de5a38f0e582a;
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x183b
// Size: 0xa
function private function_fdff38028c016239() {
    namespace_f8065cafc523dba5::function_fdff38028c016239();
}

// Namespace player/namespace_7e17181d03156026
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184c
// Size: 0x24
function function_6d606d81ea9ab50b(var_81aa39b3e585cd66, var_d198b30dc157c5cd, contentoverride) {
    return namespace_f8065cafc523dba5::function_6d606d81ea9ab50b(var_81aa39b3e585cd66, var_d198b30dc157c5cd);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1878
// Size: 0x1a
function hidehudclear() {
    self.hidehudenabled = undefined;
    self setclientomnvar("ui_hide_hud", 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1899
// Size: 0xa9
function hideminimap(forcehide) {
    if (alwaysshowminimap() && !istrue(forcehide)) {
        return;
    }
    if (!isdefined(self.minimapstatetracker)) {
        self.minimapstatetracker = 0;
    }
    var_5546bbd6b68a186d = self.minimapstatetracker;
    self.minimapstatetracker--;
    if (self.minimapstatetracker < 0) {
        self.minimapstatetracker = 0;
    }
    if (istrue(forcehide) || self.minimapstatetracker == 0 && var_5546bbd6b68a186d > self.minimapstatetracker) {
        self setclientomnvar("ui_hide_minimap", 1);
        if (istrue(forcehide)) {
            self.minimapstatetracker = 0;
        }
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1949
// Size: 0x63
function showminimap() {
    if (!isdefined(self.minimapstatetracker)) {
        self.minimapstatetracker = 0;
    }
    var_5546bbd6b68a186d = self.minimapstatetracker;
    self.minimapstatetracker++;
    if (self.minimapstatetracker == 1 && var_5546bbd6b68a186d < self.minimapstatetracker) {
        self setclientomnvar("ui_hide_minimap", 0);
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b3
// Size: 0xd
function alwaysshowminimap() {
    return istrue(level.minimaponbydefault);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c8
// Size: 0x42
function isfemale() {
    return isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female";
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a12
// Size: 0xca
function getlowestclientnum(players, var_e1fea15ff7126a10) {
    var_f08bc22aabb76cc0 = undefined;
    /#
        assertex(isdefined(players), "getLowestClientNum: Players array is undefined.");
    #/
    foreach (player in players) {
        if (player.team != "spectator" && player.team != "codcaster" && (!var_e1fea15ff7126a10 || player namespace_f8065cafc523dba5::_isalive())) {
            if (!isdefined(var_f08bc22aabb76cc0) || player getentitynumber() < var_f08bc22aabb76cc0) {
                var_f08bc22aabb76cc0 = player getentitynumber();
            }
        }
    }
    return var_f08bc22aabb76cc0;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae4
// Size: 0xda
function setusingremote(remotename) {
    if (isdefined(self.carryicon)) {
        self.carryicon.alpha = 0;
    }
    /#
        assert(!isusingremote());
    #/
    self.usingremote = remotename;
    if (namespace_32b635fd0594e0cc::function_258c5e445c8b7f80()) {
        val::set("usingRemote", "nvg", 0);
    }
    val::set("usingRemote", "vehicle_use", 0);
    val::set("usingRemote", "crate_use", 0);
    val::set("usingRemote", "offhand_weapons", 0);
    val::set("usingRemote", "ads", 0);
    val::set("usingRemote", "ascender_use", 0);
    namespace_e765f0aad2368473::enableloopingcoughaudiosupression();
    self setclientomnvar("ui_using_killstreak_remote", 1);
    self notify("using_remote");
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc5
// Size: 0x1b
function getremotename() {
    /#
        assert(isusingremote());
    #/
    return self.usingremote;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be8
// Size: 0x74
function clearusingremote(var_2c111f02d48e2671) {
    val::function_c9d0b43701bdba00("usingRemote");
    namespace_e765f0aad2368473::disableloopingcoughaudiosupression();
    if (isdefined(self.carryicon)) {
        self.carryicon.alpha = 1;
    }
    self.usingremote = undefined;
    if (!isdefined(var_2c111f02d48e2671)) {
        _freezecontrols(0, undefined, "usingRemote");
    }
    self setclientomnvar("ui_using_killstreak_remote", 0);
    self notify("stopped_using_remote");
}

// Namespace player/namespace_7e17181d03156026
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c63
// Size: 0x21d
function _freezecontrols(frozen, force, debug) {
    if (!isdefined(self.pers)) {
        return;
    }
    if (!isdefined(self.pers["controllerFreezeStack"])) {
        self.pers["controllerFreezeStack"] = 0;
        self.pers["controllerFreezeDebug"] = [];
    }
    if (frozen) {
        /#
            assert(!isdefined(force));
        #/
        self.pers["controllerFreezeStack"]++;
    } else if (istrue(force)) {
        self.pers["controllerFreezeStack"] = 0;
    } else {
        self.pers["controllerFreezeStack"]--;
    }
    if (isdefined(debug)) {
        if (getdvarint(@"hash_fc8a67f104cc90a6", 0)) {
            logstring("IW9-676465: Player " + self.name + " called _freezeControls( " + frozen + ", " + istrue(force) + ", "" + debug + "" )");
        }
        if (frozen) {
            if (!isdefined(self.pers["controllerFreezeDebug"][debug])) {
                self.pers["controllerFreezeDebug"][debug] = 0;
            }
            self.pers["controllerFreezeDebug"][debug]++;
        } else if (istrue(force)) {
            self.pers["controllerFreezeDebug"] = [];
        } else if (!isdefined(self.pers["controllerFreezeDebug"][debug]) || self.pers["controllerFreezeDebug"][debug] == 0) {
            /#
                println("nvg" + debug + "any");
            #/
        } else {
            self.pers["controllerFreezeDebug"][debug]--;
            if (self.pers["controllerFreezeDebug"][debug] == 0) {
                self.pers["controllerFreezeDebug"][debug] = undefined;
            }
        }
    }
    if (self.pers["controllerFreezeStack"] <= 0) {
        self.pers["controllerFreezeStack"] = 0;
        self freezecontrols(0);
        self.controlsfrozen = 0;
    } else {
        self freezecontrols(1);
        self.controlsfrozen = 1;
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e87
// Size: 0x14c
function function_5471a04faad16a00() {
    if (!isdefined(self.pers)) {
        return;
    }
    if (!isdefined(self.pers["controllerFreezeStack"])) {
        self.pers["controllerFreezeStack"] = 0;
        self.pers["controllerFreezeDebug"] = [];
    }
    if (self.pers["controllerFreezeStack"] <= 0) {
        self.pers["controllerFreezeStack"] = 0;
        self freezecontrols(0);
        self.controlsfrozen = 0;
    } else {
        self freezecontrols(1);
        self.controlsfrozen = 1;
        if (getdvarint(@"hash_fc8a67f104cc90a6", 0)) {
            var_d1d0a8a55841e44c = "";
            if (isdefined(self.pers["controllerFreezeDebug"])) {
                foreach (context, var_e08b864f74e95717 in self.pers["controllerFreezeDebug"]) {
                    var_d1d0a8a55841e44c = var_d1d0a8a55841e44c + context + "=" + var_e08b864f74e95717 + " | ";
                }
            }
            logstring("IW9-676465: Player " + self.name + " was frozen after a _refreshFreezeControls(). Freeze Debug Stack: " + var_d1d0a8a55841e44c);
        }
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fda
// Size: 0xdb
function function_8213d31f7a3c32e2() {
    stacksize = 0;
    if (isdefined(self.pers["controllerFreezeStack"])) {
        stacksize = self.pers["controllerFreezeStack"];
    }
    if (stacksize <= 0) {
        return;
    }
    var_d1d0a8a55841e44c = "";
    if (isdefined(self.pers["controllerFreezeDebug"])) {
        foreach (context, var_e08b864f74e95717 in self.pers["controllerFreezeDebug"]) {
            var_d1d0a8a55841e44c = var_d1d0a8a55841e44c + context + "=" + var_e08b864f74e95717 + " | ";
        }
    }
    /#
        println("-" + stacksize + "<unknown string>" + var_d1d0a8a55841e44c);
    #/
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20bc
// Size: 0xe0
function _freezelookcontrols(frozen, force) {
    if (!isdefined(self.pers)) {
        return;
    }
    if (!isdefined(self.pers["controllerLookFreezeStack"])) {
        self.pers["controllerLookFreezeStack"] = 0;
    }
    if (frozen) {
        /#
            assert(!isdefined(force));
        #/
        self.pers["controllerLookFreezeStack"]++;
    } else if (istrue(force)) {
        self.pers["controllerLookFreezeStack"] = 0;
    } else {
        self.pers["controllerLookFreezeStack"]--;
    }
    if (self.pers["controllerLookFreezeStack"] <= 0) {
        self.pers["controllerLookFreezeStack"] = 0;
        self freezelookcontrols(0);
        self.lookcontrolsfrozen = 0;
    } else {
        self freezelookcontrols(1);
        self.lookcontrolsfrozen = 1;
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a3
// Size: 0x6c
function getplayerforguid(guid) {
    foreach (player in level.players) {
        if (player.guid == guid) {
            return player;
        }
    }
    return undefined;
}

// Namespace player/namespace_7e17181d03156026
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2217
// Size: 0xb4
function set_temp_energy_restore_rate(var_a693d55954af1208, var_9a4c48942aa8c4d1, time, var_4e846c387c082c5e) {
    var_4c1e617deaa58718 = self energy_getrestorerate(var_a693d55954af1208);
    self.temprateset = 1;
    /#
        assertex(var_4c1e617deaa58718 != var_9a4c48942aa8c4d1, "Attempting to set temp recharge rate same as default rate.");
    #/
    self energy_setrestorerate(var_a693d55954af1208, var_9a4c48942aa8c4d1);
    if (!isdefined(var_4e846c387c082c5e) || !var_4e846c387c082c5e) {
        wait(time);
    } else {
        /#
            assertex(var_9a4c48942aa8c4d1 > 0, "attempted to set a zero restore rate until full");
        #/
        var_f91d73bcc743d785 = self energy_getmax(var_a693d55954af1208);
        for (;;) {
            for (;;) {
                if (self energy_getenergy(var_a693d55954af1208) >= var_f91d73bcc743d785) {
                    break;
                }
            }
        }
    }
    self energy_setrestorerate(var_a693d55954af1208, var_4c1e617deaa58718);
    self.temprateset = 0;
}

// Namespace player/namespace_7e17181d03156026
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x22d2
// Size: 0xb4
function set_temp_energy_rest_time(var_a693d55954af1208, tempresttime, time, var_4e846c387c082c5e) {
    var_25c4d960831fd0a1 = self energy_getresttimems(var_a693d55954af1208);
    self.tempresttime = 1;
    /#
        assertex(var_25c4d960831fd0a1 != tempresttime, "Attempting to set temp rest Time same as default.");
    #/
    self energy_setresttimems(var_a693d55954af1208, tempresttime);
    if (!isdefined(var_4e846c387c082c5e) || !var_4e846c387c082c5e) {
        wait(time);
    } else {
        /#
            assertex(tempresttime > 0, "attempted to set a zero rest time until full");
        #/
        var_f91d73bcc743d785 = self energy_getmax(var_a693d55954af1208);
        for (;;) {
            for (;;) {
                if (self energy_getenergy(var_a693d55954af1208) >= var_f91d73bcc743d785) {
                    break;
                }
            }
        }
    }
    self energy_setresttimems(var_a693d55954af1208, var_25c4d960831fd0a1);
    self.tempresttime = 0;
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238d
// Size: 0x3d
function _enableignoreme() {
    if (!isdefined(self.enabledignoreme)) {
        self.enabledignoreme = 0;
    }
    if (self.enabledignoreme == 0) {
        self.ignoreme = 1;
    }
    self.enabledignoreme++;
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d1
// Size: 0x4d
function _disableignoreme() {
    /#
        assert(isdefined(self.enabledignoreme) && self.enabledignoreme > 0, "_disableIgnoreMe when ignoreme is already disabled.");
    #/
    if (self.enabledignoreme == 1) {
        self.ignoreme = 0;
    }
    self.enabledignoreme--;
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2425
// Size: 0x17
function _resetenableignoreme() {
    self.enabledignoreme = undefined;
    self.ignoreme = 0;
}

// Namespace player/namespace_7e17181d03156026
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2443
// Size: 0xd8
function watchbuttonpressed(key, commanddown, commandup, var_833370df65011bab) {
    if (!isdefined(self.buttonspressed)) {
        self.buttonspressed = [];
    }
    if (!isdefined(self.buttonspressed[key])) {
        struct = spawnstruct();
        struct.player = self;
        struct.key = key;
        struct.commanddown = commanddown;
        struct.commandup = commandup;
        struct.notifydown = key + "_buttonDown";
        struct.notifyup = key + "_buttonUp";
        struct.pressed = istrue(var_833370df65011bab);
        self.buttonspressed[key] = struct;
        struct thread watchbuttonpressedinternal();
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2522
// Size: 0x41
function getbuttonpressed(key) {
    if (!isdefined(self.buttonspressed)) {
        return 0;
    }
    if (!isdefined(self.buttonspressed[key])) {
        return 0;
    }
    return self.buttonspressed[key].pressed;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x256b
// Size: 0x4d
function watchbuttonpressedend(key) {
    if (!isdefined(self) || !isdefined(self.buttonspressed) || self.buttonspressed[key]) {
        return;
    }
    self.buttonspressed[key] notify("watchButtonPressedEnd");
    self.buttonspressed[key] = undefined;
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25bf
// Size: 0x96
function watchbuttonpressedinternal() {
    self.player endon("disconnect");
    self endon("watchButtonPressedEnd");
    while (1) {
        self.down = 0;
        self.up = 0;
        childthread watchbuttondown();
        childthread watchbuttonup();
        self waittill("start_race");
        waittillframeend();
        self notify("end_race");
        if (self.down && self.up) {
            continue;
        }
        if (self.down) {
            self.pressed = 1;
        } else {
            self.pressed = 0;
        }
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265c
// Size: 0x52
function watchbuttondown() {
    self endon("end_race");
    self.player notifyonplayercommand(self.notifydown, self.commanddown);
    self.player waittill(self.notifydown);
    self.down = 1;
    self notify("start_race");
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b5
// Size: 0x52
function watchbuttonup() {
    self endon("end_race");
    self.player notifyonplayercommand(self.notifyup, self.commandup);
    self.player waittill(self.notifyup);
    self.up = 1;
    self notify("start_race");
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x270e
// Size: 0x22
function watchbuttonpressendondisconnect() {
    self endon("watchButtonPressedEnd");
    self.player waittill("disconnect");
    self notify("watchButtonPressedEnd");
}

// Namespace player/namespace_7e17181d03156026
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2737
// Size: 0x92
function _setdof_internal(nearstart, nearend, farstart, farend, nearblur, farblur) {
    if (1) {
        return;
    }
    if (!isdefined(self)) {
        return;
    }
    nearstart = max(nearstart, 0);
    nearend = clamp(nearend, 1, 9994);
    farstart = clamp(farstart, 2, 9998);
    farend = clamp(farend, 3, 9999);
    if (farstart > 9994) {
        farblur = 0;
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27d0
// Size: 0x640
function setdof_dynamic() {
    self endon("death_or_disconnect");
    setdof_default();
    if (isai(self)) {
        return;
    }
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle", 3:"physicscontents_characterproxy", 4:"physicscontents_glass", 5:"physicscontents_itemclip"];
    contentoverride = physics_createcontents(content);
    var_8d727bc70842a709 = [0:"physicscontents_characterproxy"];
    var_30d537ea3164e799 = physics_createcontents(var_8d727bc70842a709);
    var_1c1624bd5cbdd4d2 = 1;
    var_6e047c983826ae33 = 1;
    var_2e3c1d928388c537 = cos(27);
    var_a906be9cea201732 = 1;
    var_641ef3fc1ef694a5 = 0;
    var_3206c3880f4b4d7 = [];
    var_3206c3880f4b4d7["geo"] = spawnstruct();
    var_3206c3880f4b4d7["geo"].nearstartfactor = getdvarfloat(@"hash_477d20ac52a6d418", 0.01);
    var_3206c3880f4b4d7["geo"].nearendfactor = getdvarfloat(@"hash_e3404a5a9ae5315d", 0.95);
    var_3206c3880f4b4d7["geo"].farstartfactor = getdvarfloat(@"hash_3207700a54cd601", 1.5);
    var_3206c3880f4b4d7["geo"].farendfactor = getdvarfloat(@"hash_db3504caf0e15404", 2.5);
    var_3206c3880f4b4d7["geo"].nearblur = getdvarfloat(@"hash_ae45baa306e4ae81", 3.9);
    var_3206c3880f4b4d7["geo"].farblur = getdvarfloat(@"hash_8bc87003c9fc085e", 2.25);
    var_3206c3880f4b4d7["interest"] = spawnstruct();
    var_3206c3880f4b4d7["interest"].nearstartfactor = getdvarfloat(@"hash_a021d23278c7d20a", 0.01);
    var_3206c3880f4b4d7["interest"].nearendfactor = getdvarfloat(@"hash_cdbd913c101a27bf", 0.95);
    var_3206c3880f4b4d7["interest"].farstartfactor = getdvarfloat(@"hash_6a3b9b7e711c8173", 1.5);
    var_3206c3880f4b4d7["interest"].farendfactor = getdvarfloat(@"hash_5e226882a6c7a446", 2.5);
    var_3206c3880f4b4d7["interest"].nearblur = getdvarfloat(@"hash_725177713eaa11f3", 7);
    var_3206c3880f4b4d7["interest"].farblur = getdvarfloat(@"hash_d9ee3b42f6373034", 3.5);
    while (1) {
        waitframe();
        var_6ac13f02fe0dad34 = "geo";
        if (istrue(self.usingcustomdof)) {
            continue;
        }
        var_a519a2a30c26b6da = self playerads() > 0.9;
        if (var_a906be9cea201732 && !var_a519a2a30c26b6da) {
            if (var_641ef3fc1ef694a5) {
                var_641ef3fc1ef694a5 = 0;
                _setdof_internal(0, 0, 512, 512, 4, 0);
            }
            continue;
        }
        startpos = self geteye();
        viewangles = self getplayerangles();
        fwd = anglestoforward(viewangles);
        disttotarget = -1;
        neardist = undefined;
        fardist = undefined;
        var_752873f0ea3f37f9 = undefined;
        tracedist = undefined;
        if (var_1c1624bd5cbdd4d2) {
            bestdot = 0;
            foreach (enemy in level.players) {
                if (!namespace_f8065cafc523dba5::playersareenemies(self, enemy)) {
                    continue;
                }
                if (!enemy namespace_f8065cafc523dba5::_isalive()) {
                    continue;
                }
                enemypos = enemy geteye();
                var_d7df12f0ec1c913a = vectordot(fwd, vectornormalize(enemypos - startpos));
                if (var_d7df12f0ec1c913a < var_2e3c1d928388c537) {
                    continue;
                }
                dist = distance(startpos, enemypos);
                if (!isdefined(neardist) || dist < neardist) {
                    if (enemy sightconetrace(startpos, self) > 0) {
                        neardist = dist;
                    }
                }
                if (!isdefined(fardist) || dist > fardist) {
                    if (enemy sightconetrace(startpos, self) > 0) {
                        fardist = dist;
                    }
                }
            }
        }
        endpos = startpos + fwd * 10000;
        trace = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, 0.1, self, contentoverride, 0);
        tracedist = distance(startpos, trace["position"]);
        var_8c685a74e876c0fd = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, 20, self, var_30d537ea3164e799, 0);
        var_8b39d5984da1dc7f = var_8c685a74e876c0fd["entity"];
        var_850a0d10678de336 = isdefined(var_8b39d5984da1dc7f) && isplayer(var_8b39d5984da1dc7f) && namespace_f8065cafc523dba5::playersareenemies(self, var_8b39d5984da1dc7f);
        var_59131f90f8665fae = var_850a0d10678de336 && var_8b39d5984da1dc7f sightconetrace(startpos, self) > 0;
        if (!isdefined(neardist) || tracedist < neardist) {
            neardist = tracedist;
        }
        if (!isdefined(fardist) || tracedist > fardist) {
            fardist = tracedist;
        }
        var_641ef3fc1ef694a5 = 1;
        var_81ec67164be866bd = max(abs(neardist - fardist) * 0.5, 300);
        nearstart = 0;
        nearend = max(neardist - 50, 1);
        farstart = fardist + 50;
        farend = farstart + var_81ec67164be866bd;
        nearblur = ter_op(var_59131f90f8665fae, 6, 4);
        farblur = ter_op(var_59131f90f8665fae, 2.5, 1.25);
        _setdof_internal(nearstart, nearend, farstart, farend, nearblur, farblur);
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e17
// Size: 0x23
function setdof_killer() {
    self endon("disconnect");
    self.usingcustomdof = 1;
    setdof_killer_update();
    setdof_default();
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e41
// Size: 0x1bf
function setdof_killer_update() {
    self endon("disconnect");
    self endon("death_delay_finished");
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle", 3:"physicscontents_characterproxy", 4:"physicscontents_glass", 5:"physicscontents_itemclip"];
    contentoverride = physics_createcontents(content);
    var_844b0a6ccabe8587 = vectornormalize(self.origin - self.lastkilledby.origin);
    startpos = self.origin + (0, 0, 42);
    endpos = startpos + var_844b0a6ccabe8587 * 120;
    trace = namespace_2a184fc4902783dc::sphere_trace(startpos, endpos, 2, self, contentoverride, 0);
    var_a5ed8689ca0dddbb = trace["position"];
    while (istrue(self.usingcustomdof)) {
        if (!isdefined(self.lastkilledby)) {
            break;
        }
        disttotarget = distance(var_a5ed8689ca0dddbb, self.lastkilledby.origin);
        nearstart = 0;
        nearend = max(disttotarget - 12, 1);
        farstart = disttotarget + 12;
        farend = farstart + 50;
        nearblur = 8;
        farblur = 4.5;
        _setdof_internal(nearstart, nearend, farstart, farend, nearblur, farblur);
        waitframe();
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3007
// Size: 0x1f
function setdof_default() {
    self.usingcustomdof = 0;
    _setdof_internal(0, 0, 512, 512, 4, 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x302d
// Size: 0x20
function setdof_spectator() {
    self.usingcustomdof = 1;
    _setdof_internal(0, 0, 512, 512, 4, 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3054
// Size: 0x25
function setdof_infil() {
    self.usingcustomdof = 1;
    _setdof_internal(0, 128, 512, 4000, 6, 1.8);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3080
// Size: 0x26
function setdof_apache() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 1000, 6500, 7, 3.5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30ad
// Size: 0x26
function setdof_cruisethird() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 1000, 6500, 7, 3.5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30da
// Size: 0x22
function setdof_cruisefirst() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 1000, 1000, 7, 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3103
// Size: 0x26
function setdof_tank() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 120, 1000, 6500, 7, 3.5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3130
// Size: 0x25
function setdof_thirdperson() {
    self.usingcustomdof = 1;
    _setdof_internal(0, 110, 512, 4096, 6, 1.8);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x315c
// Size: 0x22
function setdof_gunship() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 1000, 1000, 7, 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3185
// Size: 0x23
function setdof_gunship_zoom() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 1000, 6500, 10, 5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31af
// Size: 0x26
function setdof_scrambler_strength_1() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 1000, 5000, 4, 3.5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31dc
// Size: 0x29
function setdof_scrambler_strength_2() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 800, 4000, 4.5, 3.5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x320c
// Size: 0x26
function setdof_scrambler_strength_3() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 600, 3000, 5, 3.5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3239
// Size: 0x29
function setdof_scrambler_strength_4() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 500, 2000, 5.5, 3.5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3269
// Size: 0x26
function setdof_scrambler_strength_5() {
    self.usingcustomdof = 1;
    _setdof_internal(10, 80, 400, 1000, 6, 3.5);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3296
// Size: 0xa
function clearkillcamstate() {
    namespace_f8065cafc523dba5::clearkillcamstate();
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32a7
// Size: 0x44
function isinkillcam() {
    if (isai(self)) {
        return 0;
    }
    if (self.spectatekillcam) {
        if (self.forcespectatorclient == -1 && self.killcamentity == -1) {
            return 0;
        }
    }
    return self.spectatekillcam;
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f3
// Size: 0x86
function waittillrecoveredhealth(time, interval) {
    self endon("death_or_disconnect");
    fullhealthtime = 0;
    if (!isdefined(interval)) {
        interval = 0.05;
    }
    if (!isdefined(time)) {
        time = 0;
    }
    while (1) {
        if (self.health != self.maxhealth) {
            fullhealthtime = 0;
        } else {
            fullhealthtime = fullhealthtime + interval;
        }
        wait(interval);
        if (self.health == self.maxhealth && fullhealthtime >= time) {
            break;
        }
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3381
// Size: 0x42
function _setsuit(suit) {
    if (isdefined(self.suit) && self.suit == suit) {
        return;
    }
    self setsuit(suit);
    self.suit = suit;
    namespace_46e942396566f2da::function_7c62c6c14aba289b();
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ca
// Size: 0x51
function setwind(value, var_5734778d7f1b6e6f) {
    if (!self isscriptable() || !self getscriptablehaspart("wind") || !isreallyalive(self)) {
        return;
    }
    self.manualoverridewindmaterial = var_5734778d7f1b6e6f;
    self setscriptablepartstate("wind", value, 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3422
// Size: 0x14
function printspawnmessage(message) {
    namespace_f8065cafc523dba5::printspawnmessage(message);
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343d
// Size: 0xfd
function CodcasterSetPlayerStatusEffect(category, duration) {
    if (!isplayer(self)) {
        return;
    }
    effecttype = undefined;
    switch (category) {
    case #"hash_a68c414683465b09":
        effecttype = 0;
        break;
    case #"hash_23f2c68a2fc41281":
        effecttype = 2;
        break;
    case #"hash_fb36696c0708bf42":
        effecttype = 3;
        break;
    case #"hash_ceb098150f024a39":
        effecttype = 1;
        break;
    case #"hash_ff0da8f68d7b83f3":
        effecttype = 4;
        break;
    case #"hash_1f1d7b3efcb82111":
        effecttype = 5;
        break;
    }
    if (isdefined(effecttype)) {
        var_c8e256020171797a = 0;
        if (effecttype != 1 && effecttype != 4 && effecttype != 5) {
            var_c8e256020171797a = namespace_475c6252a691eb85::function_56ad1b98a0613f8a("specialty_tac_resist");
        }
        if (duration != -1) {
            duration = int(duration * 1000);
        }
        self function_98a42c6d882aae10(effecttype, duration, gettime() + duration, var_c8e256020171797a);
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3541
// Size: 0xbf
function isincombat() {
    isshooting = 0;
    if (isdefined(self.lastshotfiredtime)) {
        var_32d023e8d6030ee3 = 0;
        if (!weaponisauto(self.currentprimaryweapon)) {
            var_c34a63b63e5e6854 = self function_c26a2350f081dc6(self.currentprimaryweapon);
            var_32d023e8d6030ee3 = var_c34a63b63e5e6854 + max(getdvarint(@"hash_f6ed71d9c8bdb8c9", 0), 150);
        } else {
            var_32d023e8d6030ee3 = getdvarint(@"hash_f6ed71d9c8bdb8c9", 0);
        }
        currenttime = gettime();
        isshooting = self.lastshotfiredtime + var_32d023e8d6030ee3 >= currenttime;
    }
    return isshooting || self ismeleeing() || self isthrowinggrenade() || function_9612d351d714efb1();
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3608
// Size: 0xcf
function function_9612d351d714efb1() {
    var_9612d351d714efb1 = 0;
    if (isdefined(self.attackers)) {
        currenttime = gettime();
        var_fba4e93698c9c865 = 0;
        var_9c1c82123f62e38c = getdvarint(@"hash_20e694002fcd35cc", 2000);
        foreach (guid, attacker in self.attackers) {
            var_fba4e93698c9c865 = currenttime - self.attackerdata[guid].lasttimedamaged;
            var_9612d351d714efb1 = isdefined(attacker) && var_fba4e93698c9c865 < var_9c1c82123f62e38c;
            if (var_9612d351d714efb1) {
                break;
            }
        }
    }
    return var_9612d351d714efb1;
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36df
// Size: 0x1e
function setbeingrevivedinternal(var_14dd46408efef0f3) {
    self.beingrevived = var_14dd46408efef0f3;
    self setbeingrevived(var_14dd46408efef0f3);
}

// Namespace player/namespace_7e17181d03156026
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3704
// Size: 0x1b
function getbeingrevivedinternal() {
    return istrue(self.beingrevived) || istrue(self.isselfreviving);
}

// Namespace player/namespace_7e17181d03156026
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3727
// Size: 0x50
function function_d80ebbf694920c5f(notifyname, commandname, var_e86de67bf72081c, var_3fd755a4695815a9, endons, inputtype, var_a5b5522433ca23bc) {
    thread function_bce0309beb222741(notifyname, commandname, var_e86de67bf72081c, var_3fd755a4695815a9, endons, 0, undefined, inputtype, 0, undefined, var_a5b5522433ca23bc);
}

// Namespace player/namespace_7e17181d03156026
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377e
// Size: 0x62
function function_bbf44d52ca2820cd(notifyname, commandname, var_e86de67bf72081c, var_3fd755a4695815a9, endons, var_f61019386e1b1034, var_52273a4095c18970, inputtype, var_a5b5522433ca23bc) {
    thread function_bce0309beb222741(notifyname, commandname, var_e86de67bf72081c, var_3fd755a4695815a9, endons, var_f61019386e1b1034, var_52273a4095c18970, inputtype, 0, undefined, var_a5b5522433ca23bc);
}

// Namespace player/namespace_7e17181d03156026
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e7
// Size: 0x5a
function function_4b6858706980b154(notifyname, commandname, var_e86de67bf72081c, var_3fd755a4695815a9, endons, inputtype, var_5bbf4defc70826d0, var_a5b5522433ca23bc) {
    thread function_bce0309beb222741(notifyname, commandname, var_e86de67bf72081c, var_3fd755a4695815a9, endons, 0, undefined, inputtype, 1, var_5bbf4defc70826d0, var_a5b5522433ca23bc);
}

// Namespace player/namespace_7e17181d03156026
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3848
// Size: 0x1c2
function function_bce0309beb222741(notifyname, commandname, var_e86de67bf72081c, var_3fd755a4695815a9, endons, var_f61019386e1b1034, var_52273a4095c18970, inputtype, var_cbdfe397ae48520e, var_5bbf4defc70826d0, var_a5b5522433ca23bc) {
    level endon("game_ended");
    self endon("disconnect");
    thread function_ea10736811b65b12(notifyname, endons);
    var_3fd755a4695815a9 = ter_op(isdefined(var_3fd755a4695815a9), var_3fd755a4695815a9, self);
    var_f61019386e1b1034 = ter_op(isdefined(var_f61019386e1b1034), var_f61019386e1b1034, 0);
    inputtype = ter_op(isdefined(inputtype), inputtype, "any");
    var_cbdfe397ae48520e = ter_op(isdefined(var_cbdfe397ae48520e), var_cbdfe397ae48520e, 0);
    var_5bbf4defc70826d0 = ter_op(isdefined(var_5bbf4defc70826d0), var_5bbf4defc70826d0, 0);
    var_a5b5522433ca23bc = ter_op(isdefined(var_a5b5522433ca23bc), var_a5b5522433ca23bc, 0);
    if (isbot(self) && !var_a5b5522433ca23bc) {
        return;
    }
    /#
        assertex(isdefined(notifyname) && isdefined(commandname) && isdefined(var_e86de67bf72081c), "setupDoActionOnCommand() has undefined mandatory arguments.");
    #/
    var_489e7e15f93639d9 = "+" + commandname;
    var_f8f485e1aa3cbc93 = "-" + commandname;
    var_2753b81fc59d0999 = notifyname + "_press";
    var_3cf1bee5c30f7dff = notifyname + "_release";
    var_93c853099fdfbb57 = var_cbdfe397ae48520e || var_f61019386e1b1034 > 0;
    if (!isbot(self)) {
        self notifyonplayercommand(var_2753b81fc59d0999, var_489e7e15f93639d9);
        if (var_93c853099fdfbb57) {
            self notifyonplayercommand(var_3cf1bee5c30f7dff, var_f8f485e1aa3cbc93);
        }
    }
    function_22e92f7d1f36f97b(notifyname, var_e86de67bf72081c, var_3fd755a4695815a9, var_f61019386e1b1034, var_52273a4095c18970, inputtype, var_cbdfe397ae48520e, var_5bbf4defc70826d0, var_a5b5522433ca23bc);
    if (isdefined(var_52273a4095c18970)) {
        self thread [[ var_52273a4095c18970 ]](var_3fd755a4695815a9, 0, 0);
    }
    if (!isbot(self)) {
        self notifyonplayercommandremove(var_2753b81fc59d0999, var_489e7e15f93639d9);
        if (var_93c853099fdfbb57) {
            self notifyonplayercommandremove(var_3cf1bee5c30f7dff, var_f8f485e1aa3cbc93);
        }
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a11
// Size: 0x150
function function_efc7b5130b976314(player) {
    if (isdefined(level.lootleaders) && array_contains(level.lootleaders, player)) {
        if (isdefined(player.attached_bag)) {
            stopfxontag(level._effect["vfx_br_cashLeaderBag"], player, "j_bag_left");
            var_d8943d63ec472996 = getmatchrulesdata("brData", "plunderModelType");
            modelname = "accessory_money_bag_large_closed_player";
            switch (var_d8943d63ec472996) {
            case #"hash_59b8e9d05b31ff9":
                modelname = "accessory_money_bag_large_closed_player_plunder";
                break;
            }
            player hidepart("j_bag_left", modelname);
        }
    }
    if ((namespace_cd0b2d039510b38d::getsubgametype() == "dmz" || namespace_cd0b2d039510b38d::getsubgametype() == "exgm") && isdefined(player.attached_bag)) {
        player.var_7af7c88d975503ad = player.attached_bag;
        player namespace_d696adde758cbe79::function_6d569066ac5f3df0();
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "bigctf") {
        player.var_80a77ec6ebdffe2b = player.carryflag;
        player namespace_43c384132c052883::detachflag();
    }
    player namespace_1cd9f6896754adb0::set("hideAttachedModels", "hide_operator_backpack", 1);
    player namespace_1cd9f6896754adb0::set("hideAttachedModels", "show_operator_pet", 0);
}

// Namespace player/namespace_7e17181d03156026
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b68
// Size: 0x194
function function_affaefa6ea1b971d(player) {
    if (isdefined(level.lootleaders) && array_contains(level.lootleaders, player)) {
        if (isdefined(player.attached_bag)) {
            var_d8943d63ec472996 = getmatchrulesdata("brData", "plunderModelType");
            modelname = "accessory_money_bag_large_closed_player";
            switch (var_d8943d63ec472996) {
            case #"hash_59b8e9d05b31ff9":
                modelname = "accessory_money_bag_large_closed_player_plunder";
                break;
            }
            player showpart("j_bag_left", modelname);
            playfxontag(level._effect["vfx_br_cashLeaderBag"], player, "j_bag_left");
        }
    }
    if ((namespace_cd0b2d039510b38d::getsubgametype() == "dmz" || namespace_cd0b2d039510b38d::getsubgametype() == "exgm") && !isdefined(player.attached_bag)) {
        player namespace_d696adde758cbe79::function_c3f3fceeddda6f6(function_53c4c53197386572(player.var_7af7c88d975503ad, "parts_backpack_inventory_small"));
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "bigctf") {
        if (isdefined(player.var_80a77ec6ebdffe2b) && isdefined(player.carryobject)) {
            otherteam = namespace_cd0b2d039510b38d::getotherteam(player.pers["team"])[0];
            player attach(player.var_80a77ec6ebdffe2b, "tag_stowed_back3", 1);
            player.carryflag = level.carryflag[otherteam];
            player.var_80a77ec6ebdffe2b = undefined;
        }
    }
    player namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("hideAttachedModels");
}

// Namespace player/namespace_7e17181d03156026
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d03
// Size: 0x34
function private function_ea10736811b65b12(notifyname, endons) {
    level endon("game_ended");
    self endon("disconnect");
    waittill_any_in_array_return_no_endon_death(endons);
    self notify(notifyname + "_endon");
}

// Namespace player/namespace_7e17181d03156026
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d3e
// Size: 0x7f
function private function_22e92f7d1f36f97b(notifyname, var_e86de67bf72081c, var_3fd755a4695815a9, var_f61019386e1b1034, var_52273a4095c18970, inputtype, var_cbdfe397ae48520e, var_5bbf4defc70826d0, var_a5b5522433ca23bc) {
    level endon("game_ended");
    self endon("disconnect");
    self endon(notifyname + "_endon");
    while (1) {
        function_147c3508c4ff17a0(notifyname, var_e86de67bf72081c, var_3fd755a4695815a9, var_f61019386e1b1034, var_52273a4095c18970, inputtype, var_cbdfe397ae48520e, var_5bbf4defc70826d0, var_a5b5522433ca23bc);
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3dc4
// Size: 0xa1
function private function_147c3508c4ff17a0(notifyname, var_e86de67bf72081c, var_3fd755a4695815a9, var_f61019386e1b1034, var_52273a4095c18970, inputtype, var_cbdfe397ae48520e, var_5bbf4defc70826d0, var_a5b5522433ca23bc) {
    level endon("game_ended");
    self endon("disconnect");
    self endon(notifyname + "_endon");
    if (var_f61019386e1b1034 == 0) {
        self endon(notifyname + "_release");
    }
    function_f4e88a8caf5d63ff(notifyname, var_3fd755a4695815a9, var_f61019386e1b1034, var_52273a4095c18970, inputtype, var_a5b5522433ca23bc);
    if (var_cbdfe397ae48520e) {
        function_f295850252d7414a(notifyname, var_e86de67bf72081c, var_3fd755a4695815a9, var_5bbf4defc70826d0);
    } else {
        self thread [[ var_e86de67bf72081c ]](var_3fd755a4695815a9);
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3e6c
// Size: 0x13c
function private function_f4e88a8caf5d63ff(notifyname, var_3fd755a4695815a9, var_f61019386e1b1034, var_52273a4095c18970, inputtype, var_a5b5522433ca23bc) {
    level endon("game_ended");
    self endon("disconnect");
    self endon(notifyname + "_endon");
    var_563c6b7baaf043fa = var_f61019386e1b1034 == 0;
    var_3f6fd9c606674a97 = isbot(self) && var_a5b5522433ca23bc;
    var_69dc428918a98193 = 0;
    while (!var_69dc428918a98193) {
        if (var_563c6b7baaf043fa) {
            if (!var_3f6fd9c606674a97) {
                self waittill(notifyname + "_press");
            } else {
                waitframe();
            }
            var_69dc428918a98193 = 1;
        } else {
            if (!var_3f6fd9c606674a97) {
                self waittill(notifyname + "_press");
            } else {
                waitframe();
            }
            thread function_53979f2ab653d2dd(notifyname, var_3fd755a4695815a9, var_f61019386e1b1034, var_52273a4095c18970);
            msg = waittill_notify_or_timeout_return(notifyname + "_release", var_f61019386e1b1034);
            var_69dc428918a98193 = msg == "timeout";
        }
        if (var_69dc428918a98193 && inputtype != "any" && !var_3f6fd9c606674a97) {
            if (inputtype == "gamepad_only") {
                var_69dc428918a98193 = self usinggamepad();
            } else if (inputtype == "kbm_only") {
                var_69dc428918a98193 = !self usinggamepad();
            }
        }
        if (!var_69dc428918a98193 && isdefined(var_52273a4095c18970)) {
            self thread [[ var_52273a4095c18970 ]](var_3fd755a4695815a9, 0, 0);
        }
    }
}

// Namespace player/namespace_7e17181d03156026
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3faf
// Size: 0x96
function private function_53979f2ab653d2dd(notifyname, var_3fd755a4695815a9, var_f61019386e1b1034, var_52273a4095c18970) {
    level endon("game_ended");
    self endon("disconnect");
    self endon(notifyname + "_endon");
    self endon(notifyname + "_release");
    if (!isdefined(var_52273a4095c18970)) {
        return;
    }
    progress = 0;
    var_4c727180836420d8 = var_f61019386e1b1034 * 1000;
    while (progress < var_4c727180836420d8) {
        waitframe();
        progress = progress + level.frameduration;
        if (progress < var_4c727180836420d8) {
            self thread [[ var_52273a4095c18970 ]](var_3fd755a4695815a9, progress, 0);
        }
    }
    self thread [[ var_52273a4095c18970 ]](var_3fd755a4695815a9, progress, 1);
}

// Namespace player/namespace_7e17181d03156026
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x404c
// Size: 0x5f
function private function_f295850252d7414a(notifyname, var_e86de67bf72081c, var_3fd755a4695815a9, var_5bbf4defc70826d0) {
    level endon("game_ended");
    self endon("disconnect");
    self endon(notifyname + "_release");
    self endon(notifyname + "_endon");
    while (1) {
        self thread [[ var_e86de67bf72081c ]](var_3fd755a4695815a9);
        if (var_5bbf4defc70826d0 > 0) {
            wait(var_5bbf4defc70826d0);
        } else {
            waitframe();
        }
    }
}

