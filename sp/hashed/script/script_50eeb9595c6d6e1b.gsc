#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using script_35de402efc5acfb3;
#using script_f4e8d02d2f70888;
#using script_433d8f78f7e5fb;
#using script_3212cc02a2700260;
#using script_5d265b4fca61f070;
#using scripts\common\debug.gsc;
#using scripts\engine\math.gsc;

#namespace battlechatter_events;

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d4d
// Size: 0x139
function function_f5154a3d477820d9() {
    if (function_8f59caa9212fcc56()) {
        return;
    }
    if (utility::issp() && !isalive(level.player)) {
        return;
    }
    if (shotrecently(3) && !isdefined(self.battlechatter.lastcombat) || isdefined(self.battlechatter.var_20e68057b05a543)) {
        if (!isdefined(self.battlechatter.lastcombat)) {
            var_971153a5e8911fef = 999;
        } else {
            var_971153a5e8911fef = (gettime() - self.battlechatter.var_20e68057b05a543) / 1000;
        }
        self.battlechatter.lastcombat = gettime();
        self.battlechatter.var_20e68057b05a543 = undefined;
        if (var_971153a5e8911fef > 30) {
            return function_5634ad9c7902c703();
        }
    }
    self.battlechatter.lastcombat = gettime();
    if (isstruct(function_16c83724c6b1446d())) {
        return;
    }
    if (isstruct(function_c5ece4fa44d2894e())) {
        return;
    }
    if (isstruct(function_9b24c93b2bc885cf())) {
        return;
    }
    if (isstruct(function_6de481ebc9a12469())) {
        return;
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e8e
// Size: 0x111
function function_5634ad9c7902c703() {
    other = getclosestfriendlyspeaker();
    if (!isdefined(other)) {
        return;
    }
    if (utility::issp() && (!isdefined(self.enemy) || !isdefined(self.enemy.origin) || istrue(!self canshoot(self.enemy.origin + (0, 0, 40))))) {
        return;
    }
    if (percent_chance(40)) {
        seq = [0.3, "enemy_soldier", &set_target, other, &function_d2b3539e8cdd93e7];
    } else {
        seq = [0.3, "enemy_soldier", &set_target];
    }
    if (percent_chance(65)) {
        seq = array_combine(seq, [other, 0.1, "aquired_target"]);
    }
    function_93b4f17e4a3474b("aquired_target", seq);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10fa7
// Size: 0xbf
function function_d2b3539e8cdd93e7() {
    if (!isdefined(self.speaker) || !isdefined(self.listener) || !isdefined(self.speaker.enemy)) {
        return;
    }
    direction = self.listener get_direction(self.listener.enemy);
    if (!isdefined(direction)) {
        return;
    }
    if (!self.speaker seerecently(self.speaker.enemy, 3)) {
        return [0.4, "neg_target", self.listener, 0.2, direction];
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1106e
// Size: 0x26
function function_6de481ebc9a12469() {
    seq = function_f06047156c190734();
    if (!isdefined(seq)) {
        return;
    }
    function_93b4f17e4a3474b("order_attack", seq);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1109c
// Size: 0xb3
function function_f06047156c190734() {
    other = getclosestfriendlyspeaker();
    if (!isdefined(other)) {
        return;
    }
    other_name = other function_2008b43adf7e18ef();
    if (percent_chance(30)) {
        other_name = 0;
    }
    if (percent_chance(40)) {
        seq = [other_name, "order_attack", other, 0.3, "copy", 0.1, "attacking"];
    } else {
        seq = [other_name, "order_attack", other, 0.2, &function_e5312c6dfa471fdb];
    }
    return seq;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11158
// Size: 0x21
function function_e5312c6dfa471fdb() {
    return ter_op(self.speaker recentlysawenemy(), "aquired_target", "target_covered");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11182
// Size: 0xbe
function function_a06c6f8b2f6d82d0(direction) {
    if (self.enemy isnear(self, level.var_fb605061a3778884)) {
        return;
    }
    if (!function_45f570789ff9a0fd(5, 1)) {
        return;
    }
    if (!isdefined(direction)) {
        direction = get_direction(self.enemy);
    }
    if (!isdefined(direction) || direction == "ahead") {
        return;
    }
    seq = [direction, &set_target];
    other = getclosestfriendlyspeaker();
    if (isdefined(other)) {
        return 0;
    }
    seq = array_combine(seq, [other, 0.1, &function_e5312c6dfa471fdb]);
    function_93b4f17e4a3474b("enemy_direction", seq);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11248
// Size: 0x173
function get_direction(target) {
    if (!isdefined(target) || !isdefined(target.origin) || !isdefined(target.team)) {
        return;
    }
    if (target.origin[2] > self.origin[2] + 100) {
        return "high";
    }
    allies = function_fd9e4cb348a5f283(self.origin, level.var_63a73645a8e030ad, self.team);
    if (self.team == "allies") {
        allies = array_combine(allies, getplayersinrange(self.origin, level.var_798aa343368f724e));
    }
    if (allies.size == 0) {
        return;
    }
    ally_center = get_average_origin(allies);
    combat_forward = vectornormalize(function_7969d683dfc4fb9e(allies));
    var_53b34aadf7b8e731 = vectornormalize(target.origin - ally_center);
    dotproduct = vectordot(var_53b34aadf7b8e731, combat_forward);
    if (dotproduct > 0.95) {
        return "ahead";
    }
    if (dotproduct < -0.1) {
        return "behind";
    }
    right = vectorcross((0, 0, 1), combat_forward);
    dotproduct = vectordot(var_53b34aadf7b8e731, right);
    return ter_op(dotproduct < 0, "right", "left");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x113c4
// Size: 0x19a
function function_a1b5ccd038b58c59(start, end, color, neck_width, head_width, head_length, depthtest, duration) {
    angle = vectortoangles(end - start);
    len = length(end - start);
    if (isdefined(head_length) && head_length <= 1) {
        head_length = len * head_length;
    }
    right = anglestoright(angle);
    forward = anglestoforward(angle);
    neck_width = default_to(neck_width, 2);
    head_width = default_to(head_width, neck_width * 4);
    head_length = default_to(head_length, head_width * 3);
    depthtest = default_to(depthtest, 1);
    duration = default_to(duration, 1);
    head_start = start + forward * (len - head_length);
    arrow = [end];
    arrow[arrow.size] = head_start + right * head_width / 2;
    arrow[arrow.size] = head_start + right * neck_width / 2;
    arrow[arrow.size] = start + right * neck_width / 2;
    arrow[arrow.size] = start - right * neck_width / 2;
    arrow[arrow.size] = head_start - right * neck_width / 2;
    arrow[arrow.size] = head_start - right * head_width / 2;
    for (p = 0; p < arrow.size; p++) {
        /#
            line(arrow[p], arrow[(p + 1) % arrow.size], color, 1, depthtest, duration);
        #/
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11566
// Size: 0x8b
function get_average_origin(guys, max_count) {
    max_count = default_to(max_count, guys.size);
    origins = [];
    foreach (guy in guys) {
        if (origins.size >= max_count) {
            break;
        }
        origins[origins.size] = guy.origin;
    }
    return averagepoint(origins);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x115fa
// Size: 0xac
function function_7969d683dfc4fb9e(guys, max_count) {
    max_count = default_to(max_count, guys.size);
    forwards = [];
    foreach (guy in guys) {
        if (forwards.size >= max_count) {
            break;
        }
        if (isdefined(guy.node)) {
            guy = guy.node;
        }
        forwards[forwards.size] = anglestoforward(guy.angles);
    }
    return averagenormal(forwards);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116af
// Size: 0xe3
function function_8d862c3d37cb8ebd(enemy) {
    if (!isdefined(enemy) || !isdefined(enemy.origin) || !isdefined(enemy.team) || !isai(enemy) || isbot(enemy)) {
        return false;
    }
    if (isdefined(enemy.battlechatter) && istrue(enemy.battlechatter.var_d611e2f69fa1cac4)) {
        return false;
    }
    if (!enemy seerecently(self, 5)) {
        return false;
    }
    var_9d683edc4be7acce = enemy getclosestfriendlyspeaker();
    var_92efd1e1e657aee9 = isalive(var_9d683edc4be7acce) && var_9d683edc4be7acce isnear(enemy, level.var_798aa343368f724e);
    if (!var_92efd1e1e657aee9) {
        return false;
    }
    if (!getplayersinrange(enemy.origin, level.var_63a73645a8e030ad).size > 0) {
        return false;
    }
    return true;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1179b
// Size: 0xef
function function_771bace1bff17684() {
    self endon("death");
    self endon("bcs_stateChange");
    if (is_dead_or_dying(self)) {
        return;
    }
    if (!check_cooldown("target_getting_cover") || !check_cooldown("enemy_getting_cover")) {
        return;
    }
    enemy = self.enemy;
    if (function_8d862c3d37cb8ebd(enemy)) {
        return enemy function_93b4f17e4a3474b("target_getting_cover", ["target_getting_cover"]);
    }
    var_eb835b5fde3371bd = getenemiesinrange();
    if (isdefined(var_eb835b5fde3371bd) && var_eb835b5fde3371bd.size > 0) {
        foreach (enemy_entity in var_eb835b5fde3371bd) {
            if (function_8d862c3d37cb8ebd(enemy_entity)) {
                return enemy_entity function_93b4f17e4a3474b("enemy_getting_cover", ["enemy_getting_cover"]);
            }
        }
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11892
// Size: 0xb4
function function_402ee78fe1df3ace() {
    self endon("death");
    self endon("bcs_stateChange");
    if (is_dead_or_dying(self) || isdefined(self.battlechatter) && istrue(self.battlechatter.var_d611e2f69fa1cac4)) {
        return;
    }
    wait 0.5;
    enemy = self.enemy;
    if (!isdefined(enemy) || !isdefined(enemy.origin) || !isdefined(enemy.team)) {
        return;
    }
    if (!check_cooldown("getting_cover")) {
        return;
    }
    if (!function_45f570789ff9a0fd(5, 1)) {
        return;
    }
    return function_93b4f17e4a3474b("getting_cover", ["getting_cover"]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1194f
// Size: 0x116
function function_c5ece4fa44d2894e() {
    allies = function_fd9e4cb348a5f283(self.origin, level.var_798aa343368f724e, self.team);
    foreach (ally in allies) {
        if (ally == self) {
            continue;
        }
        if (!isdefined(ally.node) || !isdefined(ally.node.type) || ally.node.type == "Exposed 3D" || ally.node.type == "Path 3D") {
            ally_name = ally function_2008b43adf7e18ef();
            return function_93b4f17e4a3474b("ally_exposure", [ally_name, 0.1, "youre_exposed"]);
        }
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a6d
// Size: 0x29
function function_859d741dc99bf1a4() {
    maxhealth = default_to(self.maxhealth, 100);
    return self.health < maxhealth;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11a9f
// Size: 0x86
function function_16c83724c6b1446d(enemy) {
    enemy = default_to(enemy, self.enemy);
    if (!function_45f570789ff9a0fd(5, 1)) {
        return;
    }
    enemy_weapon = enemy get_weapon();
    if (!isdefined(enemy_weapon)) {
        return;
    }
    seg = function_1609ef297b7a32cf(enemy, "target_" + enemy_weapon, "enemy_" + enemy_weapon);
    return function_93b4f17e4a3474b("enemy_weapon", [0.3, seg, &set_target]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11b2e
// Size: 0xe3
function get_weapon() {
    weapon = ter_op(isdefined(self.weapon), self.weapon, self.currentweapon);
    if (!isdefined(weapon)) {
        return;
    }
    if (isarray(weapon)) {
        weapon = weapon[0];
    }
    class = weaponclass(weapon);
    if (!isdefined(class)) {
        return;
    }
    switch (class) {
    case #"hash_fa24dff6bd60a12d":
        return "lmg";
    case #"hash_690c0d6a821b42e":
        return "shotgun";
    case #"hash_6191aaef9f922f96":
        return "sniper";
    case #"hash_61e969dacaaf9881":
    case #"hash_719417cb1de832b6":
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_900cb96c552c5e8e":
    case #"hash_e224d0b635d0dadd":
    default:
        return undefined;
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c19
// Size: 0xbd
function function_9b24c93b2bc885cf() {
    if (!isdefined(self.team) || self.team == "dead") {
        return;
    }
    if (!isdefined(self.battlechatter) || !isdefined(self.battlechatter.countryid) || self.battlechatter.countryid == "PMC") {
        return;
    }
    if (!isdefined(self.voice) || self.voice == #"hash_5f1ef8142f0b6fcb") {
        return;
    }
    other = getclosestfriendlyspeaker(self.team, "combat");
    return function_93b4f17e4a3474b("hostile_burst", "hostile_burst");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11cdf
// Size: 0x55
function function_c666e714b2411844(objweapon) {
    if (isdefined(objweapon) && isdefined(objweapon.classname) && !isnullweapon(objweapon)) {
        if (objweapon.classname == "grenade") {
            return function_f581838ce4328f7a(objweapon);
        } else {
            return objweapon.classname;
        }
    }
    return undefined;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11d3d
// Size: 0x8f
function function_7846ced6c23280a9(type) {
    if (isdefined(type)) {
        switch (type) {
        case #"hash_5d11ac1131cddab1":
        case #"hash_7c03088193266bc4":
            return "use_grenade";
        case #"hash_e042760d17966848":
            return "use_flash";
        case #"hash_e1f6f84e4cd950eb":
            return "use_smoke";
        case #"hash_c9a436974fe60919":
            return "use_molotov";
        case #"hash_61e969dacaaf9881":
            return "use_rpg";
        default:
            break;
        }
    }
    return undefined;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11dd5
// Size: 0x98
function function_e12a23f3c8aa65bb(type) {
    if (isdefined(type)) {
        switch (type) {
        case #"hash_5d11ac1131cddab1":
        case #"hash_7c03088193266bc4":
            return "using_grenade";
        case #"hash_e042760d17966848":
            return "using_flash";
        case #"hash_e1f6f84e4cd950eb":
            return "using_smoke";
        case #"hash_c9a436974fe60919":
            return "using_molotov";
        case #"hash_61e969dacaaf9881":
            return "using_rpg";
        default:
            return ("using_" + type);
        }
        return;
    }
    return undefined;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11e75
// Size: 0x7d
function function_b4d191cb892d2ed9(type) {
    if (isdefined(type)) {
        switch (type) {
        case #"hash_5d11ac1131cddab1":
        case #"hash_7c03088193266bc4":
            return "enemy_using_grenade";
        case #"hash_e042760d17966848":
            return "enemy_using_flash";
        case #"hash_c9a436974fe60919":
            return "enemy_using_molotov";
        case #"hash_61e969dacaaf9881":
            return "enemy_using_rpg";
        default:
            break;
        }
    }
    return undefined;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11efb
// Size: 0x24d
function useevent(type, var_7cf0530cd57b14) {
    if (!isdefined(type) || !isstring(type)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<dev string:x1c>");
            }
        #/
        return;
    }
    var_58686d35610dc65 = isai(self);
    var_cd10f4029aaf6c37 = function_e12a23f3c8aa65bb(type);
    if (var_58686d35610dc65 && chatterallowed(self)) {
        if (isdefined(var_cd10f4029aaf6c37)) {
            sequence = [self, var_cd10f4029aaf6c37];
            if (istrue(var_7cf0530cd57b14)) {
                var_776811fd7338978c = function_7846ced6c23280a9(type);
                ally_speaker = function_d8c3c539bc71c7af(self.team);
                if (isdefined(ally_speaker) && isdefined(var_776811fd7338978c)) {
                    sequence = [ally_speaker, var_776811fd7338978c, self, var_cd10f4029aaf6c37];
                } else {
                    /#
                        if (getdvarint(@"hash_864d3ab12f741516")) {
                            function_51c8ea07cf76cbd7("<dev string:x42>" + type + "<dev string:x72>");
                        }
                    #/
                }
            }
            function_93b4f17e4a3474b("use_" + type, sequence, level.battlechatter.settings["use_"]);
        } else {
            /#
                if (getdvarint(@"hash_864d3ab12f741516")) {
                    function_51c8ea07cf76cbd7("<dev string:x74>" + type + "<dev string:x72>");
                }
            #/
        }
    }
    var_32ffe93e49cf51c0 = function_b4d191cb892d2ed9(type);
    if (isdefined(var_32ffe93e49cf51c0)) {
        var_4acfa36a6dd8b797 = 0.5;
        if (var_58686d35610dc65) {
            enemy_speaker = function_8db2aa6f0377958(undefined, undefined, 1, undefined, var_4acfa36a6dd8b797);
        } else {
            var_eb835b5fde3371bd = function_74b5af7f20c85724(self.origin, undefined, self.team);
            enemy_speaker = function_b1ab02cfbfd12e43(var_eb835b5fde3371bd, undefined, undefined, 1, var_4acfa36a6dd8b797);
        }
        if (isdefined(enemy_speaker) && isai(enemy_speaker)) {
            enemy_speaker function_93b4f17e4a3474b("enemy_using_" + type, var_32ffe93e49cf51c0, level.battlechatter.settings["enemy_using_"]);
        }
        return;
    }
    /#
        if (getdvarint(@"hash_864d3ab12f741516")) {
            function_51c8ea07cf76cbd7("<dev string:x9f>" + type + "<dev string:x72>");
        }
    #/
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12150
// Size: 0x20e
function function_cffa856196d037ae(grenade) {
    if (!isdefined(grenade)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<dev string:xd0>");
            }
        #/
        return;
    }
    objweapon = grenade.weapon_object;
    if (!isdefined(objweapon)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<dev string:x10a>");
            }
        #/
        return;
    }
    level endon("game_ended");
    grenade endon("death");
    grenade notify("bcs_grenadeDangerEvent");
    grenade endon("bcs_grenadeDangerEvent");
    var_83d0156a645ddb13 = isweapondetonationtimed(objweapon);
    if (!istrue(var_83d0156a645ddb13)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<dev string:x13d>");
            }
        #/
        return;
    }
    ownerteam = self.team;
    var_c50afd6f74fd3266 = isdefined(self) && isai(self);
    if (var_c50afd6f74fd3266) {
        fusetime = getgrenadefusetimeai(objweapon);
    } else {
        fusetime = getgrenadefusetime(objweapon);
    }
    if (!isdefined(fusetime)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<dev string:x188>");
            }
        #/
        return;
    }
    chatterdelay = fusetime / 1000 - 1.5;
    chatterdelay = max(chatterdelay, 0);
    wait chatterdelay;
    dangerradius = default_to(getgrenadedamageradius(objweapon), 100);
    dangerorigin = grenade.origin;
    aiinrange = function_74b5af7f20c85724(dangerorigin, dangerradius, ownerteam);
    if (isdefined(aiinrange) && aiinrange.size > 0) {
        var_4005592fa1462834 = function_b1ab02cfbfd12e43(aiinrange);
        if (isdefined(var_4005592fa1462834)) {
            var_cc22949a3adbc834 = "enemy_grenade_close";
            if (aiinrange.size > 1) {
                var_cc22949a3adbc834 = "team_enemy_grenade_close";
            }
            var_4005592fa1462834 function_93b4f17e4a3474b("grenade_danger", var_cc22949a3adbc834, level.battlechatter.settings["grenade_danger"]);
        }
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12366
// Size: 0xaf
function burnevent(type) {
    if (!isdefined(type) || !isstring(type)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<dev string:x1be>");
            }
        #/
        return;
    }
    var_cc22949a3adbc834 = undefined;
    if (type == "molotov") {
        var_cc22949a3adbc834 = "hurt_by_molotov";
    }
    if (!isdefined(var_cc22949a3adbc834)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("<dev string:x1e5>" + type + "<dev string:x212>");
            }
        #/
        return;
    }
    function_93b4f17e4a3474b("hurt_by_" + type, var_cc22949a3adbc834, level.battlechatter.settings["hurt_by_"]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1241d
// Size: 0xb5
function attackevent() {
    self endon("death");
    if (utility::issp() && !isalive(level.player)) {
        return;
    }
    wait 0.3;
    lastshoottime = self.battlechatter.lastshoottime;
    if (isdefined(self.battlechatter.var_3c94d4874d436201) && self.battlechatter.var_3c94d4874d436201 > gettime()) {
        return;
    }
    self.battlechatter.lastshoottime = gettime();
    if (!time_has_passed(lastshoottime, 20)) {
        return;
    }
    function_93b4f17e4a3474b("attacking", "attacking");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x124da
// Size: 0x10e
function shootevent(hit_result) {
    if (!isdefined(hit_result)) {
        return;
    }
    if (hit_result == "target_wounded") {
        if (percent_chance(50)) {
            function_93b4f17e4a3474b("target_wounded", "wounded_target");
        } else {
            ally = function_d8c3c539bc71c7af(self.team);
            if (isdefined(ally)) {
                seq = [ally, "ask_target_wounded", 0.2, self, "wounded_target"];
                function_93b4f17e4a3474b("target_wounded", seq);
            }
        }
        return;
    }
    if (hit_result == "target_unhurt") {
        if (percent_chance(50)) {
            function_93b4f17e4a3474b("target_unhurt", "target_unhurt");
            return;
        }
        ally = function_d8c3c539bc71c7af(self.team);
        if (isdefined(ally)) {
            seq = [ally, "ask_target_wounded", 0.2, self, "target_unhurt"];
            function_93b4f17e4a3474b("target_unhurt", seq);
        }
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125f0
// Size: 0x189
function function_3aab8d98361f6ecf() {
    if (!isdefined(self) || !isdefined(self.enemy) || !isdefined(self.weapon) || isnullweapon(self.weapon)) {
        return;
    }
    clipammo = self.bulletsinclip;
    clipsize = weaponclipsize(self.weapon);
    if (!isdefined(clipammo) || !isdefined(clipsize) || clipsize == 0) {
        return;
    }
    ally = getclosestfriendlyspeaker();
    if (!isdefined(ally)) {
        return;
    }
    if (percent_chance(15)) {
        self_name = function_2008b43adf7e18ef();
        ask_sequence = [ally, self_name, "ask_low_ammo"];
        var_c5525bbc1964db31 = [];
        clippercentage = clipammo / clipsize;
        if (clippercentage <= 0.3) {
            if (percent_chance(50)) {
                var_c5525bbc1964db31 = [0.2, self, "reply_low_ammo"];
            } else {
                var_c5525bbc1964db31 = [0.2, self, "low_ammo"];
            }
        } else {
            var_c5525bbc1964db31 = [0.2, self, "reply_okay", 0.2, ally, "reply_keepshooting"];
        }
        sequence = array_combine(ask_sequence, var_c5525bbc1964db31);
        function_93b4f17e4a3474b("ammo_status", sequence);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12781
// Size: 0x2
function function_8bdff60054ce5866() {
    
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1278b
// Size: 0x1a5
function reloadevent() {
    if (utility::issp() && !isalive(level.player)) {
        return;
    }
    if (!issp() && isplayer(self)) {
        return;
    }
    if (!isplayer(self) && function_8f59caa9212fcc56()) {
        return;
    }
    enemies = [];
    if (check_cooldown("enemy_reloading")) {
        if (isplayer(self)) {
            enemies = function_fd9e4cb348a5f283(self.origin, level.var_587de0e7b537210a, "axis");
        } else {
            enemies = getenemiesinrange();
        }
    }
    foreach (enemy in enemies) {
        if (utility::issp() && isplayer(self) && !enemy canshoot(self.origin + (0, 0, 40))) {
            continue;
        }
        if (is_equal(enemy.enemy, self) && enemy seerecently(self, 5)) {
            seq = [0.3, function_1609ef297b7a32cf(enemy, "target_reloading", "enemy_reloading")];
            if (percent_chance(60)) {
                var_f06047156c190734 = enemy function_f06047156c190734();
                if (isdefined(var_f06047156c190734)) {
                    seq = array_combine(seq, var_f06047156c190734);
                }
            }
            enemy function_93b4f17e4a3474b("enemy_reloading", seq);
            return;
        }
    }
    function_93b4f17e4a3474b("reloading", "reloading");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12938
// Size: 0x123
function function_56e490b1816855eb(otherentity, eventsubcategory) {
    self endon("removed from battleChatter");
    self endon("death");
    self endon("bcs_stateChange");
    if (!isalive(otherentity)) {
        return;
    }
    if (function_8f59caa9212fcc56()) {
        return;
    }
    if (!check_cooldown("enemy_movement_" + eventsubcategory)) {
        return;
    }
    enemies = getenemiesinrange();
    if (enemies.size == 0) {
        return;
    }
    sequence = undefined;
    if (self seerecently(otherentity, 5)) {
        switch (eventsubcategory) {
        case #"hash_184bba7053cc1c15":
            sequence = [self, "target_moving_up", 0.7];
            break;
        case #"hash_a64459fb02c72b3e":
            sequence = [self, "target_moving_up", 0.7];
            break;
        case #"hash_20cd76d83c2f7487":
            sequence = [self, "target_moving", 0.7];
            break;
        default:
            return;
        }
    }
    if (isdefined(sequence)) {
        function_93b4f17e4a3474b("enemy_movement_" + eventsubcategory, sequence);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12a63
// Size: 0x2e3
function moveevent(var_12853466ce806612) {
    if (utility::issp() && !isalive(level.player)) {
        return;
    }
    if (function_8f59caa9212fcc56()) {
        return;
    }
    if (!check_cooldown("enemy_movement")) {
        var_12853466ce806612 = 0;
    }
    enemies = getenemiesinrange();
    if (enemies.size == 0) {
        return;
    }
    enemy_center = get_average_origin(enemies);
    var_a2bde827fd591515 = enemy_center - self.origin;
    movement_direction = self.goalpos - self.origin;
    dotproduct = vectordot2(var_a2bde827fd591515, movement_direction);
    if (default_to(var_12853466ce806612, 1)) {
        foreach (enemy in enemies) {
            if (isplayer(enemy)) {
                continue;
            }
            if (is_equal(enemy.enemy, self) && enemy seerecently(self, 5)) {
                if (dotproduct > 0.65) {
                    seq = function_1609ef297b7a32cf(enemy, "target_moving_up", "enemy_moving_up");
                } else {
                    seq = function_1609ef297b7a32cf(enemy, "target_moving", "enemy_moving");
                }
                if (percent_chance(60)) {
                    var_f06047156c190734 = enemy function_f06047156c190734();
                    if (isdefined(var_f06047156c190734)) {
                        seq = array_insert(var_f06047156c190734, seq, 0);
                    }
                }
                enemy function_93b4f17e4a3474b("enemy_movement", seq);
                return;
            }
        }
    }
    guy1 = self;
    guy2 = function_d8c3c539bc71c7af(self.team);
    move_event = ter_op(dotproduct > 0.65, "movingup", "moving");
    if (move_event == "movingup") {
        order_event = "moveup";
    } else {
        order_event = "move";
    }
    if (isdefined(guy2) && percent_chance(65)) {
        var_948d565f600a3ed3 = guy1 function_2008b43adf7e18ef();
        if (percent_chance(30)) {
            var_948d565f600a3ed3 = 0;
        }
        seq = [guy2, 0.1, var_948d565f600a3ed3, 0.2, order_event, guy1, 0.2, move_event];
    } else {
        seq = move_event;
    }
    if (isdefined(guy2) && guy2 shotrecently(3)) {
        seq = [seq, 0.2, "coverme", guy2, 0.3, "suppressing"];
    }
    function_93b4f17e4a3474b("ally_movement", seq);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12d4e
// Size: 0x18f
function function_453b3867c6ec0ceb(enemy, team, type) {
    wait 0.6;
    if (!isdefined(self) || !isdefined(team) || !isdefined(enemy) || team == "dead") {
        return;
    }
    if (isdefined(type)) {
        sequence = "killfirm_" + type;
        name = "killfirm_" + type;
    } else {
        sequence = function_1609ef297b7a32cf(enemy, "killfirm_target", "killfirm_enemy");
        name = "killfirm";
    }
    speaker = self;
    other = getclosestfriendlyspeaker(team, undefined, 1);
    if (isplayer(self) && isalive(self) || isdefined(self.vehicletype)) {
        speaker = other;
        sequence = [0.4, "praise"];
        name = "player_killfirm";
    } else if (percent_chance(30)) {
        sequence = [0.4, sequence, 0.25, other, "praise"];
    } else {
        sequence = [0.4, sequence];
    }
    if (!isalive(speaker)) {
        return;
    }
    if (name == "player_killfirm") {
        speaker function_93b4f17e4a3474b(name, sequence, level.battlechatter.settings["player_killfirm"]);
        return;
    }
    speaker function_93b4f17e4a3474b(name, sequence, level.battlechatter.settings["killfirm"]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ee5
// Size: 0x10a
function function_f649c4ef3acdec1d(team) {
    wait 0.7;
    if (!isdefined(self) || !isdefined(team) || team == "dead") {
        return;
    }
    if (utility::issp()) {
        speaker = getclosestfriendlyspeaker(team, "combat", 1);
    } else {
        speaker = getclosestfriendlyspeaker(team, "combat", 0);
    }
    ai_name = function_8271e180c87b8970();
    if (!isdefined(speaker)) {
        return;
    }
    if (!speaker check_cooldown("casualty")) {
        speaker function_93b4f17e4a3474b("casualties", "casualties");
        return;
    }
    if (isdefined(ai_name)) {
        if (cointoss()) {
            sequence = [0.4, ai_name];
        } else {
            sequence = [0.4, ai_name, 0.5, "casualty"];
        }
    } else {
        sequence = [0.4, "casualty"];
    }
    speaker function_93b4f17e4a3474b("casualty", sequence);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ff7
// Size: 0x86
function friendlyfireevent() {
    self endon("death");
    wait 0.15;
    if (isdefined(self.var_261aaf24a09d231d)) {
        foreach (vo_data in self.var_261aaf24a09d231d) {
            if (!istrue(vo_data.ischatter)) {
                return;
            }
        }
    }
    function_93b4f17e4a3474b("friendlyfire", "checkfire");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13085
// Size: 0x2d
function function_45b841e13dd6cf9c(root, suffix) {
    ai_name = getname();
    if (!isdefined(ai_name)) {
        return;
    }
    return root + ai_name;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x130bb
// Size: 0xa5
function function_8271e180c87b8970() {
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.countryid) && (isstartstr(self.battlechatter.countryid, "AQ") || isstartstr(self.battlechatter.countryid, "CTM") || isstartstr(self.battlechatter.countryid, "PMC"))) {
        return function_45b841e13dd6cf9c("c_canm_");
    }
    return function_45b841e13dd6cf9c("c_cbnm_");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13168
// Size: 0xa5
function function_2008b43adf7e18ef() {
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.countryid) && (isstartstr(self.battlechatter.countryid, "AQ") || isstartstr(self.battlechatter.countryid, "CTM") || isstartstr(self.battlechatter.countryid, "PMC"))) {
        return function_45b841e13dd6cf9c("c_ator");
    }
    return function_45b841e13dd6cf9c("c_cbnm_");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13215
// Size: 0xd
function function_7e6d670c76d60628() {
    return function_45b841e13dd6cf9c("s_idnm_");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1322b
// Size: 0xa5
function function_472b1d721b3b7618() {
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.countryid) && (isstartstr(self.battlechatter.countryid, "AQ") || isstartstr(self.battlechatter.countryid, "CTM") || isstartstr(self.battlechatter.countryid, "PMC"))) {
        return function_45b841e13dd6cf9c("s_idcn_");
    }
    return function_45b841e13dd6cf9c("s_idnm_");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x132d8
// Size: 0xd
function function_3e144fda9848fd5() {
    return function_45b841e13dd6cf9c("s_hnnm_");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x132ee
// Size: 0xd
function function_479fa1bceacac04b() {
    return function_45b841e13dd6cf9c("s_alcn_its");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13304
// Size: 0x3da
function function_f06007e1f432ce27() {
    if (!isdefined(self.team) || self.team == "dead") {
        return;
    }
    if (check_cooldown("status_report")) {
        return function_1e4f162bf544387();
    }
    if (!isdefined(self.battlechatter) || !isdefined(self.battlechatter.countryid) || !isdefined(self.battlechatter.npcid)) {
        return;
    }
    if (self.battlechatter.countryid == "AQ" && self.battlechatter.npcid == "5") {
        return;
    }
    guys = [];
    guys[0] = self;
    guys[1] = function_d8c3c539bc71c7af(self.team, undefined, 0, level.var_dd332b4f1c13f7d5);
    if (isdefined(guys[1]) && (!isdefined(guys[1].battlechatter) || !isdefined(guys[1].battlechatter.countryid) || !isdefined(guys[1].battlechatter.npcid))) {
        guys[1] = undefined;
    }
    if (isdefined(guys[1]) && guys[1].battlechatter.countryid == "AQ" && guys[1].battlechatter.npcid == "5") {
        guys[1] = undefined;
    }
    if (guys.size == 2) {
        aliases = event_lookup("idle_conv");
        if (!isdefined(aliases)) {
            return;
        }
        convo = [];
        guy_index = 1;
        foreach (alias in aliases) {
            convo[convo.size] = randomfloatrange(0.5, 1);
            convo[convo.size] = alias;
            convo[convo.size] = guys[guy_index];
            guy_index = !guy_index;
        }
        chatter = function_93b4f17e4a3474b("idle_convo", convo, undefined, ["stealth_investigate", "stealth_combat", "outside_convo_dist"]);
        if (isdefined(chatter) && isstruct(chatter)) {
            chatter thread function_749f5c9deca36473("idle_convo", guys);
        }
        return;
    }
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(self.origin, level.var_d809dc9f8a466642, self.team);
    var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
    if (var_542b15e7d1da2adb == 1) {
        aliases = event_lookup("idle_solo");
        if (!isdefined(aliases)) {
            return;
        }
        radio_buddy = function_573b9ff9ed152518(self, 0);
        voices = [self, radio_buddy];
        voice_index = 1;
        sequence = [];
        foreach (alias in aliases) {
            sequence[sequence.size] = randomfloatrange(0.5, 1);
            sequence[sequence.size] = alias;
            sequence[sequence.size] = voices[voice_index];
            voice_index = !voice_index;
        }
        chatter = function_93b4f17e4a3474b("idle", sequence, undefined, ["stealth_investigate", "stealth_combat", "ai_inside_solo_radius"]);
        if (isdefined(chatter) && isstruct(chatter)) {
            chatter thread function_749f5c9deca36473("idle_solo", guys);
        }
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x136e6
// Size: 0x1ec
function function_749f5c9deca36473(event, guys) {
    foreach (guy in guys) {
        guy endon("removed from battleChatter");
        guy endon("death");
        guy endon("stealth_investigate");
        guy endon("stealth_combat");
    }
    self endon("finished_or_cancelled");
    var_198913d9a9fa1276 = 180;
    timestart = gettime();
    while (!time_has_passed(timestart, var_198913d9a9fa1276)) {
        waitframe();
        if (event == "idle_convo") {
            if (distance2dsquared(guys[0].origin, guys[1].origin) >= level.var_27a93e38d913ff2f) {
                guys[0] notify("outside_convo_dist");
                guys[1] notify("outside_convo_dist");
                guys[0] set_cooldown("idle_convo", level.var_dafa42d7384e9ef5);
                /#
                    if (getdvarint(@"hash_864d3ab12f741516")) {
                        function_51c8ea07cf76cbd7("<dev string:x220>" + scripts\common\debug::function_600b37e8cf3f2de9(guys[0]) + "<dev string:x241>" + scripts\common\debug::function_600b37e8cf3f2de9(guys[1]));
                    }
                #/
                return;
            }
            continue;
        }
        if (event == "idle_solo") {
            var_75be11c0a0a035dc = function_fd9e4cb348a5f283(guys[0].origin, level.var_d809dc9f8a466642, guys[0].team);
            var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
            if (var_542b15e7d1da2adb > 1) {
                guys[0] notify("ai_inside_solo_radius");
                guys[0] set_cooldown("idle", level.var_dafa42d7384e9ef5);
                /#
                    if (getdvarint(@"hash_864d3ab12f741516")) {
                        function_51c8ea07cf76cbd7("<dev string:x245>" + scripts\common\debug::function_600b37e8cf3f2de9(guys[0]));
                    }
                #/
                return;
            }
        }
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x138da
// Size: 0x55
function function_1d268b003b51a5b3(var_cd5f775022dcd2c3) {
    if (isdefined(var_cd5f775022dcd2c3)) {
        if (var_cd5f775022dcd2c3 == 0) {
            function_93b4f17e4a3474b("patrol_curious", "react_first");
            return;
        } else if (var_cd5f775022dcd2c3 == 1) {
            function_93b4f17e4a3474b("patrol_curious", "react_second");
            return;
        }
    }
    function_93b4f17e4a3474b("patrol_curious", "react_multi");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13937
// Size: 0x1f0
function function_1e4f162bf544387() {
    if (!isdefined(level.stealth) || istrue(level.var_b8b68f147d0eeb36)) {
        return;
    }
    sequence = [];
    agent = self;
    leader = function_592f13f1a0e078ff(agent);
    ai_name = agent function_7e6d670c76d60628();
    if (isdefined(ai_name) && percent_chance(60)) {
        sequence = array_combine(sequence, [leader, 0.1, ai_name]);
    }
    if (percent_chance(60)) {
        sequence = array_combine(sequence, [leader, 0.15, "ask_how_copy", agent, 0.15, "reply_hear_you"]);
    }
    var_a4a81419d5dc1a07 = random(["report_idle", "ask_found_anything"]);
    sequence = array_combine(sequence, [leader, 0.2, var_a4a81419d5dc1a07, agent, 0.3, "report_reply_idle", leader, 0.1, "confirming"]);
    if (percent_chance(40)) {
        var_e58fa9c1fffeee86 = undefined;
        if (getcombatstate() == "hunt") {
            var_e58fa9c1fffeee86 = random(["order_continue_search", "order_find_target", "order_find_perimeter"]);
        } else {
            var_e58fa9c1fffeee86 = random(["order_stay_alert", "good_hunting", "signoff"]);
        }
        if (isdefined(var_e58fa9c1fffeee86)) {
            sequence = array_combine(sequence, [leader, 0.2, var_e58fa9c1fffeee86]);
        }
    }
    agent function_93b4f17e4a3474b("status_report", sequence, undefined, ["stealth_investigate", "stealth_combat"]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13b2f
// Size: 0x79
function function_e3a09ac9c428dbea(array) {
    foreach (guy in array) {
        if (guy == self || !isdefined(guy.battlechatter)) {
            continue;
        }
        if (guy getcombatstate() == "combat") {
            return true;
        }
    }
    return false;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x13bb1
// Size: 0x61
function private function_e8cbb4eef70a6e9c() {
    if (isdefined(self.owner.closest_ally)) {
        return self.owner.closest_ally;
    }
    if (isdefined(self.owner.team)) {
        return getclosestfriendlyspeaker(self.owner.team);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13c1a
// Size: 0x291
function function_842319303719440c(radio) {
    allies = function_fd9e4cb348a5f283(self.origin, level.var_587de0e7b537210a, self.team);
    allies = array_remove(allies, self);
    closest_ally = sortbydistance(allies, self.origin)[0];
    radio.closest_ally = closest_ally;
    if (isdefined(closest_ally)) {
        ally_name = closest_ally function_7e6d670c76d60628();
    } else {
        ally_name = 0;
    }
    sequence = 0;
    if (utility::issp()) {
        dead_name = function_479fa1bceacac04b();
        sequence = [1.5, &closest_radio, "react_noreply", &function_c315a1b81d2e3288, 0.7, &closest_radio, ally_name, 0.3, &closest_radio, dead_name, 0.1, &closest_radio, "inv_no_response", 0.3, &closest_radio];
        if (!is_dead_or_dying(closest_ally) && isdefined(closest_ally.fnsetstealthstate)) {
            if (!istrue(level.var_2b9d0f1e2beb4de2) || !closest_ally can_path(self.origin)) {
                sequence2 = ["order_stay_alert", &function_e8cbb4eef70a6e9c, 0.2, &function_1e0fd010aa69762d, "confirming"];
            } else {
                sequence2 = ["order_get_visual", 0.2, &function_c7da930cd7ba754f, &function_e8cbb4eef70a6e9c, &function_64d791a1d9d155b1, 0.1, &function_1e0fd010aa69762d, "moving_there"];
            }
            sequence = array_combine(sequence, sequence2);
        }
    } else {
        order = ter_op(getcombatstate() == "combat", "order_stay_alert", "order_stay_aware");
        sequence = [1.5, &closest_radio, "react_noreply", &function_c315a1b81d2e3288, 0.7, &closest_radio, ally_name, 0.3, &closest_radio, "report_alert", 0.2, order];
    }
    return sequence;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13eb4
// Size: 0x8a
function closest_radio() {
    if (is_dead_or_dying(level.player)) {
        return;
    }
    enemies = function_fd9e4cb348a5f283(level.player.origin, level.var_798aa343368f724e, self.speaker.team);
    if (enemies.size == 0) {
        return;
    }
    guy = sortbydistance(enemies, level.player.origin)[0];
    return function_592f13f1a0e078ff(guy);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f47
// Size: 0xc8
function function_1e0fd010aa69762d() {
    if (is_dead_or_dying(level.player)) {
        return;
    }
    enemies = function_fd9e4cb348a5f283(level.player.origin, level.var_63a73645a8e030ad, self.speaker.team);
    corpses = [[ level.var_621af16ef0684a11 ]](level.var_63a73645a8e030ad);
    enemies = array_combine(enemies, corpses);
    enemies = array_remove(enemies, self.speaker);
    if (enemies.size == 0) {
        return;
    }
    guy = sortbydistance(enemies, level.player.origin)[0];
    self.receivers = guy;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14017
// Size: 0x37
function function_c7da930cd7ba754f() {
    if (is_dead_or_dying(self.sequence[self.index])) {
        return [1.5, "ally_missing_multi", undefined];
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14056
// Size: 0x33
function function_c315a1b81d2e3288() {
    parent = self.speaker.vo_parent;
    if (isdefined(parent)) {
        parent.var_6ef5f7ac4d441cbb = 1;
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14091
// Size: 0x62
function function_64d791a1d9d155b1() {
    thread function_4dc52e4105914357();
    self.owner.battlechatter.npcid = self.speaker.battlechatter.npcid;
    self.owner.battlechatter.lookupid = undefined;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x140fb
// Size: 0xdc
function function_4dc52e4105914357() {
    self.speaker endon("stealth_combat");
    self.speaker endon("stealth_update_investigate");
    corpse = self.owner.vo_parent;
    event = spawnstruct();
    event.type = "investigate";
    event.typeorig = "unresponsive_teammate";
    event.origin = corpse.origin;
    event.investigate_pos = corpse.origin;
    if (!isdefined(self.speaker.fnsetstealthstate)) {
        return;
    }
    self.speaker thread [[ self.speaker.fnsetstealthstate ]]("investigate", event);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x141df
// Size: 0x56
function can_path(target_origin, var_574307d4cdbdac4c) {
    dist_sq = squared(default_to(var_574307d4cdbdac4c, 100));
    path = self findpath(self.origin, target_origin);
    return distancesquared(path[path.size - 1], target_origin) < dist_sq;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1423e
// Size: 0x1a
function function_bffb62c0764278a7() {
    self.listener delaycall(0.5, &kill);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14260
// Size: 0x9e
function function_64e63285a83e3efe() {
    self endon("death");
    if (is_dead_or_dying(self) || istrue(self.battlechatter.var_d611e2f69fa1cac4)) {
        return;
    }
    function_b145367392d5843d(2, 1);
    result = function_d54e84a9513b0e45("initial_combat", [0.2, "surprise", 0.7, "react_first_combat"], 1, 0.5, 15);
    if (!isdefined(result) || !isint(result) || result) {
        set_cooldown("enter_combat", 15);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14306
// Size: 0x46
function function_23a29830a84af4cf() {
    self endon("death");
    self endon("stealth_combat");
    sequence = [self, 0.5, "disguise_enter_investigate"];
    function_d54e84a9513b0e45("disguise_enter_investigate", sequence, 1, 2, 10);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14354
// Size: 0x191
function function_bbb539fd7c238608() {
    if (!isdefined(self.var_bdf67b527ec1547a) || self.var_bdf67b527ec1547a == "none") {
        return;
    }
    sequence = undefined;
    other = getclosestfriendlyspeaker();
    var_b70b49dc45959168 = isalive(other) && isdefined(other.stealth) && other isnear(self, level.var_798aa343368f724e);
    if (var_b70b49dc45959168 && other.var_fe5ebefa740c7106 == 1) {
        sequence = [self, 0, "react_multi", other, 1.5, "ask_saw_that", self, 1, "confirming", other, 1.5, "team_heard_something"];
    } else if (var_b70b49dc45959168) {
        sequence = [self, 0, "muttered_confusion", other, 1.5, "ask_saw_that", self, 1, "confirming", other, 1, "hunt_inv_order"];
    } else {
        sequence = [self, 0, "react_multi", self, 1.5, "heard_something"];
    }
    chatter = function_93b4f17e4a3474b("announce_", sequence);
    thread investigatestart(chatter);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x144ed
// Size: 0x90
function investigatestart(chatter) {
    self endon("death");
    self endon("stealth_combat");
    if (isdefined(chatter)) {
        waitchatter(chatter);
    }
    sequence = undefined;
    leader = function_592f13f1a0e078ff(self);
    sequence = [leader, 1, "confirming", leader, 1, "order_get_visual", leader, 1, "order_report_back"];
    function_93b4f17e4a3474b("investigate_start", sequence);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14585
// Size: 0x260
function function_e46d9fd4c3250863() {
    self endon("death");
    self endon("stealth_combat");
    if (!isdefined(self.var_bdf67b527ec1547a) || self.var_bdf67b527ec1547a == "none") {
        return;
    }
    self.var_28cda4aa4cbd4932 = 1;
    sequence = [];
    leader = function_592f13f1a0e078ff(self);
    other = getclosestfriendlyspeaker();
    var_b70b49dc45959168 = isalive(other) && isdefined(other.stealth) && other isnear(self, level.var_798aa343368f724e);
    if (var_b70b49dc45959168) {
        if (percent_chance(50)) {
            sequence = [self, 0, "ask_found_anything", other, 1.5, "resp_sound_first"];
        } else {
            sequence = [self, 0, "ask_found_anything", other, 1.5, "area_clear"];
        }
    } else {
        soldier_name = function_7e6d670c76d60628();
        leader_name = leader function_7e6d670c76d60628();
        if (percent_chance(33)) {
            sequence = [self, 0, leader_name, leader, 0.7, "report_search", self, 1, "resp_sound_first", leader, 1, "confirming"];
        } else if (percent_chance(50)) {
            sequence = [self, 0, leader_name, leader, 0.7, soldier_name, self, 1, "area_clear", leader, 1, "confirming"];
        } else {
            sequence = [self, 0, leader_name, leader, 1.5, "reply_hear_you", leader, 1, "report_search", self, 1, "area_clear", leader, 1, "confirming"];
        }
    }
    function_93b4f17e4a3474b("investigate_pos_reached", sequence);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x147ed
// Size: 0x112
function function_ba8bab0dfce1b7d1() {
    self endon("death");
    self endon("stealth_combat");
    if (!istrue(self.var_28cda4aa4cbd4932)) {
        self.var_28cda4aa4cbd4932 = undefined;
        return;
    }
    sequence = [];
    leader = function_592f13f1a0e078ff(self);
    other = getclosestfriendlyspeaker();
    var_b70b49dc45959168 = isalive(other) && isdefined(other.stealth) && other isnear(self, level.var_798aa343368f724e);
    wait randomfloatrange(2, 2.5);
    if (var_b70b49dc45959168) {
        sequence = [self, 0, "team_return_idle", other, 1.5, "confirming"];
    } else {
        sequence = [leader, 0, "inv_patrol", self, 1.5, "confirming"];
    }
    function_93b4f17e4a3474b("return_to_idle", sequence);
    self.var_28cda4aa4cbd4932 = undefined;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14907
// Size: 0x16c
function function_e906749f6343f822() {
    self endon("death");
    self endon("stealth_combat");
    if (is_dead_or_dying(self)) {
        return;
    }
    if (!check_cooldown("saw_corpse_1") || !check_cooldown("saw_corpse_2")) {
        return;
    }
    leader = function_592f13f1a0e078ff(self);
    if (!isdefined(leader)) {
        return;
    }
    other = getclosestfriendlyspeaker();
    var_b70b49dc45959168 = isalive(other) && other isnear(self, level.var_798aa343368f724e);
    if (var_b70b49dc45959168) {
        sequence = [self, 2, "team_have_something", self, 2, "team_see_something"];
    } else {
        sequence = [self, 2, "have_something", self, 2, "see_something"];
    }
    chatter = function_93b4f17e4a3474b("saw_corpse_1", sequence);
    waitchatter(chatter);
    sequence2 = [leader, 2, "confirming", leader, 2, "order_get_visual", leader, 2, "order_report_back"];
    chatter = function_93b4f17e4a3474b("saw_corpse_2", sequence);
    waitchatter(chatter);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14a7b
// Size: 0x274
function function_f713a4757399049c(other) {
    leader = function_592f13f1a0e078ff(self);
    if (!isdefined(self.alertlevel) || self.alertlevel != "alert") {
        sequence = [other, 1, "surprise", self, 1, "react_found_corpse", leader, 1, "hunt_report_alert"];
        chatter = function_93b4f17e4a3474b("found_corpse_1", sequence);
        waitchatter(chatter);
        return;
    }
    if (percent_chance(50)) {
        sequence1 = [other, 1, "surprise", self, 1, "react_found_corpse", leader, 1, "order_continue_search"];
        chatter = function_93b4f17e4a3474b("found_corpse_2", sequence1);
        waitchatter(chatter);
        return;
    }
    corpse_name = undefined;
    if (utility::issp()) {
        corpses = [[ level.var_621af16ef0684a11 ]](level.var_798aa343368f724e);
        if (corpses.size > 0) {
            corpse = sortbydistance(corpses, self.origin)[0];
            corpse_name = corpse function_479fa1bceacac04b();
            corpse.var_6ef5f7ac4d441cbb = 1;
        }
    } else if (isdefined(level.var_276311a22caaf5ac)) {
        corpses = [[ level.var_276311a22caaf5ac ]](self.origin, level.var_798aa343368f724e);
        if (corpses.size > 0) {
            corpse = sortbydistance(corpses, self.origin)[0];
            corpse_name = corpse function_479fa1bceacac04b();
            corpse.var_6ef5f7ac4d441cbb = 1;
        }
    }
    if (!isdefined(corpse_name)) {
        corpse_name = 0;
    }
    sequence2 = [other, 1, "surprise", self, 1, "react_found_corpse", leader, 1, "leader_ask_corpse_name", self, 1, corpse_name, leader, 1, "order_continue_search"];
    chatter = function_93b4f17e4a3474b("found_corpse_3", sequence2);
    waitchatter(chatter);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14cf7
// Size: 0x67
function function_4dffa550c687b071() {
    self endon("death");
    self endon("stealth_combat");
    if (!check_cooldown("found_corpse_1") || !check_cooldown("found_corpse_2") || !check_cooldown("found_corpse_3")) {
        return;
    }
    other = getclosestfriendlyspeaker();
    if (!isdefined(other)) {
        function_f713a4757399049c(self);
        return;
    }
    function_f713a4757399049c(other);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14d66
// Size: 0x115
function announceevent(type, event) {
    if (event.type == "cover_blown") {
        return;
    }
    if (event.type == "investigate") {
        return;
    }
    if (!isdefined(self.team) || self.team == "dead") {
        return;
    }
    if (getcombatstate() == "combat") {
        return;
    }
    if (function_e3a09ac9c428dbea(function_fd9e4cb348a5f283(self.origin, 4000, self.team))) {
        return;
    }
    if (type == "found_corpse" || type == "saw_corpse") {
        return;
    }
    if (isstartstr(type, "gunshot") || type == "bulletwhizby" || type == "ally_damaged") {
        initial_reaction = "surprise";
    } else {
        initial_reaction = "muttered_confusion";
    }
    function_93b4f17e4a3474b("announce_" + type, initial_reaction, level.battlechatter.settings["announce_"], "stealth_combat");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14e83
// Size: 0x2
function function_22d252d6cfa50edd() {
    
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14e8d
// Size: 0x1a
function function_e64dbaaae396fbb8(previousstate) {
    if (previousstate == 1) {
        thread function_ba8bab0dfce1b7d1();
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14eaf
// Size: 0x226
function function_f6c7d545b09f9f0a() {
    self endon("death");
    self endon("stealth_combat");
    if (self.var_fe5ebefa740c7106 != 1 || !isdefined(self.var_bdf67b527ec1547a) || self.var_bdf67b527ec1547a == "none") {
        return;
    }
    pathdist = self pathdisttogoal();
    if (pathdist > 200) {
        sequence = undefined;
        leader = function_592f13f1a0e078ff(self);
        other = getclosestfriendlyspeaker();
        var_b70b49dc45959168 = isalive(other) && isdefined(other.stealth) && other isnear(self, level.var_798aa343368f724e);
        if (var_b70b49dc45959168) {
            if (percent_chance(33)) {
                sequence = [self, 0, "alert_search_orders", other, 1.5, "confirming", other, 1, "order_dir_resp"];
            } else if (percent_chance(50)) {
                sequence = [self, 0, "order_investigate", other, 1.5, "confirming", other, 1, "order_dir_resp"];
            } else {
                sequence = [self, 0, "order_dir", other, 1.5, "confirming", other, 1, "order_dir_resp"];
            }
            function_93b4f17e4a3474b("investigate_loop", sequence);
            return;
        }
        if (percent_chance(50)) {
            sequence = [self, 0, "report_investigating", leader, 1.5, "confirming"];
        } else {
            sequence = [self, 0, "searching_here", leader, 1.5, "confirming"];
        }
        function_93b4f17e4a3474b("investigate_loop", sequence);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x150dd
// Size: 0xb6
function private function_5748768636a2cea8(player) {
    self endon("bc_hunt_hunt_cleared");
    player endon("bc_hunt_hunt_cleared");
    /#
        huntvalidate(self);
    #/
    self.var_e76e4e828c793c74 = 1;
    player.var_e76e4e828c793c74 = 1;
    thread function_b00184a8810e1cb2(player);
    childthread function_9e4b25719bada8d0(player);
    leader = function_592f13f1a0e078ff(self);
    if (!istrue(self.var_8fc1a615203f7bd1)) {
        other = hunthuntenter(player, leader);
    }
    self.var_8fc1a615203f7bd1 = 1;
    while (true) {
        if (!isdefined(other) || !isalive(other)) {
            other = getclosestfriendlyspeaker();
        }
        hunthuntloop(player, leader, other);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1519b
// Size: 0x81
function private function_b00184a8810e1cb2(player) {
    msg = waittill_any_ents_return(self, "death", self, "bcs_stateChange", self, "bc_hunt_hunt_loop_finish", player, "death_or_disconnect");
    if (isdefined(self) && isdefined(self.var_e76e4e828c793c74)) {
        self notify("bc_hunt_hunt_cleared");
        self.var_e76e4e828c793c74 = undefined;
    }
    if (isdefined(player) && isdefined(player.var_e76e4e828c793c74)) {
        player notify("bc_hunt_hunt_cleared");
        player.var_e76e4e828c793c74 = undefined;
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15224
// Size: 0x29
function function_9e4b25719bada8d0(player) {
    while (true) {
        if (function_200e534b0a853905(player)) {
            self notify("bc_hunt_hunt_loop_finish");
            return 1;
        }
        waitframe();
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x15255
// Size: 0x370
function private hunthuntenter(player, leader) {
    sequence_initial = [self, "ask_target_location", 0.6];
    chatter = function_93b4f17e4a3474b("hunt_initial", sequence_initial);
    waitchatter(chatter);
    wait 5;
    self_name = function_3e144fda9848fd5();
    other = getclosestfriendlyspeaker();
    other_isvalid = isdefined(other) && isalive(other) && isdefined(other.stealth) && other.var_fe5ebefa740c7106 == 2;
    if (other_isvalid) {
        var_b70b49dc45959168 = other isnear(self, level.var_798aa343368f724e);
        sequence_duo = [];
        if (var_b70b49dc45959168) {
            if (cointoss()) {
                sequence_duo = [leader, self_name, 0.6, "report_search", 0.6, self, "hunt_neg", 0.6, "target_still_close", 0.6, leader, "order_continue_search", 0.6, self, "hunt_copy", 0.6];
            } else {
                sequence_duo = [leader, self_name, 0.6, "report_search", 0.6, self, "reply_found_nothing", 0.6, "target_still_close", 0.6, leader, "order_continue_search", 0.6, "order_find_target", 0.6, self, "hunt_copy", 0.6];
            }
        } else {
            sequence_duo = [leader, self_name, 0.6, "report_search", 0.6, self, "reply_found_nothing", 0.6, "target_still_close", 0.6, leader, "order_continue_search", 0.6, "order_find_target", 0.6, self, "hunt_copy", 0.6];
        }
        chatter = function_93b4f17e4a3474b("hunt_duo_enter", sequence_duo);
        waitchatter(chatter);
        wait 15;
        return other;
    }
    sequence_solo = [leader, self_name, 0.6, "report_search", 0.6, self, "hunt_neg", 0.6, "target_still_close", 0.6, leader, "order_find_target", 0.6, "order_find_perimeter", 0.6, self, "hunt_copy", 0.6];
    chatter = function_93b4f17e4a3474b("hunt_solo_enter", sequence_solo);
    waitchatter(chatter);
    wait 15;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x155cd
// Size: 0x324
function private hunthuntloop(player, leader, other) {
    if (isdefined(other)) {
        other_isvalid = isalive(other) && isdefined(other.stealth) && other.var_fe5ebefa740c7106 == 2;
        var_b70b49dc45959168 = other isnear(self, level.var_8e8e487a64d9aa1b);
        var_bffcbc62498722ae = ter_op(other_isvalid && cointoss(), [other, self], [self, other]);
        soldier2 = var_bffcbc62498722ae[1];
        soldier1 = var_bffcbc62498722ae[0];
        if (!other_isvalid || var_b70b49dc45959168) {
            var_34a29ee860da9247 = [soldier1, soldier1 function_7e6d670c76d60628(), 0.6, leader, "reply_hear_you", 0.6, "report_search", 0.6, soldier1, "report_reply_search", 0.6, leader, "confirming", 0.6, "order_continue_search", 0.6];
            chatter = function_93b4f17e4a3474b("hunt_duo_loop_near", var_34a29ee860da9247);
            waitchatter(chatter);
            wait 15;
        } else {
            var_34a29ee860da9247 = [soldier1, "inv_ask_first", 0.6, soldier2, "hunt_neg", 0.6, "report_searching", 0.6];
            chatter = function_93b4f17e4a3474b("hunt_duo_loop_far_1", var_34a29ee860da9247);
            waitchatter(chatter);
            wait 10;
            if (!isdefined(soldier1) || !isdefined(soldier2)) {
                return;
            }
            other_isvalid = isalive(soldier2) && isdefined(soldier2.stealth) && soldier2.var_fe5ebefa740c7106 == 2;
            var_b70b49dc45959168 = soldier2 isnear(soldier1, level.var_8e8e487a64d9aa1b);
            if (other_isvalid && !var_b70b49dc45959168) {
                var_34a29fe860da947a = [soldier1, "inv_ask_second", 0.6, soldier2, "report_nothing", 0.6];
                chatter = function_93b4f17e4a3474b("hunt_duo_loop_far_2", var_34a29fe860da947a);
                waitchatter(chatter);
                wait 15;
            }
        }
        return;
    }
    sequence_solo = [leader, "report_search", 0.6, self, "report_searching", 0.6, leader, "confirming", 0.6, "order_continue_search", 0.6, "signoff", 0.6];
    chatter = function_93b4f17e4a3474b("hunt_solo_loop", sequence_solo);
    waitchatter(chatter);
    wait 15;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158f9
// Size: 0x2
function function_7ce36b78c85185c2() {
    
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15903
// Size: 0xa4
function function_65f8179711192d2b() {
    foreach (player in getplayersinrange(self.origin, level.var_587de0e7b537210a)) {
        if (istrue(player.var_9f44126029ba3947)) {
            player notify("bc_combat_hunt_to_be_cleared");
        }
    }
    if (isdefined(self.bc_hunt)) {
        self.bc_hunt = undefined;
        self.var_ed4d33da8aedbae0 = undefined;
        self.var_8fc1a615203f7bd1 = undefined;
        self notify("bc_hunt_left");
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159af
// Size: 0x3d
function function_facb9692c3fba174() {
    if (istrue(self.var_9f44126029ba3947)) {
        self notify("bc_combat_hunt_loop_finish");
    }
    if (is_equal(self.bc_hunt, 0)) {
        self.bc_hunt = 1;
        self notify("bc_hunt_transitioned");
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x159f4
// Size: 0xc2
function function_9e2e203621d4db83(player) {
    msg = waittill_any_ents_return(self, "death", self, "bcs_stateChange", player, "bc_combat_hunt_to_be_cleared", player, "death_or_disconnect");
    if (!isdefined(msg) || msg == "death" || msg == "bcs_stateChange") {
        if (isdefined(self)) {
            self notify("bc_combat_hunt_ai_na");
        }
    } else if (isdefined(msg) && msg == "bc_combat_hunt_to_be_cleared") {
        player notify("bc_combat_hunt_cleared");
    } else if (isdefined(msg) && msg == "death_or_disconnect") {
        if (isdefined(self)) {
            self notify("bc_combat_hunt_cleared");
        }
    }
    if (isdefined(self)) {
        self.var_9f44126029ba3947 = undefined;
    }
    if (isdefined(player)) {
        player.var_9f44126029ba3947 = undefined;
        player.var_177d5d34a6473dbe = undefined;
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15abe
// Size: 0x10b
function function_c6b8da8a2c73763b(player, leader, soldier1) {
    self waittill("bc_combat_hunt_loop_finish");
    if (!function_200e534b0a853905(player) && (!isdefined(player.var_177d5d34a6473dbe) || gettime() - player.var_177d5d34a6473dbe > 10000)) {
        soldier_name = function_3e144fda9848fd5();
        var_20791ff5069d43f4 = [leader, soldier_name, 0.7, leader, "ask_found_anything", 0.7, soldier1, "hunt_neg", 0.6, leader, "order_continue_search", 0.7, soldier1, "cmb_hunt_confirmation", 0.6];
        chatter = function_93b4f17e4a3474b("enter_hunt_6", var_20791ff5069d43f4);
        waitchatter(chatter);
    }
    player notify("bc_combat_hunt_to_be_cleared");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15bd1
// Size: 0x6d
function function_d63963e99c9ae77b() {
    foreach (player in getplayersinrange(self.origin, level.var_587de0e7b537210a)) {
        if (istrue(player.var_9f44126029ba3947)) {
            return true;
        }
    }
    return false;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15c47
// Size: 0x29
function function_288d22f8e8481fa3(player) {
    while (true) {
        if (function_200e534b0a853905(player)) {
            self notify("bc_combat_hunt_loop_finish");
            return 1;
        }
        waitframe();
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15c78
// Size: 0x42
function function_200e534b0a853905(player) {
    if (is_dead_or_dying(self)) {
        return true;
    }
    if (distancesquared(self.origin, player.origin) > level.var_e49b54322cbd63c1) {
        return true;
    }
    return false;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15cc3
// Size: 0x20a
function function_849082e11feeba9a(player, leader, soldier) {
    self endon("bc_combat_hunt_loop_finish");
    childthread function_288d22f8e8481fa3(player);
    while (true) {
        var_3500bf2042abb37c = [leader, "report_target_location", 0.7, soldier, "neg_target", 0.6, soldier, "target_still_close", 0.7, leader, "order_continue_search", 0.7, leader, "order_stay_alert", 0.7, soldier, "cmb_hunt_confirmation", 0.6];
        var_3500c22042abba15 = [leader, "report_target_location", 0.7, soldier, "neg_target", 0.6, soldier, "target_still_close", 0.7, leader, "order_find_target", 0.7, leader, "order_stay_alert", 0.7, soldier, "cmb_hunt_confirmation", 0.6];
        var_3500c12042abb7e2 = [soldier, "hunt", 0.7];
        chatter = function_93b4f17e4a3474b("enter_hunt_3", var_3500bf2042abb37c);
        player.var_177d5d34a6473dbe = gettime();
        waitchatter(chatter);
        wait 15;
        chatter = function_93b4f17e4a3474b("enter_hunt_4", var_3500c22042abba15);
        player.var_177d5d34a6473dbe = gettime();
        waitchatter(chatter);
        wait 15;
        chatter = function_93b4f17e4a3474b("enter_hunt_5", var_3500c12042abb7e2);
        player.var_177d5d34a6473dbe = gettime();
        waitchatter(chatter);
        wait 30;
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15ed5
// Size: 0x3c9
function function_cdf55cf331718d81(player) {
    self endon("bc_combat_hunt_ai_na");
    self endon("bc_combat_hunt_cleared");
    player endon("bc_combat_hunt_cleared");
    /#
        huntvalidate(self);
    #/
    player.var_9f44126029ba3947 = 1;
    self.var_9f44126029ba3947 = 1;
    thread function_9e2e203621d4db83(player);
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(self.origin, level.var_8b1a7cec63f2e832, self.team);
    var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
    leader = function_592f13f1a0e078ff(self);
    soldier1 = self;
    if (var_542b15e7d1da2adb == 1) {
        if (cointoss()) {
            sequence_initial = [soldier1, "ask_target_location", 0.6];
        } else {
            sequence_initial = [soldier1, "lost_enemy_solo", 0.6, leader, "order_find_target", 0.7, soldier1, "cmb_hunt_confirmation", 0.6];
        }
    } else if (var_542b15e7d1da2adb > 1) {
        soldier2 = function_573b9ff9ed152518(self, 0);
        if (cointoss()) {
            sequence_initial = [soldier1, "ask_target_location", 0.6, soldier2, "target_still_close", 0.6];
        } else {
            leader_name = leader function_7e6d670c76d60628();
            sequence_initial = [soldier1, leader_name, 0.6, soldier1, "lost_enemy_duo", 0.6, leader, "order_find_target", 0.6, soldier1, "cmb_hunt_confirmation", 0.6];
        }
    }
    if (!istrue(self.var_ed4d33da8aedbae0)) {
        chatter = function_93b4f17e4a3474b("enter_hunt_1", sequence_initial);
        waitchatter(chatter);
        wait 10;
    }
    if (function_200e534b0a853905(player)) {
        player notify("bc_combat_hunt_to_be_cleared");
        return;
    }
    other = getclosestfriendlyspeaker();
    var_b70b49dc45959168 = isdefined(other) && isalive(other) && distancesquared(self.origin, other.origin) < level.var_85b48a519a69f1b9;
    if (var_b70b49dc45959168 && isdefined(other.stealth) && other.var_fe5ebefa740c7106 == 2) {
        if (cointoss()) {
            order = "order_take_point";
        } else {
            order = "order_follow_me";
        }
        sequence_started = [soldier1, order, 0.6, other, "confirming", 0.6, other, "moving_following", 0.6];
    } else if (var_542b15e7d1da2adb > 1) {
        sequence_started = [soldier1, "hunt_report_alert", 0.6, other, "cmb_hunt_confirmation", 0.6];
    }
    if (isdefined(sequence_started) && !istrue(self.var_ed4d33da8aedbae0)) {
        chatter = function_93b4f17e4a3474b("enter_hunt_2", sequence_started);
        waitchatter(chatter);
        wait 10;
    }
    if (function_200e534b0a853905(player)) {
        player notify("bc_combat_hunt_to_be_cleared");
        return;
    }
    self.var_ed4d33da8aedbae0 = 1;
    childthread function_c6b8da8a2c73763b(player, leader, soldier1);
    childthread function_849082e11feeba9a(player, leader, soldier1);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162a6
// Size: 0x34
function function_f4671f61a3031990() {
    if (!isdefined(self.bc_hunt)) {
        self.bc_hunt = 0;
        self notify("bc_hunt_entered");
        thread huntidle();
        /#
            thread huntdebug();
        #/
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x162e2
// Size: 0x1a
function private function_fc52f6275d262cdb() {
    return istrue(self.var_9f44126029ba3947) || istrue(self.var_e76e4e828c793c74);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16305
// Size: 0x26
function private function_127cbd3f9e8cab92() {
    return isdefined(self) && !function_fc52f6275d262cdb() && isalive(self) && !istrue(self.inlaststand);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16334
// Size: 0xdc
function private huntidle() {
    self endon("death");
    while (true) {
        if (!isdefined(self.bc_hunt) || is_dead_or_dying(self) || istrue(self._blackboard.invehicle)) {
            break;
        }
        if (!function_fc52f6275d262cdb()) {
            foreach (player in getplayersinrange(self.origin, level.var_3c8c2ca8a1d0e8a7)) {
                if (!player function_127cbd3f9e8cab92()) {
                    continue;
                }
                if (self.bc_hunt == 0) {
                    thread function_78c4f1260a3e4c9c(player);
                } else {
                    thread function_78c4f4260a3e5335(player);
                }
                break;
            }
        }
        wait 3;
    }
}

/#

    // Namespace battlechatter_events / namespace_24b7b4457f51f1a3
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x16418
    // Size: 0x123
    function private huntdebug() {
        self endon("<dev string:x26d>");
        for (;;) {
            if (!getdvarint(@"hash_864d3ab12f741516") || !isdefined(self.bc_hunt) || is_dead_or_dying(self)) {
            } else {
                position = self.origin + (0, 0, 70);
                if (self.bc_hunt == 0) {
                    color = ter_op(isdefined(self.var_9f44126029ba3947), (1, 0, 0), (0.5, 0.5, 0.5));
                    text = ter_op(isdefined(self.var_ed4d33da8aedbae0), "<dev string:x273>", "<dev string:x289>");
                } else {
                    color = ter_op(isdefined(self.var_e76e4e828c793c74), (1, 1, 0), (0.5, 0.5, 0.5));
                    text = ter_op(isdefined(self.var_8fc1a615203f7bd1), "<dev string:x2a0>", "<dev string:x2b4>");
                }
                debugstar(position, color, 1, text, 0.2);
            }
            waitframe();
        }
    }

    // Namespace battlechatter_events / namespace_24b7b4457f51f1a3
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x16543
    // Size: 0x81
    function private huntvalidate(current_guy) {
        foreach (guy in getaiarray(current_guy.team)) {
            assert(guy == current_guy || !guy function_fc52f6275d262cdb(), "<dev string:x2c9>" + guy getentitynumber());
        }
    }

#/

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x165cc
// Size: 0x5e
function private function_78c4f1260a3e4c9c(player) {
    self endon("death");
    thread function_cdf55cf331718d81(player);
    waittill_any_4("bc_combat_hunt_ai_na", "bc_combat_hunt_cleared", "bc_hunt_transitioned", "bc_hunt_left");
    if (!player function_127cbd3f9e8cab92()) {
        return;
    }
    if (is_equal(self.bc_hunt, 1)) {
        thread function_5748768636a2cea8(player);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16632
// Size: 0x14
function private function_78c4f4260a3e5335(player) {
    thread function_5748768636a2cea8(player);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1664e
// Size: 0xa8
function group_member() {
    if (!isalive(self.speaker)) {
        return;
    }
    groupmembers = array_remove(level.stealth.groupdata.groups[self.speaker.script_stealthgroup].members, self.speaker);
    if (groupmembers.size > 0) {
        return function_248a7374a1a0605a(self.speaker.origin, groupmembers, self.speaker.battlechatter.npcid);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x166fe
// Size: 0x17a
function function_da9e3311b63335e1(enemyentity) {
    self endon("death");
    self endon("bcs_stateChange");
    if (!isdefined(enemyentity) || !isalive(enemyentity) || !isplayer(enemyentity)) {
        return;
    }
    if (!check_cooldown("lost_target_elapsed_1") || !check_cooldown("lost_target_elapsed_2")) {
        return;
    }
    chatter = function_93b4f17e4a3474b("lost_target_elapsed_1", [self, "ask_target_location", 0.7]);
    waitchatter(chatter);
    if (!isdefined(enemyentity) || !isalive(enemyentity)) {
        return;
    }
    other = getclosestfriendlyspeaker();
    var_2bd00dd4702caf70 = isdefined(other) && isalive(other) && distancesquared(self.origin, other.origin) < level.var_defb33e34eb9dee7;
    if (!var_2bd00dd4702caf70 || !isdefined(other.stealth) || other.var_fe5ebefa740c7106 != 3) {
        return;
    }
    var_e33e63f0b2178301 = int(function_c89ed1840c8d0f0f(getdvarfloat(@"hash_5fb2e8cfc2ccb6a0")));
    var_ad0bace8f0942cb7 = other seerecently(enemyentity, var_e33e63f0b2178301);
    if (!istrue(var_ad0bace8f0942cb7)) {
        chatter = function_93b4f17e4a3474b("lost_target_elapsed_2", [other, "neg_target", 0.7]);
        waitchatter(chatter);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16880
// Size: 0x136
function private function_adc542e4e2305c6b() {
    struct = spawnstruct();
    foreach (player in level.players) {
        if (isdefined(player.last_weapon_fired_time) && gettime() <= player.last_weapon_fired_time + 100) {
            var_7bb9290d450b028b = distancesquared(player.origin, self.origin);
            if (isenemyteam(player.team, self.team) && var_7bb9290d450b028b < (level.var_63a73645a8e030ad + 1000) * (level.var_63a73645a8e030ad + 1000) && player scripts\engine\math::is_point_in_front(self.origin)) {
                struct.var_7bb9290d450b028b = var_7bb9290d450b028b;
                struct.var_23f37822d0802641 = player.var_23f37822d0802641;
                if (issp()) {
                    struct.enemy = player;
                }
                return struct;
            }
        }
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x169be
// Size: 0x4d
function private function_a6a6363c1dd4ba36() {
    if (isplayer(self)) {
        weapon = self getcurrentweapon();
    } else {
        if (is_equal(self.code_classname, "misc_turret")) {
            return "turret";
        }
        weapon = self.weapon;
    }
    return weaponclass(weapon);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16a14
// Size: 0x14
function private function_ca5cf7e5c88dea1f() {
    self.soldier2 = self.speaker;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16a30
// Size: 0x36
function private function_9af3ce5b350c9330(var_bc2e64c41ca31711) {
    if (!isdefined(var_bc2e64c41ca31711)) {
        var_bc2e64c41ca31711 = 1;
    }
    return isdefined(self.damagedby) && scripts\engine\utility::time_has_passed(self.damagetime, var_bc2e64c41ca31711);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16a6f
// Size: 0x36
function private function_c6adbc3f1ac04730() {
    if (isdefined(self)) {
        if (isplayer(self)) {
            return self.last_weapon_fired_time;
        } else {
            return self._blackboard.var_60dcaa3d3be97ab;
        }
    }
    return 0;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16aae
// Size: 0x39
function private function_2691ad67de7d62fa(var_bc2e64c41ca31711) {
    if (!isdefined(var_bc2e64c41ca31711)) {
        var_bc2e64c41ca31711 = 2;
    }
    var_fa8c6ee684b9e0ff = function_c6adbc3f1ac04730();
    if (isdefined(var_fa8c6ee684b9e0ff)) {
        return !scripts\engine\utility::time_has_passed(var_fa8c6ee684b9e0ff, var_bc2e64c41ca31711);
    }
    return false;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16af0
// Size: 0x55
function private function_fe408f094c61eee7() {
    var_fa8c6ee684b9e0ff = 0;
    if (isdefined(self.enemy)) {
        var_fa8c6ee684b9e0ff = self.enemy function_c6adbc3f1ac04730();
    }
    if (isdefined(var_fa8c6ee684b9e0ff)) {
        var_3a122ac91b97d719 = gettime() - var_fa8c6ee684b9e0ff;
        if (recentlysawenemy(var_3a122ac91b97d719)) {
            return true;
        }
    }
    return false;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16b4e
// Size: 0x52
function private function_41bd563abffd40ba() {
    if (self._blackboard.coverstate != "none") {
        return true;
    }
    node = self getgoalnode(3);
    if (isdefined(node) && node.type != "Exposed") {
        return true;
    }
    return false;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16ba9
// Size: 0x4
function private function_1309aeea62c4607f() {
    return true;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x16bb6
// Size: 0x66
function private function_d004e724b5e2939b(guy, radius) {
    if (!isdefined(guy)) {
        return 0;
    }
    ai_guys = getaiarrayinradius(guy.origin, radius, guy.team);
    player_guys = getplayersinrange(guy.origin, radius);
    return ai_guys.size + player_guys.size - 1;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x16c25
// Size: 0x191
function private function_68217f6b6c2e6dd5() {
    soldier1 = self.owner;
    soldier2 = self.soldier2;
    if (!isalive(soldier2)) {
        soldier2 = function_d8c3c539bc71c7af(soldier1.team);
    }
    var_c8977bdbd8aaa098 = soldier1 function_41bd563abffd40ba() || soldier2 function_41bd563abffd40ba();
    var_6b7353c9fd470817 = isdefined(soldier1.enemy) && soldier1.enemy function_2691ad67de7d62fa(8) || isdefined(soldier2.enemy) && soldier2.enemy function_2691ad67de7d62fa(8);
    var_8690dde5c97f495c = soldier2 function_9af3ce5b350c9330();
    var_3365202662df8a86 = function_1309aeea62c4607f();
    if (var_6b7353c9fd470817 && var_c8977bdbd8aaa098 && var_8690dde5c97f495c) {
        return [soldier1, "ask_wounded", 0.2, soldier2, "reply_wounded", 0.2];
    }
    if (var_6b7353c9fd470817 && var_c8977bdbd8aaa098 && !var_8690dde5c97f495c) {
        return [soldier1, "ask_wounded", 0.2, soldier2, "reply_ok", 0.2];
    }
    if (var_3365202662df8a86) {
        return [soldier1, "order_attack", 0.2, soldier2, "attacking", 0.2];
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x16dbe
// Size: 0x12e
function private function_6b784b3654e92ad5(soldier1, var_6bae4604edc5e4a9, var_7aaefaa2648b4d9c) {
    is_handled = 1;
    var_6a1c22bcff227f70 = isdefined(soldier1.enemy) && distancesquared(soldier1.origin, soldier1.enemy.origin) < 1000000;
    if (var_6bae4604edc5e4a9 && !var_7aaefaa2648b4d9c && var_6a1c22bcff227f70) {
        chatter = function_93b4f17e4a3474b("comb_rs_saw_enemy_on_pos", ["react_first_combat", 0.7, "at_my_location"]);
    } else if (var_6bae4604edc5e4a9 && !var_7aaefaa2648b4d9c && !var_6a1c22bcff227f70) {
        chatter = function_93b4f17e4a3474b("comb_rs_saw_enemy_out_pos", ["react_first_combat", 0.7, "over_there"]);
    } else if (var_6bae4604edc5e4a9 && var_7aaefaa2648b4d9c) {
        chatter = function_93b4f17e4a3474b("comb_rs_saw_shot_but_enemy_hid", ["react_first_combat", 0.7, "whizby_resp"]);
    } else {
        is_handled = 0;
    }
    return [chatter, is_handled];
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x16ef5
// Size: 0x6d8
function private function_e18a7412d8dd1189(soldier1, var_6bae4604edc5e4a9, ai_event, var_f962f4443b32b75b) {
    is_handled = 1;
    var_a444c26c770a5baf = var_6bae4604edc5e4a9;
    backup_enemy = undefined;
    if (var_a444c26c770a5baf) {
        var_9a14bbbe486374b = self.enemy function_a6a6363c1dd4ba36();
        var_98d2a5998bce56b2 = distancesquared(self.enemy.origin, self.origin);
    } else if (isdefined(var_f962f4443b32b75b)) {
        var_9a14bbbe486374b = weaponclass(var_f962f4443b32b75b.var_23f37822d0802641);
        var_98d2a5998bce56b2 = var_f962f4443b32b75b.var_7bb9290d450b028b;
        backup_enemy = var_f962f4443b32b75b.enemy;
    }
    if (isdefined(var_98d2a5998bce56b2) && isdefined(var_9a14bbbe486374b)) {
        var_8ac9f5a6073c2868 = var_98d2a5998bce56b2 * 0.00694444;
        /#
            var_fc6b3378f008ac6 = sqrt(var_98d2a5998bce56b2);
            var_fe5bb378f22ee3f = var_fc6b3378f008ac6 * 0.0833333;
        #/
        if (!var_a444c26c770a5baf && var_8ac9f5a6073c2868 >= 2500 && var_9a14bbbe486374b == "sniper") {
            chatter = function_93b4f17e4a3474b("comb_full_unaware_sniper", ["enemy_sniper", 0.7, "youre_exposed", 0.7]);
        } else if (!var_a444c26c770a5baf && var_8ac9f5a6073c2868 >= 225 && var_8ac9f5a6073c2868 <= 6400 && var_9a14bbbe486374b == "mg") {
            chatter = function_93b4f17e4a3474b("comb_full_unaware_lmg", ["enemy_lmg", 0.7]);
        } else if (!var_a444c26c770a5baf && var_8ac9f5a6073c2868 <= 6400 && var_9a14bbbe486374b == "spread") {
            chatter = function_93b4f17e4a3474b("comb_full_unaware_shotgun", ["enemy_shotgun", 0.7]);
        } else if (var_a444c26c770a5baf && var_8ac9f5a6073c2868 >= 2500 && var_9a14bbbe486374b == "sniper") {
            chatter = function_93b4f17e4a3474b("comb_full_aware_sniper", ["target_sniper", 0.7, "youre_exposed", 0.7]);
        } else if (var_a444c26c770a5baf && var_8ac9f5a6073c2868 >= 225 && var_8ac9f5a6073c2868 <= 6400 && var_9a14bbbe486374b == "mg") {
            chatter = function_93b4f17e4a3474b("comb_full_aware_lmg", ["target_lmg", 0.7]);
        } else if (var_a444c26c770a5baf && var_8ac9f5a6073c2868 <= 6400 && var_9a14bbbe486374b == "spread") {
            chatter = function_93b4f17e4a3474b("comb_full_aware_shotgun", ["target_shotgun", 0.7]);
        } else {
            is_handled = 0;
        }
    } else {
        is_handled = 0;
    }
    if (is_handled) {
        return [chatter, 1];
    }
    soldier2 = function_d8c3c539bc71c7af(self.team, undefined, undefined, level.var_798aa343368f724e + 200);
    is_duo = isdefined(soldier2);
    if (is_duo) {
        var_b9565ef78cfc2905 = isdefined(soldier1.enemy) && soldier1.enemy function_2691ad67de7d62fa() || isdefined(soldier2.enemy) && soldier2.enemy function_2691ad67de7d62fa() || isdefined(backup_enemy) && backup_enemy function_2691ad67de7d62fa();
        var_547820c918ed54f8 = soldier1 recentlysawenemy(0.05) || soldier2 recentlysawenemy(0.05);
        var_cf22f65a01029532 = soldier1 function_fe408f094c61eee7() || soldier2 function_fe408f094c61eee7();
        var_f794fb43f8a2d2ab = (soldier1 recentlysawenemy() || soldier2 recentlysawenemy()) && (soldier1 function_1309aeea62c4607f() || soldier2 function_1309aeea62c4607f());
        var_1cc6b5c882d3828a = function_d004e724b5e2939b(soldier1.enemy, level.var_63a73645a8e030ad) > 1 || function_d004e724b5e2939b(soldier2.enemy, level.var_63a73645a8e030ad) > 1 || function_d004e724b5e2939b(backup_enemy, level.var_63a73645a8e030ad) > 1;
        if (!var_cf22f65a01029532) {
            chatter = function_93b4f17e4a3474b("comb_fulld_didnt_see_shooting", [soldier1, "enemy_attacking", 0.7, soldier1, "ask_enemy_loc", 0.7, soldier1, "ask_enemy_count", soldier2, "enemy_loc_resp", 0.7, soldier2, &function_ca5cf7e5c88dea1f, &function_68217f6b6c2e6dd5]);
        } else if (!var_1cc6b5c882d3828a && var_f794fb43f8a2d2ab && var_547820c918ed54f8) {
            chatter = function_93b4f17e4a3474b("comb_fulld_enemy_open", [soldier1, "enemy_attacking", 0.7, soldier1, "target_exposed", 0.7, soldier1, "order_attack", 0.5, soldier2, "attacking"]);
        } else if (!var_1cc6b5c882d3828a && var_f794fb43f8a2d2ab && !var_547820c918ed54f8) {
            chatter = function_93b4f17e4a3474b("comb_fulld_enemy_cover", [soldier1, "enemy_attacking", 0.7, soldier1, "target_covered", 0.7, soldier1, "order_attack", 0.5, soldier2, "attacking"]);
        } else if (var_1cc6b5c882d3828a && var_f794fb43f8a2d2ab && var_547820c918ed54f8) {
            chatter = function_93b4f17e4a3474b("comb_fulld_enemies_open", [soldier1, "enemy_attacking", 0.7, soldier1, "enemy_exposed", 0.7, soldier1, "order_attack", 0.5, soldier2, "attacking"]);
        } else if (var_1cc6b5c882d3828a && var_f794fb43f8a2d2ab && !var_547820c918ed54f8) {
            chatter = function_93b4f17e4a3474b("comb_fulld_enemies_cover", [soldier1, "enemy_attacking", 0.7, soldier1, "enemy_covered", 0.7, soldier1, "order_attack", 0.5, soldier2, "attacking"]);
        } else {
            is_handled = 0;
        }
    } else {
        is_handled = 0;
    }
    return [chatter, is_handled];
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x175d6
// Size: 0x28f
function private function_bb7d302d01228a41(soldier1, ai_event, previous_state) {
    is_handled = 1;
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(self.origin, level.var_63a73645a8e030ad, self.team);
    var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
    if (ai_event == "bulletwhizby" || ai_event == "gunshot_impact" || ai_event == "silenced_shot_impact") {
        if (var_542b15e7d1da2adb == 1) {
            chatter = function_93b4f17e4a3474b("initial_combat", [&function_e872439019a2560c, soldier1, "hunt_reactions", 0.1, "react_whizby", 0.5, "unaware_backup"]);
        } else if (var_542b15e7d1da2adb == 2) {
            chatter = function_93b4f17e4a3474b("initial_combat_2", [&function_e872439019a2560c, soldier1, "hunt_reactions", 0.1, "react_whizby", &function_12014207b3e66976, "youre_exposed", soldier1, "unaware_backup"]);
        } else {
            chatter = function_93b4f17e4a3474b("initial_combat_N", [&function_e872439019a2560c, soldier1, "hunt_reactions", 0.1, "react_whizby", &function_12014207b3e66976, "youre_exposed"]);
        }
    } else if (previous_state != 3) {
        if (var_542b15e7d1da2adb == 1) {
            chatter = function_93b4f17e4a3474b("initial_combat_nonshot_1", [&function_e872439019a2560c, soldier1, "react_first_combat", 0.7, "unaware_backup", 0.2]);
        } else if (var_542b15e7d1da2adb == 2) {
            chatter = function_93b4f17e4a3474b("initial_combat_nonshot_2", [&function_e872439019a2560c, soldier1, "react_first_combat", 0.4, "youre_exposed", 0.4, "unaware_backup", 0.2]);
        } else {
            chatter = function_93b4f17e4a3474b("initial_combat_nonshot_N", [&function_e872439019a2560c, soldier1, "react_first_combat", 0.4, "youre_exposed", 0.4]);
        }
    } else {
        is_handled = 0;
    }
    return [chatter, 0];
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1786e
// Size: 0x1f
function function_80bfded61c19c9cc(previous_state, ai_event) {
    thread function_1ae088b4c06d0525(previous_state, ai_event, 1);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x17896
// Size: 0x310
function function_1ae088b4c06d0525(previous_state, ai_event, var_de837dfd8bcdc3af) {
    if (!isdefined(ai_event)) {
        ai_event = "none";
    }
    var_63f509639a8c705 = 0;
    self endon("death");
    soldier1 = self;
    var_d24851273de8ff3d = previous_state == 1 || previous_state == 2;
    var_55be4d7bbf3f76de = ai_event == "sight";
    var_ddc90174461e7335 = (ai_event == "gunshot" || ai_event == "gunshot_impact" || ai_event == "silenced_shot_impact" || ai_event == "silenced_shot") && !soldier1 recentlysawenemy(0.05);
    var_f962f4443b32b75b = soldier1 function_adc542e4e2305c6b();
    if (istrue(var_de837dfd8bcdc3af)) {
        if (var_ddc90174461e7335) {
            wait 1.2;
        } else if (ai_event == "bulletwhizby") {
            wait 0.6;
        } else {
            wait 0.75;
        }
    }
    if (is_dead_or_dying(self) || isdefined(self.battlechatter) && istrue(self.battlechatter.var_d611e2f69fa1cac4)) {
        return;
    }
    var_39bf97269a97bf86 = 0;
    if (isdefined(self.enemy) && (!isai(self.enemy) || !isplayer(self.enemy))) {
        var_39bf97269a97bf86 = 1;
    }
    if (utility::issp()) {
        function_af3a6677d4327aae(2, 1);
    } else {
        function_b145367392d5843d(2, 1);
    }
    var_7aaefaa2648b4d9c = soldier1 recentlysawenemy(3) && !soldier1 recentlysawenemy(0.05);
    var_698be5c37a79f2fb = var_55be4d7bbf3f76de || var_ddc90174461e7335 && soldier1 recentlysawenemy(1.2);
    if ((ai_event == "sight" || var_698be5c37a79f2fb) && var_d24851273de8ff3d) {
        var_c0013d62498c3438 = function_6b784b3654e92ad5(soldier1, var_698be5c37a79f2fb, var_7aaefaa2648b4d9c);
        var_63f509639a8c705 = var_c0013d62498c3438[1];
        chatter = var_c0013d62498c3438[0];
    }
    if ((ai_event == "gunshot" || ai_event == "gunshot_impact" || ai_event == "bulletwhizby") && !var_63f509639a8c705 && !var_39bf97269a97bf86) {
        var_6eb60849133fe70f = var_698be5c37a79f2fb || ai_event == "bulletwhizby" && soldier1 recentlysawenemy(0.6);
        var_c0014462498c439d = function_e18a7412d8dd1189(soldier1, var_6eb60849133fe70f, ai_event, var_f962f4443b32b75b);
        var_63f509639a8c705 = var_c0014462498c439d[1];
        chatter = var_c0014462498c439d[0];
    }
    if ((ai_event == "bulletwhizby" || ai_event == "gunshot_impact" || ai_event == "silenced_shot_impact" || previous_state != 3) && !var_63f509639a8c705) {
        var_c0014362498c416a = function_bb7d302d01228a41(soldier1, ai_event, previous_state);
        var_63f509639a8c705 = var_c0014362498c416a[1];
        chatter = var_c0014362498c416a[0];
    }
    if (!isdefined(chatter) || !isint(chatter) || chatter) {
        set_cooldown("enter_combat", 15);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x17bae
// Size: 0x9a
function private function_34a791e14c9f44d0(guys) {
    sum = (0, 0, 0);
    count = 0;
    foreach (guy in guys) {
        if (isalive(guy)) {
            sum += guy.goalpos;
            count++;
        }
    }
    assert(count != 0);
    return sum / count;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17c51
// Size: 0x9e
function private function_f1f2c29f80ac4b2f() {
    soldier1 = self.owner;
    if (!function_96144b7f4c1c227e()) {
        if (cointoss()) {
            return [soldier1, "moving_alone", 0.2];
        } else {
            return [soldier1, "moving_there", 0.2];
        }
        return;
    }
    if (cointoss()) {
        return [soldier1, "moving_together", 0.2];
    }
    return [soldier1, "moving_there", 0.2];
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17cf7
// Size: 0x73
function private function_e872439019a2560c() {
    owner = self.owner;
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(owner.origin, level.var_63a73645a8e030ad, self.team);
    self.var_98a49d4dd75fff17 = var_75be11c0a0a035dc.size;
    self.var_bd758acb28777c09 = function_34a791e14c9f44d0(var_75be11c0a0a035dc);
    self.var_25ae1a4f78cb39c5 = owner.origin;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17d72
// Size: 0x8a
function private function_96144b7f4c1c227e() {
    owner = self.owner;
    if (isalive(owner)) {
        owner_origin = owner.origin;
    } else {
        owner_origin = self.var_25ae1a4f78cb39c5;
    }
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(owner_origin, level.var_63a73645a8e030ad, self.team);
    var_f74d9ce4b34826d4 = var_75be11c0a0a035dc.size;
    if (var_f74d9ce4b34826d4 > self.var_98a49d4dd75fff17) {
        return 1;
    }
    return 0;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e04
// Size: 0x5f
function function_8fa36b2ce712a5bb() {
    self endon("death");
    if (is_dead_or_dying(self) || istrue(self.battlechatter.var_d611e2f69fa1cac4)) {
        return;
    }
    if (utility::issp()) {
        function_af3a6677d4327aae(2, 1);
    } else {
        function_b145367392d5843d(2, 1);
    }
    function_93b4f17e4a3474b("enter_combat", "react_first_combat");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17e6b
// Size: 0xe9
function function_baa35784be25b993(target) {
    target = default_to(target, self.enemy);
    groupdata = level.stealth.groupdata.groups[self.script_stealthgroup];
    foreach (groupmember in groupdata.members) {
        if (self == groupmember) {
            continue;
        }
        if (isdefined(target) && isdefined(target.origin)) {
            groupmember aieventlistenerevent("combat", target, target.origin);
            continue;
        }
        groupmember aieventlistenerevent("combat", self, self.origin);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17f5c
// Size: 0xae
function function_881ab22021be3c6b(fromenter) {
    self endon("death");
    wait 2;
    if (is_dead_or_dying(self) || !isdefined(self.team) || self.team == "dead") {
        return;
    }
    if (utility::issp() && function_fd9e4cb348a5f283(self.origin, level.var_798aa343368f724e, self.team).size == 1) {
        return;
    }
    seq = random(["order_attack", "attacking", "suppressing"]);
    function_93b4f17e4a3474b("join_combat", seq);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18012
// Size: 0x16e
function function_6237814879b07fbf() {
    self endon("death");
    if (is_dead_or_dying(self) || istrue(self.battlechatter.var_d611e2f69fa1cac4)) {
        return;
    }
    if (function_e3a09ac9c428dbea(function_fd9e4cb348a5f283(self.origin, level.var_798aa343368f724e, self.team))) {
        return function_881ab22021be3c6b();
    }
    if (utility::issp()) {
        function_af3a6677d4327aae(2, 1);
    } else {
        function_b145367392d5843d(2, 1);
    }
    if (!check_cooldown("enter_combat")) {
        return;
    }
    initial_reaction = ter_op(cointoss(), "found_target", "found_you");
    var_13eaef47aa5ba1bd = "at_my_location";
    if (utility::issp()) {
        lostinwater = 0;
        other = level.player;
        if (isdefined(other) && (isagent(other) || isplayer(other))) {
            lostinwater = other isswimming() || other isswimunderwater();
        }
        if (lostinwater) {
            var_13eaef47aa5ba1bd = "report_target_water";
        } else if (distancesquared(other.origin, self.origin) > level.var_c1ed820e79e07b7c) {
            var_13eaef47aa5ba1bd = "over_there";
        }
    }
    function_93b4f17e4a3474b("enter_combat", [initial_reaction, 0.5, var_13eaef47aa5ba1bd]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18188
// Size: 0x128
function function_3dac2e167dc9be7a() {
    self endon("death");
    if (is_dead_or_dying(self) || isdefined(self.battlechatter) && istrue(self.battlechatter.var_d611e2f69fa1cac4)) {
        return;
    }
    if (utility::issp()) {
        function_af3a6677d4327aae(2, 1);
    } else {
        function_b145367392d5843d(2, 1);
    }
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(self.origin, level.var_798aa343368f724e, self.team);
    var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
    leader = function_592f13f1a0e078ff(self);
    if (var_542b15e7d1da2adb == 1) {
        chatter = function_93b4f17e4a3474b("red_alert_1", [&function_e872439019a2560c, leader, "report_alert_combat", 0.2, &function_f1f2c29f80ac4b2f]);
        return;
    }
    chatter = function_93b4f17e4a3474b("red_alert_N", [&function_e872439019a2560c, leader, "report_alert_combat", 0.2, &function_f1f2c29f80ac4b2f]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x182b8
// Size: 0x6b
function function_e2d4e5c64d62278e(other) {
    lostinwater = 0;
    if (isdefined(other) && (isagent(other) || isplayer(other))) {
        lostinwater = other isswimming() || other isswimunderwater();
    }
    if (lostinwater) {
        function_93b4f17e4a3474b("losing_target_water", "lost_target_water");
        return;
    }
    function_93b4f17e4a3474b("losing_target", "lost_target");
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1832b
// Size: 0x26a
function function_a364b61121ab136f(targetent) {
    self endon("death");
    waitframe();
    if (!isdefined(self.var_ea9ad73c9a583d4c) || gettime() - self.var_ea9ad73c9a583d4c < 3000) {
        function_93b4f17e4a3474b("react_first_combat", "react_first_combat");
        return;
    }
    var_5dedd071a4cd9cd8 = 0;
    if (isdefined(targetent)) {
        var_848920efef4c7248 = vectortoyaw(self.origin - targetent.origin);
        angledelta = angleclamp180(var_848920efef4c7248 - targetent.angles[1]);
        if (abs(angledelta) > 60) {
            var_5dedd071a4cd9cd8 = 1;
        }
    }
    if (var_5dedd071a4cd9cd8) {
        if (!istrue(level.var_e58efb25be1ee016)) {
            if (isdefined(self.var_6a2525ae2b942b46)) {
                shouldskip = issp() && self.team == "allies";
                if (!shouldskip) {
                    self.var_caff0e9895ed03b3 = gettime() + int(self.var_6a2525ae2b942b46 * 1000);
                }
            }
        }
        soldier1 = self;
        soldier2 = getclosestfriendlyspeaker();
        leader = function_592f13f1a0e078ff(self);
        if (!isdefined(soldier2)) {
            function_93b4f17e4a3474b("flanked_1", [soldier1, "flanked", 0.2, leader, "order_attack"]);
        } else {
            function_93b4f17e4a3474b("flanked_N", [soldier1, "flanked", 0.2, soldier2, "order_attack"]);
        }
        return;
    }
    enemies = getenemiesinrange();
    var_96fd8098b75efd0f = 0;
    foreach (enemy in enemies) {
        if (enemy != targetent && self cansee(enemy, 3)) {
            var_96fd8098b75efd0f = 1;
            break;
        }
    }
    if (var_96fd8098b75efd0f) {
        function_93b4f17e4a3474b("enemy_sighted_N", ["enemy_soldiers"]);
        return;
    }
    function_93b4f17e4a3474b("enemy_sighted_1", ["enemy_soldier"]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1859d
// Size: 0x18
function function_71da86464a72718d() {
    function_93b4f17e4a3474b("cover_destroyed", ["repositioning"]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185bd
// Size: 0x53
function function_7825e0643a6c5600() {
    soldier2 = getclosestfriendlyspeaker();
    if (isdefined(soldier2)) {
        var_f89f4b49aca39611 = soldier2 function_2008b43adf7e18ef();
        function_93b4f17e4a3474b("reacquire_push_towards", [self, var_f89f4b49aca39611, 0.2, "order_check_last"]);
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18618
// Size: 0x18
function function_45eb140ec25c64a1() {
    function_93b4f17e4a3474b("semtex_stuck", ["semtex_stuck"]);
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18638
// Size: 0xb
function function_79b973bc437563db(var_3da06140a804e127) {
    
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1864b
// Size: 0x13
function area_clear(region, region_name) {
    
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18666
// Size: 0x13
function clearing_region(var_3da06140a804e127, region_name) {
    
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18681
// Size: 0x141
function event_lookup(event_name, data) {
    countryid = default_to(self.battlechatter.var_96a045a4858e3f20, self.battlechatter.countryid);
    faction = default_to(self.battlechatter.lookupid, countryid);
    if (!isdefined(faction) || !isdefined(level.battlechatter.eventstrings) || !isdefined(level.battlechatter.eventstrings[faction])) {
        return;
    }
    event = level.battlechatter.eventstrings[faction][event_name];
    if (isarray(event)) {
        if (event.size == 0) {
            return;
        }
        if (event_name == "casualty" && isdefined(self.voice) && self.voice == #"hash_5f1ef8142f0b6fcb") {
            event[event.size - 1] = undefined;
        }
        event = array_event(event, event_name, faction);
    }
    if (isfunction(event)) {
        event = [[ event ]](data);
    }
    if (isstring(event) || isarray(event)) {
        return event;
    }
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x187ca
// Size: 0x1ea
function array_event(event, event_name, faction) {
    if (utility::ismp()) {
        return event[randomint(event.size)];
    }
    index = undefined;
    if (isdefined(self.vo_parent)) {
        origin = self.vo_parent.origin;
    } else {
        origin = self.origin;
    }
    if (!isdefined(origin)) {
        return undefined;
    }
    if (utility::issp()) {
        nearby_players = [level.player];
    } else {
        nearby_players = getplayersinrange(origin, level.var_587de0e7b537210a);
    }
    foreach (player in nearby_players) {
        if (isdefined(player.var_2036ddd05c3ffdc9) && isdefined(player.var_2036ddd05c3ffdc9[faction]) && isdefined(player.var_2036ddd05c3ffdc9[faction][event_name])) {
            index = player.var_2036ddd05c3ffdc9[faction][event_name];
            break;
        }
    }
    index = default_to(index, randomint(event.size));
    foreach (player in nearby_players) {
        if (!isdefined(player.var_2036ddd05c3ffdc9)) {
            player.var_2036ddd05c3ffdc9 = [];
        }
        if (!isdefined(player.var_2036ddd05c3ffdc9[faction])) {
            player.var_2036ddd05c3ffdc9[faction] = [];
        }
        player.var_2036ddd05c3ffdc9[faction][event_name] = (index + 1) % event.size;
    }
    return event[index];
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x189bd
// Size: 0x34
function add_lookup(faction, key, values) {
    level.battlechatter.eventstrings[faction][key] = values;
}

// Namespace battlechatter_events / namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x189f9
// Size: 0x17cbb
function event_init() {
    level.battlechatter.eventstrings["DGG"]["warn_getBack"] = ["s_wrnf_heygetthefuckback"];
    level.battlechatter.eventstrings["DGG"]["warn_getBackNow"] = ["s_wrnf_getbackgetbackrightn"];
    level.battlechatter.eventstrings["DGG"]["warn_getOut"] = ["s_wrnf_heyyougetthefuckouto"];
    level.battlechatter.eventstrings["DGG"]["warn_curse"] = ["s_wrnk_motherfucker"];
    level.battlechatter.eventstrings["DGG"]["warn_attack"] = ["s_wrnk_heyiwarnedyou", "s_wrnk_youwerewarned", "s_wrnk_heyyoujustfuckedup"];
    level.battlechatter.eventstrings["DGG"]["react_aware"] = ["s_rcaw_surprisedeffort", "s_rcaw_surprisedeffort_01", "s_rcaw_surprisedeffort_02", "s_rcaw_ohfuck", "s_rcaw_ohshit"];
    level.battlechatter.eventstrings["DGG"]["react_multi"] = ["s_rcml_takingcontact", "s_rcml_contactcontact"];
    level.battlechatter.eventstrings["DGG"]["react_unaware"] = ["s_rcun_whothefuckthrewthat", "s_rcun_whothrewthat", "s_rcun_wheredthatcomefrom", "s_rcun_whereditcomefrom"];
    level.battlechatter.eventstrings["AQS"]["right"] = ["c_posn_toourright", "c_posn_ontheright", "c_posn_rightsdie", "c_posn_rightright"];
    level.battlechatter.eventstrings["AQS"]["ahead"] = ["c_posn_aheadahead", "c_posn_rightinfrontofus", "c_posn_aheadofus", "c_posn_lookforward", "c_posn_thatwayaheadofyou"];
    level.battlechatter.eventstrings["AQS"]["behind"] = ["c_posn_watchbehindus", "c_posn_lookbehindus", "c_posn_watchourbacksbrother", "c_posn_checkbehindus", "c_posn_turnaround", "c_posn_behindusbrother"];
    level.battlechatter.eventstrings["AQS"]["high"] = ["c_posn_upup", "c_posn_upthere", "c_posn_aboveus"];
    level.battlechatter.eventstrings["AQS"]["left"] = ["c_posn_ontheleft", "c_posn_leftside", "c_posn_left", "c_posn_toourleft"];
    level.battlechatter.eventstrings["AQS"]["use_flash"] = ["c_ator_useaflashgrenade", "c_ator_throwaflashgrenade", "c_ator_blindthemwithaflashg"];
    level.battlechatter.eventstrings["AQS"]["use_grenade"] = ["c_ator_useagrenade", "c_ator_throwagrenade", "c_ator_attackthemwithagrena"];
    level.battlechatter.eventstrings["AQS"]["use_molotov"] = ["c_ator_throwamolotov", "c_ator_useamolotov", "c_ator_burnthemwithamolotov"];
    level.battlechatter.eventstrings["AQS"]["use_rpg"] = ["c_ator_firearocketatthem", "c_ator_useyourrockets", "c_ator_therocketusetherocke"];
    level.battlechatter.eventstrings["AQS"]["order_attack"] = ["c_ator_shootthem", "c_ator_startshooting", "c_ator_shootshoot", "c_ator_fireonthem", "c_ator_attackthem", "c_ator_shootyourweapon", "c_ator_shootthemthisisanord"];
    level.battlechatter.eventstrings["AQS"]["move"] = ["c_tcor_getmoving", "c_tcor_move", "c_tcor_movenow", "c_tcor_getupmove", "c_tcor_startmoving", "c_tcor_gobrothermove", "c_tcor_moveoverthere", "c_tcor_gonowgo"];
    level.battlechatter.eventstrings["AQS"]["moveup"] = ["c_tcor_moveup", "c_tcor_movetowardsthem", "c_tcor_goup", "c_tcor_getupthere", "c_tcor_goforwardmove"];
    level.battlechatter.eventstrings["AQS"]["coverme"] = ["c_tcor_coverme", "c_tcor_covermebrother", "c_tcor_ineedcover"];
    level.battlechatter.eventstrings["AQS"]["using_flash"] = ["c_atac_usingflashgrenade", "c_atac_tossingaflashgrenade"];
    level.battlechatter.eventstrings["AQS"]["using_grenade"] = ["c_atac_usinggrenade", "c_atac_tossingagrenade"];
    level.battlechatter.eventstrings["AQS"]["using_molotov"] = ["c_atac_usingamolotov", "c_atac_tossingamolotov"];
    level.battlechatter.eventstrings["AQS"]["using_rpg"] = ["c_atac_usingarocket", "c_atac_launchingarocket"];
    level.battlechatter.eventstrings["AQS"]["using_smoke"] = ["c_atac_throwingsmoke", "c_atac_smokegrenadeout"];
    level.battlechatter.eventstrings["AQS"]["attacking"] = ["c_atac_openingfire", "c_atac_imshooting", "c_atac_firing"];
    level.battlechatter.eventstrings["AQS"]["movingup"] = ["c_tcac_immovingup", "c_tcac_followme", "c_tcac_thiswaybrothers", "c_tcac_movingforward"];
    level.battlechatter.eventstrings["AQS"]["reloading"] = ["c_tcac_changingmagazine", "c_tcac_imreloading"];
    level.battlechatter.eventstrings["AQS"]["moving"] = ["c_tcac_moving", "c_tcac_immoving", "c_tcac_heyimmoving"];
    level.battlechatter.eventstrings["AQS"]["getting_cover"] = ["c_tcac_takingcover", "c_tcac_movingtocover", "c_tcac_gettingcover"];
    level.battlechatter.eventstrings["AQS"]["enemy_using_flash"] = ["c_eata_reactionimblind", "c_eata_reactionicantsee", "c_eata_flashgrenade"];
    level.battlechatter.eventstrings["AQS"]["enemy_using_grenade"] = ["c_eata_grenade", "c_eata_ohshit", "c_eata_grenadewatchout"];
    level.battlechatter.eventstrings["AQS"]["enemy_using_molotov"] = ["c_eata_molotov", "c_eata_watchthefire", "c_eata_molotovmove"];
    level.battlechatter.eventstrings["AQS"]["enemy_using_rpg"] = ["c_eata_rpg", "c_eata_rpg_01", "c_eata_rocketrocket"];
    level.battlechatter.eventstrings["AQS"]["enemy_attacking"] = ["c_eata_imtakingfire", "c_eata_imgettingshotat", "c_eata_theyreshootingatus"];
    level.battlechatter.eventstrings["AQS"]["enemy_flanking_left"] = ["c_etca_guardtheleftflank", "c_etca_theenemyisflankingle", "c_etca_theyreflankingleft"];
    level.battlechatter.eventstrings["AQS"]["enemy_flanking_right"] = ["c_etca_guardtherightflank", "c_etca_theenemyisflankingri", "c_etca_theyreflankingright"];
    level.battlechatter.eventstrings["AQS"]["enemy_moving"] = ["c_etca_onesmoving", "c_etca_iseeonemoving", "c_etca_theresonemoving"];
    level.battlechatter.eventstrings["AQS"]["enemy_moving_up"] = ["c_etca_onesmovingtowardsus", "c_etca_onesmovingup", "c_etca_onesmovingthisway"];
    level.battlechatter.eventstrings["AQS"]["enemy_getting_cover"] = ["c_etca_theenemyistakingcove", "c_etca_enemytakingcover", "c_etca_onestakingcover"];
    level.battlechatter.eventstrings["AQS"]["enemy_reloading"] = ["c_etca_onesreloading", "c_etca_iseeonereloading", "c_etca_heyonesreloading"];
    level.battlechatter.eventstrings["AQS"]["target_getting_cover"] = ["c_ttca_theyretakingcover", "c_ttca_theyreincover", "c_ttca_theyrebehindcover"];
    level.battlechatter.eventstrings["AQS"]["target_reloading"] = ["c_ttca_theyrereloading", "c_ttca_iseethemreloading", "c_ttca_thatonesreloading"];
    level.battlechatter.eventstrings["AQS"]["target_moving"] = ["c_ttca_theyremoving", "c_ttca_heytheyremoving", "c_ttca_theyremovingrightnow"];
    level.battlechatter.eventstrings["AQS"]["target_moving_up"] = ["c_ttca_theyremovingup", "c_ttca_theyremovingforward", "c_ttca_theyremovingtowardsu"];
    level.battlechatter.eventstrings["AQS"]["target_near_patrol"] = ["c_ttca_theyreswimmingnearth", "c_ttca_theyreswimmingyourwa", "c_ttca_interceptthem"];
    level.battlechatter.eventstrings["AQS"]["enemy_soldier"] = ["c_enmy_iseeanenemy", "c_enmy_iseeone", "c_enmy_enemy"];
    level.battlechatter.eventstrings["AQS"]["enemy_soldiers"] = ["c_enmy_enemiesenemies", "c_enmy_iseeenemies", "c_enmy_enemies"];
    level.battlechatter.eventstrings["AQS"]["aquired_target"] = ["c_aqen_hesrightthere", "c_aqen_icanseehim", "c_aqen_ifoundhim", "c_aqen_thereheis"];
    level.battlechatter.eventstrings["AQS"]["neg_target"] = ["c_aqen_where", "c_aqen_idontseeanyone", "c_aqen_whereishe", "c_aqen_icantseehim", "c_aqen_idontseehimbrother", "c_aqen_whatshislocation"];
    level.battlechatter.eventstrings["AQS"]["enemy_exposed"] = ["c_exco_onesoutofcover", "c_exco_anenemyisintheopen", "c_exco_onesintheopen"];
    level.battlechatter.eventstrings["AQS"]["target_exposed"] = ["c_exco_theyreoutofcover", "c_exco_theyreintheopen", "c_exco_theyrenotincover"];
    level.battlechatter.eventstrings["AQS"]["youre_exposed"] = ["c_exco_tothecovertothecover", "c_exco_gettocover", "c_exco_getbehindthecover"];
    level.battlechatter.eventstrings["AQS"]["target_covered"] = ["c_exco_theyrebehindthecover", "c_exco_theyretakingcover", "c_exco_theyreincover"];
    level.battlechatter.eventstrings["AQS"]["killfirm_enemy"] = ["c_firm_gotone", "c_firm_ikilledone", "c_firm_ishotone"];
    level.battlechatter.eventstrings["AQS"]["killfirm_target"] = ["c_firm_theyredead", "c_firm_ikilledthemthatpig", "c_firm_ishotthatone"];
    level.battlechatter.eventstrings["AQS"]["killfirm_truck"] = ["c_firm_theirtruckisdestroye", "c_firm_theirtruckisdown", "c_firm_idestroyedtheirtruck"];
    level.battlechatter.eventstrings["AQS"]["killfirm_bigrig"] = ["c_firm_itookouttheirbigrig", "c_firm_wedestroyedtheirbigr", "c_firm_theirbigrigisdestroy"];
    level.battlechatter.eventstrings["AQS"]["killfirm_helo"] = ["c_firm_ishotdowntheirhelico", "c_firm_idestroyedtheirhelic", "c_firm_theirhelicopterisdow"];
    level.battlechatter.eventstrings["AQS"]["casualties"] = ["c_casu_werelosingtoomany", "c_casu_theyrekillingus"];
    level.battlechatter.eventstrings["AQS"]["copy"] = ["c_conf_igotit", "c_conf_yesbrother", "c_conf_understood", "c_conf_iknow", "c_conf_iam", "c_aqcp_copy", "c_aqcp_copythat"];
    level.battlechatter.eventstrings["AQS"]["praise"] = ["c_pras_goodgood", "c_pras_goodworknowkillanoth", "c_pras_forsulamanmayhissoul", "c_pras_goodihopetheysuffere", "c_pras_yesbrotherkillthemal"];
    level.battlechatter.eventstrings["AQS"]["low_ammo"] = ["c_stat_ineedammunition", "c_stat_ineedmoreammunition", "c_stat_whohasanothermagazin", "c_stat_ineedamagazine", "c_stat_ineedanothermagazine"];
    level.battlechatter.eventstrings["AQS"]["wounded"] = ["c_stat_imhit", "c_stat_imhurtbrother", "c_stat_imwounded"];
    level.battlechatter.eventstrings["AQS"]["ask_wounded"] = ["c_stat_areyouwounded", "c_stat_areyouhurtbrother", "c_stat_areyouhit"];
    level.battlechatter.eventstrings["AQS"]["ask_low_ammo"] = ["c_stat_howsyourammunition", "c_stat_doyouneedammunition", "c_stat_areyougoodonammuniti"];
    level.battlechatter.eventstrings["AQS"]["ask_status"] = ["c_stat_areyouokay", "c_stat_areyougoodbrother", "c_stat_iseverythinggood"];
    level.battlechatter.eventstrings["AQS"]["reply_wounded"] = ["c_stat_theyshotme", "c_stat_thosepigsshotme", "c_stat_igothit"];
    level.battlechatter.eventstrings["AQS"]["reply_low_ammo"] = ["c_stat_runninglow", "c_stat_imlow", "c_stat_imalmostout"];
    level.battlechatter.eventstrings["AQS"]["reply_okay"] = ["c_stat_imokay", "c_stat_imgoodbrother", "c_stat_imgood"];
    level.battlechatter.eventstrings["AQS"]["wounded_enemy"] = ["c_aens_iwoundedthatone", "c_aens_gotoneheswounded", "c_aens_ihitoneofthem"];
    level.battlechatter.eventstrings["AQS"]["ask_target_loc"] = ["c_tast_whatstheirlocation", "c_tast_doyouseethem", "c_tast_wherearethey"];
    level.battlechatter.eventstrings["AQS"]["ask_target_wounded"] = ["c_tast_aretheydead", "c_tast_didyoushootthem", "c_tast_aretheyhitbrother"];
    level.battlechatter.eventstrings["AQS"]["target_wounded"] = ["c_tast_theyrewounded", "c_tast_theyrehurtkillthem", "c_tast_theyrebleeding"];
    level.battlechatter.eventstrings["AQS"]["target_unhurt"] = ["c_tast_theygotaway", "c_tast_ididntgetthem", "c_tast_imissedthembrother"];
    level.battlechatter.eventstrings["AQS"]["wounded_target"] = ["c_atas_heshurt", "c_atas_heswounded", "c_atas_iinjuredhim"];
    level.battlechatter.eventstrings["AQS"]["enemy_lmg"] = ["c_enws_machinegunner", "c_enws_theyhaveamachinegunn", "c_enws_onehasamachinegun"];
    level.battlechatter.eventstrings["AQS"]["enemy_shotgun"] = ["c_enws_shotgun", "c_enws_shotgun_01", "c_enws_oneofthemhasashotgun"];
    level.battlechatter.eventstrings["AQS"]["enemy_sniper"] = ["c_enws_theyhaveasniper", "c_enws_snipergetdown", "c_enws_carefulonessniping"];
    level.battlechatter.eventstrings["AQS"]["target_lmg"] = ["c_taws_machinegunmachinegun", "c_taws_thatonehasamachinegu", "c_taws_carefulbrothertheyha"];
    level.battlechatter.eventstrings["AQS"]["target_shotgun"] = ["c_taws_thatonehasashotgun", "c_taws_shotgun"];
    level.battlechatter.eventstrings["AQS"]["target_sniper"] = ["c_taws_sniper", "c_taws_hessnipingatus"];
    level.battlechatter.eventstrings["AQS"]["casualty"] = ["c_canm_mybrother", "c_canm_theykilledoneofours", "c_canm_theykilledhim", "c_canm_theykilledourbrother", "c_canm_abrotherhasfallen"];
    level.battlechatter.eventstrings["AQS"]["hostile_burst"] = ["c_hsbr_yournationswillburn", "c_hsbr_wearethekillers", "c_hsbr_weareyourexecutioner", "c_hsbr_wearethewolvesofsula"];
    level.battlechatter.eventstrings["AQS"]["suppressing"] = ["c_aqsp_gotyoucovered", "c_aqsp_coveringyou", "c_aqsp_imcoveringyougo", "c_aqsp_getbackgo"];
    level.battlechatter.eventstrings["AQS"]["reply_hear_you"] = ["s_idrp_yesbrother", "s_idrp_goahead", "s_idrp_yesihearyou", "s_idrp_ihearyougoahead"];
    level.battlechatter.eventstrings["AQS"]["resp_patrol"] = ["s_idrp_thisispatrol", "s_ahrp_thisispatrol"];
    level.battlechatter.eventstrings["AQS"]["muttered_confusion"] = ["s_idin_whatthefuck", "s_idin_whatthehell", "s_idin_whatthefuckisthat", "s_idin_whatthehellisthat"];
    level.battlechatter.eventstrings["AQS"]["investigating"] = ["s_idin_imgoingtocheckitout", "s_idin_illcheckitout", "s_idin_illgocheck"];
    level.battlechatter.eventstrings["AQS"]["inv_arrive"] = ["s_idin_hmm", "s_idin_hmphokay", "s_idin_huhwhatwasthat", "s_idin_hrm", "s_idin_huhthehell"];
    level.battlechatter.eventstrings["AQS"]["react_found_corpse"] = ["s_alrc_welostaman", "s_alrc_ifoundabodyitsoneofo", "s_alrc_oneofourpatrolsgothi", "s_alrc_welostabrother"];
    level.battlechatter.eventstrings["AQS"]["ask_corpse_name"] = ["s_alrc_whoisit", "s_alrc_who", "s_alrc_whodidwelose"];
    level.battlechatter.eventstrings["AQS"]["need_backup"] = ["s_alrc_sendbackup", "s_alrc_illneedbackup", "s_albc_getmesomebackup"];
    level.battlechatter.eventstrings["AQS"]["hunt_affirm"] = ["s_hnrs_yesbrother"];
    level.battlechatter.eventstrings["AQS"]["hunt_copy"] = ["s_hnrs_okay", "s_hnrs_gotit", "s_hnrs_copy"];
    level.battlechatter.eventstrings["AQS"]["hunt_neg"] = ["s_hnrs_nobrother"];
    level.battlechatter.eventstrings["AQS"]["react_whizby"] = ["s_unrc_someoneshotatme", "s_unrc_ijustgotshotat", "s_unrc_imgettingshotat", "s_unrc_someonetriedtoshootm", "s_unrc_itookfire"];
    level.battlechatter.eventstrings["AQS"]["react_loc"] = ["s_unrc_itcamefromoverthere", "s_unrc_itcamefromthatdirect", "s_unrc_itwasfromthatway", "s_unrc_itcamefromthatway", "s_unrc_itwasfromthatdirecti"];
    level.battlechatter.eventstrings["AQS"]["react_unaware"] = ["s_unrc_imtakingfire", "s_unrc_contact", "s_unrc_imunderattack"];
    level.battlechatter.eventstrings["AQS"]["over_there"] = ["s_hnfn_overthere", "s_hnfn_theyreoverthere", "s_hnfn_theyreoverthatway"];
    level.battlechatter.eventstrings["AQS"]["surprise"] = ["s_hurc_ohgod", "s_hurc_ohfuck", "s_hurc_ohshit"];
    level.battlechatter.eventstrings["AQS"]["report_reply_idle"] = ["s_idrr_nothinghere", "s_idrr_secure", "s_idrr_weregoodbrother", "s_idrr_allclear", "s_idrr_goodhere", "s_idrr_nothingtoreport", "s_idrr_quietherebrother"];
    level.battlechatter.eventstrings["AQS"]["react_first"] = ["s_idrc_huh", "s_idrc_wha", "s_idrc_hm", "s_idrc_eh", "s_idrc_hrm", "s_idrc_hmph"];
    level.battlechatter.eventstrings["AQS"]["react_second"] = ["s_idrc_whatthefuckwasthat", "s_idrc_whatthehellwasthat", "s_idrc_whosthere"];
    level.battlechatter.eventstrings["AQS"]["react_multi"] = ["s_idrm_whatthefuckisgoingon", "s_idrm_okaywhatthefuck", "s_idrm_issomeonefuckingwith"];
    level.battlechatter.eventstrings["AQS"]["react_interrupt"] = ["s_idli_whatswrong", "s_idli_whatwasthat", "s_idli_areyouokaybrother"];
    level.battlechatter.eventstrings["AQS"]["react_noreply"] = ["s_idli_areyouthere", "s_idli_wheredyougo", "s_idli_canyouhearme"];
    level.battlechatter.eventstrings["AQS"]["order_investigate"] = ["s_idio_gocheckitout", "s_idio_goseewhatitwas", "s_idio_gocheckjusttobesure"];
    level.battlechatter.eventstrings["AQS"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["AQS"]["idle_good_hunting"] = ["s_idls_besafebrother", "s_idls_staysharpbrother", "s_idls_keepyoureyesopenbrot"];
    level.battlechatter.eventstrings["AQS"]["inv_ask_first"] = ["s_idia_whatwasit", "s_idia_whatdidyousee", "s_idia_yougotanything", "s_idia_didyouseeanything", "s_idia_findanything"];
    level.battlechatter.eventstrings["AQS"]["inv_ask_second"] = ["s_idia_whatwasitthistime", "s_idia_seeanythingthistime", "s_idia_stillnothing", "s_idia_stilldidntfindanythi", "s_idia_findanythingthistime"];
    level.battlechatter.eventstrings["AQS"]["resp_water_first"] = ["s_idir_soundedlikesomething", "s_idir_iheardsplashingbutit", "s_idir_thewaterwasmovingbut", "s_idir_thoughtiheardsomethi"];
    level.battlechatter.eventstrings["AQS"]["resp_sound_first"] = ["s_idir_nothingididntseeanyo", "s_idir_ididntseeanyonewereg", "s_idir_thoughtiheardsomeone", "s_idir_soundedlikesomeoneru"];
    level.battlechatter.eventstrings["AQS"]["order_check_together"] = ["s_idit_letsgocheckitout", "s_idit_thiswayfollowme", "s_idit_overherecoverme"];
    level.battlechatter.eventstrings["AQS"]["covering_investigate"] = ["s_idit_rightbehindyou", "s_idit_imwithyou", "s_idit_ivegotyourback"];
    level.battlechatter.eventstrings["AQS"]["team_return_idle"] = ["s_idid_letsheadback", "s_idid_fuckitletsgetback", "s_idid_alrightweshouldgetba"];
    level.battlechatter.eventstrings["AQS"]["ask_heard_that"] = ["s_alre_didyouhearthat", "s_alre_youheardthatright", "s_alre_youheardthattoo"];
    level.battlechatter.eventstrings["AQS"]["ask_saw_that"] = ["s_alre_didyouseethat", "s_alre_tellmeyousawthat", "s_alre_yousawthatright"];
    level.battlechatter.eventstrings["AQS"]["have_something"] = ["s_alre_imighthavesomething", "s_alre_ithinkihavesomething", "s_alre_ithinksomethingsover"];
    level.battlechatter.eventstrings["AQS"]["heard_something"] = ["s_alre_iheardsomething", "s_alre_iheardanoise", "s_alre_iheardanoisebyme"];
    level.battlechatter.eventstrings["AQS"]["saw_something"] = ["s_alre_isawsomething", "s_alre_ithinkisawsomething", "s_alre_ithinksomeonesnearme"];
    level.battlechatter.eventstrings["AQS"]["see_something"] = ["s_alre_iseesomething", "s_alre_ithinkiseesomething", "s_alre_iseesomethingnearme"];
    level.battlechatter.eventstrings["AQS"]["team_have_something"] = ["s_alre_wemighthavesomething", "s_alre_ithinkwegotsomething", "s_alre_wemayhavesomethinghe"];
    level.battlechatter.eventstrings["AQS"]["team_heard_something"] = ["s_alre_weheardsomething", "s_alre_weheardsomethingnear", "s_alre_weheardanoise"];
    level.battlechatter.eventstrings["AQS"]["team_saw_something"] = ["s_alre_wesawsomething", "s_alre_wesawsomethingnearus", "s_alre_wesawsomethingnearou"];
    level.battlechatter.eventstrings["AQS"]["team_see_something"] = ["s_alre_weseesomething"];
    level.battlechatter.eventstrings["AQS"]["bottle_whizby"] = ["s_alre_whothefuckthrewthat", "s_alre_whothrewthat", "s_alre_youmissed"];
    level.battlechatter.eventstrings["AQS"]["object_whizby"] = ["s_alre_whothefuckthrewthat", "s_alre_whothrewthat", "s_alre_youmissed"];
    level.battlechatter.eventstrings["AQS"]["jailer_body_react"] = ["s_idrm_okaywhatthefuck", "s_idrm_whatthefuckisgoingon", "s_idrm_issomeonefuckingwith"];
    level.battlechatter.eventstrings["AQS"]["jailer_head_react"] = ["s_unrc_imtakingfire", "s_unrc_contact", "s_unrc_imunderattack", "s_unrc_itookfire"];
    level.battlechatter.eventstrings["AQS"]["react_resp"] = ["s_alrr_yeah", "s_alrr_yesbrother", "s_alrr_yeahidid"];
    level.battlechatter.eventstrings["AQS"]["alert_investigating"] = ["s_alin_imgoingtocheckitout", "s_alin_imcheckingitout", "s_alin_imgoingtochecktheare"];
    level.battlechatter.eventstrings["AQS"]["team_alert_investigating"] = ["s_alin_weregoingtocheckitou", "s_alin_werecheckingitout", "s_alin_weregoingtoseewhatit"];
    level.battlechatter.eventstrings["AQS"]["alert_confirming"] = ["s_alcf_roger", "s_alcf_copy", "s_alcf_copythat"];
    level.battlechatter.eventstrings["AQS"]["inv_ask"] = ["s_alia_youseeanything", "s_alia_yougotsomething", "s_alia_whatvewegot", "s_alia_youseesomething"];
    level.battlechatter.eventstrings["AQS"]["inv_patrol"] = ["s_alip_illsecurethisareayou", "s_alip_illsearcharoundgetba", "s_alip_headbacktoyourpatrol", "s_alip_keeppatrollingillsec"];
    level.battlechatter.eventstrings["AQS"]["report_reply_search"] = ["s_alir_nothingyet", "s_alir_nothingsofar", "s_alir_itsbeenquietsofar", "s_alir_weregoodfornow", "s_alir_allclearrightnow", "s_alir_sofarsogood", "s_alir_notseeinganythingyet", "s_alir_haventseenanything", "s_alir_nothingfornow", "s_alir_itsclearfornow", "s_alir_weregoodsofar"];
    level.battlechatter.eventstrings["AQS"]["ask_enemy_loc"] = ["s_unwl_wheredthatcomefrom", "s_unwl_whereditcomefrom", "s_unwl_wherethefuckarethey"];
    level.battlechatter.eventstrings["AQS"]["enemy_loc_resp"] = ["s_unrs_idontknow", "s_unrs_ididntseethem", "s_unrs_idontfuckingknow", "s_unrs_ididntsee"];
    level.battlechatter.eventstrings["AQS"]["ask_enemy_count"] = ["s_unwc_howmanyarethere", "s_unwc_howmanyofem", "s_unwc_howmany"];
    level.battlechatter.eventstrings["AQS"]["unaware_backup"] = ["s_unwb_ineedbackupnow", "s_unwb_getbackupoverhere", "s_unwb_sendbackupnow"];
    level.battlechatter.eventstrings["AQS"]["react_first_combat"] = ["s_awrr_enemy", "s_awrr_theenemyishere", "s_awrr_enemyrighthere", "s_awrr_theresanenemy", "s_awrr_enemyenemy", "s_awrr_someoneshere", "s_awrr_enemyhere"];
    level.battlechatter.eventstrings["AQS"]["at_my_location"] = ["s_awrr_hererighthere", "s_awrr_rightherebrothers", "s_awrr_heyoverhere", "s_awrr_righthererighthere", "s_awrr_heytheyrerighthere", "s_awrr_theyrehereiseethem", "s_awrr_heytheyreoverhere", "s_awrr_heytheyrehere"];
    level.battlechatter.eventstrings["AQS"]["found_you"] = ["s_awrr_motherfucker", "s_awrr_pieceofshit", "s_awrr_youbitch", "s_awrr_fuckyou", "s_awrr_gotyou"];
    level.battlechatter.eventstrings["AQS"]["report_target_water"] = ["s_awrr_theyreinthewaterover", "s_awrr_theyreswimmingoverth", "s_awrr_heytheyreswimmingove", "s_awrr_theyreswimmingthiswa", "s_awrr_icanhearthemtheyrein", "s_awrr_theyreswimmingoverhe", "s_awrr_heytheyreswimmingtha"];
    level.battlechatter.eventstrings["AQS"]["found_target"] = ["s_awrr_heytheyrerightthere", "s_awrr_heyiseethem", "s_awrr_ifoundthem", "s_awrr_igotthem", "s_awrr_theretheyare", "s_awrr_theyrerightoverthere"];
    level.battlechatter.eventstrings["AQS"]["order_check_last"] = ["s_advo_moveontheirlocationg", "s_advo_checkiftheyrethere", "s_advo_moveonthem"];
    level.battlechatter.eventstrings["AQS"]["lost_target"] = ["s_lkpl_frustratedgrunttheyr", "s_lkpl_frustratedgrunttheyr_01", "s_lkpl_frustratedgruntwelos_01", "s_lkpl_frustratedgruntfuckt"];
    level.battlechatter.eventstrings["AQS"]["lost_target_water"] = ["s_lkpw_theywentunderwater", "s_lkpw_theyreinthewater", "s_lkpw_theyjumpedinthewater", "s_lkpw_theywentinthewater"];
    level.battlechatter.eventstrings["AQS"]["ask_target_location"] = ["s_lklr_wherearethey", "s_lklr_doyouseethem", "s_lklr_youseewheretheywent", "s_lklr_wheredtheygo", "s_lklr_wherethefuckarethey", "s_lklr_whereisthisperson"];
    level.battlechatter.eventstrings["AQS"]["wait_target_surface"] = ["s_lkwr_whentheycomesupforai", "s_lkwr_theypoptheirheadouty", "s_lkwr_whentheycomeupyoukil", "s_lkwr_theygoforairyoutaket", "s_lkwr_whentheypopuptheyred", "s_lkwr_theyllcomeupforairwh"];
    level.battlechatter.eventstrings["AQS"]["water_use_grenade"] = ["s_lkwf_dontusebulletsusegre", "s_lkwf_throwagrenadeinthere", "s_lkwf_useyourgrenadesthrow"];
    level.battlechatter.eventstrings["AQS"]["target_still_close"] = ["s_lkpc_theywerehere", "s_lkpc_theywererighthere", "s_lkpc_theycantbefar", "s_lkpc_theyreclose", "s_lkpc_theyrehiding", "s_lkpc_theyvegottabehere", "s_lkpc_theydidntjustdisappe", "s_lkpc_theyreheresomewhere"];
    level.battlechatter.eventstrings["AQS"]["order_clear_building"] = ["s_cmho_clearthebuilding", "s_cmho_securethebuilding", "s_cmho_getthisbuildingclear"];
    level.battlechatter.eventstrings["AQS"]["order_search_water"] = ["s_cmho_searchthewater", "s_cmho_checkthewater", "s_cmho_keepyoureyesonthewat", "s_cmho_watchthewater", "s_cmho_theywereinthewater"];
    level.battlechatter.eventstrings["AQS"]["clearing_east"] = ["s_cmhs_checkingeast", "s_cmhs_movingeast", "s_cmhs_searchingeast"];
    level.battlechatter.eventstrings["AQS"]["clearing_north"] = ["s_cmhs_scoutingnorth", "s_cmhs_checkingnorth", "s_cmhs_movingnorth"];
    level.battlechatter.eventstrings["AQS"]["clearing_south"] = ["s_cmhs_movingsouth", "s_cmhs_checkingsouth", "s_cmhs_scanningsouth"];
    level.battlechatter.eventstrings["AQS"]["clearing_west"] = ["s_cmhs_movingwest", "s_cmhs_scoutingwest", "s_cmhs_checkingwest"];
    level.battlechatter.eventstrings["AQS"]["searching_here"] = ["s_cmhc_thisareasgood", "s_cmhc_thisareasclear", "s_cmhc_myareaisclear"];
    level.battlechatter.eventstrings["AQS"]["cmb_hunt_confirmation"] = ["s_cmhr_yesbrother", "s_cmhr_copythat", "s_cmhr_okay", "s_cmhr_gotit", "s_cmhr_nobrother"];
    level.battlechatter.eventstrings["AQS"]["good_hunting"] = ["s_hnts_besafebrother", "s_hnts_stayalertbrother", "s_hnts_onyourtoesbrother"];
    level.battlechatter.eventstrings["AQS"]["moving_there"] = ["s_hntm_movingnow", "s_hntm_movingtherenow", "s_hntm_moving"];
    level.battlechatter.eventstrings["AQS"]["moving_alone"] = ["s_hntm_onmywaybrother", "s_hntm_immoving", "s_hntm_imheadingtherenow"];
    level.battlechatter.eventstrings["AQS"]["moving_following"] = ["s_hntm_imwithyoubrother", "s_hntm_ihaveyourback", "s_hntm_illguardyourback"];
    level.battlechatter.eventstrings["AQS"]["moving_together"] = ["s_hntm_weremoving", "s_hntm_weremovingtherenow", "s_hntm_onourwaybrother"];
    level.battlechatter.eventstrings["AQS"]["order_follow_me"] = ["s_hntm_letsmovestaytogether", "s_hntm_followmeletsgo", "s_hntm_yourewithmeletsmove"];
    level.battlechatter.eventstrings["AQS"]["order_take_point"] = ["s_hntm_taketheleadbrotherle", "s_hntm_letskeepmovingyoulea", "s_hntm_letsgetovertherelead", "s_aqhr_letsgoillcoveryou", "s_aqhr_letsgetovertherelead", "s_aqhr_letsmoveyoulead"];
    level.battlechatter.eventstrings["AQS"]["ask_found_anything"] = ["s_aqhr_gotanything", "s_aqhr_yougotsomething", "s_aqhr_findanything", "s_aqhr_youseethem", "s_aqhr_didyoufindsomething", "s_aqhr_whatdoyougot"];
    level.battlechatter.eventstrings["AQS"]["reply_found_nothing"] = ["s_aqhr_nothingyet", "s_aqhr_nothingsofar", "s_aqhr_nothingherebrother"];
    level.battlechatter.eventstrings["AQS"]["report_searching"] = ["s_aqhr_stillsweepingthisare", "s_aqhr_stillsearching", "s_aqhr_stilllookingforthem"];
    level.battlechatter.eventstrings["AQS"]["report_nothing"] = ["s_aqhr_theresnothinghere", "s_aqhr_nosignofthemyet", "s_aqhr_noonesherebrother"];
    level.battlechatter.eventstrings["AQS"]["report_investigating"] = ["s_aqhr_checkingthisarea", "s_aqhr_securingthisarea", "s_aqhr_searchingthisarea"];
    level.battlechatter.eventstrings["AQS"]["area_clear"] = ["s_aqhr_thisareaisclear", "s_aqhr_clearhere", "s_aqhr_areaclear"];
    level.battlechatter.eventstrings["AQS"]["order_dir"] = ["s_aqhs_checkthatway", "s_aqhs_heysearchoverthere", "s_aqhs_checkoverthere", "s_aqhs_searchthatway"];
    level.battlechatter.eventstrings["AQS"]["order_dir_resp"] = ["s_aqhs_illsearchoverhere", "s_aqhs_illtakethisway", "s_aqhs_illtakeoverhere", "s_aqhs_illsearchthisway"];
    level.battlechatter.eventstrings["AQS"]["hunt_search_object"] = ["s_aqhs_itsclear", "s_aqhs_clear", "s_aqhs_nothinghere", "s_aqhs_goodhere"];
    level.battlechatter.eventstrings["AQS"]["hunt"] = ["s_aqhb_wherethefuckareyou", "s_aqhb_wherethefuckishe", "s_aqhb_whereisthispieceofsh", "s_aqhb_comeonwhereareyouhid", "s_aqhb_wherethefuckdidyougo", "s_aqhb_pieceofshitshowyours", "s_aqhb_motherfuckerwhereare"];
    level.battlechatter.eventstrings["AQS"]["hunt_inv_order"] = ["s_ahii_checkit", "s_ahii_checkitout", "s_ahii_gocheckit", "s_ahii_searchit"];
    level.battlechatter.eventstrings["AQS"]["hunt_inv_event"] = ["s_ahir_ithinktheyrenearme", "s_ahir_imighthavethem", "s_ahir_ijustheardthem", "s_ahir_imighthavefoundthem"];
    level.battlechatter.eventstrings["AQS"]["hunt_reactions"] = ["s_ahnr_surprisedinttenserea", "s_ahnr_surprisedinttenserea_01", "s_ahnr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["AQS"]["cmb_reactions"] = ["s_aqcr_surprisedinttenserea", "s_aqcr_surprisedinttenserea_01", "s_aqcr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["AQS"]["whizby_resp"] = ["s_aqal_itcamefromoverthere", "s_aqal_itcamefromthatway", "s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["AQS"]["hunt_cornercheck"] = ["s_aqho_checkyourcorners", "s_aqho_checkthecorners", "s_aqho_searcheverycornerfin"];
    level.battlechatter.eventstrings["AQS"]["hunt_order_hold"] = ["s_aqho_holdup", "s_aqho_wait", "s_aqho_hold"];
    level.battlechatter.eventstrings["AQS"]["alert_cornercheck"] = ["s_aqao_besuretocheckthecorn", "s_aqao_checkthecornersjustt", "s_aqao_remembertochecktheco"];
    level.battlechatter.eventstrings["AQS"]["alert_order_hold"] = ["s_aqao_holdup", "s_aqao_wait", "s_aqao_hold"];
    level.battlechatter.eventstrings["AQS"]["alert_search_orders"] = ["s_aqao_checkthatway", "s_aqao_gothatway", "s_aqao_checkoverthere", "s_aqao_searchoverthere", "s_aqao_searchthatway", "s_aqao_lookoverthere"];
    level.battlechatter.eventstrings["AQS"]["attack_orders"] = ["s_aato_patrol"];
    level.battlechatter.eventstrings["AQS"]["lkp_patrol_search"] = ["s_alwp_justwatchthewater", "s_alwp_keepwatchingthatside", "s_alwp_justkeepyoureyesonth"];
    level.battlechatter.eventstrings["AQS"]["hunt_report_alert"] = ["s_aqlo_spreadoutfindthem", "s_aqlo_searchtheareafindthe", "s_aqlo_spreadoutsearchthear"];
    level.battlechatter.eventstrings["AQS"]["disguise_enter_investigate"] = ["s_idrc_whosthere", "s_idli_areyouokaybrother", "s_alrc_whoisit", "s_idin_huhwhatwasthat", "s_idin_hmphokay", "s_idin_hmm"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"] = [];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][0] = ["s_idsl_wewillkillalltheysen", "s_idsl_likegrandfatherdid", "s_idsl_theydontcareaboutthi", "s_idsl_itmeansnothingtothem", "s_idsl_notheywantsomething", "s_idsl_theyalwayswantsometh", "s_idsl_neverheretohelptofix", "s_idsl_justtakeandtake", "s_idsl_untileverythingisdea", "s_idsl_thesemercenaries", "s_idsl_youwanttostealfromus", "s_idsl_illsendallyoudemonsb"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][1] = ["s_idsl_ourwarisnotforourfai", "s_idsl_wefighttoremoveallfo", "s_idsl_wearealqatalaweareth", "s_idsl_wefightwithoutsorrow", "s_idsl_wewagewarwithoutsymp", "s_idsl_thisistheonlywaytoli", "s_idsl_atruesoldier"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][2] = ["s_idsl_ourwarisnotforourfai_01", "s_idsl_wefighttoremovetorem", "s_idsl_startoverokayourwari", "s_idsl_wefighttoremoveuhall", "s_idsl_wewagewarswithnosymp", "s_idsl_itistheonlywaytolive", "s_idsl_atruesoldieratruesol", "s_idsl_okayonemoretime"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][3] = ["s_idsl_goahead", "s_idsl_anysecondnow", "s_idsl_askmetoreportin", "s_idsl_everyfewminutesthisf", "s_idsl_illreportinwhenthere"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][4] = ["s_idsl_mastaphakazithekingo", "s_idsl_wetookyourcrownandsl", "s_idsl_nowalmasrareturnstoh", "s_idsl_whowillalwaysfightto"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][5] = ["s_idsl_goingtobealongday", "s_idsl_cantsleep", "s_idsl_themercenairesrisewi", "s_idsl_juststayfocused", "s_idsl_rememberwhyyoufighth", "s_idsl_dontgetlazy", "s_idsl_ifyourelazyyoudie"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][6] = ["s_idsl_thisfuckingheat", "s_idsl_whycantwefightduring", "s_idsl_atleasticoulddiecomf"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][7] = ["s_idsl_irangivesusarmorandw", "s_idsl_couldatleastgiveusso", "s_idsl_weneedtocontrolthesk", "s_idsl_thennoonewillfuckwit"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][8] = ["s_idsl_ishouldbeonthefrontl", "s_idsl_notdefendinggarbage", "s_idsl_ihopeanenemyshowsuph", "s_idsl_thenitwontbesofuckin", "s_idsl_icouldseesomecombat", "s_idsl_getmyfirstkill"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"] = [];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][0] = ["s_idcv_haveyoutrainedforthe", "s_idcv_yeahlastmonth", "s_idcv_whatplacedoyouwantto", "s_idcv_spainiwanttoworkwith", "s_idcv_thatismyfirstchoices", "s_idcv_notamsterdamthatshit", "s_idcv_idontcareatleastitsc"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][1] = ["s_idcv_haveyoufoughtthembef", "s_idcv_themercenaries", "s_idcv_yesthelegionorthaton", "s_idcv_nonotthemifoughtones", "s_idcv_youwereinverdansk", "s_idcv_yesbrotheriwastherew", "s_idcv_whatwasitlike", "s_idcv_hehitwashellbutfunto", "s_idcv_iwantedtogotheykeptm", "s_idcv_russiansiranianswhen", "s_idcv_wehavenewweaponsbett", "s_idcv_yeahwealsohaveabigge", "s_idcv_sobeitillfightanyone", "s_idcv_yeahsurejustkeepaloo"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][2] = ["s_idcv_howmuchlonger", "s_idcv_untilwhat", "s_idcv_untilthiswarisover", "s_idcv_hehwhenthebastardsfi", "s_idcv_thatwillneverhappenw", "s_idcv_liketherussians", "s_idcv_themandtheamericans", "s_idcv_anddictatorskazithat", "s_idcv_dontforgettheirarmie", "s_idcv_andnowtheirmercenari", "s_idcv_yeahwellkillthemtoo", "s_idcv_thatsrightbrother"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][3] = ["s_idcv_whatwasyourfirstbigb", "s_idcv_theattackonthecoast", "s_idcv_youwereontheship", "s_idcv_yeahiwaswiththesnipe", "s_idcv_iheardyouguyskilleds", "s_idcv_eitherthebulletsorfl", "s_idcv_thatsbadassthatshipw"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][4] = ["s_idcv_heyiseeone", "s_idcv_noyoudontstopdoingth", "s_idcv_imboredmanineedenter", "s_idcv_yeahwelldontgetuskil", "s_idcv_itwasajoke", "s_idcv_doesntmatterwhenyoua", "s_idcv_okayokayfairenough"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][5] = ["s_idcv_heyyoudead", "s_idcv_stillalive", "s_idcv_sometimesithinkicoul", "s_idcv_sometimes", "s_idcv_youthinkthatcouldhap", "s_idcv_no", "s_idcv_ithoughtmyfrienddied", "s_idcv_aoneleggedamericando", "s_idcv_imsayingtheamericani", "s_idcv_howdyouknowhehadonel", "s_idcv_nobutothersdidtheyto", "s_idcv_tohellwiththattraito", "s_idcv_youknowherownbrother", "s_idcv_andhewasrighttodoitn", "s_idcv_okaywellletmethinkof"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][6] = ["s_idcv_iheardthemercenaries", "s_idcv_didourbrothersstopth", "s_idcv_easilytheykilledallo", "s_idcv_goodforthem"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][7] = ["s_idcv_ithinkiknowawaytoend", "s_idcv_yeahwhatsthat", "s_idcv_justdoitliketheoldda", "s_idcv_andwhosourbestyou", "s_idcv_nobutevenicouldslaug", "s_idcv_sowewoulddefinitelyw", "s_idcv_itellyoutakeawaythei", "s_idcv_ohsoyouthinkthiswoul", "s_idcv_managainstmanwewould", "s_idcv_yourefullofshitjustp"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][8] = ["s_idcv_whatdoyouthinkofthel", "s_idcv_idontknowalotabouthi", "s_idcv_thewolftrustedhim", "s_idcv_andhowdidthatturnout", "s_idcv_ibelieveinhimheisbol", "s_idcv_thosearemiraclesinth", "s_idcv_youresayinghesatyran", "s_idcv_imsayinghemustprovew"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][9] = ["s_idcv_youknowwhywereguardi", "s_idcv_thisisourhome", "s_idcv_nobrotheritstostopth", "s_idcv_becausetheywanttotak", "s_idcv_theydontgiveashitabo", "s_idcv_nowhat", "s_idcv_abrokenwatchandsomec", "s_idcv_theyrejustthieves", "s_idcv_simplesmallbrainedth", "s_idcv_pathetic"];
    map_name = default_to(level.script, "");
    level.battlechatter.eventstrings["RU"]["idle_solo"] = [];
    level.battlechatter.eventstrings["RU"]["idle_solo"][0] = ["s_ic01_ineedastatusupdate", "s_ic01_stillinprogress", "s_ic01_whatstheholdup", "s_ic01_itwentoffline", "s_ic01_eta", "s_ic01_10mikes"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][1] = ["s_ic03_howsyourperimeter", "s_ic03_justfinishedasweepal", "s_ic03_copy", "s_ic03_illtakeanotherpassin", "s_ic03_goodstayonit", "s_ic03_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][2] = ["s_ic05_delta03howmuchlonger", "s_ic05_5mikes", "s_ic05_whenyouredonemoveont", "s_ic05_rogerwantmetocomebac", "s_ic05_sendcharliesquadover", "s_ic05_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][3] = ["s_ic07_alpha02anyhostiles", "s_ic07_negativenothingyet", "s_ic07_copymaintainposition", "s_ic07_youseeanything", "s_ic07_negativebutstayalert", "s_ic07_rogerthatalpha01"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][4] = ["s_ic09_alpha03areyoudone", "s_ic09_negativeinprogress", "s_ic09_shouldvebeenfinished", "s_ic09_itllbeonschedule", "s_ic09_pickupthepacecommand", "s_ic09_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][5] = ["s_ic11_alphateamreport", "s_ic11_thisisalphawerewrapp", "s_ic11_copyyouarecleartopro", "s_ic11_whatsdeltassituation", "s_ic11_halfwaydoneonschedul", "s_ic11_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][6] = ["s_ic13_tango02whenyouredone", "s_ic13_copy", "s_ic13_makeitquick", "s_ic13_didsomethinghappen", "s_ic13_captainwantstwomanfi", "s_ic13_rogertango01"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][7] = ["s_ic15_alphateamreport", "s_ic15_inpositionnomovement", "s_ic15_copystayonalert", "s_ic15_anythingfromtheother", "s_ic15_negativenocontacts", "s_ic15_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][8] = ["s_ic17_alpha03havereinforce", "s_ic17_negativewearestillwa", "s_ic17_updatemewhentheydo", "s_ic17_copystillonschedule", "s_ic17_notiftangodoesntgeth", "s_ic17_illmakesuretheydo"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][9] = ["s_ic19_commandthisisalpha01", "s_ic19_lastknownlocation", "s_ic19_sector7", "s_ic19_inspectitbeonguard", "s_ic19_copy", "s_ic19_givemeupdateseveryfi"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][10] = ["s_ic21_delta02haveyoufounda", "s_ic21_negativeandyou", "s_ic21_nothingyet", "s_ic21_wasourinteloff", "s_ic21_keepsearchingitshere", "s_ic21_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][11] = ["s_ic23_whiskey02areweready", "s_ic23_negativeinprogress", "s_ic23_eta", "s_ic23_tenmikes", "s_ic23_movefasterclocksrunn", "s_ic23_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][12] = ["s_ic25_alpha03toallteamspos", "s_ic25_goodcommandsnotfucki", "s_ic25_shouldimeetwithecho", "s_ic25_negativeholdposition", "s_ic25_rogerstandingby", "s_ic25_updateinfive"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][13] = ["s_ic27_thisisdelta02noactiv", "s_ic27_copy02", "s_ic27_goingtofindcharliehi", "s_ic27_copystayalerthostile", "s_ic27_willradiowhenivemade", "s_ic27_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][14] = ["s_ic29_whiskey04reportingal", "s_ic29_copywhiskeykeepmeupd"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][15] = ["s_ic31_thisisalpha02allquie", "s_ic31_copythatalphamaintai", "s_ic31_roger", "s_ic31_deltasstill10mikesou", "s_ic31_willholduntiltheyarr", "s_ic31_beonguard"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][16] = ["s_ic33_rotationcommencingin", "s_ic33_copywhostakingover", "s_ic33_delta", "s_ic33_canyouconfirmournext", "s_ic33_affirmativesector3no", "s_ic33_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][17] = ["s_ic35_thisistango01iminpos", "s_ic35_copyhowdoesitlook", "s_ic35_areaislocked", "s_ic35_sweepagainstayonthis", "s_ic35_copywillupdateinfive", "s_ic35_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][18] = ["s_ic37_thisischarlie01givem", "s_ic37_charlie01exfilinboun", "s_ic37_markingstationone", "s_ic37_affirmative", "s_ic37_beonguard", "s_ic37_willradiowheniseethe"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][19] = ["s_ic39_whatsyourstatustango", "s_ic39_tango02allclear", "s_ic39_copyyouseecharlie", "s_ic39_affirmativecharlieis", "s_ic39_stayalertandholdposi", "s_ic39_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][20] = ["s_ic41_thisissierra02inposi", "s_ic41_copysierrazuluandalp", "s_ic41_eta", "s_ic41_tminusfour", "s_ic41_statusonecho", "s_ic41_movingnow"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][21] = ["s_ic43_delta01inpositionare", "s_ic43_copy01youconnectwith", "s_ic43_affirmativetheyreinp", "s_ic43_copy", "s_ic43_therearealotofteamso", "s_ic43_commandsnottakingany"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][22] = ["s_ic45_zulu02inposition", "s_ic45_copystayputcommsares", "s_ic45_contact", "s_ic45_unknownstayonguardun", "s_ic45_rogergunsareready", "s_ic45_copy"];
    level.battlechatter.eventstrings["RU"]["idle_conv"] = [];
    level.battlechatter.eventstrings["RU"]["idle_conv"][0] = ["s_ic02_whatsyourstatus", "s_ic02_workingonit", "s_ic02_helosarealreadyinbou", "s_ic02_illbringintangotohel", "s_ic02_getitdonein15", "s_ic02_willdoitin10"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][1] = ["s_ic04_anyactivity", "s_ic04_perimetersclear", "s_ic04_sweepitagain", "s_ic04_copywillheadoutinfiv", "s_ic04_staysharp", "s_ic04_rog"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][2] = ["s_ic06_eta", "s_ic06_shouldbedonein20", "s_ic06_hopedforsooner", "s_ic06_whatmattersisthatits", "s_ic06_captainstimelinenotm", "s_ic06_wereonit"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][3] = ["s_ic08_anymovement", "s_ic08_negativeyou", "s_ic08_notyet", "s_ic08_hostilescouldbeplayi", "s_ic08_ingoodpositionwerese", "s_ic08_copythatkeepingwatch"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][4] = ["s_ic10_howarewedoingonprep", "s_ic10_everythingisset", "s_ic10_sector2", "s_ic10_tangoteamsgotitlocke", "s_ic10_wewillmeetwiththemon", "s_ic10_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][5] = ["s_ic12_captainwantsanupdate", "s_ic12_tenmoreminutes", "s_ic12_makeitinfive", "s_ic12_weneedmorebodiesonit", "s_ic12_charlieteam", "s_ic12_theyshouldbewrappeds"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][6] = ["s_ic14_wereceiveneworders", "s_ic14_affirmativeweretomee", "s_ic14_location", "s_ic14_outerperimeterfullsw", "s_ic14_copy", "s_ic14_letsmove"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][7] = ["s_ic16_wherearetheothers", "s_ic16_alpha02and03aresecur", "s_ic16_andthecaptain", "s_ic16_syncingwithdeltateam", "s_ic16_justyouandmethen", "s_ic16_morethanenough"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][8] = ["s_ic18_commandsentanupdater", "s_ic18_gooddeltaneedsmoresu", "s_ic18_andzulu", "s_ic18_finishedtenminutesag", "s_ic18_tellthemtosupportdel", "s_ic18_copy"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][9] = ["s_ic20_deltamissedacommchec", "s_ic20_whatwastheirlastloca", "s_ic20_patrollingthefarside", "s_ic20_notifytangotheyreclo", "s_ic20_shouldwejoin", "s_ic20_negativestayonpost"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][10] = ["s_ic22_anyupdates", "s_ic22_negative", "s_ic22_itsgoingtobearoundhe", "s_ic22_permissiontoredirect", "s_ic22_negativealphasonpatr", "s_ic22_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][11] = ["s_ic24_youhaveenoughcharges", "s_ic24_negativerunninglow", "s_ic24_locatedeltaforresupp", "s_ic24_copy", "s_ic24_needtobedoneinfive", "s_ic24_onit"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][12] = ["s_ic26_commandwantseverythi", "s_ic26_charliesdoinganother", "s_ic26_makesuretheyrethorou", "s_ic26_roger", "s_ic26_nowitnesses", "s_ic26_willreportbackwhenwe"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][13] = ["s_ic28_sector2isclear", "s_ic28_wehavereportsofhosti", "s_ic28_yessir", "s_ic28_youseeanythingradioa", "s_ic28_copy", "s_ic28_switchinfourhours"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][14] = ["s_ic30_whiskeysquadscombing", "s_ic30_andecho", "s_ic30_patrolling", "s_ic30_copybereadytomove", "s_ic30_yessir", "s_ic30_untilthenbevigilant"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][15] = ["s_ic32_cantseeshit", "s_ic32_wellholdhere", "s_ic32_alphassweepingsector", "s_ic32_keepwatchiftheymoves", "s_ic32_roger", "s_ic32_illupdatecommand"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][16] = ["s_ic34_deltasshiftingtosect", "s_ic34_whythechange", "s_ic34_alphasquadarrived", "s_ic34_copy", "s_ic34_weremorethancoveredn", "s_ic34_letsgetamoveon"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][17] = ["s_ic36_sierrasinposition", "s_ic36_zulusontheperimeter", "s_ic36_radiocommandtellthem", "s_ic36_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][18] = ["s_ic38_whatsthestatusonexfi", "s_ic38_commandsayshelosared", "s_ic38_howmany", "s_ic38_three", "s_ic38_copyholdyourposition", "s_ic38_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][19] = ["s_ic40_commandwantstheaoloc", "s_ic40_onit", "s_ic40_keepthosecornersclea", "s_ic40_anythinginbound", "s_ic40_nothingyetordersaret", "s_ic40_copy"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][20] = ["s_ic42_whiskeyisinposition", "s_ic42_zulu", "s_ic42_inboundinfive", "s_ic42_theyrelate", "s_ic42_charliewillcover", "s_ic42_copy"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][21] = ["s_ic44_weset", "s_ic44_affirmative", "s_ic44_status", "s_ic44_allclear", "s_ic44_stayvigilantcheckini", "s_ic44_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][22] = ["s_ic46_commandgavewordtomov", "s_ic46_arewecoveringtheirse", "s_ic46_negativetheyrehandle", "s_ic46_copywelldoanotherswe", "s_ic46_agreedwellsplitthete", "s_ic46_roger"];
    if (map_name == "cp_jup_port") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = ["s_icsp_statusreport", "s_icsp_haventlocatedthepayl", "s_icsp_hesnotgonnabehappyab", "s_icsp_thecompanysgonethrou", "s_icsp_thenitshiddensomewhe", "s_icsp_keepyoureyesopen"];
        level.battlechatter.eventstrings["RU"]["idle_solo"][24] = ["s_isp2_wedonthavetimeforthi", "s_isp2_weremarkingaswegowel", "s_isp2_howmuchhavewesearche", "s_isp2_aboutfortypercentoft", "s_isp2_onlyforty", "s_isp2_wecanbruteforceitweh"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = ["s_id01_perimeterclear", "s_id01_affirmativenoactivit", "s_id01_theambushwaseffectiv", "s_id01_charliesstillmopping", "s_id01_tellthemtohurryuplet", "s_id01_copythat"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = ["s_icdf_youfoundherfarahkari", "s_icdf_onlythebodyoftheharb", "s_icdf_wastheshipsmanifesto", "s_icdf_negative", "s_icdf_thenwellhavetodothis", "s_icdf_gotateamontheboatnow"];
    }
    if (map_name == "cp_jup_chemical") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = ["s_icsc_anysignoftheulf", "s_icsc_negative", "s_icsc_thatcanchangegotword", "s_icsc_ifulfstheretheyrenot", "s_icsc_juststayalert", "s_icsc_copythat"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = ["s_ichg_wefindthatpayloadwen", "s_ichg_alphasquadsonit", "s_ichg_fasterwefindthepaylo", "s_ichg_illradiocharlieseeif", "s_ichg_gotcheckinseveryfive", "s_ichg_copythat"];
    }
    if (map_name == "cp_jup_ranch") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = ["s_icsr_delta02toalpha01what", "s_icsr_delta02perimeterclea", "s_icsr_copykeepitlockeddown", "s_icsr_isalphadonewiththebo", "s_icsr_almostwillkeepyouupd", "s_icsr_rogerthat"];
        level.battlechatter.eventstrings["RU"]["idle_solo"][24] = ["s_isr2_locatedanything", "s_isr2_foundacouplecellsnea", "s_isr2_ifanythingsurvivedwe", "s_isr2_illdoanotherlooparou", "s_isr2_reportbackinfive", "s_isr2_copy"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = ["s_icdr_findanything", "s_icdr_negativejustdebrisyo", "s_icdr_notyet", "s_icdr_searchteamsaremaking", "s_icdr_thatjustleavesthecel", "s_icdr_wefindanyfootagethat"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = ["s_icso_seeanyphonesoverther", "s_icso_negativemovingontoth", "s_icso_searchteamspulledthe", "s_icso_goodanythingelsefrom", "s_icso_tightenperimeter", "s_icso_noonewillgetinoroutu"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][25] = ["s_icut_notfindingmuchjustde", "s_icut_keepsearchingbosswan", "s_icut_phonescameras", "s_icut_anythingthatsnotours", "s_icut_roger", "s_icut_wefindanythingthatim"];
    }
    if (map_name == "cp_jup_resort") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = ["s_icst_weshoulddoanothersea", "s_icst_romanovawantsanupdat", "s_icst_everyfiveminutes", "s_icst_sheknowswhatshesdoin", "s_icst_tellcharlieanddeltat", "s_icst_copythatrelaying"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = ["s_icor_romanovasbeengetting", "s_icor_deltasmonitoringfori", "s_icor_thingsaregettinghot", "s_icor_wellneedtotightensec", "s_icor_intruderslikelythen", "s_icor_affirmativesweepthea"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = ["s_icsf_charlieanddeltasquad", "s_icsf_romanovawantsupdates", "s_icsf_copythatillletthemkn", "s_icsf_anynewsfromtheothers", "s_icsf_theyreclear", "s_icsf_tellthemtocheckagain"];
    }
    if (map_name == "cp_jup_dam") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = ["s_icsd_charlie04thisisalpha", "s_icsd_payloadssetperimeter", "s_icsd_checkitagaincantbeto", "s_icsd_youveseenthechemical", "s_icsd_lethalashelldontdrop", "s_icsd_solidcopy"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = ["s_icpa_anyupdatesfromteam4", "s_icpa_theirpayloadsalmosts", "s_icpa_tellthemtohurryitup", "s_icpa_copy", "s_icpa_havethesnipersholdon", "s_icpa_theyrealreadyinposit"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = ["s_id03_charlieteamsaysthepa", "s_id03_tellthemtostayalertd", "s_id03_copythat", "s_id03_thenwegottamove", "s_id03_jltvsarestandingby", "s_id03_dontwanttobeanywhere"];
    }
    if (map_name == "cp_jup_apt") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = ["s_ic47_delta04status", "s_ic47_shipmentsnearlyready", "s_ic47_notraces", "s_ic47_wewereneverhere", "s_ic47_illupdatenolanlethim", "s_ic47_copythat"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = ["s_ic49_tangoandcharliedeplo", "s_ic49_wheretheyheaded", "s_ic49_easternurzikstan", "s_ic49_whataboutus", "s_ic49_willgetourdestinatio", "s_ic49_solidcopy"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = ["s_ic48_pingdeltacommandwant", "s_ic48_truckswerelatetheyre", "s_ic48_nolansnotgoingtolike", "s_ic48_illtellthemtopickupt", "s_ic48_goodtheyreexpectingt", "s_ic48_copythat"];
    }
    level.battlechatter.eventstrings["AQS_L"]["reply_hear_you"] = ["s_idrp_yesbrother", "s_idrp_goahead", "s_idrp_thisiscommand", "s_idrp_whatisitbrother", "s_idrp_yesihearyou", "s_idrp_ihearyougoahead"];
    level.battlechatter.eventstrings["AQS_L"]["react_interrupt"] = ["s_idli_whatswrong", "s_idli_whatwasthat", "s_idli_whathappened", "s_idli_ididnthearyoubrother", "s_idli_issomethingwrong", "s_idli_areyouokaybrother"];
    level.battlechatter.eventstrings["AQS_L"]["react_noreply"] = ["s_idli_areyouthere", "s_idli_didiloseyou", "s_idli_canyouhearmebrother"];
    level.battlechatter.eventstrings["AQS_L"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["AQS_L"]["signoff"] = ["s_idls_outhere", "s_idls_commandout", "s_idls_staysafebrotherout", "s_idls_out"];
    level.battlechatter.eventstrings["AQS_L"]["inv_patrol"] = ["s_alip_resumeyourpatrolkeep", "s_alip_getbacktoyourpatrolb", "s_alip_returntoyourpatrolbu"];
    level.battlechatter.eventstrings["AQS_L"]["report_search"] = ["s_alip_whatsyourstatus", "s_aias_reportin", "s_aias_haveyoufoundanything", "s_aias_givemeanupdate", "s_aias_whathaveyougot"];
    level.battlechatter.eventstrings["AQS_L"]["wait_target_surface"] = ["s_lkwr_whentheycomesupforai", "s_lkwr_theypoptheirheadouty", "s_lkwr_whentheycomeupyoukil", "s_lkwr_theygoforairyoutaket", "s_lkwr_whentheypopuptheyred", "s_lkwr_theyllcomeupforairwh"];
    level.battlechatter.eventstrings["AQS_L"]["order_find_target"] = ["s_cmho_findthem", "s_cmho_searcheverywherefind", "s_cmho_huntthemdown"];
    level.battlechatter.eventstrings["AQS_L"]["order_find_perimeter"] = ["s_cmho_cleartheperimeter", "s_cmho_securetheperimeter", "s_cmho_gettheperimeterclear"];
    level.battlechatter.eventstrings["AQS_L"]["order_search_water"] = ["s_cmho_searchthewater", "s_cmho_checkthewater", "s_cmho_theywereinthewater", "s_cmho_keepyoureyesonthewat", "s_cmho_watchthewater"];
    level.battlechatter.eventstrings["AQS_L"]["good_hunting"] = ["s_hnts_besafebrother", "s_hnts_stayvigilantbrother", "s_hnts_becarefuloutthere", "s_aisg_copybesafebrother"];
    level.battlechatter.eventstrings["AQS_L"]["ask_found_anything"] = ["s_aqhr_haveyoufoundanything", "s_aqhr_whathaveyoufound", "s_aqhr_whathaveyougot"];
    level.battlechatter.eventstrings["AQS_L"]["order_take_point"] = ["s_aqhr_reportin", "s_aqhr_givemesomething", "s_aqhr_tellmeyouhavesomethi"];
    level.battlechatter.eventstrings["AQS_L"]["hunt_report_alert"] = ["s_aqhr_anenemyisintheareahu", "s_aqhr_wehaveanenemyinsidet", "s_aqhr_brotherstheresanenem", "s_aqlo_spreadoutfindthem", "s_aqlo_searchtheareafindthe", "s_aqlo_spreadoutsearchthear"];
    level.battlechatter.eventstrings["AQS_L"]["order_continue_search"] = ["s_aqho_continuesweeping", "s_aqho_keepsearchingthearea", "s_aqho_searchtheareauntilyo"];
    level.battlechatter.eventstrings["AQS_L"]["order_stay_alert"] = ["s_aqho_stayalert", "s_aqho_keepyoureyesopen", "s_aqho_stayfocusedbrother"];
    level.battlechatter.eventstrings["AQS_L"]["order_stay_aware"] = ["s_aqho_guardyourselfbrother", "s_aqho_donotunderestimateth", "s_aqho_keepyourguardup"];
    level.battlechatter.eventstrings["AQS_L"]["ask_how_copy"] = ["s_idcm_doyouhearmebrother", "s_idcm_comein", "s_idcm_thisiscommand"];
    level.battlechatter.eventstrings["AQS_L"]["inv_no_response"] = ["s_iinr_hesnotrespondingonra", "s_iinr_icantreachhim", "s_iinr_hesnotansweringhisra", "s_iinr_hesnotresponding"];
    level.battlechatter.eventstrings["AQS_L"]["order_get_visual"] = ["s_iinr_canyougocheckitout", "s_iinr_checkitoutmakesureno", "s_iinr_seeifyoucanfindhimok", "s_iinr_ineedyoucheckitout"];
    level.battlechatter.eventstrings["AQS_L"]["inv_patrol_noresp"] = ["s_iinr_patrolisntresponding", "s_iinr_patroldidntcheckin", "s_iinr_patrolisntansweringo", "s_iinr_icantreachpatrol"];
    level.battlechatter.eventstrings["AQS_L"]["hunt_patrol_noresp"] = ["s_iinr_patrolisntresponding_01", "s_iinr_patroldidntcheckin_01", "s_iinr_patrolisntansweringo_01", "s_iinr_icantreachpatrol_01", "s_hpnr_patrolisntresponding", "s_hpnr_patroldidntcheckin", "s_hpnr_patrolisntansweringo", "s_hpnr_icantreachpatrol"];
    level.battlechatter.eventstrings["AQS_L"]["report_alert"] = ["s_airp_brotherswemayhavecom", "s_airp_allteamswemayhaveasi", "s_airp_everyonetightenupwem", "s_airp_brotherskeepyoureyes"];
    level.battlechatter.eventstrings["AQS_L"]["report_reply_search"] = ["s_wrpl_iftheyshowupagainyou", "s_wrpl_ifyouseethemagainope", "s_wrpl_iftheyshowbackupyour"];
    level.battlechatter.eventstrings["AQS_L"]["warn_reply"] = ["s_wrpl_iftheyshowupagainsho", "s_wrpl_ifyouseethemagainope_01", "s_wrpl_iftheyreturnjustkill"];
    level.battlechatter.eventstrings["AQS_L"]["report_target_location"] = ["s_chrp_givemeanupdatedoesan", "s_chrp_talktomeguyswhatsthe", "s_chrp_starttalkingguysiwan", "s_chrp_reportinguyswhereare"];
    level.battlechatter.eventstrings["AQS_L"]["report_idle"] = ["s_irpr_status", "s_irpr_report", "s_irpr_anythingtoreport", "s_irpr_gotanything", "s_irpr_checkin"];
    level.battlechatter.eventstrings["AQS_L"]["ally_missing_multi"] = ["s_alms_multipleteamsarentre", "s_alms_anothergroupisntresp", "s_alms_wevelostcontactwitha", "s_alms_anotherteamfailedtor"];
    level.battlechatter.eventstrings["AQS_L"]["order_search_start"] = ["s_aior_searchthearea", "s_aior_searcharound", "s_aior_sweeptheperimeter"];
    level.battlechatter.eventstrings["AQS_L"]["order_report_back"] = ["s_aior_reportwhatyoufind", "s_aior_radioifyoufindanythi", "s_aior_reportbackifyoufinds"];
    level.battlechatter.eventstrings["PMC"]["left"] = ["c_posn_leftside", "c_posn_left", "c_posn_checkleft", "c_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["PMC"]["right"] = ["c_posn_rightside", "c_posn_theyreflankingright", "c_posn_right", "c_posn_checkright"];
    level.battlechatter.eventstrings["PMC"]["ahead"] = ["c_posn_straightahead", "c_posn_rightinfrontofus", "c_posn_aheadofus", "c_posn_front", "c_posn_deadahead"];
    level.battlechatter.eventstrings["PMC"]["behind"] = ["c_posn_behindus", "c_posn_onoursix", "c_posn_checkrear", "c_posn_rear"];
    level.battlechatter.eventstrings["PMC"]["high"] = ["c_posn_uptop", "c_posn_checkhigh"];
    level.battlechatter.eventstrings["PMC"]["use_flash"] = ["c_ator_useaflashbang", "c_ator_throwaflashbang", "c_ator_tossaflashbang"];
    level.battlechatter.eventstrings["PMC"]["use_grenade"] = ["c_ator_useagrenade", "c_ator_throwafrag", "c_ator_tossafrag"];
    level.battlechatter.eventstrings["PMC"]["use_molotov"] = ["c_ator_throwamolotov", "c_ator_useamolotov", "c_ator_tossamolotov"];
    level.battlechatter.eventstrings["PMC"]["use_rpg"] = ["c_ator_hitemwitharocket", "c_ator_usearocket", "c_ator_rocket"];
    level.battlechatter.eventstrings["PMC"]["order_attack"] = ["c_ator_engage", "c_ator_giveemsome", "c_ator_dumpem", "c_ator_gohot", "c_ator_fuckinshootem", "c_ator_startsmokinem"];
    level.battlechatter.eventstrings["PMC"]["attacking"] = ["c_atac_goinghot", "c_atac_engaging", "c_atac_openinup"];
    level.battlechatter.eventstrings["PMC"]["using_rpg"] = ["c_atac_rocket", "c_atac_rocket_01"];
    level.battlechatter.eventstrings["PMC"]["using_smoke"] = ["c_atac_throwingsmoke", "c_atac_smokeout"];
    level.battlechatter.eventstrings["PMC"]["using_flash"] = ["c_atac_flashbangout", "c_atac_throwingflashbang"];
    level.battlechatter.eventstrings["PMC"]["using_grenade"] = ["c_atac_fragout", "c_atac_throwingafrag"];
    level.battlechatter.eventstrings["PMC"]["using_molotov"] = ["c_atac_throwingmolotov", "c_atac_molotovout"];
    level.battlechatter.eventstrings["PMC"]["movingup"] = ["c_tcac_impushingup", "c_tcac_pushingforward", "c_tcac_movingup", "c_tcac_pushinup"];
    level.battlechatter.eventstrings["PMC"]["getting_cover"] = ["c_tcac_covercover", "c_tcac_takingcover", "c_tcac_movingtocover"];
    level.battlechatter.eventstrings["PMC"]["reloading"] = ["c_tcac_reloading", "c_tcac_changingmags"];
    level.battlechatter.eventstrings["PMC"]["moving"] = ["c_tcac_moving", "c_tcac_immoving", "c_tcac_heyimmoving"];
    level.battlechatter.eventstrings["PMC"]["enemy_using_flash"] = ["c_eata_flashincoming", "c_eata_flashgrenade", "c_eata_flash", "c_eata_flashgrenade_01"];
    level.battlechatter.eventstrings["PMC"]["enemy_using_grenade"] = ["c_eata_grenade", "c_eata_grenadewatchout", "c_eata_grenadeincoming"];
    level.battlechatter.eventstrings["PMC"]["enemy_using_molotov"] = ["c_eata_molotov", "c_eata_molotovincoming", "c_eata_molotov_01"];
    level.battlechatter.eventstrings["PMC"]["enemy_using_rpg"] = ["c_eata_rpg", "c_eata_rpgincoming", "c_eata_rpggetdown"];
    level.battlechatter.eventstrings["PMC"]["enemy_attacking"] = ["c_eata_takingfire", "c_eata_contact", "c_eata_shadowsincontact"];
    level.battlechatter.eventstrings["PMC"]["enemy_moving_up"] = ["c_etca_onespushing", "c_etca_gotonemovingup", "c_etca_onesmovingup"];
    level.battlechatter.eventstrings["PMC"]["enemy_getting_cover"] = ["c_etca_novisualontarget", "c_etca_gotonetakingcover", "c_etca_onesmovingtocover", "c_etca_novisualontarget_01"];
    level.battlechatter.eventstrings["PMC"]["enemy_reloading"] = ["c_etca_onesreloading", "c_etca_onesreloading_01", "c_etca_oneschangingmags"];
    level.battlechatter.eventstrings["PMC"]["enemy_flanking_left"] = ["c_etca_onesmovingleft", "c_etca_leftflank", "c_etca_guardleft"];
    level.battlechatter.eventstrings["PMC"]["enemy_flanking_right"] = ["c_etca_guardright", "c_etca_rightflank", "c_etca_onesmovingright"];
    level.battlechatter.eventstrings["PMC"]["enemy_moving"] = ["c_etca_onesmovin", "c_etca_thatonesmoving", "c_etca_gotonemoving"];
    level.battlechatter.eventstrings["PMC"]["target_getting_cover"] = ["c_ttca_theyremovingtocover", "c_ttca_hesgoingforcover", "c_ttca_hestakingcover"];
    level.battlechatter.eventstrings["PMC"]["target_reloading"] = ["c_ttca_theyrereloading", "c_ttca_hesout", "c_ttca_hesreloading"];
    level.battlechatter.eventstrings["PMC"]["target_moving"] = ["c_ttca_theyremoving", "c_ttca_hesmoving", "c_ttca_hesrunning"];
    level.battlechatter.eventstrings["PMC"]["target_moving_up"] = ["c_ttca_theyremovingup", "c_ttca_hescominguponyou", "c_ttca_hesmovingup"];
    level.battlechatter.eventstrings["PMC"]["target_near_patrol"] = ["c_ttca_theyreswimmingnearth", "c_ttca_theyreswimmingyourwa", "c_ttca_interceptthem"];
    level.battlechatter.eventstrings["PMC"]["enemy_soldier"] = ["c_enmy_visualonatarget", "c_enmy_targetspotted", "c_enmy_gotatarget"];
    level.battlechatter.eventstrings["PMC"]["enemy_soldiers"] = ["c_enmy_targets", "c_enmy_targets_01", "c_enmy_wegotbadguys"];
    level.battlechatter.eventstrings["PMC"]["neg_target"] = ["c_aqen_idontseeem", "c_aqen_novisual", "c_aqen_cantseehim", "c_aqen_wherethefuckishe"];
    level.battlechatter.eventstrings["PMC"]["aquired_target"] = ["c_aqen_gotavisual", "c_aqen_targetacquired", "c_aqen_iseehim", "c_aqen_thereheis"];
    level.battlechatter.eventstrings["PMC"]["enemy_exposed"] = ["c_exco_onesintheopen", "c_exco_onesintheopen_01", "c_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["PMC"]["target_exposed"] = ["c_exco_theyreintheopen", "c_exco_hesintheopen", "c_exco_theyreintheopen_01"];
    level.battlechatter.eventstrings["PMC"]["youre_exposed"] = ["c_exco_findcover"];
    level.battlechatter.eventstrings["PMC"]["target_covered"] = ["c_exco_hesbehindcover", "c_exco_hesgotcover", "c_exco_hestakingcover"];
    level.battlechatter.eventstrings["PMC"]["killfirm_bigrig"] = ["c_firm_theyresemitrucksdown", "c_firm_destroyedtheirsemitr", "c_firm_enemysemitrucksdown"];
    level.battlechatter.eventstrings["PMC"]["killfirm_enemy"] = ["c_firm_gotone", "c_firm_ekia", "c_firm_targetdown"];
    level.battlechatter.eventstrings["PMC"]["killfirm_target"] = ["c_firm_hesdone", "c_firm_hesdown", "c_firm_dumpedhim"];
    level.battlechatter.eventstrings["PMC"]["killfirm_truck"] = ["c_firm_truckdestroyed", "c_firm_theirtrucksdown", "c_firm_enemytrucksdown"];
    level.battlechatter.eventstrings["PMC"]["killfirm_helo"] = ["c_firm_helodown", "c_firm_helodestroyed", "c_firm_theirhelosdown"];
    level.battlechatter.eventstrings["PMC"]["casualties"] = ["c_casu_weretakingheavies", "c_casu_weregettingourassesk", "c_casu_werelosingshooters", "c_casu_weretakingcasualties"];
    level.battlechatter.eventstrings["PMC"]["copy"] = ["c_conf_copy", "c_conf_check", "c_conf_copythat", "c_conf_goodcopy", "c_conf_solidcopy", "c_aqcp_copy", "c_aqcp_solidcopy"];
    level.battlechatter.eventstrings["PMC"]["praise"] = ["c_pras_hellyeah", "c_pras_niceone", "c_pras_fuckina", "c_pras_yeah", "c_pras_getyousome"];
    level.battlechatter.eventstrings["PMC"]["low_ammo"] = ["c_stat_ineedamag", "c_stat_lowonammo", "c_stat_lastmag", "c_stat_needammo", "c_stat_imwinchester"];
    level.battlechatter.eventstrings["PMC"]["wounded"] = ["c_stat_imhit", "c_stat_imshot", "c_stat_medic"];
    level.battlechatter.eventstrings["PMC"]["ask_wounded"] = ["c_stat_yougood", "c_stat_youwounded", "c_stat_youhit"];
    level.battlechatter.eventstrings["PMC"]["ask_low_ammo"] = ["c_stat_howsyourammo", "c_stat_checkyourammo", "c_stat_whatsyourroundcount"];
    level.battlechatter.eventstrings["PMC"]["ask_status"] = ["c_stat_youokay", "c_stat_whatsyourstatus", "c_stat_status"];
    level.battlechatter.eventstrings["PMC"]["reply_wounded"] = ["c_stat_itookaround", "c_stat_imgood", "c_stat_yeahroundhittheplate"];
    level.battlechatter.eventstrings["PMC"]["reply_low_ammo"] = ["c_stat_runninglow", "c_stat_imlow", "c_stat_almostout"];
    level.battlechatter.eventstrings["PMC"]["reply_okay"] = ["c_stat_imsolid", "c_stat_goodtogo", "c_stat_goodhere"];
    level.battlechatter.eventstrings["PMC"]["wounded_enemy"] = ["c_aens_igothim", "c_aens_clippedhim", "c_aens_hitone"];
    level.battlechatter.eventstrings["PMC"]["ask_target_loc"] = ["c_tast_wheresheat", "c_tast_doesanyonehaveavisua", "c_tast_wherethefuckretheyat"];
    level.battlechatter.eventstrings["PMC"]["ask_target_wounded"] = ["c_tast_yougethim", "c_tast_youhithim", "c_tast_youdrophim"];
    level.battlechatter.eventstrings["PMC"]["target_wounded"] = ["c_tast_heshit", "c_tast_heswounded", "c_tast_hesbleeding"];
    level.battlechatter.eventstrings["PMC"]["target_unhurt"] = ["c_tast_hegotaway", "c_tast_heranoff", "c_tast_hesfallingback"];
    level.battlechatter.eventstrings["PMC"]["wounded_target"] = ["c_atas_woundedhim", "c_atas_ihithim", "c_atas_itaggedem"];
    level.battlechatter.eventstrings["PMC"]["enemy_shotgun"] = ["c_enws_shotgunwatchout", "c_enws_onesgotashotgun", "c_enws_shotgun"];
    level.battlechatter.eventstrings["PMC"]["enemy_sniper"] = ["c_enws_thatsasniper", "c_enws_sniper", "c_enws_enemysniper"];
    level.battlechatter.eventstrings["PMC"]["enemy_lmg"] = ["c_enws_enemymachinegunner", "c_enws_lmg", "c_enws_machinegun"];
    level.battlechatter.eventstrings["PMC"]["target_lmg"] = ["c_taws_theyreusingamachineg", "c_taws_hesgotamachinegun", "c_taws_machinegunner"];
    level.battlechatter.eventstrings["PMC"]["target_shotgun"] = ["c_taws_theyvegotashotgun", "c_taws_hesgotashotgun"];
    level.battlechatter.eventstrings["PMC"]["target_sniper"] = ["c_taws_hessnipingus", "c_taws_hesasniper"];
    level.battlechatter.eventstrings["PMC"]["checkfire"] = ["c_chck_checkyourfire", "c_chck_watchyourfire", "c_chck_blueblue", "c_chck_checkfirecheckfire"];
    level.battlechatter.eventstrings["PMC"]["move"] = ["c_tcor_move", "c_tcor_igotyoumove", "c_tcor_startmoving", "c_tcor_go"];
    level.battlechatter.eventstrings["PMC"]["moveup"] = ["c_tcor_moveup", "c_tcor_moveupgo", "c_tcor_pushup", "c_tcor_getupthere", "c_tcor_pushforward"];
    level.battlechatter.eventstrings["PMC"]["coverme"] = ["c_tcor_coverme", "c_tcor_ineedcoverfire", "c_tcor_coverme_01"];
    level.battlechatter.eventstrings["PMC"]["casualty"] = ["c_canm_wegotacasualty", "c_canm_shadowdown", "c_canm_wehaveashadowdown", "c_canm_wevegotwounded", "c_canm_mandown"];
    level.battlechatter.eventstrings["PMC"]["suppressing"] = ["c_aqsp_suppressingfire", "c_aqsp_imcoveringyou", "c_aqsp_coveringfire"];
    level.battlechatter.eventstrings["PMC"]["disguise_enter_combat"] = ["s_awrr_motherfucker", "s_awrr_foundyou", "s_awrr_igotyou", "s_awrr_troopsincontact", "s_awrr_gotyou", "s_awrr_ifoundyou"];
    level.battlechatter.eventstrings["PMC"]["reply_hear_you"] = ["s_idrp_go", "s_idrp_goahead", "s_idrp_imhere", "s_idrp_rogergoahead"];
    level.battlechatter.eventstrings["PMC"]["resp_patrol"] = ["s_idrp_thisisthresher", "s_ahrp_thisisthresher"];
    level.battlechatter.eventstrings["PMC"]["muttered_confusion"] = ["s_idin_whatthefuck", "s_idin_whatthehell", "s_idin_whatthefuckwasthat", "s_idin_whatthehellwasthat"];
    level.battlechatter.eventstrings["PMC"]["investigating"] = ["s_idin_illseewhatsup", "s_idin_illcheckitout", "s_idin_illgocheck"];
    level.battlechatter.eventstrings["PMC"]["inv_arrive"] = ["s_idin_hmm", "s_idin_hmphokay", "s_idin_huhwhatwasthat", "s_idin_hrm", "s_idin_huhthehell"];
    level.battlechatter.eventstrings["PMC"]["react_found_corpse"] = ["s_alrc_wegotamandown", "s_alrc_wegotacasualty", "s_alrc_gotashadowdown", "s_alrc_wegotakia"];
    level.battlechatter.eventstrings["PMC"]["ask_corpse_name"] = ["s_alrc_whoisit", "s_alrc_who", "s_alrc_whodidwelose"];
    level.battlechatter.eventstrings["PMC"]["need_backup"] = ["s_alrc_sendshadows", "s_alrc_sendreinforcements", "s_albc_sendreinforcements"];
    level.battlechatter.eventstrings["PMC"]["hunt_affirm"] = ["s_hnrs_rog"];
    level.battlechatter.eventstrings["PMC"]["hunt_copy"] = ["s_hnrs_copy", "s_hnrs_rogerthat", "s_hnrs_copythat"];
    level.battlechatter.eventstrings["PMC"]["hunt_neg"] = ["s_hnrs_negative"];
    level.battlechatter.eventstrings["PMC"]["react_whizby"] = ["s_unrc_imtakingfire", "s_unrc_thatsclose", "s_unrc_someonesshootinatme", "s_unrc_takineffectivefire", "s_unrc_imgettingshotat"];
    level.battlechatter.eventstrings["PMC"]["react_loc"] = ["s_unrc_itcamefromoverthere", "s_unrc_camefromthatway", "s_unrc_thatwaythatway", "s_unrc_itwasoverthatway", "s_unrc_itcamefromthatdirect"];
    level.battlechatter.eventstrings["PMC"]["react_unaware"] = ["s_unrc_takingcontact", "s_unrc_contactcontact", "s_unrc_takingindirectfire"];
    level.battlechatter.eventstrings["PMC"]["over_there"] = ["s_hnfn_overthere", "s_hnfn_theyreoverthere", "s_hnfn_rightthere"];
    level.battlechatter.eventstrings["PMC"]["surprise"] = ["s_hurc_surprisedeffort", "s_hurc_surprisedeffort_01", "s_hurc_surprisedeffort_02", "s_hurc_ohfuck", "s_hurc_ohshit"];
    level.battlechatter.eventstrings["PMC"]["report_reply_idle"] = ["s_idrr_gotnothing", "s_idrr_secure", "s_idrr_clearhere", "s_idrr_allclear", "s_idrr_goodhere", "s_idrr_allquiet", "s_idrr_areassecure"];
    level.battlechatter.eventstrings["PMC"]["react_first"] = ["s_idrc_huh", "s_idrc_wha", "s_idrc_hm", "s_idrc_eh", "s_idrc_hrm", "s_idrc_hmph"];
    level.battlechatter.eventstrings["PMC"]["react_second"] = ["s_idrc_whatthefuckisthat", "s_idrc_whatthehellisthat", "s_idrc_thefuckisgoingon"];
    level.battlechatter.eventstrings["PMC"]["react_multi"] = ["s_idrm_whosoutthere", "s_idrm_okaywhatthefuck", "s_idrm_whatisthisshit"];
    level.battlechatter.eventstrings["PMC"]["react_interrupt"] = ["s_idli_missedyourlastover", "s_idli_sayagainover", "s_idli_yougood"];
    level.battlechatter.eventstrings["PMC"]["react_noreply"] = ["s_idli_youreceivingme", "s_idli_youcopy", "s_idli_doyoureadme"];
    level.battlechatter.eventstrings["PMC"]["order_investigate"] = ["s_idio_gocheckit", "s_idio_checkitout", "s_idio_gocheckthatout"];
    level.battlechatter.eventstrings["PMC"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["PMC"]["idle_good_hunting"] = ["s_idls_stayfrosty", "s_idls_keepittight", "s_idls_staysharp"];
    level.battlechatter.eventstrings["PMC"]["inv_ask_first"] = ["s_idia_whatwasit", "s_idia_whatdyoufind", "s_idia_yougotanything", "s_idia_seeanything", "s_idia_findanything"];
    level.battlechatter.eventstrings["PMC"]["inv_ask_second"] = ["s_idia_whatwasitthistime", "s_idia_anythingthistime", "s_idia_stillnothing", "s_idia_stilldidntfindanythi", "s_idia_findanythingthistime"];
    level.battlechatter.eventstrings["PMC"]["resp_window_first"] = ["s_idir_awindowwasleftopenwe", "s_idir_foundanopenwindowche", "s_idir_someoneleftawindowop"];
    level.battlechatter.eventstrings["PMC"]["resp_water_first"] = ["s_idir_checkedthewaterthere", "s_idir_sweptthewaterdidntfi", "s_idir_checkednearthewaterw", "s_idir_nothinginthewaterwer"];
    level.battlechatter.eventstrings["PMC"]["resp_sound_first"] = ["s_idir_nothingnobody", "s_idir_negativewereclear", "s_idir_nahweresecure", "s_idir_nothingnovisual"];
    level.battlechatter.eventstrings["PMC"]["resp_window_multi"] = ["s_idir_sawanotheropenwindow", "s_idir_anotheropenwindowwer", "s_idir_therewasanotheropenw"];
    level.battlechatter.eventstrings["PMC"]["order_check_together"] = ["s_idit_letsgocheckitout", "s_idit_letscheckitwatchmyba", "s_idit_letsgocheckcoverme"];
    level.battlechatter.eventstrings["PMC"]["covering_investigate"] = ["s_idit_covering", "s_idit_imwithyou", "s_idit_gotyoucovered"];
    level.battlechatter.eventstrings["PMC"]["team_return_idle"] = ["s_idid_okayletsheadback", "s_idid_weregoodhereletsgetb", "s_idid_backtoourpostsletsgo"];
    level.battlechatter.eventstrings["PMC"]["ask_heard_that"] = ["s_alre_youhearthat", "s_alre_youheardthatright", "s_alre_youheardthattoo"];
    level.battlechatter.eventstrings["PMC"]["ask_saw_that"] = ["s_alre_didyouseethat", "s_alre_yougeteyesonthat", "s_alre_youcatchthat"];
    level.battlechatter.eventstrings["PMC"]["have_something"] = ["s_alre_imighthavesomething", "s_alre_ithinkihavesomething", "s_alre_igotapossiblethreat"];
    level.battlechatter.eventstrings["PMC"]["heard_something"] = ["s_alre_iheardsomething", "s_alre_heardsomethingnearme", "s_alre_iheardanoise"];
    level.battlechatter.eventstrings["PMC"]["saw_something"] = ["s_alre_isawsomething", "s_alre_thoughtisawsomething", "s_alre_ithinksomeonesnearme"];
    level.battlechatter.eventstrings["PMC"]["see_something"] = ["s_alre_iseesomething", "s_alre_ithinkiseesomething", "s_alre_iseesomethingnearme"];
    level.battlechatter.eventstrings["PMC"]["team_have_something"] = ["s_alre_wemighthavesomething", "s_alre_ithinkwegotsomething", "s_alre_wegotapossiblethreat"];
    level.battlechatter.eventstrings["PMC"]["team_heard_something"] = ["s_alre_weheardsomething", "s_alre_weheardsomethingclos", "s_alre_weheardanoise"];
    level.battlechatter.eventstrings["PMC"]["team_saw_something"] = ["s_alre_wesawsomething", "s_alre_wesawsomethingnearus", "s_alre_wesawsomethingnearou"];
    level.battlechatter.eventstrings["PMC"]["team_see_something"] = ["s_alre_weseesomething"];
    level.battlechatter.eventstrings["PMC"]["bottle_whizby"] = ["s_alre_whothefuckthrewthat", "s_alre_whothrewthat", "s_alre_youmissed"];
    level.battlechatter.eventstrings["PMC"]["object_whizby"] = ["s_alre_whothefuckthrewthat", "s_alre_whothrewthat", "s_alre_youmissed"];
    level.battlechatter.eventstrings["PMC"]["jailer_body_react"] = ["s_idrm_okaywhatthefuck", "s_idrm_whatthefuckisgoingon", "s_idrm_issomeonefuckingwith"];
    level.battlechatter.eventstrings["PMC"]["jailer_head_react"] = ["s_unrc_contact", "s_unrc_imunderattack", "s_unrc_itookfire"];
    level.battlechatter.eventstrings["PMC"]["react_resp"] = ["s_alrr_yeah", "s_alrr_afirm", "s_alrr_yeahrogerthat"];
    level.battlechatter.eventstrings["PMC"]["alert_investigating"] = ["s_alin_imgonnareccethearea", "s_alin_imcheckingitout", "s_alin_imgonnacheckitout"];
    level.battlechatter.eventstrings["PMC"]["team_alert_investigating"] = ["s_alin_wellcheckthearea", "s_alin_werecheckingitout", "s_alin_weregonnacheckitout"];
    level.battlechatter.eventstrings["PMC"]["alert_confirming"] = ["s_alcf_roger", "s_alcf_copy", "s_alcf_copythat"];
    level.battlechatter.eventstrings["PMC"]["alert_ask"] = ["s_alia_seeanything", "s_alia_yougotsomething", "s_alia_anything", "s_alia_gotanything"];
    level.battlechatter.eventstrings["PMC"]["alert_patrol"] = ["s_alip_illpullsecurityherea", "s_alip_illsecuretheareakeep", "s_alip_headbackillpullsecur", "s_alip_ivegotthisareagetbac"];
    level.battlechatter.eventstrings["PMC"]["report_reply_search"] = ["s_alir_negativenothingyet", "s_alir_nothingsofar", "s_alir_nothing", "s_alir_goodsofar", "s_alir_igotnothingyet", "s_alir_sofarsogood", "s_alir_notseeinganything", "s_alir_negativegotnothing", "s_alir_nothingfornow", "s_alir_itsclearsofar", "s_alir_weregoodfornow"];
    level.battlechatter.eventstrings["PMC"]["warn_report"] = ["s_wrnr_hadanunknowninsideth", "s_wrnr_hadanunknowninsideth_01", "s_wrnr_anunknownwasintheare"];
    level.battlechatter.eventstrings["PMC"]["warn_spotted"] = ["s_wrnf_heygetthefuckback", "s_wrnf_heyyougetthefuckoutt", "s_wrnf_getbackgetbackrightn"];
    level.battlechatter.eventstrings["PMC"]["warn_conv"] = ["s_wrni_scaredthehelloutofem", "s_wrni_probablyshittingthem", "s_wrni_whatthehellweretheyd", "s_wrni_whatthefuckweretheyt"];
    level.battlechatter.eventstrings["PMC"]["warn_conv_reply"] = ["s_wrir_almostgotthemselvesk", "s_wrir_iwasreadytodumpthatm", "s_wrir_luckytheydidntcatcha"];
    level.battlechatter.eventstrings["PMC"]["warn_attack"] = ["s_wrnk_heyiwarnedyou", "s_wrnk_youwerewarned", "s_wrnk_heyyoujustfuckedup"];
    level.battlechatter.eventstrings["PMC"]["ask_enemy_loc"] = ["s_unwl_wheredthatcomefrom", "s_unwl_whereditcomefrom", "s_unwl_wherethefuckarethey"];
    level.battlechatter.eventstrings["PMC"]["enemy_loc_resp"] = ["s_unrs_idontknowbutthatwasa", "s_unrs_ididntseeem", "s_unrs_idontfuckingknow", "s_unrs_novisualdidntseeem"];
    level.battlechatter.eventstrings["PMC"]["ask_enemy_count"] = ["s_unwc_howmanyarethere", "s_unwc_howmanyofem", "s_unwc_howmany"];
    level.battlechatter.eventstrings["PMC"]["unaware_backup"] = ["s_unwb_ineedreinforcements", "s_unwb_getmoreshadowshereno", "s_unwb_sendreinforcementsmy"];
    level.battlechatter.eventstrings["PMC"]["react_first_combat"] = ["s_awrr_contact", "s_awrr_troopsincontact", "s_awrr_enemymyposition", "s_awrr_enemy", "s_awrr_enemyshere", "s_awrr_gotenemyhere", "s_awrr_enemysclose"];
    level.battlechatter.eventstrings["PMC"]["report_target_water"] = ["s_awrr_targetsinthewater", "s_awrr_gotavisualtheyreinth", "s_awrr_iseeeminthewater", "s_awrr_inthewaterinthewater", "s_awrr_enemyinthewater", "s_awrr_theyremovinginthewat", "s_awrr_heytheyreinthewater"];
    level.battlechatter.eventstrings["PMC"]["at_my_location"] = ["s_awrr_righthere", "s_awrr_onmeonme", "s_awrr_myposition", "s_awrr_righthererighthere", "s_awrr_onme", "s_awrr_theyrerighthere", "s_awrr_overhere", "s_awrr_theyreoverhere"];
    level.battlechatter.eventstrings["PMC"]["found_target"] = ["s_awrr_gotem", "s_awrr_iseeem", "s_awrr_foundem", "s_awrr_hey", "s_awrr_visual", "s_awrr_targetspotted"];
    level.battlechatter.eventstrings["PMC"]["found_you"] = ["s_awrr_motherfucker", "s_awrr_foundyou", "s_awrr_igotyou", "s_awrr_ifoundyou", "s_awrr_gotyou"];
    level.battlechatter.eventstrings["PMC"]["order_check_last"] = ["s_advo_moveonemgo", "s_advo_forceuponemgo", "s_advo_pushtheirpositiongo"];
    level.battlechatter.eventstrings["PMC"]["lost_target"] = ["s_lkpl_frustratedgrunttheyr", "s_lkpl_frustratedgrunttheyr_01", "s_lkpl_frustratedgruntnovis", "s_lkpl_frustratedgrunttheyg"];
    level.battlechatter.eventstrings["PMC"]["lost_target_water"] = ["s_lkpw_theywentunderwater", "s_lkpw_theyreinthewater", "s_lkpw_theyjumpedinthewater", "s_lkpw_targetsinthewater"];
    level.battlechatter.eventstrings["PMC"]["ask_target_location"] = ["s_lklr_gotavisual", "s_lklr_youseeem", "s_lklr_whatstheirlocation", "s_lklr_wherearethey", "s_lklr_wherethefuckarethey", "s_lklr_getmealocation"];
    level.battlechatter.eventstrings["PMC"]["wait_target_surface"] = ["s_lkwr_whentheycomeupsmokee", "s_lkwr_theypopupyoushootem", "s_lkwr_whentheysurfaceopenu", "s_lkwr_theygoforairyoudrope", "s_lkwr_waittiltheysurfaceth", "s_lkwr_theysurfaceyoulighte"];
    level.battlechatter.eventstrings["PMC"]["water_use_grenade"] = ["s_lkwf_dontwasteammousegren", "s_lkwf_throwagrenadeinthere", "s_lkwf_getagrenadeinthewate"];
    level.battlechatter.eventstrings["PMC"]["target_still_close"] = ["s_lkpc_theywerehere", "s_lkpc_theywererighthere", "s_lkpc_theycantbefar", "s_lkpc_theyreclose", "s_lkpc_theyrehiding", "s_lkpc_theygottabeclose", "s_lkpc_theydidntmakeitfar", "s_lkpc_theyrestillheresomew"];
    level.battlechatter.eventstrings["PMC"]["order_clear_building"] = ["s_cmho_clearthebuilding", "s_cmho_securethebuilding", "s_cmho_getthisbuildingsecur"];
    level.battlechatter.eventstrings["PMC"]["order_search_water"] = ["s_cmho_searchthewater", "s_cmho_checkthewater", "s_cmho_targetwasinthewater", "s_cmho_geteyesonthewater", "s_cmho_watchthewater"];
    level.battlechatter.eventstrings["PMC"]["clearing_east"] = ["s_cmhs_checkingeast", "s_cmhs_movingeast", "s_cmhs_securingeast"];
    level.battlechatter.eventstrings["PMC"]["clearing_north"] = ["s_cmhs_checkingnorth", "s_cmhs_movingnorth", "s_cmhs_securingnorth"];
    level.battlechatter.eventstrings["PMC"]["clearing_south"] = ["s_cmhs_checkingsouth", "s_cmhs_movingsouth", "s_cmhs_securingsouth"];
    level.battlechatter.eventstrings["PMC"]["clearing_west"] = ["s_cmhs_checkingwest", "s_cmhs_movingwest", "s_cmhs_securingwest"];
    level.battlechatter.eventstrings["PMC"]["searching_here"] = ["s_cmhc_checkingthisarea", "s_cmhc_securingthisarea", "s_cmhc_searchingthisarea"];
    level.battlechatter.eventstrings["PMC"]["cmb_hunt_confirmation"] = ["s_cmhr_rog", "s_cmhr_rogerthat", "s_cmhr_copy", "s_cmhr_copythat", "s_cmhr_negative"];
    level.battlechatter.eventstrings["PMC"]["good_hunting"] = ["s_hnts_staysharp", "s_hnts_stayfrosty", "s_hnts_keepittight"];
    level.battlechatter.eventstrings["PMC"]["moving_there"] = ["s_hntm_movingnow", "s_hntm_movingtherenow", "s_hntm_moving"];
    level.battlechatter.eventstrings["PMC"]["moving_alone"] = ["s_hntm_iminbound", "s_hntm_immoving", "s_hntm_immovingnow"];
    level.battlechatter.eventstrings["PMC"]["moving_following"] = ["s_hntm_gotyoursix", "s_hntm_imwithyou", "s_hntm_gotyourback"];
    level.battlechatter.eventstrings["PMC"]["moving_together"] = ["s_hntm_weremoving", "s_hntm_weremovingtherenow", "s_hntm_wereinboundnow"];
    level.battlechatter.eventstrings["PMC"]["order_follow_me"] = ["s_hntm_illleadletsgo", "s_hntm_onme", "s_hntm_illtakepointletsmove"];
    level.battlechatter.eventstrings["PMC"]["order_take_point"] = ["s_hntm_takepointmoveout", "s_hntm_youtakepointletsgo", "s_hntm_onyouletsmove", "s_aqhr_takeitoutigotyourbac", "s_aqhr_takepointillcover", "s_aqhr_takepointletsroll"];
    level.battlechatter.eventstrings["PMC"]["ask_found_anything"] = ["s_aqhr_gotanything", "s_aqhr_yougotsomething", "s_aqhr_findanything", "s_aqhr_gotavisual", "s_aqhr_anyvisual", "s_aqhr_whatdoyougot"];
    level.battlechatter.eventstrings["PMC"]["reply_found_nothing"] = ["s_aqhr_novisualonthetarget", "s_aqhr_nosignofem", "s_aqhr_novisual"];
    level.battlechatter.eventstrings["PMC"]["report_searching"] = ["s_aqhr_stillsweeping", "s_aqhr_stillsearching", "s_aqhr_stilllookingforem"];
    level.battlechatter.eventstrings["PMC"]["report_nothing"] = ["s_aqhr_nothingyet", "s_aqhr_nothingsofar", "s_aqhr_nothinghere"];
    level.battlechatter.eventstrings["PMC"]["report_investigating"] = ["s_aqhr_immovingin", "s_aqhr_imcheckingitout", "s_aqhr_movingtosecure"];
    level.battlechatter.eventstrings["PMC"]["area_clear"] = ["s_aqhr_thisareassecure", "s_aqhr_securehere", "s_aqhr_areasecure"];
    level.battlechatter.eventstrings["PMC"]["order_dir"] = ["s_aqhs_securethatarea", "s_aqhs_clearthatarea", "s_aqhs_cordonthatarea", "s_aqhs_checkthatway"];
    level.battlechatter.eventstrings["PMC"]["order_dir_resp"] = ["s_aqhs_illsecurethisarea", "s_aqhs_illtakethisway", "s_aqhs_illcheckoverhere", "s_aqhs_illsearchthisway"];
    level.battlechatter.eventstrings["PMC"]["hunt_search_object"] = ["s_aqhs_itsclear", "s_aqhs_clear", "s_aqhs_secure", "s_aqhs_weresecure"];
    level.battlechatter.eventstrings["PMC"]["hunt"] = ["s_aqhb_wherethefuckareyou", "s_aqhb_motherfuckers", "s_aqhb_yourehidingiknowyour", "s_aqhb_youreheresomewherear", "s_aqhb_comeonout", "s_aqhb_gonnafindyou", "s_aqhb_wheredyoufuckinggo"];
    level.battlechatter.eventstrings["PMC"]["hunt_inv_order"] = ["s_ahii_checkit", "s_ahii_gocheckitout", "s_ahii_checkthatout", "s_ahii_gocheckthat"];
    level.battlechatter.eventstrings["PMC"]["hunt_inv_event"] = ["s_ahir_ithinktheyrenearme", "s_ahir_imighthaveem", "s_ahir_ithinkigotem", "s_ahir_thinkifoundem"];
    level.battlechatter.eventstrings["PMC"]["hunt_reactions"] = ["s_ahnr_surprisedinttenserea", "s_ahnr_surprisedinttenserea_01", "s_ahnr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["PMC"]["cmb_reactions"] = ["s_aqcr_surprisedinttenserea", "s_aqcr_surprisedinttenserea_01", "s_aqcr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["PMC"]["whizby_resp"] = ["s_aqal_itcamefromoverthere", "s_aqal_itcamefromthatway", "s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["PMC"]["hunt_cornercheck"] = ["s_aqho_checkyourcorners", "s_aqho_checkcornersfindem", "s_aqho_checkthosecorners"];
    level.battlechatter.eventstrings["PMC"]["hunt_order_hold"] = ["s_aqho_holdup", "s_aqho_standfast", "s_aqho_hold"];
    level.battlechatter.eventstrings["PMC"]["alert_cornercheck"] = ["s_aqao_checkthecorners", "s_aqao_watchyourcorners", "s_aqao_checkthosecorners"];
    level.battlechatter.eventstrings["PMC"]["alert_order_hold"] = ["s_aqao_holdup", "s_aqao_standfast", "s_aqao_hold"];
    level.battlechatter.eventstrings["PMC"]["alert_search_orders"] = ["s_aqao_checkthatway", "s_aqao_gothatway", "s_aqao_checkoverthere", "s_aqao_searchoverthere", "s_aqao_searchthatway", "s_aqao_securethatarea"];
    level.battlechatter.eventstrings["PMC"]["attack_orders"] = ["s_aato_thresher"];
    level.battlechatter.eventstrings["PMC"]["lkp_patrol_search"] = ["s_alwp_justwatchthewater", "s_alwp_keepwatchingthatside", "s_alwp_justkeepyoureyesonth"];
    level.battlechatter.eventstrings["PMC"]["hunt_report_alert"] = ["s_aqlo_cordonandsearchthear", "s_aqlo_fanoutsearchthearea", "s_aqlo_cordonofftheareafind"];
    level.battlechatter.eventstrings["PMC"]["resp_glass_first"] = ["s_airs_brokenglasshere", "s_airs_itsbrokenglass", "s_airs_gotsomebrokenglass"];
    level.battlechatter.eventstrings["PMC"]["resp_glass_multi"] = ["s_airs_moreglass", "s_airs_gotsomemoreglass", "s_airs_theresmorebrokenglas"];
    level.battlechatter.eventstrings["PMC"]["disguise_enter_investigate"] = ["s_alrc_whoisit", "s_alrc_who", "s_idrc_hmph", "s_idrc_hrm", "s_idrc_eh", "s_idrc_hm", "s_idrc_wha"];
    level.battlechatter.eventstrings["PMC"]["lost_enemy_duo"] = ["c_tast_welostem", "c_tast_welostthem", "c_tast_welosttrackofem"];
    level.battlechatter.eventstrings["PMC"]["lost_enemy_solo"] = ["c_tast_ilosttrackofthem", "c_tast_fuckilostem", "c_tast_fuckilostthem"];
    level.battlechatter.eventstrings["PMC_L"]["reply_hear_you"] = ["s_idrp_rogergoahead", "s_idrp_go", "s_idrp_goahead", "s_idrp_thisisactualgoahead", "s_idrp_thisisactual", "s_idrp_goforactual"];
    level.battlechatter.eventstrings["PMC_L"]["react_interrupt"] = ["s_idli_missedyourlastover", "s_idli_sayagainover", "s_idli_yougood", "s_idli_sayagainyourlastover", "s_idli_commscheck", "s_idli_missedyourlastsayaga"];
    level.battlechatter.eventstrings["PMC_L"]["react_noreply"] = ["s_idli_youreceivingme", "s_idli_youcopy", "s_idli_doyoureadme"];
    level.battlechatter.eventstrings["PMC_L"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["PMC_L"]["signoff"] = ["s_idls_out", "s_idls_actualout", "s_idls_stayfrosty", "s_idls_out_01"];
    level.battlechatter.eventstrings["PMC_L"]["inv_patrol"] = ["s_alip_continueyourpatrolst", "s_alip_getbacktoyourrouteke", "s_alip_returntoyourpatrolst"];
    level.battlechatter.eventstrings["PMC_L"]["wait_target_surface"] = ["s_lkwr_waitforemtocomeupthe", "s_lkwr_whentheycomeupforair", "s_lkwr_whentheycomeupyourec", "s_lkwr_whentheygoforairyout", "s_lkwr_lightemupwhentheygof", "s_lkwr_waitforemtosurfaceth"];
    level.battlechatter.eventstrings["PMC_L"]["order_find_target"] = ["s_cmho_weneedalocationonthe", "s_cmho_locatethetargetnow", "s_cmho_huntemdown"];
    level.battlechatter.eventstrings["PMC_L"]["order_find_perimeter"] = ["s_cmho_getthisarealockeddow", "s_cmho_securetheperimeter", "s_cmho_iwantthisarealockedd"];
    level.battlechatter.eventstrings["PMC_L"]["order_search_water"] = ["s_cmho_searchthewater", "s_cmho_checkthewater", "s_cmho_theywereinthewater", "s_cmho_keepyoureyesonthewat", "s_cmho_watchthewater"];
    level.battlechatter.eventstrings["PMC_L"]["good_hunting"] = ["s_hnts_goodhunting", "s_hnts_staysharpoutthere", "s_hnts_out", "s_aisg_copystaysharp"];
    level.battlechatter.eventstrings["PMC_L"]["ask_found_anything"] = ["s_aqhr_whatsyourstatus", "s_aqhr_whatveyougot", "s_aqhr_givemeasitrep", "s_aqhr_sitrep", "s_aqhr_youfindanything", "s_aqhr_tellmeyougotsomethin"];
    level.battlechatter.eventstrings["PMC_L"]["hunt_report_alert"] = ["s_aqhr_allshadowswehaveenem", "s_aqhr_allshadowsenemyisins", "s_aqhr_allshadowsperimeteri", "s_aqlo_fanoutsecuretheperim", "s_aqlo_setcontainmentfindem", "s_aqlo_spreadoutsearchthear"];
    level.battlechatter.eventstrings["PMC_L"]["order_continue_search"] = ["s_aqho_keeplookingforem", "s_aqho_keepsweeping", "s_aqho_keepsearchingthearea"];
    level.battlechatter.eventstrings["PMC_L"]["order_stay_alert"] = ["s_aqho_staysharp", "s_aqho_keepittight", "s_aqho_eyesopen"];
    level.battlechatter.eventstrings["PMC_L"]["order_stay_aware"] = ["s_aqho_dontlettheseguysgett", "s_aqho_theseguysaretf141don", "s_aqho_keepyourguardupwitht"];
    level.battlechatter.eventstrings["PMC_L"]["ask_how_copy"] = ["s_idcm_howcopy", "s_idcm_doyoucopy", "s_idcm_commscheck"];
    level.battlechatter.eventstrings["PMC_L"]["inv_no_response"] = ["s_iinr_hesradiosilent", "s_iinr_icantreachhim", "s_iinr_hesnotoncomms", "s_iinr_hesnotresponding"];
    level.battlechatter.eventstrings["PMC_L"]["order_get_visual"] = ["s_iinr_seeifyoucanfindoutwh", "s_iinr_checkitoutmakesureno", "s_iinr_canyougetavisualonem", "s_iinr_ineedyoutocheckitout"];
    level.battlechatter.eventstrings["PMC_L"]["inv_patrol_noresp"] = ["s_iinr_thresherisntrespondi", "s_iinr_thresherdidntcheckin", "s_iinr_thresherisntoncomms", "s_iinr_icantreachthresher"];
    level.battlechatter.eventstrings["PMC_L"]["report_search"] = ["s_aias_sitrep", "s_aias_whatsyourstatus", "s_aias_findanything", "s_aias_gotanything", "s_aias_status"];
    level.battlechatter.eventstrings["PMC_L"]["report_alert"] = ["s_airp_allshadowsgetswitche", "s_airp_allshadowsperimeterm", "s_airp_allshadowspossibleen", "s_airp_allshadowssetsecurit"];
    level.battlechatter.eventstrings["PMC_L"]["warn_reply"] = ["s_wrpl_youreclearedhotifthe", "s_wrpl_youseeemagainputemin", "s_wrpl_theycomebackyourecle"];
    level.battlechatter.eventstrings["PMC_L"]["report_target_location"] = ["s_chrp_doesanyonehaveavisua", "s_chrp_talktomeguyswhatsthe", "s_chrp_cmonshadowsineedaloc", "s_chrp_allshadowsdoyouhavea"];
    level.battlechatter.eventstrings["PMC_L"]["report_idle"] = ["s_irpr_status", "s_irpr_sitrep", "s_irpr_yougood", "s_irpr_gotanything", "s_irpr_report"];
    level.battlechatter.eventstrings["PMC_L"]["ally_missing_multi"] = ["s_alms_multipleshadowsarent", "s_alms_moreshadowsarentresp", "s_alms_wevelostcontactwithm", "s_alms_anotherteamlostcomms"];
    level.battlechatter.eventstrings["PMC_L"]["order_search_start"] = ["s_aior_searchthearea", "s_aior_pullsecuritysweepthe", "s_aior_securetheperimeter"];
    level.battlechatter.eventstrings["PMC_L"]["order_report_back"] = ["s_aior_soundoffifyoufindsom", "s_aior_imstandingbyifyoufin", "s_aior_usecommsifyoufindsom"];
    level.battlechatter.eventstrings["PMC_L"]["hunt_patrol_noresp"] = ["s_hpnr_thresherisntrespondi", "s_hpnr_thresherdidntcheckin", "s_hpnr_thresherisntanswerin", "s_hpnr_icantreachthresher"];
    level.battlechatter.eventstrings["RU"]["ahead"] = ["c_posn_straightahead", "c_posn_rightinfrontofus", "c_posn_aheadofus", "c_posn_front", "c_posn_deadahead"];
    level.battlechatter.eventstrings["RU"]["aquired_target"] = ["c_aqen_gotavisual", "c_aqen_targetacquired", "c_aqen_iseehim", "c_aqen_thereheis"];
    level.battlechatter.eventstrings["RU"]["ask_low_ammo"] = ["c_stat_howsyourammo", "c_stat_checkyourammo", "c_stat_whatsyourroundcount"];
    level.battlechatter.eventstrings["RU"]["ask_status"] = ["c_stat_youokay", "c_stat_whatsyourstatus", "c_stat_status"];
    level.battlechatter.eventstrings["RU"]["ask_target_wounded"] = ["c_tast_yougethim", "c_tast_youhithim", "c_tast_youdrophim"];
    level.battlechatter.eventstrings["RU"]["ask_wounded"] = ["c_stat_yougood", "c_stat_youwounded", "c_stat_youhit"];
    level.battlechatter.eventstrings["RU"]["attacking"] = ["c_atac_goinghot", "c_atac_engaging", "c_atac_openinup"];
    level.battlechatter.eventstrings["RU"]["behind"] = ["c_posn_behindus", "c_posn_onoursix", "c_posn_checkrear", "c_posn_rear"];
    level.battlechatter.eventstrings["RU"]["casualties"] = ["c_casu_weretakingheavies", "c_casu_weregettingourassesk", "c_casu_werelosingshooters", "c_casu_weretakingcasualties"];
    level.battlechatter.eventstrings["RU"]["casualty"] = ["c_canm_wegotacasualty", "c_canm_shadowdown", "c_canm_wehaveashadowdown", "c_canm_wevegotwounded", "c_canm_mandown"];
    level.battlechatter.eventstrings["RU"]["checkfire"] = ["c_chck_checkyourfire", "c_chck_watchyourfire", "c_chck_blueblue", "c_chck_checkfirecheckfire"];
    level.battlechatter.eventstrings["RU"]["copy"] = ["c_conf_check", "c_conf_copythat", "c_conf_copy", "c_conf_goodcopy", "c_conf_solidcopy", "c_aqcp_copy", "c_aqcp_solidcopy"];
    level.battlechatter.eventstrings["RU"]["coverme"] = ["c_tcor_coverme", "c_tcor_ineedcoverfire", "c_tcor_coverme_01"];
    level.battlechatter.eventstrings["RU"]["enemy_attacking"] = ["c_eata_takingfire", "c_eata_contact", "c_eata_shadowsincontact", "s_unrc_imtakingfire", "s_unrc_someonesshootinatme", "s_unrc_takineffectivefire", "s_unrc_imgettingshotat"];
    level.battlechatter.eventstrings["RU"]["enemy_covered"] = ["c_exco_onesbehindcover", "c_exco_oneofthemisbehindcov", "c_exco_gotoneofthembehindco"];
    level.battlechatter.eventstrings["RU"]["enemy_exposed"] = ["c_exco_onesintheopen", "c_exco_onesintheopen_01", "c_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["RU"]["enemy_flanking_left"] = ["c_etca_onesmovingleft", "c_etca_leftflank", "c_etca_guardleft", "c_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["RU"]["enemy_flanking_right"] = ["c_etca_guardright", "c_etca_rightflank", "c_etca_onesmovingright", "c_posn_theyreflankingright"];
    level.battlechatter.eventstrings["RU"]["enemy_getting_cover"] = ["c_etca_novisualontarget", "c_etca_gotonetakingcover", "c_etca_onesmovingtocover", "c_etca_novisualontarget_01"];
    level.battlechatter.eventstrings["RU"]["enemy_grenade_close"] = ["c_glna_fuckpleaseno", "c_glna_fuck", "c_glna_noplease"];
    level.battlechatter.eventstrings["RU"]["enemy_lmg"] = ["c_enws_enemymachinegunner", "c_enws_lmg", "c_enws_machinegun"];
    level.battlechatter.eventstrings["RU"]["enemy_moving"] = ["c_etca_onesmovin", "c_etca_thatonesmoving", "c_etca_gotonemoving"];
    level.battlechatter.eventstrings["RU"]["enemy_moving_up"] = ["c_etca_onespushing", "c_etca_gotonemovingup", "c_etca_onesmovingup"];
    level.battlechatter.eventstrings["RU"]["enemy_reloading"] = ["c_etca_onesreloading", "c_etca_theyrereloading", "c_etca_oneschangingmags"];
    level.battlechatter.eventstrings["RU"]["enemy_shotgun"] = ["c_enws_shotgunwatchout", "c_enws_onesgotashotgun", "c_enws_shotgun"];
    level.battlechatter.eventstrings["RU"]["enemy_sniper"] = ["c_enws_thatsasniper", "c_enws_sniper", "c_enws_enemysniper"];
    level.battlechatter.eventstrings["RU"]["enemy_soldier"] = ["c_enmy_visualonatarget", "c_enmy_targetspotted", "c_enmy_gotatarget"];
    level.battlechatter.eventstrings["RU"]["enemy_soldiers"] = ["c_enmy_targets", "c_enmy_targets_01", "c_enmy_wegotbadguys"];
    level.battlechatter.eventstrings["RU"]["enemy_unhurt"] = ["c_tast_ijustmissedone", "c_tast_justmissedone", "c_tast_barelymissedone"];
    level.battlechatter.eventstrings["RU"]["enemy_using_flash"] = ["c_eata_flashincoming", "c_eata_flashgrenade", "c_eata_flash", "c_eata_flashgrenade_01"];
    level.battlechatter.eventstrings["RU"]["enemy_using_grenade"] = ["c_eata_grenade", "c_eata_grenadewatchout", "c_eata_grenadeincoming"];
    level.battlechatter.eventstrings["RU"]["enemy_using_molotov"] = ["c_eata_molotov", "c_eata_molotovincoming", "c_eata_molotov_01"];
    level.battlechatter.eventstrings["RU"]["enemy_using_rpg"] = ["c_eata_rpg", "c_eata_rpgincoming", "c_eata_rpggetdown"];
    level.battlechatter.eventstrings["RU"]["getting_cover"] = ["c_tcac_covercover", "c_tcac_takingcover", "c_tcac_movingtocover"];
    level.battlechatter.eventstrings["RU"]["high"] = ["c_posn_uptop", "c_posn_checkhigh", "c_posn_coverup"];
    level.battlechatter.eventstrings["RU"]["hurt_by_molotov"] = ["c_mtvd_fuckthatburns", "c_mtvd_ahfuckthatshot", "c_mtvd_ahthatsfuckinghot"];
    level.battlechatter.eventstrings["RU"]["killfirm_bigrig"] = ["c_firm_theyresemitrucksdown", "c_firm_destroyedtheirsemitr", "c_firm_enemysemitrucksdown"];
    level.battlechatter.eventstrings["RU"]["killfirm_enemy"] = ["c_firm_gotone", "c_firm_ekia", "c_firm_targetdown"];
    level.battlechatter.eventstrings["RU"]["killfirm_helo"] = ["c_firm_helodown", "c_firm_helodestroyed", "c_firm_theirhelosdown"];
    level.battlechatter.eventstrings["RU"]["killfirm_target"] = ["c_firm_hesdone", "c_firm_hesdown", "c_firm_dumpedhim"];
    level.battlechatter.eventstrings["RU"]["killfirm_truck"] = ["c_firm_truckdestroyed", "c_firm_theirtrucksdown", "c_firm_enemytrucksdown"];
    level.battlechatter.eventstrings["RU"]["left"] = ["c_posn_leftside", "c_posn_left", "c_posn_checkleft"];
    level.battlechatter.eventstrings["RU"]["lost_enemy_duo"] = ["c_tast_welostem", "c_tast_welostthem", "c_tast_welosttrackofem"];
    level.battlechatter.eventstrings["RU"]["lost_enemy_solo"] = ["c_tast_ilosttrackofthem", "c_tast_fuckilostem", "c_tast_fuckilostthem"];
    level.battlechatter.eventstrings["RU"]["low_ammo"] = ["c_stat_ineedamag", "c_stat_lowonammo", "c_stat_lastmag", "c_stat_needammo", "c_stat_imwinchester"];
    level.battlechatter.eventstrings["RU"]["move"] = ["c_tcor_move", "c_tcor_igotyoumove", "c_tcor_startmoving", "c_tcor_go"];
    level.battlechatter.eventstrings["RU"]["moveup"] = ["c_tcor_moveup", "c_tcor_moveupgo", "c_tcor_pushup", "c_tcor_getupthere", "c_tcor_pushforward"];
    level.battlechatter.eventstrings["RU"]["moving"] = ["c_tcac_moving", "c_tcac_immoving", "c_tcac_heyimmoving"];
    level.battlechatter.eventstrings["RU"]["movingup"] = ["c_tcac_impushingup", "c_tcac_pushingforward", "c_tcac_movingup", "c_tcac_pushinup"];
    level.battlechatter.eventstrings["RU"]["neg_target"] = ["c_aqen_idontseeem", "c_aqen_novisual", "c_aqen_cantseehim", "c_aqen_wherethefuckishe"];
    level.battlechatter.eventstrings["RU"]["order_attack"] = ["c_ator_engage", "c_ator_giveemsome", "c_ator_dumpem", "c_ator_gohot", "c_ator_youreclearedhot", "c_ator_startsmokinem"];
    level.battlechatter.eventstrings["RU"]["praise"] = ["c_pras_hellyeah", "c_pras_niceone", "c_pras_fuckina", "c_pras_yeah", "c_pras_getyousome"];
    level.battlechatter.eventstrings["RU"]["reloading"] = ["c_tcac_reloading", "c_tcac_changingmags"];
    level.battlechatter.eventstrings["RU"]["reply_keepshooting"] = ["c_stat_keepshootinguntilthe", "c_stat_thenkeepshootingthem", "c_stat_useeverylastbulletto"];
    level.battlechatter.eventstrings["RU"]["reply_low_ammo"] = ["c_stat_runninglow", "c_stat_imlow", "c_stat_almostout"];
    level.battlechatter.eventstrings["RU"]["reply_okay"] = ["c_stat_imsolid", "c_stat_goodtogo", "c_stat_goodhere"];
    level.battlechatter.eventstrings["RU"]["reply_wounded"] = ["c_stat_itookaround", "c_stat_imgood", "c_stat_yeahroundhittheplate"];
    level.battlechatter.eventstrings["RU"]["repositioning"] = ["c_posn_mycoversblownimrepos", "c_posn_imrepositioning", "c_posn_gottoreposition"];
    level.battlechatter.eventstrings["RU"]["right"] = ["c_posn_rightside", "c_posn_right", "c_posn_checkright"];
    level.battlechatter.eventstrings["RU"]["suppressing"] = ["c_aqsp_suppressingfirefallb", "c_aqsp_suppressingfire", "c_aqsp_imcoveringyou", "c_aqsp_coveringfire"];
    level.battlechatter.eventstrings["RU"]["target_covered"] = ["c_exco_hesbehindcover", "c_exco_hesgotcover", "c_exco_hestakingcover"];
    level.battlechatter.eventstrings["RU"]["target_exposed"] = ["c_exco_theyreintheopen", "c_exco_hesintheopen", "c_exco_theyreintheopen_01"];
    level.battlechatter.eventstrings["RU"]["target_getting_cover"] = ["c_ttca_theyremovingtocover", "c_ttca_hesgoingforcover", "c_ttca_hestakingcover"];
    level.battlechatter.eventstrings["RU"]["target_lmg"] = ["c_taws_theyreusingamachineg", "c_taws_hesgotamachinegun", "c_taws_machinegunner"];
    level.battlechatter.eventstrings["RU"]["target_moving"] = ["c_ttca_theyremoving", "c_ttca_hesmoving", "c_ttca_hesrunning"];
    level.battlechatter.eventstrings["RU"]["target_moving_up"] = ["c_ttca_theyremovingup", "c_ttca_hesmovingup", "c_ttca_hescominguponyou"];
    level.battlechatter.eventstrings["RU"]["target_near_patrol"] = ["c_ttca_theyreswimmingnearth", "c_ttca_theyreswimmingyourwa", "c_ttca_interceptthem"];
    level.battlechatter.eventstrings["RU"]["target_reloading"] = ["c_ttca_theyrereloading", "c_ttca_hesout", "c_ttca_hesreloading"];
    level.battlechatter.eventstrings["RU"]["target_shotgun"] = ["c_taws_theyvegotashotgun", "c_taws_hesgotashotgun"];
    level.battlechatter.eventstrings["RU"]["target_sniper"] = ["c_taws_hessnipingus", "c_taws_hesasniper"];
    level.battlechatter.eventstrings["RU"]["target_unhurt"] = ["c_tast_hegotaway", "c_tast_heranoff", "c_tast_hesfallingback"];
    level.battlechatter.eventstrings["RU"]["team_enemy_grenade_close"] = ["c_glna_fuckweredead", "c_glna_werefuckingdead", "c_glna_fucknoweredead"];
    level.battlechatter.eventstrings["RU"]["use_flash"] = ["c_ator_useaflashbang", "c_ator_throwaflashbang", "c_ator_tossaflashbang"];
    level.battlechatter.eventstrings["RU"]["use_grenade"] = ["c_ator_useagrenade", "c_ator_throwafrag", "c_ator_tossafrag"];
    level.battlechatter.eventstrings["RU"]["use_molotov"] = ["c_ator_throwamolotov", "c_ator_useamolotov", "c_ator_tossamolotov"];
    level.battlechatter.eventstrings["RU"]["use_smoke"] = ["c_atac_throwasmokegrenade", "c_atac_useasmokegrenade", "c_atac_tossasmokegrenade"];
    level.battlechatter.eventstrings["RU"]["using_flash"] = ["c_atac_flashbangout", "c_atac_throwingflashbang"];
    level.battlechatter.eventstrings["RU"]["using_grenade"] = ["c_atac_fragout", "c_atac_throwingafrag"];
    level.battlechatter.eventstrings["RU"]["using_molotov"] = ["c_atac_throwingmolotov", "c_atac_molotovout"];
    level.battlechatter.eventstrings["RU"]["using_rpg"] = ["c_atac_rocket", "c_atac_rocket_01"];
    level.battlechatter.eventstrings["RU"]["using_smoke"] = ["c_atac_throwingsmoke", "c_atac_smokeout"];
    level.battlechatter.eventstrings["RU"]["wounded"] = ["c_stat_imhit", "c_stat_imshot", "c_stat_medic"];
    level.battlechatter.eventstrings["RU"]["wounded_enemy"] = ["c_aens_igothim", "c_aens_clippedhim", "c_aens_hitone"];
    level.battlechatter.eventstrings["RU"]["wounded_target"] = ["c_atas_woundedhim", "c_atas_ihithim", "c_atas_itaggedem"];
    level.battlechatter.eventstrings["RU"]["youre_exposed"] = ["c_exco_findcover", "c_exco_gettocoversoldier", "c_exco_youreexposedsoldierm"];
    level.battlechatter.eventstrings["RU"]["semtex_stuck"] = ["c_glna_fuckpleaseno", "c_glna_fuck", "c_glna_noplease"];
    level.battlechatter.eventstrings["RU"]["alert_cornercheck"] = ["s_aqao_checkthecorners", "s_aqao_watchyourcorners", "s_aqao_checkthosecorners"];
    level.battlechatter.eventstrings["RU"]["alert_confirming"] = ["s_alcf_roger", "s_alcf_copy", "s_alcf_copythat"];
    level.battlechatter.eventstrings["RU"]["alert_investigating"] = ["s_alin_imgonnareccethearea", "s_alin_imcheckingitout", "s_alin_imgonnacheckitout"];
    level.battlechatter.eventstrings["RU"]["alert_order_hold"] = ["s_aqao_holdup", "s_aqao_standfast", "s_aqao_hold"];
    level.battlechatter.eventstrings["RU"]["alert_patrol"] = ["s_alip_illpullsecurityherea", "s_alip_illsecuretheareakeep", "s_alip_headbackillpullsecur", "s_alip_ivegotthisareagetbac"];
    level.battlechatter.eventstrings["RU"]["alert_search_orders"] = ["s_aqao_checkthatway", "s_aqao_gothatway", "s_aqao_checkoverthere", "s_aqao_searchoverthere", "s_aqao_searchthatway", "s_aqao_securethatarea"];
    level.battlechatter.eventstrings["RU"]["area_clear"] = ["s_aqhr_thisareassecure", "s_aqhr_securehere", "s_aqhr_areasecure"];
    level.battlechatter.eventstrings["RU"]["ask_corpse_name"] = ["s_alrc_whoisit", "s_alrc_who", "s_alrc_whodidwelose"];
    level.battlechatter.eventstrings["RU"]["ask_enemy_count"] = ["s_unwc_howmanyarethere", "s_unwc_howmanyofem", "s_unwc_howmany"];
    level.battlechatter.eventstrings["RU"]["ask_enemy_loc"] = ["s_unwl_wheredthatcomefrom", "s_unwl_whereditcomefrom", "s_unwl_wherethefuckarethey"];
    level.battlechatter.eventstrings["RU"]["ask_found_anything"] = ["s_aqhr_gotanything", "s_aqhr_yougotsomething", "s_aqhr_findanything", "s_aqhr_gotavisual", "s_aqhr_anyvisual", "s_aqhr_whatdoyougot"];
    level.battlechatter.eventstrings["RU"]["ask_heard_that"] = ["s_alre_youhearthat", "s_alre_youheardthatright", "s_alre_youheardthattoo"];
    level.battlechatter.eventstrings["RU"]["ask_saw_that"] = ["s_alre_didyouseethat", "s_alre_yougeteyesonthat", "s_alre_youcatchthat"];
    level.battlechatter.eventstrings["RU"]["ask_target_location"] = ["s_lklr_gotavisual", "s_lklr_youseeem", "s_lklr_whatstheirlocation", "s_lklr_wherearethey", "s_lklr_wherethefuckarethey", "s_lklr_getmealocation", "c_tast_wherearethey", "c_tast_doesanyonehaveavisua", "c_tast_wherethefuckretheyat"];
    level.battlechatter.eventstrings["RU"]["attack_orders"] = ["s_aato_thresher"];
    level.battlechatter.eventstrings["RU"]["at_my_location"] = ["s_awrr_righthere", "s_awrr_onmeonme", "s_awrr_myposition", "s_awrr_righthererighthere", "s_awrr_onme", "s_awrr_theyrerighthere", "s_awrr_overhere", "s_awrr_theyreoverhere"];
    level.battlechatter.eventstrings["RU"]["bottle_whizby"] = ["s_alre_whothefuckthrewthat", "s_alre_whothrewthat", "s_alre_youmissed"];
    level.battlechatter.eventstrings["RU"]["cmb_hunt_confirmation"] = ["s_cmhr_rog", "s_cmhr_rogerthat", "s_cmhr_copy", "s_cmhr_copythat", "s_cmhr_roger"];
    level.battlechatter.eventstrings["RU"]["clearing_east"] = ["s_cmhs_checkingeast", "s_cmhs_movingeast", "s_cmhs_securingeast"];
    level.battlechatter.eventstrings["RU"]["clearing_north"] = ["s_cmhs_checkingnorth", "s_cmhs_movingnorth", "s_cmhs_securingnorth"];
    level.battlechatter.eventstrings["RU"]["clearing_south"] = ["s_cmhs_checkingsouth", "s_cmhs_movingsouth", "s_cmhs_securingsouth"];
    level.battlechatter.eventstrings["RU"]["clearing_west"] = ["s_cmhs_checkingwest", "s_cmhs_movingwest", "s_cmhs_securingwest"];
    level.battlechatter.eventstrings["RU"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["RU"]["covering_investigate"] = ["s_idit_covering", "s_idit_imwithyou", "s_idit_gotyoucovered"];
    level.battlechatter.eventstrings["RU"]["enemy_loc_resp"] = ["s_unrs_nearbystayalert", "s_unrs_ididntseeem", "s_unrs_idontfuckingknow", "s_unrs_novisualdidntseeem"];
    level.battlechatter.eventstrings["RU"]["flanked"] = ["s_awrr_ivegotthemflanked", "s_awrr_ivegotaflankonthem", "s_awrr_iveflankedthem"];
    level.battlechatter.eventstrings["RU"]["found_target"] = ["s_awrr_gotem", "s_awrr_iseeem", "s_awrr_foundem", "s_awrr_hey", "s_awrr_visual", "s_awrr_targetspotted"];
    level.battlechatter.eventstrings["RU"]["found_you"] = ["s_awrr_thereyouare", "s_awrr_foundyou", "s_awrr_igotyou", "s_awrr_ifoundyou", "s_awrr_gotyou"];
    level.battlechatter.eventstrings["RU"]["good_hunting"] = ["s_hnts_staysharp", "s_hnts_stayfrosty", "s_hnts_keepittight"];
    level.battlechatter.eventstrings["RU"]["have_something"] = ["s_alre_imighthavesomething", "s_alre_ithinkihavesomething", "s_alre_igotapossiblethreat"];
    level.battlechatter.eventstrings["RU"]["heard_something"] = ["s_alre_iheardsomething", "s_alre_heardsomethingnearme", "s_alre_iheardanoise"];
    level.battlechatter.eventstrings["RU"]["hunt"] = ["s_aqhb_wherethefuckareyou", "s_aqhb_yourehidingiknowyour", "s_aqhb_youreheresomewherear", "s_aqhb_comeonout", "s_aqhb_gonnafindyou", "s_aqhb_wheredyoufuckinggo"];
    level.battlechatter.eventstrings["RU"]["hunt_copy"] = ["s_hnrs_copy", "s_hnrs_rogerthat", "s_hnrs_copythat"];
    level.battlechatter.eventstrings["RU"]["hunt_cornercheck"] = ["s_aqho_checkyourcorners", "s_aqho_checkcornersfindem", "s_aqho_checkthosecorners"];
    level.battlechatter.eventstrings["RU"]["hunt_inv_event"] = ["s_ahir_ithinktheyrenearme", "s_ahir_imighthaveem", "s_ahir_ithinkigotem", "s_ahir_thinkifoundem"];
    level.battlechatter.eventstrings["RU"]["hunt_inv_order"] = ["s_ahii_checkit", "s_ahii_gocheckitout", "s_ahii_checkthatout", "s_ahii_gocheckthat"];
    level.battlechatter.eventstrings["RU"]["hunt_neg"] = ["s_hnrs_negative", "s_hnrs_no", "s_hnrs_nosir"];
    level.battlechatter.eventstrings["RU"]["hunt_order_hold"] = ["s_aqho_holdup", "s_aqho_standfast", "s_aqho_hold"];
    level.battlechatter.eventstrings["RU"]["hunt_reactions"] = ["s_ahnr_surprisedintensereac", "s_ahnr_surprisedintensereac_01", "s_ahnr_surprisedintensereac_02"];
    level.battlechatter.eventstrings["RU"]["hunt_report_alert"] = ["s_aqlo_cordonandsearchthear", "s_aqlo_fanoutsearchthearea", "s_aqlo_cordonofftheareafind"];
    level.battlechatter.eventstrings["RU"]["hunt_search_object"] = ["s_aqhs_itsclear", "s_aqhs_clear", "s_aqhs_secure", "s_aqhs_weresecure"];
    level.battlechatter.eventstrings["RU"]["idle_good_hunting"] = ["s_idls_stayfrosty", "s_idls_keepittight", "s_idls_staysharp"];
    level.battlechatter.eventstrings["RU"]["inv_arrive"] = ["s_idin_hmm", "s_idin_hmphokay", "s_idin_huhwhatwasthat", "s_idin_hrm", "s_idin_huhthehell"];
    level.battlechatter.eventstrings["RU"]["inv_ask_first"] = ["s_idia_whatwasit", "s_idia_whatdyoufind", "s_idia_yougotanything", "s_idia_seeanything", "s_idia_findanything", "s_alia_seeanything"];
    level.battlechatter.eventstrings["RU"]["inv_ask_second"] = ["s_idia_whatwasitthistime", "s_idia_anythingthistime", "s_idia_stillnothing", "s_idia_stilldidntfindanythi", "s_idia_findanythingthistime"];
    level.battlechatter.eventstrings["RU"]["investigating"] = ["s_idin_illseewhatsup", "s_idin_illcheckitout", "s_idin_illgocheck"];
    level.battlechatter.eventstrings["RU"]["lkp_patrol_search"] = ["s_alwp_justwatchthewater", "s_alwp_keepwatchingthatside", "s_alwp_justkeepyoureyesonth"];
    level.battlechatter.eventstrings["RU"]["lost_target"] = ["s_lkpl_frustratedgrunttheyr", "s_lkpl_frustratedgrunttheyr_01", "s_lkpl_frustratedgruntnovis", "s_lkpl_frustratedgrunttheyg"];
    level.battlechatter.eventstrings["RU"]["lost_target_water"] = ["s_lkpw_theywentunderwater", "s_lkpw_theyreinthewater", "s_lkpw_theyjumpedinthewater", "s_lkpw_theyjumpedinthewater"];
    level.battlechatter.eventstrings["RU"]["moving_there"] = ["s_hntm_movingnow", "s_hntm_movingtherenow", "s_hntm_moving"];
    level.battlechatter.eventstrings["RU"]["moving_alone"] = ["s_hntm_iminbound", "s_hntm_immoving", "s_hntm_immovingnow"];
    level.battlechatter.eventstrings["RU"]["moving_following"] = ["s_hntm_gotyoursix", "s_hntm_imwithyou", "s_hntm_gotyourback"];
    level.battlechatter.eventstrings["RU"]["moving_together"] = ["s_hntm_weremoving", "s_hntm_weremovingtherenow", "s_hntm_wereinboundnow"];
    level.battlechatter.eventstrings["RU"]["muttered_confusion"] = ["s_idin_whatthefuck", "s_idin_whatthehell", "s_idin_whatthefuckwasthat", "s_idin_whatthehellwasthat"];
    level.battlechatter.eventstrings["RU"]["need_backup"] = ["s_alrc_requestingmorekonni", "s_alrc_sendreinforcements", "s_albc_sendreinforcements"];
    level.battlechatter.eventstrings["RU"]["order_check_last"] = ["s_advo_moveonemgo", "s_advo_forceuponemgo", "s_advo_pushtheirpositiongo"];
    level.battlechatter.eventstrings["RU"]["order_check_together"] = ["s_idit_letsgocheckitout", "s_idit_letscheckitwatchmyba", "s_idit_letsgocheckcoverme"];
    level.battlechatter.eventstrings["RU"]["order_clear_building"] = ["s_cmho_clearthebuilding", "s_cmho_securethebuilding", "s_cmho_getthisbuildingsecur"];
    level.battlechatter.eventstrings["RU"]["order_dir"] = ["s_aqhs_securethatarea", "s_aqhs_clearthatarea", "s_aqhs_cordonthatarea", "s_aqhs_checkthatway"];
    level.battlechatter.eventstrings["RU"]["order_dir_resp"] = ["s_aqhs_illsecurethisarea", "s_aqhs_illtakethisway", "s_aqhs_illcheckoverhere", "s_aqhs_illsearchthisway"];
    level.battlechatter.eventstrings["RU"]["order_follow_me"] = ["s_hntm_illleadletsgo", "s_hntm_onme", "s_hntm_illtakepointletsmove"];
    level.battlechatter.eventstrings["RU"]["order_investigate"] = ["s_idio_gocheckit", "s_idio_checkitout", "s_idio_gocheckthatout"];
    level.battlechatter.eventstrings["RU"]["order_search_water"] = ["s_cmho_searchthewater", "s_cmho_checkthewater", "s_cmho_targetwasinthewater", "s_cmho_geteyesonthewater", "s_cmho_watchthewater"];
    level.battlechatter.eventstrings["RU"]["order_take_point"] = ["s_hntm_takepointmoveout", "s_hntm_youtakepointletsgo", "s_hntm_onyouletsmove", "s_aqhr_takeitoutigotyourbac", "s_aqhr_takepointillcover", "s_aqhr_takepointletsroll"];
    level.battlechatter.eventstrings["RU"]["over_there"] = ["s_hnfn_overthere", "s_hnfn_theyreoverthere", "s_hnfn_rightthere"];
    level.battlechatter.eventstrings["RU"]["react_first"] = ["s_idrc_huh", "s_idrc_wha", "s_idrc_hm", "s_idrc_eh", "s_idrc_hrm", "s_idrc_hmph", "s_idin_hmm", "s_idin_hmphokay", "s_idin_huhwhatwasthat", "s_idin_hrm", "s_idin_huhthehell"];
    level.battlechatter.eventstrings["RU"]["react_first_combat"] = ["s_awrr_contactenemy", "s_awrr_contactenemyhere", "s_awrr_enemymyposition", "s_awrr_enemy", "s_awrr_enemyshere", "s_awrr_gotenemyhere", "s_awrr_enemysrighthere"];
    level.battlechatter.eventstrings["RU"]["react_found_corpse"] = ["s_alrc_wegotamandown", "s_alrc_wegotacasualty", "s_alrc_friendlysoldierdown", "s_alrc_wegotakia"];
    level.battlechatter.eventstrings["RU"]["react_interrupt"] = ["s_idli_missedyourlastover", "s_idli_sayagainover", "s_idli_yougood"];
    level.battlechatter.eventstrings["RU"]["react_multi"] = ["s_idrm_whosoutthere", "s_idrm_okaywhatthefuck", "s_idrm_whatisthisshit"];
    level.battlechatter.eventstrings["RU"]["react_noreply"] = ["s_idli_youreceivingme", "s_idli_youcopy", "s_idli_doyoureadme"];
    level.battlechatter.eventstrings["RU"]["react_resp"] = ["s_alrr_yeah", "s_alrr_afirm", "s_alrr_yeahrogerthat"];
    level.battlechatter.eventstrings["RU"]["react_second"] = ["s_idrc_whatthefuckisthat", "s_idrc_whatthehellisthat", "s_idrc_thefuckisgoingon"];
    level.battlechatter.eventstrings["RU"]["react_whizby"] = ["s_unrc_imtakingfire", "s_unrc_thatsclose", "s_unrc_someonesshootinatme", "s_unrc_takineffectivefire", "s_unrc_imgettingshotat"];
    level.battlechatter.eventstrings["RU"]["reply_found_nothing"] = ["s_aqhr_novisualonthetarget", "s_aqhr_nosignofem", "s_aqhr_novisual"];
    level.battlechatter.eventstrings["RU"]["reply_hear_you"] = ["s_idrp_go", "s_idrp_goahead", "s_idrp_imhere", "s_idrp_rogergoahead"];
    level.battlechatter.eventstrings["RU"]["report_investigating"] = ["s_aqhr_immovingin", "s_aqhr_imcheckingitout", "s_aqhr_movingtosecure"];
    level.battlechatter.eventstrings["RU"]["report_nothing"] = ["s_aqhr_nothingyet", "s_aqhr_nothingsofar", "s_aqhr_nothinghere"];
    level.battlechatter.eventstrings["RU"]["report_reply_idle"] = ["s_idrr_gotnothing", "s_idrr_secure", "s_idrr_clearhere", "s_idrr_allclear", "s_idrr_goodhere", "s_idrr_allquiet", "s_idrr_areassecure"];
    level.battlechatter.eventstrings["RU"]["report_reply_search"] = ["s_alir_negativenothingyet", "s_alir_nothingsofar", "s_alir_nothing", "s_alir_goodsofar", "s_alir_igotnothingyet", "s_alir_sofarsogood", "s_alir_notseeinganything", "s_alir_negativegotnothing", "s_alir_nothingfornow", "s_alir_itsclearsofar", "s_alir_weregoodfornow"];
    level.battlechatter.eventstrings["RU"]["report_searching"] = ["s_aqhr_stillsweeping", "s_aqhr_stillsearching", "s_aqhr_stilllookingforem"];
    level.battlechatter.eventstrings["RU"]["report_target_water"] = ["s_awrr_targetsinthewater", "s_awrr_gotavisualtheyreinth", "s_awrr_iseeeminthewater", "s_awrr_inthewaterinthewater", "s_awrr_enemyinthewater", "s_awrr_theyremovinginthewat", "s_awrr_heytheyreinthewater"];
    level.battlechatter.eventstrings["RU"]["resp_glass_first"] = ["s_airs_brokenglasshere", "s_airs_itsbrokenglass", "s_airs_gotsomebrokenglass"];
    level.battlechatter.eventstrings["RU"]["resp_glass_multi"] = ["s_airs_moreglass", "s_airs_gotsomemoreglass", "s_airs_theresmorebrokenglas"];
    level.battlechatter.eventstrings["RU"]["resp_sound_first"] = ["s_idir_nothingnobody", "s_idir_negativewereclear", "s_idir_nahweresecure", "s_idir_nothingnovisual"];
    level.battlechatter.eventstrings["RU"]["resp_water_first"] = ["s_idir_checkedthewaterthere", "s_idir_sweptthewaterdidntfi", "s_idir_checkednearthewaterw", "s_idir_nothinginthewaterwer"];
    level.battlechatter.eventstrings["RU"]["resp_window_first"] = ["s_idir_awindowwasleftopenwe", "s_idir_foundanopenwindowche", "s_idir_someoneleftawindowop"];
    level.battlechatter.eventstrings["RU"]["resp_window_multi"] = ["s_idir_sawanotheropenwindow", "s_idir_anotheropenwindowwer", "s_idir_therewasanotheropenw"];
    level.battlechatter.eventstrings["RU"]["saw_something"] = ["s_alre_isawsomething", "s_alre_thoughtisawsomething", "s_alre_ithinksomeonesnearme"];
    level.battlechatter.eventstrings["RU"]["searching_here"] = ["s_cmhc_checkingthisarea", "s_cmhc_securingthisarea", "s_cmhc_searchingthisarea"];
    level.battlechatter.eventstrings["RU"]["see_something"] = ["s_alre_iseesomething", "s_alre_ithinkiseesomething", "s_alre_iseesomethingnearme"];
    level.battlechatter.eventstrings["RU"]["surprise"] = ["s_hurc_ohfuck", "s_hurc_ohshit"];
    level.battlechatter.eventstrings["RU"]["target_still_close"] = ["s_lkpc_theywerehere", "s_lkpc_theywererighthere", "s_lkpc_theycantbefar", "s_lkpc_theyreclose", "s_lkpc_theyrehiding", "s_lkpc_theygottabeclose", "s_lkpc_theydidntmakeitfar", "s_lkpc_theyrestillheresomew"];
    level.battlechatter.eventstrings["RU"]["team_alert_investigating"] = ["s_alin_wellcheckthearea", "s_alin_werecheckingitout", "s_alin_weregonnacheckitout"];
    level.battlechatter.eventstrings["RU"]["team_have_something"] = ["s_alre_wemighthavesomething", "s_alre_ithinkwegotsomething", "s_alre_wegotapossiblethreat"];
    level.battlechatter.eventstrings["RU"]["team_heard_something"] = ["s_alre_weheardsomething", "s_alre_weheardsomethingclos", "s_alre_weheardanoise"];
    level.battlechatter.eventstrings["RU"]["team_return_idle"] = ["s_idid_okayletsheadback", "s_idid_weregoodhereletsgetb", "s_idid_backtoourpostsletsgo"];
    level.battlechatter.eventstrings["RU"]["team_saw_something"] = ["s_alre_wesawsomething", "s_alre_wesawsomethingnearus", "s_alre_wesawsomethingnearou"];
    level.battlechatter.eventstrings["RU"]["team_see_something"] = ["s_alre_weseesomething"];
    level.battlechatter.eventstrings["RU"]["unaware_backup"] = ["s_unwb_ineedreinforcements", "s_unwb_getmorepersonnelhere", "s_unwb_sendreinforcementsmy"];
    level.battlechatter.eventstrings["RU"]["wait_target_surface"] = ["s_lkwr_whentheycomeupsmokee", "s_lkwr_theypopupyoushootem", "s_lkwr_whentheysurfaceopenu", "s_lkwr_theygoforairyoudrope", "s_lkwr_waittiltheysurfaceth", "s_lkwr_theysurfaceyoulighte"];
    level.battlechatter.eventstrings["RU"]["warn_conv"] = ["s_wrni_scaredthehelloutofem", "s_wrni_probablyshittingthem", "s_wrni_whatthehellweretheyd", "s_wrni_whatthefuckweretheyt"];
    level.battlechatter.eventstrings["RU"]["warn_attack"] = ["s_wrnk_heyiwarnedyou", "s_wrnk_youwerewarned", "s_wrnk_heyyoujustfuckedup"];
    level.battlechatter.eventstrings["RU"]["warn_conv_reply"] = ["s_wrir_almostgotthemselvesk", "s_wrir_iwasreadytodumpthatm", "s_wrir_luckytheydidntcatcha"];
    level.battlechatter.eventstrings["RU"]["warn_report"] = ["s_wrnr_hadanunknowninsideth", "s_wrnr_hadanunknowninsideth_01", "s_wrnr_anunknownwasintheare"];
    level.battlechatter.eventstrings["RU"]["warn_spotted"] = ["s_wrnf_heygetthefuckback", "s_wrnf_heyyougetthefuckoutt", "s_wrnf_getbackgetbackrightn"];
    level.battlechatter.eventstrings["RU"]["water_use_grenade"] = ["s_lkwf_dontwasteammousegren", "s_lkwf_throwagrenadeinthere", "s_lkwf_getagrenadeinthewate"];
    level.battlechatter.eventstrings["RU"]["whizby_resp"] = ["s_aqal_itcamefromoverthere", "s_aqal_itcamefromthatway", "s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["RU_L"]["ally_missing_multi"] = ["s_alms_multipleshadowsarent", "s_alms_moreshadowsarentresp", "s_alms_wevelostcontactwithm", "s_alms_anotherteamlostcomms"];
    level.battlechatter.eventstrings["RU_L"]["ask_found_anything"] = ["s_aqhr_whatsyourstatus", "s_aqhr_whatveyougot", "s_aqhr_givemeasitrep", "s_aqhr_sitrep", "s_aqhr_youfindanything", "s_aqhr_tellmeyougotsomethin"];
    level.battlechatter.eventstrings["RU_L"]["ask_how_copy"] = ["s_idcm_howcopy", "s_idcm_doyoucopy", "s_idcm_commscheck"];
    level.battlechatter.eventstrings["RU_L"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["RU_L"]["good_hunting"] = ["s_hnts_goodhunting", "s_hnts_staysharpoutthere", "s_hnts_out", "s_aisg_copystaysharp"];
    level.battlechatter.eventstrings["RU_L"]["hunt_patrol_noresp"] = ["s_hpnr_thresherisntrespondi", "s_hpnr_thresherdidntcheckin", "s_hpnr_thresherisntanswerin", "s_hpnr_icantreachthresher"];
    level.battlechatter.eventstrings["RU_L"]["hunt_report_alert"] = ["s_aqlo_fanoutsecuretheperim", "s_aqlo_setcontainmentfindem", "s_aqlo_spreadoutsearchthear", "s_aqhr_allshadowswehaveenem", "s_aqhr_allshadowsenemyisins", "s_aqhr_allshadowsperimeteri"];
    level.battlechatter.eventstrings["RU_L"]["inv_no_response"] = ["s_iinr_hesradiosilent", "s_iinr_icantreachhim", "s_iinr_hesnotoncomms"];
    level.battlechatter.eventstrings["RU_L"]["inv_patrol"] = ["s_alip_continueyourpatrolst", "s_alip_getbacktoyourrouteke", "s_alip_returntoyourpatrolst"];
    level.battlechatter.eventstrings["RU_L"]["inv_patrol_noresp"] = ["s_iinr_thresherisntrespondi", "s_iinr_thresherdidntcheckin", "s_iinr_thresherisntoncomms", "s_iinr_icantreachthresher"];
    level.battlechatter.eventstrings["RU_L"]["leader_ask_corpse_name"] = ["s_alrc_whoisit", "s_alrc_whodidwelose", "s_alrc_whoisitthatwelost"];
    level.battlechatter.eventstrings["RU_L"]["order_continue_search"] = ["s_aqho_keeplookingforem", "s_aqho_keepsweeping", "s_aqho_keepsearchingthearea"];
    level.battlechatter.eventstrings["RU_L"]["order_find_perimeter"] = ["s_cmho_getthisarealockeddow", "s_cmho_securetheperimeter", "s_cmho_iwantthisarealockedd"];
    level.battlechatter.eventstrings["RU_L"]["order_find_target"] = ["s_cmho_weneedalocationonthe", "s_cmho_locatethetargetnow", "s_cmho_huntemdown"];
    level.battlechatter.eventstrings["RU_L"]["order_get_visual"] = ["s_iinr_seeifyoucanfindoutwh", "s_iinr_checkitoutmakesureno", "s_iinr_canyougetavisualonem", "s_iinr_ineedyoutocheckitout"];
    level.battlechatter.eventstrings["RU_L"]["order_report_back"] = ["s_aior_soundoffifyoufindsom", "s_aior_imstandingbyifyoufin", "s_aior_usecommsifyoufindsom"];
    level.battlechatter.eventstrings["RU_L"]["order_search_start"] = ["s_aior_searchthearea", "s_aior_pullsecuritysweepthe", "s_aior_securetheperimeter"];
    level.battlechatter.eventstrings["RU_L"]["order_search_water"] = ["s_cmho_searchthewater", "s_cmho_checkthewater", "s_cmho_theywereinthewater", "s_cmho_keepyoureyesonthewat", "s_cmho_watchthewater"];
    level.battlechatter.eventstrings["RU_L"]["order_stay_alert"] = ["s_aqho_staysharp", "s_aqho_keepittight", "s_aqho_eyesopen"];
    level.battlechatter.eventstrings["RU_L"]["order_stay_aware"] = ["s_aqho_dontlettheseguysgett", "s_aqho_theseguysaretf141don"];
    level.battlechatter.eventstrings["RU_L"]["react_interrupt"] = ["s_idli_missedyourlastover", "s_idli_sayagainover", "s_idli_yougood", "s_idli_sayagainyourlastover", "s_idli_commscheck", "s_idli_missedyourlastsayaga"];
    level.battlechatter.eventstrings["RU_L"]["react_noreply"] = ["s_idli_youreceivingme", "s_idli_youcopy", "s_idli_doyoureadme"];
    level.battlechatter.eventstrings["RU_L"]["reply_hear_you"] = ["s_idrp_go", "s_idrp_goahead", "s_idrp_thisisactualgoahead", "s_idrp_rogergoahead", "s_idrp_thisisactual", "s_idrp_goforactual"];
    level.battlechatter.eventstrings["RU_L"]["report_alert"] = ["s_airp_allshadowsgetswitche", "s_airp_allshadowsperimeterm", "s_airp_allshadowspossibleen", "s_airp_allshadowssetsecurit"];
    level.battlechatter.eventstrings["RU_L"]["report_idle"] = ["s_irpr_status", "s_irpr_sitrep", "s_irpr_yougood", "s_irpr_gotanything", "s_irpr_report"];
    level.battlechatter.eventstrings["RU_L"]["report_search"] = ["s_aias_sitrep", "s_aias_whatsyourstatus", "s_aias_findanything", "s_aias_gotanything", "s_aias_status"];
    level.battlechatter.eventstrings["RU_L"]["report_target_location"] = ["s_chrp_doesanyonehaveavisua", "s_chrp_talktomeguyswhatsthe", "s_chrp_cmonshadowsineedaloc"];
    level.battlechatter.eventstrings["RU_L"]["signoff"] = ["s_idls_out", "s_idls_actualout", "s_idls_stayfrosty", "s_idls_out_01"];
    level.battlechatter.eventstrings["RU_L"]["wait_target_surface"] = ["s_lkwr_waitforemtocomeupthe", "s_lkwr_whentheycomeupforair", "s_lkwr_whentheycomeupyourec", "s_lkwr_whentheycomeupyourec", "s_lkwr_lightemupwhentheygof", "s_lkwr_waitforemtosurfaceth"];
    level.battlechatter.eventstrings["RU_L"]["warn_reply"] = ["s_wrpl_youreclearedhotifthe", "s_wrpl_youseeemagainputemin", "s_wrpl_theycomebackyourecle"];
    level.battlechatter.eventstrings["RU_L"]["leader_revenge"] = ["c_aded_iknowyoureoutthereju", "c_aded_youthinkthatyouvewon", "c_aded_takethissmallwinwhil"];
    level.battlechatter.eventstrings["RU_L"]["leader_revenge_backupinc"] = ["c_adbu_enjoythesilencewhile", "c_adbu_youthoughtyoucouldki", "c_adbu_ifiwereyouidrunbefor"];
    level.battlechatter.eventstrings["RU_L"]["order_attack"] = ["c_ator_engage", "c_ator_gohot", "c_ator_youreclearedhot"];
    level.battlechatter.eventstrings["RU_L"]["report_alert_combat"] = ["c_actr_allsoldiersenemyisin", "c_actr_anenemyhasbreachedth", "c_actr_allsoldiersperimeter"];
    if (!utility::ismp()) {
        level.battlechatter.eventstrings["USS"]["left"] = ["m_posn_ontheleft", "m_posn_leftside"];
        level.battlechatter.eventstrings["USS"]["right"] = ["m_posn_watchright", "m_posn_rightside"];
        level.battlechatter.eventstrings["USS"]["order_attack"] = ["m_ator_shootthem", "m_ator_attack", "m_ator_fireyourweapon"];
        level.battlechatter.eventstrings["USS"]["using_grenade"] = ["m_atac_fragout", "m_atac_grenadeout"];
        level.battlechatter.eventstrings["USS"]["attacking"] = ["m_atac_attacking", "m_atac_engaging", "m_atac_firing"];
        level.battlechatter.eventstrings["USS"]["movingup"] = ["m_tcac_immovingup", "m_tcac_movingforward", "m_tcac_movingup"];
        level.battlechatter.eventstrings["USS"]["reloading"] = ["m_tcac_changingmags", "m_tcac_imreloading"];
        level.battlechatter.eventstrings["USS"]["moving"] = ["m_tcac_moving", "m_tcac_immoving", "m_tcac_movingnow"];
        level.battlechatter.eventstrings["USS"]["getting_cover"] = ["m_tcac_takingcover", "m_tcac_movingtocover"];
        level.battlechatter.eventstrings["USS"]["enemy_using_flash"] = ["m_eata_flashbang", "m_eata_flashbangwatchout"];
        level.battlechatter.eventstrings["USS"]["enemy_using_grenade"] = ["m_eata_grenade", "m_eata_grenade_01", "m_eata_grenadegetback"];
        level.battlechatter.eventstrings["USS"]["enemy_using_rpg"] = ["m_eata_rpg", "m_eata_rocket"];
        level.battlechatter.eventstrings["USS"]["enemy_attacking"] = ["m_eata_imtakingfire", "m_eata_contact", "m_eata_takingeffectivefire"];
        level.battlechatter.eventstrings["USS"]["enemy_moving"] = ["m_etca_onesmoving", "m_etca_iseeonemoving"];
        level.battlechatter.eventstrings["USS"]["enemy_moving_up"] = ["m_etca_onesgettingclose", "m_etca_onesmovingup"];
        level.battlechatter.eventstrings["USS"]["enemy_getting_cover"] = ["m_etca_theyretakingcover", "m_etca_enemytakingcover"];
        level.battlechatter.eventstrings["USS"]["enemy_reloading"] = ["m_etca_onesreloading", "m_etca_iseeonereloading"];
        level.battlechatter.eventstrings["USS"]["target_getting_cover"] = ["m_ttca_hesgoingforcover", "m_ttca_hestryingtohide"];
        level.battlechatter.eventstrings["USS"]["target_reloading"] = ["m_ttca_hesreloading", "m_ttca_hestryingtoreload"];
        level.battlechatter.eventstrings["USS"]["target_moving"] = ["m_ttca_hesmoving", "m_ttca_heyhesmoving"];
        level.battlechatter.eventstrings["USS"]["target_moving_up"] = ["m_ttca_hesmovingup", "m_ttca_hesmovingourway"];
        level.battlechatter.eventstrings["USS"]["enemy_soldiers"] = ["m_enmy_iseethem", "m_enmy_iseeenemies", "m_enmy_enemies"];
        level.battlechatter.eventstrings["USS"]["aquired_target"] = ["m_aqen_hesrightthere", "m_aqen_icanseehim", "m_aqen_ifoundhim"];
        level.battlechatter.eventstrings["USS"]["neg_target"] = ["m_aqen_where", "m_aqen_idontseeanyone", "m_aqen_whereishe"];
        level.battlechatter.eventstrings["USS"]["enemy_exposed"] = ["m_exco_onesoutofcover", "m_exco_gotoneintheopen", "m_exco_onesintheopenyouseeh"];
        level.battlechatter.eventstrings["USS"]["target_exposed"] = ["m_exco_hesoutofcover", "m_exco_hesmovingfromcover"];
        level.battlechatter.eventstrings["USS"]["youre_exposed"] = ["m_exco_takecover", "m_exco_gettocover", "m_exco_getbehindsomething"];
        level.battlechatter.eventstrings["USS"]["target_covered"] = ["m_exco_hesincover", "m_exco_hestakingcover"];
        level.battlechatter.eventstrings["USS"]["killfirm_enemy"] = ["m_firm_gotone", "m_firm_enemydown", "m_firm_downedone"];
        level.battlechatter.eventstrings["USS"]["killfirm_target"] = ["m_firm_ishothim", "m_firm_igothim"];
        level.battlechatter.eventstrings["USS"]["casualties"] = ["m_casu_werelosingmen", "m_casu_weretakingheavies"];
        level.battlechatter.eventstrings["USS"]["copy"] = ["m_conf_copy", "m_conf_copythat", "m_conf_roger"];
        level.battlechatter.eventstrings["USS"]["low_ammo"] = ["m_stat_ineedammunition", "m_stat_ineedammo", "m_stat_whohasammo"];
        level.battlechatter.eventstrings["USS"]["wounded"] = ["m_stat_imhit", "m_stat_medic"];
        level.battlechatter.eventstrings["USS"]["wounded_enemy"] = ["m_aens_iwoundedone", "m_aens_ihitone"];
        level.battlechatter.eventstrings["USS"]["wounded_target"] = ["m_atas_heshurt", "m_atas_ihithim"];
        level.battlechatter.eventstrings["USS"]["coverme"] = ["m_tcor_coverme", "m_tcor_ineedcover"];
        level.battlechatter.eventstrings["USS"]["casualty"] = ["m_canm_dude", "m_canm_theykilledoneofours", "m_canm_theykilledhim"];
        level.battlechatter.eventstrings["USS"]["suppressing"] = ["m_aqsp_gotyoucovered", "m_aqsp_imcoveringyou"];
    }
    level.battlechatter.eventstrings["CTM"]["ahead"] = ["c_posn_upahead", "c_posn_infrontofus", "c_posn_aheadofus"];
    level.battlechatter.eventstrings["CTM"]["behind"] = ["c_posn_behindus", "c_posn_onoursix", "c_posn_checkrear"];
    level.battlechatter.eventstrings["CTM"]["high"] = ["c_posn_lookupup", "c_posn_upthere", "c_posn_aboveus"];
    level.battlechatter.eventstrings["CTM"]["left"] = ["c_posn_ontheleft", "c_posn_leftside", "c_posn_lookleft", "c_posn_watchtheleft"];
    level.battlechatter.eventstrings["CTM"]["right"] = ["c_posn_lookontheright", "c_posn_rightside", "c_posn_rightright", "c_posn_watchtheright"];
    level.battlechatter.eventstrings["CTM"]["use_flash"] = ["c_ator_useaflashgrenade", "c_ator_throwaflashgrenade", "c_ator_tossaflashgrenadebli"];
    level.battlechatter.eventstrings["CTM"]["use_grenade"] = ["c_ator_useagrenade", "c_ator_throwagrenade", "c_ator_getagrenadeonthem"];
    level.battlechatter.eventstrings["CTM"]["use_molotov"] = ["c_ator_throwamolotov", "c_ator_useamolotov", "c_ator_yougotamolotovburnem"];
    level.battlechatter.eventstrings["CTM"]["use_rpg"] = ["c_ator_firearocket", "c_ator_hitthemwitharocket", "c_ator_usearocket"];
    level.battlechatter.eventstrings["CTM"]["order_attack"] = ["c_ator_shootthem", "c_ator_attack", "c_ator_fireyourweapon", "c_ator_fire", "c_ator_fuckthemupshoot", "c_ator_killthem", "c_ator_shootthosefuckers"];
    level.battlechatter.eventstrings["CTM"]["attack_orders"] = ["c_ator_chepe", "c_ator_rodrigo", "c_ator_alonso", "c_ator_carlos", "c_ator_paco", "c_ator_chava", "c_ator_juan", "c_ator_rami", "c_ator_miguel", "c_ator_mincho", "c_ator_oscar", "c_ator_hector", "c_ator_too", "c_ator_andrs", "c_ator_arturo", "c_ator_raul", "c_ator_ramon", "c_ator_chente", "c_ator_manny", "c_ator_temo", "c_ator_nando", "c_ator_central"];
    level.battlechatter.eventstrings["CTM"]["using_flash"] = ["c_atac_usingflashgrenade", "c_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["CTM"]["using_grenade"] = ["c_atac_throwinggrenade", "c_atac_grenadeout"];
    level.battlechatter.eventstrings["CTM"]["using_molotov"] = ["c_atac_usingamolotov", "c_atac_throwingmolotov"];
    level.battlechatter.eventstrings["CTM"]["using_rpg"] = ["c_atac_imusingarocket", "c_atac_firingarocket"];
    level.battlechatter.eventstrings["CTM"]["attacking"] = ["c_atac_attacking", "c_atac_engaging", "c_atac_firing"];
    level.battlechatter.eventstrings["CTM"]["using_smoke"] = ["c_atac_throwingsmoke", "c_atac_smokegrenadeout"];
    level.battlechatter.eventstrings["CTM"]["movingup"] = ["c_tcac_immovingup", "c_tcac_movingforward", "c_tcac_movingup", "c_tcac_advancing"];
    level.battlechatter.eventstrings["CTM"]["reloading"] = ["c_tcac_changingmagazine", "c_tcac_imreloading"];
    level.battlechatter.eventstrings["CTM"]["moving"] = ["c_tcac_moving", "c_tcac_immoving", "c_tcac_movingnow"];
    level.battlechatter.eventstrings["CTM"]["getting_cover"] = ["c_tcac_takingcover", "c_tcac_movingtocover", "c_tcac_gettingcover"];
    level.battlechatter.eventstrings["CTM"]["enemy_using_flash"] = ["c_eata_reactionfuckmyeyes", "c_eata_reactionicantsee", "c_eata_flashgrenade"];
    level.battlechatter.eventstrings["CTM"]["enemy_using_grenade"] = ["c_eata_grenade", "c_eata_ohhhshit", "c_eata_grenadegetback"];
    level.battlechatter.eventstrings["CTM"]["enemy_using_molotov"] = ["c_eata_molotov", "c_eata_molotovgetback", "c_eata_molotovwatchout"];
    level.battlechatter.eventstrings["CTM"]["enemy_using_rpg"] = ["c_eata_rpg", "c_eata_rocket", "c_eata_rocketmove"];
    level.battlechatter.eventstrings["CTM"]["enemy_attacking"] = ["c_eata_imtakingfire", "c_eata_contact", "c_eata_thosebitchesareshoot"];
    level.battlechatter.eventstrings["CTM"]["enemy_flanking_left"] = ["c_etca_watchlefttheyreflank", "c_etca_leftwatchleft", "c_etca_theyreflankingleft"];
    level.battlechatter.eventstrings["CTM"]["enemy_flanking_right"] = ["c_etca_heywatchright", "c_etca_theenemyisflankingri", "c_etca_theyreflankingright"];
    level.battlechatter.eventstrings["CTM"]["enemy_moving"] = ["c_etca_onesmoving", "c_etca_iseeonemoving", "c_etca_theresonemoving"];
    level.battlechatter.eventstrings["CTM"]["enemy_moving_up"] = ["c_etca_onesgettingclose", "c_etca_onesmovingup", "c_etca_onesmovingthisway"];
    level.battlechatter.eventstrings["CTM"]["enemy_getting_cover"] = ["c_etca_theyretakingcover", "c_etca_enemytakingcover", "c_etca_onestakingcover"];
    level.battlechatter.eventstrings["CTM"]["enemy_reloading"] = ["c_etca_onesreloading", "c_etca_iseeonereloading", "c_etca_heyonesreloading"];
    level.battlechatter.eventstrings["CTM"]["target_getting_cover"] = ["c_ttca_hesgoingforcover", "c_ttca_hestryingtohide", "c_ttca_hesrunningforcover"];
    level.battlechatter.eventstrings["CTM"]["target_reloading"] = ["c_ttca_hesreloading", "c_ttca_hestryingtoreload", "c_ttca_thatonesreloading"];
    level.battlechatter.eventstrings["CTM"]["target_moving"] = ["c_ttca_hesmoving", "c_ttca_heyhesmoving", "c_ttca_hesmovingrightnow"];
    level.battlechatter.eventstrings["CTM"]["target_moving_up"] = ["c_ttca_hesmovingup", "c_ttca_hesmovingourway", "c_ttca_hesgettingclose"];
    level.battlechatter.eventstrings["CTM"]["target_near_patrol"] = ["c_ttca_hesinthewaternearyou", "c_ttca_hesswimmingtowardsyo", "c_ttca_intercepthim"];
    level.battlechatter.eventstrings["CTM"]["enemy_soldier"] = ["c_enmy_theresone", "c_enmy_iseeone", "c_enmy_enemy"];
    level.battlechatter.eventstrings["CTM"]["enemy_soldiers"] = ["c_enmy_iseethem", "c_enmy_iseeenemies", "c_enmy_enemies"];
    level.battlechatter.eventstrings["CTM"]["aquired_target"] = ["c_aqen_hesrightthere", "c_aqen_icanseehim", "c_aqen_ifoundhim", "c_aqen_herestherat"];
    level.battlechatter.eventstrings["CTM"]["neg_target"] = ["c_aqen_where", "c_aqen_idontseeanyone", "c_aqen_whereishe", "c_aqen_icantseehim", "c_aqen_whereisthisbitch", "c_aqen_whatshislocation"];
    level.battlechatter.eventstrings["CTM"]["enemy_exposed"] = ["c_exco_onesoutofcover", "c_exco_gotoneintheopen", "c_exco_onesintheopenyouseeh"];
    level.battlechatter.eventstrings["CTM"]["target_exposed"] = ["c_exco_hesoutofcover", "c_exco_hesmovingfromcover", "c_exco_hesnotincover"];
    level.battlechatter.eventstrings["CTM"]["youre_exposed"] = ["c_exco_takecover", "c_exco_gettocover", "c_exco_getbehindsomething"];
    level.battlechatter.eventstrings["CTM"]["target_covered"] = ["c_exco_hesincover", "c_exco_hestakingcover", "c_exco_heshidinglikeabitch"];
    level.battlechatter.eventstrings["CTM"]["killfirm_enemy"] = ["c_firm_gotone", "c_firm_ishotoneofthosefucke", "c_firm_killedoneofthem"];
    level.battlechatter.eventstrings["CTM"]["killfirm_target"] = ["c_firm_ishothim", "c_firm_gotthatfucker", "c_firm_killedthatlittlebitc"];
    level.battlechatter.eventstrings["CTM"]["killfirm_truck"] = ["c_firm_wedestroyedtheirtruc", "c_firm_theirtruckisdown", "c_firm_wekilledtheirtruck"];
    level.battlechatter.eventstrings["CTM"]["killfirm_bigrig"] = ["c_firm_itookouttheirbigrig", "c_firm_wedestroyedtheirbigr", "c_firm_theirbigriggotfucked"];
    level.battlechatter.eventstrings["CTM"]["killfirm_helo"] = ["c_firm_shottheirhelicoptero", "c_firm_wetookouttheirhelico", "c_firm_theirhelicopterisdow"];
    level.battlechatter.eventstrings["CTM"]["casualties"] = ["c_casu_werelosingmen", "c_casu_weregettingkilledout"];
    level.battlechatter.eventstrings["CTM"]["copy"] = ["c_conf_igotit", "c_conf_yesyes", "c_conf_understood", "c_conf_iknow", "c_conf_copythat", "c_aqcp_copy", "c_aqcp_copythat"];
    level.battlechatter.eventstrings["CTM"]["praise"] = ["c_pras_yeahmakethemeatshit", "c_pras_yeahkillallthesefuck", "c_pras_thatsitfuckthemup", "c_pras_thatwasagoodshot", "c_pras_yougotthemdude"];
    level.battlechatter.eventstrings["CTM"]["low_ammo"] = ["c_stat_ineedammunition", "c_stat_wherestheammo", "c_stat_whohasammo", "c_stat_ineedamagazine", "c_stat_ineedanothermagazine"];
    level.battlechatter.eventstrings["CTM"]["wounded"] = ["c_stat_imhit", "c_stat_painimhurtbaddude", "c_stat_painimhit"];
    level.battlechatter.eventstrings["CTM"]["ask_wounded"] = ["c_stat_youstillwithus", "c_stat_didyougethit", "c_stat_areyouhit"];
    level.battlechatter.eventstrings["CTM"]["ask_low_ammo"] = ["c_stat_howsyourammunition", "c_stat_doyouneedammunition", "c_stat_areyougoodonammuniti"];
    level.battlechatter.eventstrings["CTM"]["ask_status"] = ["c_stat_areyouokay", "c_stat_reportwhatsyourstatu", "c_stat_heydudeyougood"];
    level.battlechatter.eventstrings["CTM"]["reply_wounded"] = ["c_stat_painthatfuckinbitchs", "c_stat_painimshot", "c_stat_fuckigothit"];
    level.battlechatter.eventstrings["CTM"]["reply_low_ammo"] = ["c_stat_imlowonammo", "c_stat_ineedammo", "c_stat_heygivemesomeammo"];
    level.battlechatter.eventstrings["CTM"]["reply_okay"] = ["c_stat_imfuckininvincibledu", "c_stat_imokay", "c_stat_imgoodimgood"];
    level.battlechatter.eventstrings["CTM"]["wounded_enemy"] = ["c_aens_oneshurtbad", "c_aens_fuckeduponeofthem", "c_aens_ihitoneofthem"];
    level.battlechatter.eventstrings["CTM"]["ask_target_loc"] = ["c_tast_whatstheirlocation", "c_tast_doyouseethem", "c_tast_wherearethey"];
    level.battlechatter.eventstrings["CTM"]["ask_target_wounded"] = ["c_tast_tellmeyoukilledthatb", "c_tast_didyoukillthatpieceo", "c_tast_didyougethim"];
    level.battlechatter.eventstrings["CTM"]["target_wounded"] = ["c_tast_hesbleeding", "c_tast_hesfuckedupdude", "c_tast_hesmissingapiece"];
    level.battlechatter.eventstrings["CTM"]["target_unhurt"] = ["c_tast_hegotawaytherat", "c_tast_fuckididntgethim", "c_tast_arhhimissedhim"];
    level.battlechatter.eventstrings["CTM"]["wounded_target"] = ["c_atas_heshurt", "c_atas_ihithim", "c_atas_ifuckedhimup"];
    level.battlechatter.eventstrings["CTM"]["enemy_lmg"] = ["c_enws_machinegunner", "c_enws_theyhaveamachinegunn", "c_enws_onehasamachinegun"];
    level.battlechatter.eventstrings["CTM"]["enemy_shotgun"] = ["c_enws_isawonewithashotgun", "c_enws_onesgotashotgun", "c_enws_carefulonesusingasho"];
    level.battlechatter.eventstrings["CTM"]["enemy_sniper"] = ["c_enws_theyhaveasniper", "c_enws_snipergetdown", "c_enws_theresasniperonus"];
    level.battlechatter.eventstrings["CTM"]["target_lmg"] = ["c_taws_thatfuckersusingamac", "c_taws_hesgotamachinegun", "c_taws_watchithesusingamach"];
    level.battlechatter.eventstrings["CTM"]["target_shotgun"] = ["c_taws_thatrathasashotgun", "c_taws_shotgun"];
    level.battlechatter.eventstrings["CTM"]["target_sniper"] = ["c_taws_sniper", "c_taws_hessnipingatus"];
    level.battlechatter.eventstrings["CTM"]["move"] = ["c_tcor_gogo", "c_tcor_move", "c_tcor_getmoving", "c_tcor_moveyourass", "c_tcor_movefast", "c_tcor_gonow", "c_tcor_moveasshole", "c_tcor_getgoing"];
    level.battlechatter.eventstrings["CTM"]["moveup"] = ["c_tcor_moveup", "c_tcor_movein", "c_tcor_goup", "c_tcor_getupthere", "c_tcor_goforwardmove"];
    level.battlechatter.eventstrings["CTM"]["coverme"] = ["c_tcor_coverme", "c_tcor_givemecoverfire", "c_tcor_ineedcover"];
    level.battlechatter.eventstrings["CTM"]["hostile_burst"] = ["c_hsbr_gofuckyourmothers", "c_hsbr_werewiththenamelessy", "c_hsbr_thisisthesoulscartel", "c_hsbr_longlivethesoulscart"];
    level.battlechatter.eventstrings["CTM"]["casualty"] = ["m_canm_theykilledhim", "m_canm_dude", "m_canm_theykilledoneofours", "m_canm_fuckwelostaman", "m_canm_welostasoul"];
    level.battlechatter.eventstrings["CTM"]["suppressing"] = ["c_aqsp_gotyoucovered", "c_aqsp_imcoveringyou", "c_aqsp_igotyougo", "c_aqsp_fallbackillcoveryou"];
    level.battlechatter.eventstrings["CTM"]["reply_hear_you"] = ["s_idrp_yes", "s_idrp_goahead", "s_idrp_copyihearyou", "s_idrp_ihearyougoahead"];
    level.battlechatter.eventstrings["CTM"]["muttered_confusion"] = ["s_idin_whatthefuck", "s_idin_whatthehell", "s_idin_whatthefuckisthat", "s_idin_whatthehellisthat"];
    level.battlechatter.eventstrings["CTM"]["investigating"] = ["s_idin_goingtocheckitout", "s_idin_checkingitout", "s_idin_gonnagocheckit"];
    level.battlechatter.eventstrings["CTM"]["inv_arrive"] = ["s_idin_hmm", "s_idin_hmphokay", "s_idin_huhwhatwasthat", "s_idin_hrm", "s_idin_huhthehell"];
    level.battlechatter.eventstrings["CTM"]["react_found_corpse"] = ["s_alrc_welostaman", "s_alrc_foundabodyoneofours", "s_alrc_oneofourpatrolsgothi", "s_alrc_welostaman_01"];
    level.battlechatter.eventstrings["CTM"]["hunt_affirm"] = ["s_hnrs_yeahyeah"];
    level.battlechatter.eventstrings["CTM"]["hunt_copy"] = ["s_hnrs_copiedman", "s_hnrs_gotit", "s_hnrs_copy"];
    level.battlechatter.eventstrings["CTM"]["hunt_neg"] = ["s_hnrs_negative"];
    level.battlechatter.eventstrings["CTM"]["react_whizby"] = ["s_unrc_someoneshotatme", "s_unrc_ijustgotshotat", "s_unrc_imgettingfuckinshota", "s_unrc_someonetriedtoshootm", "s_unrc_itookfire"];
    level.battlechatter.eventstrings["CTM"]["react_loc"] = ["s_unrc_itcamefromoverthere", "s_unrc_itcamefromthatdirect", "s_unrc_itwasfromthatway", "s_unrc_itcamefromthatway", "s_unrc_itwasfromthatdirecti"];
    level.battlechatter.eventstrings["CTM"]["react_unaware"] = ["s_unrc_imtakingfire", "s_unrc_contact", "s_unrc_theressomeonehere"];
    level.battlechatter.eventstrings["CTM"]["over_there"] = ["s_hnfn_overthere", "s_hnfn_theyreoverthere", "s_hnfn_theyreoverthatway"];
    level.battlechatter.eventstrings["CTM"]["surprise"] = ["s_hurc_ohgod", "s_hurc_ohfuck", "s_hurc_ohshit"];
    level.battlechatter.eventstrings["CTM"]["report_reply_idle"] = ["s_idrr_nothinghere", "s_idrr_secure", "s_idrr_weregoodman", "s_idrr_allclear", "s_idrr_goodhere", "s_idrr_nothingtoreport", "s_idrr_allquietoverhere"];
    level.battlechatter.eventstrings["CTM"]["react_first"] = ["s_idrc_huh", "s_idrc_wha", "s_idrc_hm", "s_idrc_eh", "s_idrc_hrm", "s_idrc_hmph"];
    level.battlechatter.eventstrings["CTM"]["react_second"] = ["s_idrc_whatthefuckwasthat", "s_idrc_whatthehellwasthat", "s_idrc_whosthere"];
    level.battlechatter.eventstrings["CTM"]["react_multi"] = ["s_idrm_whatthefuckisgoingon", "s_idrm_okaywhatthefuck", "s_idrm_someonesfuckinwithme"];
    level.battlechatter.eventstrings["CTM"]["react_interrupt"] = ["s_idli_heywhatswrong", "s_idli_whatwasthat", "s_idli_areyouokayman"];
    level.battlechatter.eventstrings["CTM"]["react_noreply"] = ["s_idli_areyouthere", "s_idli_wheredyougo", "s_idli_canyouhearme"];
    level.battlechatter.eventstrings["CTM"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["CTM"]["idle_good_hunting"] = ["s_idls_stayfocusedoverthere", "s_idls_staysharpman", "s_idls_keepyoureyesopenman"];
    level.battlechatter.eventstrings["CTM"]["resp_sound_first"] = ["s_idir_nothingdidntseeanyon", "s_idir_didntseeanyonewerego", "s_idir_thoughtiheardsomeone", "s_idir_soundedlikesomeonewa"];
    level.battlechatter.eventstrings["CTM"]["order_check_together"] = ["s_idit_letsgocheckitout", "s_idit_thiswayfollowme", "s_idit_overherecoverme"];
    level.battlechatter.eventstrings["CTM"]["covering_investigate"] = ["s_idit_rightbehindyou", "s_idit_imwithyou", "s_idit_ivegotyourback"];
    level.battlechatter.eventstrings["CTM"]["team_return_idle"] = ["s_idid_letsheadback", "s_idid_fuckitletsgetback", "s_idid_alrightweshouldgetba"];
    level.battlechatter.eventstrings["CTM"]["have_something"] = ["s_alre_mighthavesomething_01", "s_alre_couldhavesomethinghe_01", "s_alre_somethingsoverhere_01"];
    level.battlechatter.eventstrings["CTM"]["heard_something"] = ["s_alre_heardsomething_01", "s_alre_heardanoise_01", "s_alre_heardanoiseoverhere_01"];
    level.battlechatter.eventstrings["CTM"]["saw_something"] = ["s_alre_sawsomethingoverhere_01", "s_alre_mighthaveeyesonsomeo_01", "s_alre_thinksomeonescloseby_01"];
    level.battlechatter.eventstrings["CTM"]["see_something"] = ["s_alre_seeingsomethingoverh_01", "s_alre_gotavisualonsomethin_01", "s_alre_goteyesonsomething_01"];
    level.battlechatter.eventstrings["CTM"]["object_whizby"] = ["s_alre_whothefuckthrewthat", "s_alre_whothrewthat", "s_alre_youmissed"];
    level.battlechatter.eventstrings["CTM"]["jailer_body_react"] = ["s_idrm_okaywhatthefuck", "s_idrm_whatthefuckisgoingon", "s_idrm_issomeonefuckingwith"];
    level.battlechatter.eventstrings["CTM"]["jailer_head_react"] = ["s_unrc_contact", "s_unrc_imunderattack", "s_unrc_itookfire"];
    level.battlechatter.eventstrings["CTM"]["bottle_whizby"] = ["s_alre_whothefuckthrewthat", "s_alre_whothrewthat", "s_alre_youmissed"];
    level.battlechatter.eventstrings["CTM"]["alert_investigating"] = ["s_alin_goingtocheckitout", "s_alin_checkingitout", "s_alin_goingtocheckthearea"];
    level.battlechatter.eventstrings["CTM"]["alert_confirming"] = ["s_alcf_roger", "s_alcf_copy", "s_alcf_copythat"];
    level.battlechatter.eventstrings["CTM"]["inv_ask"] = ["s_alia_youseeanything", "s_alia_yougotsomething", "s_alia_whatvewegot", "s_alia_youseesomething"];
    level.battlechatter.eventstrings["CTM"]["report_reply_search"] = ["s_alir_nothingyet", "s_alir_nothingsofar", "s_alir_itsbeenquietsofar", "s_alir_weregoodfornow", "s_alir_allclearrightnow", "s_alir_sofarsogood", "s_alir_notseeinganythingyet", "s_alir_haventseenanything", "s_alir_nothingfornow", "s_alir_itsclearfornow", "s_alir_weregoodsofar"];
    level.battlechatter.eventstrings["CTM"]["ask_enemy_loc"] = ["s_unwl_wheredthatcomefrom", "s_unwl_whereditcomefrom", "s_unwl_wherethefuckarethey"];
    level.battlechatter.eventstrings["CTM"]["enemy_loc_resp"] = ["s_unrs_idontknow", "s_unrs_ididntseethem", "s_unrs_idontfuckingknow", "s_unrs_ididntsee"];
    level.battlechatter.eventstrings["CTM"]["ask_enemy_count"] = ["s_unwc_howmanyarethere", "s_unwc_howmanyofem", "s_unwc_howmany"];
    level.battlechatter.eventstrings["CTM"]["react_first_combat"] = ["s_awrr_enemy_01", "s_awrr_theenemyishere_01", "s_awrr_enemyrighthere_01", "s_awrr_theresanenemy_01", "s_awrr_enemyenemy_01", "s_awrr_someoneshere_01", "s_awrr_enemyhere_01"];
    level.battlechatter.eventstrings["CTM"]["at_my_location"] = ["s_awrr_hererighthere_01", "s_awrr_righthereguys", "s_awrr_heyoverhere_01", "s_awrr_righthererighthere_01", "s_awrr_heytheyrerighthere_01", "s_awrr_theyrehereiseethem_01", "s_awrr_heytheyreoverhere_01", "s_awrr_heytheyrehere_01"];
    level.battlechatter.eventstrings["CTM"]["found_you"] = ["s_awrr_motherfucker", "s_awrr_pieceofshit", "s_awrr_youbitch", "s_awrr_fuckyou", "s_awrr_gotyou"];
    level.battlechatter.eventstrings["CTM"]["found_target"] = ["s_awrr_heytheyrerightthere_01", "s_awrr_heyiseethem_01", "s_awrr_ifoundthem_01", "s_awrr_igotthem_01", "s_awrr_theretheyare_01", "s_awrr_theyrerightoverthere_01"];
    level.battlechatter.eventstrings["CTM"]["found_target_loc"] = ["s_awrr_attheoffrenda", "s_awrr_theoffrenda", "s_awrr_offrenda", "s_awrr_firstfloor", "s_awrr_onthefirstfloor", "s_awrr_thefirstfloor", "s_awrr_secondfloor", "s_awrr_onthesecondfloor", "s_awrr_thesecondfloor", "s_awrr_ontheroof", "s_awrr_theroof", "s_awrr_upontheroof", "s_awrr_thegarage", "s_awrr_atthegarage", "s_awrr_inthegarage", "s_awrr_theelevator", "s_awrr_attheelevator", "s_awrr_neartheelevator"];
    level.battlechatter.eventstrings["CTM"]["order_check_last"] = ["s_advo_moveonemgo", "s_advo_theyrerighttherepush", "s_advo_moveuponemnownow"];
    level.battlechatter.eventstrings["CTM"]["lost_target"] = ["s_lkpl_frustratedgrunttheyr", "s_lkpl_frustratedgrunttheyr_01", "s_lkpl_frustratedgruntwelos", "s_lkpl_frustratedgruntfuckt"];
    level.battlechatter.eventstrings["CTM"]["ask_target_location"] = ["s_lklr_wherearethey", "s_lklr_doyouseethem", "s_lklr_youseewheretheywent", "s_lklr_wheredtheygo", "s_lklr_wherethefuckarethey", "s_lklr_whereisthislittlebit"];
    level.battlechatter.eventstrings["CTM"]["target_still_close"] = ["s_lkpc_theywerehere", "s_lkpc_theywererighthere", "s_lkpc_theycantbefar", "s_lkpc_theyreclose", "s_lkpc_theyrehiding", "s_lkpc_theyvegottabehere", "s_lkpc_theydidntjustdisappe", "s_lkpc_theyreheresomewhere"];
    level.battlechatter.eventstrings["CTM"]["order_clear_offrenda"] = ["s_cmho_clearthealtarroom", "s_cmho_securethealtarroom", "s_cmho_sweepthealtarroom"];
    level.battlechatter.eventstrings["CTM"]["order_clear_1stfloor"] = ["s_cmho_clearthefirstfloor", "s_cmho_securethefirstfloor", "s_cmho_sweepthefirstfloor"];
    level.battlechatter.eventstrings["CTM"]["order_clear_2ndfloor"] = ["s_cmho_clearthesecondfloor", "s_cmho_securethesecondfloor", "s_cmho_sweepthesecondfloor"];
    level.battlechatter.eventstrings["CTM"]["order_clear_roof"] = ["s_cmho_cleartheroof", "s_cmho_securetheroof", "s_cmho_sweeptheroof"];
    level.battlechatter.eventstrings["CTM"]["order_clear_garage"] = ["s_cmho_clearthegarage", "s_cmho_securethegarage", "s_cmho_sweepthegarage"];
    level.battlechatter.eventstrings["CTM"]["order_clear_elevator"] = ["s_cmho_cleartheelevator", "s_cmho_securetheelevator", "s_cmho_sweeptheelevator"];
    level.battlechatter.eventstrings["CTM"]["searching_here"] = ["s_cmhc_thisareasgood", "s_cmhc_thisareasclear", "s_cmhc_myareaisclear"];
    level.battlechatter.eventstrings["CTM"]["cmb_hunt_confirmation"] = ["s_cmhr_yesgotit", "s_cmhr_copythat", "s_cmhr_okay", "s_cmhr_gotit", "s_cmhr_no"];
    level.battlechatter.eventstrings["CTM"]["good_hunting"] = ["s_hnts_watchyourbackman", "s_hnts_stayalertman", "s_hnts_onyourtoesman"];
    level.battlechatter.eventstrings["CTM"]["moving_there"] = ["s_hntm_movingnow", "s_hntm_movingtherenow", "s_hntm_moving", "s_hntm_ontheway", "s_hntm_movingthatway"];
    level.battlechatter.eventstrings["CTM"]["moving_following"] = ["s_hntm_imwithyouman", "s_hntm_ihaveyourback", "s_hntm_illguardyourback"];
    level.battlechatter.eventstrings["CTM"]["order_follow_me"] = ["s_hntm_letsmovestaytogether", "s_hntm_followmeletsgo", "s_hntm_yourewithmeletsmove"];
    level.battlechatter.eventstrings["CTM"]["ask_found_anything"] = ["s_aqhr_gotanything", "s_aqhr_yougotsomething", "s_aqhr_findanything", "s_aqhr_youseethem", "s_aqhr_didyoufindsomething", "s_aqhr_whatdoyougot"];
    level.battlechatter.eventstrings["CTM"]["reply_found_nothing"] = ["s_aqhr_nothingyet", "s_aqhr_nothingsofar", "s_aqhr_nothinghereman"];
    level.battlechatter.eventstrings["CTM"]["report_searching"] = ["s_aqhr_stillsweepingthisare", "s_aqhr_stillsearching", "s_aqhr_stilllookingforthem"];
    level.battlechatter.eventstrings["CTM"]["report_nothing"] = ["s_aqhr_theresnothinghere", "s_aqhr_nosignofthemyet", "s_aqhr_nooneshereman"];
    level.battlechatter.eventstrings["CTM"]["report_investigating"] = ["s_aqhr_mighthavesomethingch", "s_aqhr_heardsomethingsweepi", "s_aqhr_theycouldbeclosesear"];
    level.battlechatter.eventstrings["CTM"]["area_clear"] = ["s_aqhr_thisareaisclear", "s_aqhr_clearhere", "s_aqhr_areaclear"];
    level.battlechatter.eventstrings["CTM"]["area_clear_loc"] = ["s_aqhr_altarroomisclear", "s_aqhr_firstfloorsecure", "s_aqhr_weresecureonthesecon", "s_aqhr_roofisclear", "s_aqhr_garageissecure", "s_aqhr_elevatorssecure"];
    level.battlechatter.eventstrings["CTM"]["order_dir"] = ["s_aqhs_checkthatway", "s_aqhs_heysearchoverthere", "s_aqhs_checkoverthere", "s_aqhs_searchthatway"];
    level.battlechatter.eventstrings["CTM"]["order_dir_resp"] = ["s_aqhs_illsearchoverhere", "s_aqhs_illtakethisway", "s_aqhs_illtakeoverhere", "s_aqhs_illsearchthisway"];
    level.battlechatter.eventstrings["CTM"]["hunt_search_object"] = ["s_aqhs_itsclear", "s_aqhs_clear", "s_aqhs_nothinghere", "s_aqhs_goodhere"];
    level.battlechatter.eventstrings["CTM"]["hunt"] = ["s_aqhb_wherethefuckareyou", "s_aqhb_wherethefuckishe", "s_aqhb_whereisthispieceofsh", "s_aqhb_comeonwhereareyouhid", "s_aqhb_wherethefuckdidyougo", "s_aqhb_pieceofshitshowyours", "s_aqhb_motherfuckerwhereare"];
    level.battlechatter.eventstrings["CTM"]["hunt_inv_order"] = ["s_ahii_checkit", "s_ahii_checkitout", "s_ahii_gocheckit", "s_ahii_searchit"];
    level.battlechatter.eventstrings["CTM"]["hunt_inv_event"] = ["s_ahir_ithinktheyreclose", "s_ahir_imighthavethem", "s_ahir_ijustheardthem", "s_ahir_imighthavefoundthem"];
    level.battlechatter.eventstrings["CTM"]["hunt_inv_loc"] = ["s_ahir_atthealtarroom", "s_ahir_nearthealtarroom", "s_ahir_bythealtarroom", "s_ahir_firstfloor", "s_ahir_onthefirstfloor", "s_ahir_thefirstfloor", "s_ahir_secondfloor", "s_ahir_onthesecondfloor", "s_ahir_thesecondfloor", "s_ahir_ontheroof", "s_ahir_theroof", "s_ahir_upontheroof", "s_ahir_thegarage", "s_ahir_atthegarage", "s_ahir_inthegarage", "s_ahir_theelevator", "s_ahir_attheelevator", "s_ahir_neartheelevator"];
    level.battlechatter.eventstrings["CTM"]["hunt_reactions"] = ["s_ahnr_surprisedintensereac", "s_ahnr_surprisedintensereac_01", "s_ahnr_surprisedintensereac_02"];
    level.battlechatter.eventstrings["CTM"]["cmb_reactions"] = ["s_aqcr_surprisedintensereac", "s_aqcr_surprisedintensereac_01", "s_aqcr_surprisedintensereac_02"];
    level.battlechatter.eventstrings["CTM"]["whizby_resp"] = ["s_aqal_itcamefromoverthere", "s_aqal_itcamefromthatway", "s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["CTM"]["hunt_cornercheck"] = ["s_aqho_checkyourcorners", "s_aqho_checkthecorners", "s_aqho_searcheverycornerfin"];
    level.battlechatter.eventstrings["CTM"]["hunt_order_hold"] = ["s_aqho_holdup", "s_aqho_wait", "s_aqho_hold"];
    level.battlechatter.eventstrings["CTM"]["alert_cornercheck"] = ["s_aqao_besuretocheckthecorn", "s_aqao_checkthecornersjustt", "s_aqao_remembertochecktheco"];
    level.battlechatter.eventstrings["CTM"]["alert_search_orders"] = ["s_aqao_checkthatway", "s_aqao_gothatway", "s_aqao_checkoverthere", "s_aqao_searchoverthere", "s_aqao_searchthatway", "s_aqao_lookoverthere"];
    level.battlechatter.eventstrings["CTM"]["hunt_report_alert"] = ["s_aqlo_spreadoutfindthem_01", "s_aqlo_searchtheareafindthe_01", "s_aqlo_spreadoutsearchthear_01"];
    level.battlechatter.eventstrings["CTM_L"]["reply_hear_you"] = ["s_idrp_copymanstarttalking", "s_idrp_goahead", "s_idrp_thisiscentral", "s_idrp_whatisit", "s_idrp_yesihearyou", "s_idrp_ihearyougoahead"];
    level.battlechatter.eventstrings["CTM_L"]["react_interrupt"] = ["s_idli_whatswrong", "s_idli_whatwasthat", "s_idli_whathappened", "s_idli_ididnthearyoumansaya", "s_idli_issomethingwrong", "s_idli_areyouokayman"];
    level.battlechatter.eventstrings["CTM_L"]["react_noreply"] = ["s_idli_areyouthere", "s_idli_didiloseyou", "s_idli_canyouhearmedude"];
    level.battlechatter.eventstrings["CTM_L"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["CTM_L"]["signoff"] = ["s_idls_outhere", "s_idls_centralout", "s_idls_staysafemanout", "s_idls_out"];
    level.battlechatter.eventstrings["CTM_L"]["inv_patrol"] = ["s_alip_resumeyourpatrolkeep", "s_alip_getbacktoyourpatrolb", "s_alip_returntoyourpatrolbu"];
    level.battlechatter.eventstrings["CTM_L"]["report_search"] = ["s_alip_whatsyourstatus", "s_aias_reportin", "s_aias_haveyoufoundanything", "s_aias_givemeanupdate", "s_aias_whathaveyougot"];
    level.battlechatter.eventstrings["CTM_L"]["wait_target_surface"] = ["s_lkwr_whentheycomesupforai", "s_lkwr_theypoptheirheadouty", "s_lkwr_whentheycomeupyoukil", "s_lkwr_theygoforairyoutaket", "s_lkwr_whentheypopuptheyred", "s_lkwr_theyllcomeupforairwh"];
    level.battlechatter.eventstrings["CTM_L"]["order_find_target"] = ["s_cmho_findthem", "s_cmho_searcheverywherefind", "s_cmho_huntthemdown"];
    level.battlechatter.eventstrings["CTM_L"]["order_find_perimeter"] = ["s_cmho_cleartheperimeter", "s_cmho_securetheperimeter", "s_cmho_gettheperimeterclear"];
    level.battlechatter.eventstrings["CTM_L"]["order_search_water"] = ["s_cmho_searchthewater", "s_cmho_checkthewater", "s_cmho_theywereinthewater", "s_cmho_keepyoureyesonthewat", "s_cmho_watchthewater"];
    level.battlechatter.eventstrings["CTM_L"]["good_hunting"] = ["s_hnts_watchyourbackoutther", "s_hnts_findthismotherfucker", "s_hnts_becarefuloutthere", "s_aisg_copyonyourtoesbro"];
    level.battlechatter.eventstrings["CTM_L"]["ask_found_anything"] = ["s_aqhr_haveyoufoundanything", "s_aqhr_whathaveyoufound", "s_aqhr_whathaveyougot", "s_aqhr_reportin", "s_aqhr_givemesomething", "s_aqhr_tellmeyouhavesomethi"];
    level.battlechatter.eventstrings["CTM_L"]["hunt_report_alert"] = ["s_aqhr_anenemyisintheareahu", "s_aqhr_wehaveanenemyinsidet", "s_aqhr_guystheresanenemyint", "s_aqlo_spreadoutfindthem_01", "s_aqlo_searchtheareafindthe_01", "s_aqlo_spreadoutsearchthear_01"];
    level.battlechatter.eventstrings["CTM_L"]["order_continue_search"] = ["s_aqho_continuesweeping", "s_aqho_keepsearchingthearea", "s_aqho_searchtheareauntilyo"];
    level.battlechatter.eventstrings["CTM_L"]["order_stay_alert"] = ["s_aqho_stayalert", "s_aqho_keepyoureyesopen", "s_aqho_stayfocused"];
    level.battlechatter.eventstrings["CTM_L"]["order_stay_aware"] = ["s_aqho_guardyourselfman", "s_aqho_donotunderestimateth", "s_aqho_keepyourguardup"];
    level.battlechatter.eventstrings["CTM_L"]["ask_how_copy"] = ["s_idcm_doyouhearmedude", "s_idcm_comein", "s_idcm_thisiscentral"];
    level.battlechatter.eventstrings["CTM_L"]["inv_no_response"] = ["s_iinr_hesnotrespondingonra", "s_iinr_icantreachhim", "s_iinr_hesnotansweringhisra", "s_iinr_hesnotresponding"];
    level.battlechatter.eventstrings["CTM_L"]["order_get_visual"] = ["s_iinr_canyougocheckitout", "s_iinr_checkitoutmakesureno", "s_iinr_seeifyoucanfindhimok", "s_iinr_ineedyoucheckitout"];
    level.battlechatter.eventstrings["CTM_L"]["inv_patrol_noresp"] = ["s_iinr_patrolisntresponding", "s_iinr_patroldidntcheckin", "s_iinr_patrolisntansweringo", "s_iinr_icantreachpatrol"];
    level.battlechatter.eventstrings["CTM_L"]["report_alert"] = ["s_airp_guyswemayhavecompany", "s_airp_allteamswemayhaveasi", "s_airp_everyonetightenupwem", "s_airp_guyskeepyoureyesopen"];
    level.battlechatter.eventstrings["CTM_L"]["warn_reply"] = ["s_wrpl_iftheyshowupagainsho", "s_wrpl_ifyouseethemagainope", "s_wrpl_iftheyreturnjustkill"];
    level.battlechatter.eventstrings["CTM_L"]["report_target_location"] = ["s_chrp_givemeanupdatedoesan", "s_chrp_talktomeguyswhatsthe", "s_chrp_starttalkingguysiwan", "s_chrp_reportinguyswhereare"];
    level.battlechatter.eventstrings["CTM_L"]["report_idle"] = ["s_irpr_status", "s_irpr_report", "s_irpr_anythingtoreport", "s_irpr_gotanything", "s_irpr_checkin"];
    level.battlechatter.eventstrings["CTM_L"]["ally_missing_multi"] = ["s_alms_multipleteamsarentre", "s_alms_anothergroupisntresp", "s_alms_wevelostcontactwitha", "s_alms_anotherteamfailedtor"];
    level.battlechatter.eventstrings["CTM_L"]["order_search_start"] = ["s_aior_searchthearea_01", "s_aior_searcharound_01", "s_aior_sweeptheperimeter_01"];
    level.battlechatter.eventstrings["CTM_L"]["order_report_back"] = ["s_aior_reportwhatyoufind", "s_aior_radioifyoufindanythi", "s_aior_reportbackifyoufinds"];
    level.battlechatter.eventstrings["CTM_L"]["hunt_patrol_noresp"] = ["s_hpnr_patrolisntresponding", "s_hpnr_patroldidntcheckin", "s_hpnr_patrolisntansweringo", "s_hpnr_icantreachpatrol"];
    level.battlechatter.eventstrings["CFS"]["left"] = ["c_posn_leftside", "c_posn_left", "c_posn_checkleft", "c_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["CFS"]["right"] = ["c_posn_rightside", "c_posn_theyreflankingright", "c_posn_right", "c_posn_checkright"];
    level.battlechatter.eventstrings["CFS"]["ahead"] = ["c_posn_straightahead", "c_posn_rightinfrontofus", "c_posn_aheadofus", "c_posn_front", "c_posn_deadahead"];
    level.battlechatter.eventstrings["CFS"]["behind"] = ["c_posn_behindus", "c_posn_onoursix", "c_posn_checkrear", "c_posn_rear"];
    level.battlechatter.eventstrings["CFS"]["high"] = ["c_posn_uptop", "c_posn_checkhigh", "c_posn_coverup"];
    level.battlechatter.eventstrings["CFS"]["using_rpg"] = ["c_atac_rocket", "c_atac_rocket_01"];
    level.battlechatter.eventstrings["CFS"]["attacking"] = ["c_atac_goinghot", "c_atac_engaging", "c_atac_openinup"];
    level.battlechatter.eventstrings["CFS"]["using_smoke"] = ["c_atac_throwingsmoke", "c_atac_smokeout"];
    level.battlechatter.eventstrings["CFS"]["using_flash"] = ["c_atac_flashbangout", "c_atac_throwingflashbang"];
    level.battlechatter.eventstrings["CFS"]["using_grenade"] = ["c_atac_fragout", "c_atac_throwingafrag"];
    level.battlechatter.eventstrings["CFS"]["using_molotov"] = ["c_atac_throwingmolotov", "c_atac_molotovout"];
    level.battlechatter.eventstrings["CFS"]["use_flash"] = ["c_ator_useaflashbang", "c_ator_throwaflashbang", "c_ator_tossaflashbang"];
    level.battlechatter.eventstrings["CFS"]["use_grenade"] = ["c_ator_useagrenade", "c_ator_throwafrag", "c_ator_tossafrag"];
    level.battlechatter.eventstrings["CFS"]["use_molotov"] = ["c_ator_throwamolotov", "c_ator_useamolotov", "c_ator_tossamolotov"];
    level.battlechatter.eventstrings["CFS"]["use_rpg"] = ["c_ator_hitemwitharocket", "c_ator_usearocket", "c_ator_rocket"];
    level.battlechatter.eventstrings["CFS"]["order_attack"] = ["c_ator_engage", "c_ator_giveemsome", "c_ator_dumpem", "c_ator_gohot", "c_ator_youreclearedhot", "c_ator_fuckinshootem", "c_ator_startsmokinem"];
    level.battlechatter.eventstrings["CFS"]["movingup"] = ["c_tcac_impushingup", "c_tcac_pushingforward", "c_tcac_movingup", "c_tcac_pushinup"];
    level.battlechatter.eventstrings["CFS"]["getting_cover"] = ["c_tcac_covercover", "c_tcac_takingcover", "c_tcac_movingtocover"];
    level.battlechatter.eventstrings["CFS"]["reloading"] = ["c_tcac_reloading", "c_tcac_changingmags"];
    level.battlechatter.eventstrings["CFS"]["enemy_using_flash"] = ["c_eata_flashincoming", "c_eata_flashgrenade", "c_eata_flash", "c_eata_flashgrenade_01"];
    level.battlechatter.eventstrings["CFS"]["enemy_using_grenade"] = ["c_eata_grenade", "c_eata_grenadewatchout", "c_eata_grenadeincoming"];
    level.battlechatter.eventstrings["CFS"]["enemy_using_molotov"] = ["c_eata_molotov", "c_eata_molotovincoming", "c_eata_molotov_01"];
    level.battlechatter.eventstrings["CFS"]["enemy_using_rpg"] = ["c_eata_rpg", "c_eata_rpgincoming", "c_eata_rpggetdown"];
    level.battlechatter.eventstrings["CFS"]["enemy_attacking"] = ["c_eata_takingfire", "c_eata_contact", "c_eata_shadowsincontact"];
    level.battlechatter.eventstrings["CFS"]["enemy_moving_up"] = ["c_etca_onespushing", "c_etca_gotonemovingup", "c_etca_onesmovingup"];
    level.battlechatter.eventstrings["CFS"]["enemy_getting_cover"] = ["c_etca_novisualontarget", "c_etca_gotonetakingcover", "c_etca_onesmovingtocover", "c_etca_novisualontarget_01"];
    level.battlechatter.eventstrings["CFS"]["enemy_reloading"] = ["c_etca_onesreloading", "c_etca_onesreloading_01", "c_etca_oneschangingmags"];
    level.battlechatter.eventstrings["CFS"]["enemy_flanking_left"] = ["c_etca_onesmovingleft", "c_etca_leftflank", "c_etca_guardleft"];
    level.battlechatter.eventstrings["CFS"]["enemy_flanking_right"] = ["c_etca_guardright", "c_etca_rightflank", "c_etca_onesmovingright"];
    level.battlechatter.eventstrings["CFS"]["enemy_moving"] = ["c_etca_onesmovin", "c_etca_thatonesmoving", "c_etca_gotonemoving"];
    level.battlechatter.eventstrings["CFS"]["target_getting_cover"] = ["c_ttca_theyremovingtocover", "c_ttca_theyregoingforcover", "c_ttca_theyretakingcover"];
    level.battlechatter.eventstrings["CFS"]["target_reloading"] = ["c_ttca_theyrereloading", "c_ttca_theyrereloading_01", "c_ttca_thebastardsreloading"];
    level.battlechatter.eventstrings["CFS"]["target_moving"] = ["c_ttca_theyremoving", "c_ttca_hesmoving", "c_ttca_hesrunning"];
    level.battlechatter.eventstrings["CFS"]["target_moving_up"] = ["c_ttca_theyremovingup", "c_ttca_hescominguponyou", "c_ttca_hesmovingup"];
    level.battlechatter.eventstrings["CFS"]["target_near_patrol"] = ["c_ttca_theyreswimmingnearth", "c_ttca_theyreswimmingyourwa", "c_ttca_interceptthem"];
    level.battlechatter.eventstrings["CFS"]["enemy_soldier"] = ["c_enmy_visualonatarget", "c_enmy_targetspotted", "c_enmy_gotatarget"];
    level.battlechatter.eventstrings["CFS"]["enemy_soldiers"] = ["c_enmy_targets", "c_enmy_xrays", "c_enmy_hostiles"];
    level.battlechatter.eventstrings["CFS"]["neg_target"] = ["c_aqen_idontseeem", "c_aqen_novisual", "c_aqen_cantseehim", "c_aqen_wherethefuckishe"];
    level.battlechatter.eventstrings["CFS"]["aquired_target"] = ["c_aqen_gotavisual", "c_aqen_targetacquired", "c_aqen_iseeem", "c_aqen_theyrerightthere"];
    level.battlechatter.eventstrings["CFS"]["enemy_exposed"] = ["c_exco_onesintheopen", "c_exco_onesintheopen_01", "c_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["CFS"]["target_exposed"] = ["c_exco_theyreintheopen", "c_exco_thatonesintheopen", "c_exco_theyreintheopen_01"];
    level.battlechatter.eventstrings["CFS"]["youre_exposed"] = ["c_exco_findcover"];
    level.battlechatter.eventstrings["CFS"]["target_covered"] = ["c_exco_theyrebehindcover", "c_exco_theyvegotcover", "c_exco_theyretakingcover"];
    level.battlechatter.eventstrings["CFS"]["killfirm_enemy"] = ["c_firm_gotone", "c_firm_hostiledown", "c_firm_xraydown"];
    level.battlechatter.eventstrings["CFS"]["killfirm_target"] = ["c_firm_theyredone", "c_firm_theyredown", "c_firm_sortedem"];
    level.battlechatter.eventstrings["CFS"]["casualties"] = ["c_casu_weretakingheavies", "c_casu_weregettingourassesk", "c_casu_werelosingshooters", "c_casu_weretakingcasualties"];
    level.battlechatter.eventstrings["CFS"]["copy"] = ["c_conf_copy", "c_conf_check", "c_conf_copythat", "c_conf_goodcopy", "c_conf_solidcopy", "c_aqcp_copy", "c_aqcp_solidcopy"];
    level.battlechatter.eventstrings["CFS"]["praise"] = ["c_pras_hellyeah", "c_pras_niceonemate", "c_pras_fuckina", "c_pras_yeah", "c_pras_thatlldo"];
    level.battlechatter.eventstrings["CFS"]["low_ammo"] = ["c_stat_ineedamag", "c_stat_lowonammo", "c_stat_lastmag", "c_stat_needammo", "c_stat_imwinchester"];
    level.battlechatter.eventstrings["CFS"]["wounded"] = ["c_stat_imhit", "c_stat_imshot", "c_stat_medic"];
    level.battlechatter.eventstrings["CFS"]["ask_wounded"] = ["c_stat_yougood", "c_stat_youwounded", "c_stat_youhit"];
    level.battlechatter.eventstrings["CFS"]["ask_low_ammo"] = ["c_stat_howsyourammo", "c_stat_checkyourammo", "c_stat_whatsyourroundcount"];
    level.battlechatter.eventstrings["CFS"]["ask_status"] = ["c_stat_youokay", "c_stat_whatsyourstatus", "c_stat_status"];
    level.battlechatter.eventstrings["CFS"]["reply_wounded"] = ["c_stat_itookaround", "c_stat_imgood", "c_stat_yeahroundhittheplate"];
    level.battlechatter.eventstrings["CFS"]["reply_low_ammo"] = ["c_stat_runninglow", "c_stat_imlow", "c_stat_almostout"];
    level.battlechatter.eventstrings["CFS"]["reply_okay"] = ["c_stat_imsolid", "c_stat_goodtogo", "c_stat_goodhere"];
    level.battlechatter.eventstrings["CFS"]["wounded_enemy"] = ["c_aens_igothim", "c_aens_clippedhim", "c_aens_hitone"];
    level.battlechatter.eventstrings["CFS"]["ask_target_loc"] = ["c_tast_wheresheat", "c_tast_doesanyonehaveavisua", "c_tast_wherethefuckretheyat"];
    level.battlechatter.eventstrings["CFS"]["ask_target_wounded"] = ["c_tast_yougethim", "c_tast_youhithim", "c_tast_youdrophim"];
    level.battlechatter.eventstrings["CFS"]["target_wounded"] = ["c_tast_heshit", "c_tast_heswounded", "c_tast_hesbleeding"];
    level.battlechatter.eventstrings["CFS"]["target_unhurt"] = ["c_tast_hegotaway", "c_tast_heranoff", "c_tast_hesfallingback"];
    level.battlechatter.eventstrings["CFS"]["wounded_target"] = ["c_atas_woundedhim", "c_atas_ihithim", "c_atas_itaggedem"];
    level.battlechatter.eventstrings["CFS"]["enemy_shotgun"] = ["c_enws_shotgunwatchout", "c_enws_onesgotashotgun", "c_enws_shotgun"];
    level.battlechatter.eventstrings["CFS"]["enemy_sniper"] = ["c_enws_thatsasniper", "c_enws_sniper", "c_enws_enemysniper"];
    level.battlechatter.eventstrings["CFS"]["enemy_lmg"] = ["c_enws_enemymachinegunner", "c_enws_lmg", "c_enws_machinegun"];
    level.battlechatter.eventstrings["CFS"]["target_lmg"] = ["c_taws_theyreusingamachineg", "c_taws_hesgotamachinegun", "c_taws_machinegunner"];
    level.battlechatter.eventstrings["CFS"]["target_shotgun"] = ["c_taws_theyvegotashotgun", "c_taws_hesgotashotgun"];
    level.battlechatter.eventstrings["CFS"]["target_sniper"] = ["c_taws_hessnipingus", "c_taws_hesasniper"];
    level.battlechatter.eventstrings["CFS"]["checkfire"] = ["c_chck_checkyourfire", "c_chck_watchyourfire", "c_chck_blueblue", "c_chck_checkfirecheckfire"];
    level.battlechatter.eventstrings["CFS"]["move"] = ["c_tcor_move", "c_tcor_igotyoumove", "c_tcor_startmoving", "c_tcor_go"];
    level.battlechatter.eventstrings["CFS"]["moveup"] = ["c_tcor_moveup", "c_tcor_moveupgo", "c_tcor_pushup", "c_tcor_getupthere", "c_tcor_pushforward"];
    level.battlechatter.eventstrings["CFS"]["coverme"] = ["c_tcor_coverme", "c_tcor_ineedcoverfire", "c_tcor_coverme_01"];
    level.battlechatter.eventstrings["CFS"]["casualty"] = ["c_canm_wegotacasualty", "c_canm_mandown", "c_canm_wehaveamandown", "c_canm_wevegotwounded", "c_canm_wevegotasoldierdown"];
    level.battlechatter.eventstrings["CFS"]["suppressing"] = ["c_aqsp_suppressingfirefallb", "c_aqsp_suppressingfire", "c_aqsp_imcoveringyou", "c_aqsp_coveringfire"];
    level.battlechatter.eventstrings["CFS"]["reply_hear_you"] = ["s_idrp_sendtraffic", "s_idrp_copygoahead", "s_idrp_imhere", "s_idrp_goahead"];
    level.battlechatter.eventstrings["CFS"]["resp_patrol"] = ["s_idrp_thisisthresher", "s_ahrp_thisisthresher"];
    level.battlechatter.eventstrings["CFS"]["muttered_confusion"] = ["s_idin_whatsthat", "s_idin_whatthehellwasthat", "s_idin_thebleedinhellwastha", "s_idin_whatthehell"];
    level.battlechatter.eventstrings["CFS"]["inv_arrive"] = ["s_idin_huhwhatwasthat", "s_idin_hmphokay", "s_idin_hmm", "s_idin_huhthehell", "s_idin_hrm"];
    level.battlechatter.eventstrings["CFS"]["investigating"] = ["s_idin_illgocheck", "s_idin_illcheckitout", "s_idin_illseewhatsup"];
    level.battlechatter.eventstrings["CFS"]["react_found_corpse"] = ["s_alrc_wehaveasoldierdown", "s_alrc_oneofoursiskia", "s_alrc_gotamandown", "s_alrc_wevegotacasualty"];
    level.battlechatter.eventstrings["CFS"]["ask_corpse_name"] = ["s_alrc_whodidwelose", "s_alrc_who", "s_alrc_whoisit"];
    level.battlechatter.eventstrings["CFS"]["need_backup"] = ["s_alrc_sendreinforcements", "s_alrc_ineedreinforcements", "s_albc_sendreinforcements"];
    level.battlechatter.eventstrings["CFS"]["hunt_copy"] = ["s_hnrs_copy", "s_hnrs_rogerthat", "s_hnrs_copythat"];
    level.battlechatter.eventstrings["CFS"]["react_whizby"] = ["s_unrc_imtakingfire", "s_unrc_imgettingshotat", "s_unrc_takineffectivefire", "s_unrc_someonesshootinatme", "s_unrc_thatsclose"];
    level.battlechatter.eventstrings["CFS"]["react_unaware"] = ["s_unrc_takingcontact", "s_unrc_takingindirectfire", "s_unrc_contactcontact"];
    level.battlechatter.eventstrings["CFS"]["over_there"] = ["s_hnfn_overthere", "s_hnfn_theyreoverthere", "s_hnfn_rightthere"];
    level.battlechatter.eventstrings["CFS"]["surprise"] = ["s_hurc_surprisedeffort", "s_hurc_surprisedeffort_01", "s_hurc_surprisedeffort_02", "s_hurc_bollocks", "s_hurc_ohshit"];
    level.battlechatter.eventstrings["CFS"]["report_reply_idle"] = ["s_idrr_gotnothing", "s_idrr_secure", "s_idrr_clearhere", "s_idrr_allclear", "s_idrr_goodhere", "s_idrr_allquiet", "s_idrr_areassecure"];
    level.battlechatter.eventstrings["CFS"]["react_first"] = ["s_idrc_huh", "s_idrc_hmph", "s_idrc_hrm", "s_idrc_eh", "s_idrc_hm", "s_idrc_wha"];
    level.battlechatter.eventstrings["CFS"]["react_second"] = ["s_idrc_yourebloodyjokingwha", "s_idrc_thebloodyhellisgoing", "s_idrc_whatthehellisthat"];
    level.battlechatter.eventstrings["CFS"]["react_multi"] = ["s_idrm_whosoutthere", "s_idrm_okaywhatthefuck", "s_idrm_whatisthisshit"];
    level.battlechatter.eventstrings["CFS"]["react_interrupt"] = ["s_idli_missedyourlastover", "s_idli_yougood", "s_idli_sayagainover"];
    level.battlechatter.eventstrings["CFS"]["react_noreply"] = ["s_idli_doyoureadme", "s_idli_youcopy", "s_idli_youreceivingme"];
    level.battlechatter.eventstrings["CFS"]["order_investigate"] = ["s_idio_gocheckit", "s_idio_checkitout", "s_idio_gocheckthatout"];
    level.battlechatter.eventstrings["CFS"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["CFS"]["inv_ask_first"] = ["s_idia_whatwasit", "s_idia_findanything", "s_idia_seeanything", "s_idia_yougotanything", "s_idia_whatdyoufind"];
    level.battlechatter.eventstrings["CFS"]["inv_ask_second"] = ["s_idia_stillnothing", "s_idia_anythingthistime", "s_idia_whatwasitthistime", "s_idia_findanythingthistime", "s_idia_stilldidntfindanythi"];
    level.battlechatter.eventstrings["CFS"]["resp_sound_first"] = ["s_idir_nothingnovisual", "s_idir_nahweresecure", "s_idir_negativewereclear", "s_idir_nothingnobody"];
    level.battlechatter.eventstrings["CFS"]["order_check_together"] = ["s_idit_letsgocheckitout", "s_idit_letscheckitwatchmyba", "s_idit_letsgocheckcoverme"];
    level.battlechatter.eventstrings["CFS"]["covering_investigate"] = ["s_idit_covering", "s_idit_imwithyou", "s_idit_gotyoucovered"];
    level.battlechatter.eventstrings["CFS"]["team_return_idle"] = ["s_idid_okayletsheadback", "s_idid_weregoodhereletsgetb", "s_idid_backtoourpostsletsgo"];
    level.battlechatter.eventstrings["CFS"]["ask_heard_that"] = ["s_alre_youhearthat", "s_alre_youheardthattoo", "s_alre_youheardthatright"];
    level.battlechatter.eventstrings["CFS"]["ask_saw_that"] = ["s_alre_didyouseethat", "s_alre_yougeteyesonthat", "s_alre_youcatchthat"];
    level.battlechatter.eventstrings["CFS"]["have_something"] = ["s_alre_imighthavesomething", "s_alre_ithinkihavesomething", "s_alre_igotapossiblethreat"];
    level.battlechatter.eventstrings["CFS"]["heard_something"] = ["s_alre_iheardsomething", "s_alre_heardsomethingnearme", "s_alre_iheardanoise"];
    level.battlechatter.eventstrings["CFS"]["saw_something"] = ["s_alre_isawsomething", "s_alre_thoughtisawsomething", "s_alre_ithinksomeonesnearme"];
    level.battlechatter.eventstrings["CFS"]["react_resp"] = ["s_alrr_yeah", "s_alrr_afirm", "s_alrr_yeahrogerthat"];
    level.battlechatter.eventstrings["CFS"]["alert_ask"] = ["s_alia_seeanything", "s_alia_yougotsomething", "s_alia_anything", "s_alia_gotanything"];
    level.battlechatter.eventstrings["CFS"]["alert_patrol"] = ["s_alip_illpullsecurityheret", "s_alip_illsecuretheareakeep", "s_alip_headbackillpullsecur", "s_alip_ivegotthisareagetbac"];
    level.battlechatter.eventstrings["CFS"]["report_reply_search"] = ["s_alir_negativenothingyet", "s_alir_nothingfornow", "s_alir_negativegotnothing", "s_alir_notseeinganything", "s_alir_sofarsogood", "s_alir_igotnothingyet", "s_alir_goodsofar", "s_alir_nothing", "s_alir_nothingsofar", "s_alir_weregoodfornow", "s_alir_itsclearsofar"];
    level.battlechatter.eventstrings["CFS"]["warn_report"] = ["s_wrnr_hadanunknowninsideth", "s_wrnr_hadanunknowninsideth_01", "s_wrnr_anunknownwasintheare"];
    level.battlechatter.eventstrings["CFS"]["warn_spotted"] = ["s_wrnf_heygetthefuckback", "s_wrnf_heyyougetthefuckoutt", "s_wrnf_getbackgetbackrightn"];
    level.battlechatter.eventstrings["CFS"]["warn_conv"] = ["s_wrni_scaredthehelloutofem", "s_wrni_probablyshittingthem", "s_wrni_whatthehellweretheyd", "s_wrni_whatthefuckweretheyt"];
    level.battlechatter.eventstrings["CFS"]["warn_conv_reply"] = ["s_wrir_almostgotthemselvesk", "s_wrir_iwasreadytodumpthatm", "s_wrir_luckytheydidntcatcha"];
    level.battlechatter.eventstrings["CFS"]["warn_attack"] = ["s_wrnk_heyiwarnedyou", "s_wrnk_youwerewarned", "s_wrnk_heyyoujustfuckedup"];
    level.battlechatter.eventstrings["CFS"]["ask_enemy_loc"] = ["s_unwl_wheredthatcomefrom", "s_unwl_whereditcomefrom", "s_unwl_wherethehellarethey"];
    level.battlechatter.eventstrings["CFS"]["enemy_loc_resp"] = ["s_unrs_idontknowbutthatwasa", "s_unrs_ididntseeem", "s_unrs_idontbloodyknow", "s_unrs_novisualdidntseeem"];
    level.battlechatter.eventstrings["CFS"]["react_first_combat"] = ["s_awrr_contact", "s_awrr_enemymyposition", "s_awrr_enemy", "s_awrr_enemyshere", "s_awrr_gotenemyhere", "s_awrr_enemysclose", "s_awrr_troopsincontact"];
    level.battlechatter.eventstrings["CFS"]["report_target_water"] = ["s_awrr_targetsinthewater", "s_awrr_gotavisualtheyreinth", "s_awrr_iseeeminthewater", "s_awrr_inthewaterinthewater", "s_awrr_enemyinthewater", "s_awrr_theyremovinginthewat", "s_awrr_heytheyreinthewater"];
    level.battlechatter.eventstrings["CFS"]["at_my_location"] = ["s_awrr_righthere", "s_awrr_onmeonme", "s_awrr_myposition", "s_awrr_righthererighthere", "s_awrr_onme", "s_awrr_theyrerighthere", "s_awrr_overhere", "s_awrr_theyreoverhere"];
    level.battlechatter.eventstrings["CFS"]["found_target"] = ["s_awrr_gotem", "s_awrr_iseeem", "s_awrr_foundem", "s_awrr_hey", "s_awrr_visual", "s_awrr_targetspotted"];
    level.battlechatter.eventstrings["CFS"]["found_you"] = ["s_awrr_iseeyoubastard", "s_awrr_foundyou", "s_awrr_igotyou", "s_awrr_gotyou", "s_awrr_ifoundyou"];
    level.battlechatter.eventstrings["CFS"]["order_check_last"] = ["s_advo_moveonemgo", "s_advo_forceuponemgo", "s_advo_pushtheirpositiongo"];
    level.battlechatter.eventstrings["CFS"]["lost_target"] = ["s_lkpl_frustratedgrunttheyr", "s_lkpl_frustratedgrunttheyr_01", "s_lkpl_frustratedgruntnovis", "s_lkpl_frustratedgrunttheyg"];
    level.battlechatter.eventstrings["CFS"]["lost_target_water"] = ["s_lkpw_theywentunderwater", "s_lkpw_theyreinthewater", "s_lkpw_theyjumpedinthewater", "s_lkpw_targetsinthewater"];
    level.battlechatter.eventstrings["CFS"]["ask_target_location"] = ["s_lklr_gotavisual", "s_lklr_youseeem", "s_lklr_whatstheirlocation", "s_lklr_wherearethey", "s_lklr_wherethefuckarethey", "s_lklr_getmealocation"];
    level.battlechatter.eventstrings["CFS"]["target_still_close"] = ["s_lkpc_theywerehere", "s_lkpc_theywererighthere", "s_lkpc_theycantbefar", "s_lkpc_theyreclose", "s_lkpc_theyrehiding", "s_lkpc_theygottabeclose", "s_lkpc_theydidntmakeitfar", "s_lkpc_theyrestillheresomew"];
    level.battlechatter.eventstrings["CFS"]["clearing_east"] = ["s_cmhs_checkingeast", "s_cmhs_securingeast", "s_cmhs_movingeast"];
    level.battlechatter.eventstrings["CFS"]["clearing_west"] = ["s_cmhs_checkingwest", "s_cmhs_securingwest", "s_cmhs_movingwest"];
    level.battlechatter.eventstrings["CFS"]["clearing_south"] = ["s_cmhs_securingsouth", "s_cmhs_movingsouth", "s_cmhs_checkingsouth"];
    level.battlechatter.eventstrings["CFS"]["clearing_north"] = ["s_cmhs_securingnorth", "s_cmhs_movingnorth", "s_cmhs_checkingnorth"];
    level.battlechatter.eventstrings["CFS"]["good_hunting"] = ["s_hnts_staysharp", "s_hnts_stayfrosty", "s_hnts_keepittight"];
    level.battlechatter.eventstrings["CFS"]["moving_there"] = ["s_hntm_movingnow", "s_hntm_moving", "s_hntm_movingtherenow", "c_tcac_moving", "c_tcac_immoving", "c_tcac_heyimmoving"];
    level.battlechatter.eventstrings["CFS"]["moving_alone"] = ["s_hntm_iminbound", "s_hntm_immoving", "s_hntm_immovingnow"];
    level.battlechatter.eventstrings["CFS"]["ask_found_anything"] = ["s_aqhr_gotanything", "s_aqhr_findanything", "s_aqhr_gotavisual", "s_aqhr_anyvisual", "s_aqhr_whatdoyougot", "s_aqhr_yougotsomething"];
    level.battlechatter.eventstrings["CFS"]["reply_found_nothing"] = ["s_aqhr_novisualonthetarget", "s_aqhr_nosignofem", "s_aqhr_novisual"];
    level.battlechatter.eventstrings["CFS"]["report_investigating"] = ["s_aqhr_immovingin", "s_aqhr_imcheckingitout", "s_aqhr_movingtosecure"];
    level.battlechatter.eventstrings["CFS"]["area_clear"] = ["s_aqhr_thisareassecure", "s_aqhr_securehere", "s_aqhr_areasecure"];
    level.battlechatter.eventstrings["CFS"]["order_dir"] = ["s_aqhs_securethatarea", "s_aqhs_checkthatway", "s_aqhs_cordonthatarea", "s_aqhs_clearthatarea"];
    level.battlechatter.eventstrings["CFS"]["order_dir_resp"] = ["s_aqhs_illsearchthisway", "s_aqhs_illcheckoverhere", "s_aqhs_illtakethisway", "s_aqhs_illsecurethisarea"];
    level.battlechatter.eventstrings["CFS"]["hunt"] = ["s_aqhb_wherethefuckareyou", "s_aqhb_motherfuckers", "s_aqhb_yourehidingiknowyour", "s_aqhb_youreheresomewherear", "s_aqhb_comeonout", "s_aqhb_gonnafindyou", "s_aqhb_wheredyoufuckinggo"];
    level.battlechatter.eventstrings["CFS"]["hunt_reactions"] = ["s_ahnr_surprisedinttenserea", "s_ahnr_surprisedinttenserea_01", "s_ahnr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["CFS"]["cmb_reactions"] = ["s_aqcr_surprisedinttenserea", "s_aqcr_surprisedinttenserea_01", "s_aqcr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["CFS"]["whizby_resp"] = ["s_aqal_itcamefromoverthere", "s_aqal_itcamefromthatway", "s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["CFS"]["hunt_cornercheck"] = ["s_aqho_checkyourcorners", "s_aqho_checkthosecorners", "s_aqho_checkcornersfindem"];
    level.battlechatter.eventstrings["CFS"]["hunt_order_hold"] = ["s_aqho_hold", "s_aqho_standfast", "s_aqho_holdup"];
    level.battlechatter.eventstrings["CFS"]["alert_search_orders"] = ["s_aqao_searchoverthere", "s_aqao_checkoverthere", "s_aqao_gothatway", "s_aqao_checkthatway", "s_aqao_securethatarea", "s_aqao_searchthatway"];
    level.battlechatter.eventstrings["CFS"]["hunt_report_alert"] = ["s_aqlo_cordonandsearchthear", "s_aqlo_fanoutsearchthearea", "s_aqlo_cordonofftheareafind"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"] = [];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][0] = ["s_idsl_alqatalatakesoveralm", "s_idsl_devgruandkortacmovei", "s_idsl_alongcomeswhitelotus", "s_idsl_blackmous", "s_idsl_legionwellweknowwhat", "s_idsl_thencrowngetsinvolve", "s_idsl_soaqbringinthecartel", "s_idsl_cartelsetsupshop", "s_idsl_thosecowboysfollowem", "s_idsl_andnowyouhavethispha", "s_idsl_somewouldcallthatapr", "s_idsl_icallitatargetrichen"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][1] = ["s_idsl_sharpenup", "s_idsl_complacencykills", "s_idsl_youknowthemomentyoug", "s_idsl_somelittlefuckerisgo", "s_idsl_sostaysharp", "s_idsl_dontletemgetthedropo", "s_idsl_wellbedoneherebefore"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][2] = ["s_idsl_cartelandaq", "s_idsl_neverthoughtidliketo", "s_idsl_shouldhavejuststayed", "s_idsl_orchosenothergroupst", "s_idsl_morecapablegroups", "s_idsl_bestsmugglersinthewo", "s_idsl_iftheyweresmarttheyd", "s_idsl_anyonewhoworkswithaq"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][3] = ["s_idsl_shouldnthavecomehere", "s_idsl_theterrorists", "s_idsl_thecartel", "s_idsl_andalltherestofem", "s_idsl_gonnaridthisplaceofy"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][4] = ["s_idsl_imapeacekeepingsoldi", "s_idsl_imapeacekeepingsoldi_01", "s_idsl_imapeacekeepingsoldi_02", "s_idsl_imaviolentbastardand"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][5] = ["s_idsl_shouldntbemuchlonger", "s_idsl_anotherhour", "s_idsl_maybetwo", "s_idsl_thenyoucangetsomeshu", "s_idsl_orasmoke", "s_idsl_justwatchyourcorners", "s_idsl_dontgetsloppy"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][6] = ["s_idsl_hummingasong", "s_idsl_hummingasong_01", "s_idsl_hummingasong_02"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][7] = ["s_idsl_clear", "s_idsl_justlikethelasttime", "s_idsl_fiftypoundssaysitscl", "s_idsl_gonnabearichmanbythe"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][8] = ["s_idsl_touchpointpull", "s_idsl_drivetoeyeline", "s_idsl_lockin", "s_idsl_squeezetrigger", "s_idsl_recoiltargetsdown", "s_idsl_bobsyouruncle"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"] = [];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][0] = ["s_idcv_wherewereyoubeforeth", "s_idcv_allover", "s_idcv_everbeentourzikstan", "s_idcv_yeahgotfamilythere", "s_idcv_wellthatmakestwoofus", "s_idcv_smallworldeh", "s_idcv_toorightmate"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][1] = ["s_idcv_youseenanycartelarou", "s_idcv_negative", "s_idcv_youknowthebosselsinn", "s_idcv_whataboutem", "s_idcv_ihearitsawoman", "s_idcv_okay", "s_idcv_imjustsaying", "s_idcv_yeahiknowwhatyouresa", "s_idcv_dontreadintoitmateju", "s_idcv_okaywithwhat", "s_idcv_yknowengaging", "s_idcv_youhavinalaugh", "s_idcv_whenthetimecomesyouc", "s_idcv_ifthetimecomesshellb"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][2] = ["s_idcv_queencapturesrookh8", "s_idcv_rooktod3", "s_idcv_queentoa8", "s_idcv_pawnc3", "s_idcv_queentoa4check", "s_idcv_kingtoe1", "s_idcv_pawntof4", "s_idcv_sneakybastardpawntof", "s_idcv_kingc1", "s_idcv_rooktod2", "s_idcv_queentoa7resign", "s_idcv_pissoff"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][3] = ["s_idcv_interrogative", "s_idcv_goahead", "s_idcv_whydidthechickencros", "s_idcv_fuckinhellwhy", "s_idcv_togettotheidiotshous", "s_idcv_whosthere", "s_idcv_thechicken"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][4] = ["s_idcv_gotanything", "s_idcv_negativeyou", "s_idcv_nothing", "s_idcv_letsgiveittenthenswe", "s_idcv_wegotreconup", "s_idcv_airassetshavebeentas", "s_idcv_sowereourownrecongot"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][5] = ["s_idcv_latestintelshowsaqan", "s_idcv_howmanyfighters", "s_idcv_adozenmaybemore", "s_idcv_wecanhandlethat", "s_idcv_itsnotthemimconcerne", "s_idcv_whothen", "s_idcv_everyoneelse", "s_idcv_yourenotgettingsofto", "s_idcv_theresadifferencebet", "s_idcv_justkeepyourweaponre", "s_idcv_wecouldusereinforcem", "s_idcv_mostofourassetsareti", "s_idcv_yougoodonweaponsanda", "s_idcv_toppedoffandrightasr", "s_idcv_okayletsstaysharp"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][6] = ["s_idcv_clear", "s_idcv_allclear", "s_idcv_watchforgreensmoketh", "s_idcv_copythat"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][7] = ["s_idcv_impullingrecceyester", "s_idcv_aqorcartel", "s_idcv_neithersotheyresetti", "s_idcv_howfar", "s_idcv_around800meterssothe", "s_idcv_areconteam", "s_idcv_negativeitwascivilia", "s_idcv_noshitwhatdyoudo", "s_idcv_whatihadtoiwatchedit", "s_idcv_welldonttellmewhowon"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][8] = ["s_idcv_anysignofaqorcartel", "s_idcv_heardsomethinggoingd", "s_idcv_rogerthatmakesureyou", "s_idcv_wayaheadofyou", "s_idcv_letskeepaneyeonthata", "s_idcv_copymaybewellseesome", "s_idcv_anymovementandyoucal", "s_idcv_solidcopy"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][9] = ["s_idcv_wehitanaqstrongholdl", "s_idcv_anycasualties", "s_idcv_noneitwasmint", "s_idcv_actionableintel", "s_idcv_unknownatthistime", "s_idcv_maybeitcanleadustoth", "s_idcv_lookedliketheyhadint", "s_idcv_evenus", "s_idcv_wellsee", "s_idcv_soundslikeweneedtohi"];
    level.battlechatter.eventstrings["CFS_L"]["wait_target_surface"] = ["s_lkwr_whentheygoforairtake", "s_lkwr_whentheycomeupyourec", "s_lkwr_whentheycomeupforair", "s_lkwr_waitforthemtocomeupt", "s_lkwr_waitforthemtosurface", "s_lkwr_theyllhavetosurfacew"];
    level.battlechatter.eventstrings["CFS_L"]["idle_name"] = ["s_idnm_king", "s_idnm_adams", "s_idnm_baker", "s_idnm_barry", "s_idnm_billy", "s_idnm_chapman", "s_idnm_colin", "s_idnm_edwards", "s_idnm_fisher", "s_idnm_george", "s_idnm_grant", "s_idnm_hall", "s_idnm_james", "s_idnm_matthews", "s_idnm_morgan", "s_idnm_parker", "s_idnm_richards", "s_idnm_roberts", "s_idnm_shaw", "s_idnm_stevens", "s_idnm_thomas", "s_idnm_turner", "s_idnm_williams"];
    level.battlechatter.eventstrings["CFS_L"]["reply_hear_you"] = ["s_idrp_rogergoahead", "s_idrp_thisisactualgoahead", "s_idrp_goahead", "s_idrp_go", "s_idrp_goforactual", "s_idrp_thisisactual"];
    level.battlechatter.eventstrings["CFS_L"]["idle_conf_name"] = ["s_idcn_doyoucopy", "s_idcn_king", "s_idcn_adams", "s_idcn_baker", "s_idcn_barry", "s_idcn_billy", "s_idcn_chapman", "s_idcn_colin", "s_idcn_edwards", "s_idcn_fisher", "s_idcn_george", "s_idcn_grant", "s_idcn_hall", "s_idcn_james", "s_idcn_matthews", "s_idcn_morgan", "s_idcn_parker", "s_idcn_richards", "s_idcn_roberts", "s_idcn_shaw", "s_idcn_stevens", "s_idcn_thomas", "s_idcn_turner", "s_idcn_williams"];
    level.battlechatter.eventstrings["CFS_L"]["hunt_name"] = ["s_hnnm_king", "s_hnnm_adams", "s_hnnm_baker", "s_hnnm_barry", "s_hnnm_billy", "s_hnnm_chapman", "s_hnnm_colin", "s_hnnm_edwards", "s_hnnm_fisher", "s_hnnm_george", "s_hnnm_grant", "s_hnnm_hall", "s_hnnm_james", "s_hnnm_matthews", "s_hnnm_morgan", "s_hnnm_parker", "s_hnnm_richards", "s_hnnm_roberts", "s_hnnm_shaw", "s_hnnm_stevens", "s_hnnm_thomas", "s_hnnm_turner", "s_hnnm_williams"];
    level.battlechatter.eventstrings["CFS_L"]["react_noreply"] = ["s_idli_areyoureceivingme", "s_idli_doyoureadme", "s_idli_doyoucopy"];
    level.battlechatter.eventstrings["CFS_L"]["react_interrupt"] = ["s_idli_missedyourlastsayaga", "s_idli_commscheck", "s_idli_sayagainyourlastover", "s_idli_areyougood", "s_idli_sayagainover", "s_idli_missedyourlastover"];
    level.battlechatter.eventstrings["CFS_L"]["confirming"] = ["s_idlc_roger", "s_idlc_copy", "s_idlc_copythat"];
    level.battlechatter.eventstrings["CFS_L"]["alert_corpse_name"] = ["s_alcn_itsking", "s_alcn_itsadams", "s_alcn_itsbaker", "s_alcn_itsbarry", "s_alcn_itsbilly", "s_alcn_itschapman", "s_alcn_itscolin", "s_alcn_itsedwards", "s_alcn_itsfisher", "s_alcn_itsgeorge", "s_alcn_itsgrant", "s_alcn_itshall", "s_alcn_itsjames", "s_alcn_itsmatthews", "s_alcn_itsmorgan", "s_alcn_itsparker", "s_alcn_itsrichards", "s_alcn_itsroberts", "s_alcn_itsshaw", "s_alcn_itsstevens", "s_alcn_itsthomas", "s_alcn_itsturner", "s_alcn_itswilliams"];
    level.battlechatter.eventstrings["CFS_L"]["inv_patrol"] = ["s_alip_continueyourpatrolst", "s_alip_getbacktoyourrouteke", "s_alip_returntoyourpatrolke"];
    level.battlechatter.eventstrings["CFS_L"]["good_hunting"] = ["s_hnts_goodhunting", "s_hnts_staysharpoutthere", "s_hnts_out", "s_aisg_copystaysharp"];
    level.battlechatter.eventstrings["CFS_L"]["ask_found_anything"] = ["s_aqhr_whatsyourstatus", "s_aqhr_whatveyougot", "s_aqhr_givemeasitrep", "s_aqhr_sitrep", "s_aqhr_didyoufindanything", "s_aqhr_tellmeyouhavesomethi"];
    level.battlechatter.eventstrings["CFS_L"]["hunt_report_alert"] = ["s_aqhr_allteamswehaveenemyi", "s_aqhr_allteamsperimeterisb", "s_aqhr_allteamsenemyisinsid", "s_aqlo_fanoutsecuretheperim", "s_aqlo_setcontainmentfindth", "s_aqlo_spreadoutsearchthear"];
    level.battlechatter.eventstrings["CFS_L"]["order_stay_aware"] = ["s_aqho_dontletthesebastards", "s_aqho_keepyourguardup", "s_aqho_dontletyourguarddown"];
    level.battlechatter.eventstrings["CFS_L"]["order_stay_alert"] = ["s_aqho_eyesopen", "s_aqho_keepittight", "s_aqho_staysharp"];
    level.battlechatter.eventstrings["CFS_L"]["order_continue_search"] = ["s_aqho_keepsearchingthearea", "s_aqho_keepsweeping", "s_aqho_keeplookingforem"];
    level.battlechatter.eventstrings["CFS_L"]["signoff"] = ["s_idls_out", "s_idls_actualout", "s_idls_staysharp", "s_idls_out_01"];
    level.battlechatter.eventstrings["CFS_L"]["order_find_target"] = ["s_cmho_weneedalocationonthe", "s_cmho_locatethetargetnow", "s_cmho_huntthemdown"];
    level.battlechatter.eventstrings["CFS_L"]["order_find_perimeter"] = ["s_cmho_getthisarealockeddow", "s_cmho_securetheperimeter", "s_cmho_iwantthisarealockedd"];
    level.battlechatter.eventstrings["CFS_L"]["order_search_water"] = ["s_cmho_searchthewater", "s_cmho_checkthewater", "s_cmho_theywereinthewater", "s_cmho_watchthewater", "s_cmho_keepyoureyesonthewat"];
    level.battlechatter.eventstrings["CFS_L"]["ask_how_copy"] = ["s_idcm_howcopy", "s_idcm_doyoucopy", "s_idcm_commscheck"];
    level.battlechatter.eventstrings["CFS_L"]["inv_no_response"] = ["s_iinr_hesradiosilent", "s_iinr_hesnotresponding", "s_iinr_hesnotoncomms", "s_iinr_icantreachhim"];
    level.battlechatter.eventstrings["CFS_L"]["inv_patrol_noresp"] = ["s_iinr_stingraydidntcheckin", "s_iinr_stingrayisntrespondi", "s_iinr_icantreachstingray", "s_iinr_stingrayisntoncomms"];
    level.battlechatter.eventstrings["CFS_L"]["order_get_visual"] = ["s_iinr_ineedyoutocheckitout", "s_iinr_doyouhaveavisualonth", "s_iinr_checkitoutmakesureno", "s_iinr_seeifyoucanfindoutwh"];
    level.battlechatter.eventstrings["CFS_L"]["report_search"] = ["s_aias_sitrep", "s_aias_whatsyourstatus", "s_aias_findanything", "s_aias_gotanything", "s_aias_status"];
    level.battlechatter.eventstrings["CFS_L"]["report_alert"] = ["s_airp_allteamssharpenupwem", "s_airp_allteamstheperimeter", "s_airp_allteamspossibleenem", "s_airp_allteamssetsecurityw"];
    level.battlechatter.eventstrings["CFS_L"]["warn_reply"] = ["s_wrpl_iftheyreturnyourecle", "s_wrpl_youseethemagainsortt", "s_wrpl_iftheyreturnyourecle_01"];
    level.battlechatter.eventstrings["CFS_L"]["report_target_location"] = ["s_chrp_doesanyonehaveavisua", "s_chrp_talktomegentswhatsth", "s_chrp_cmonladsineedalocati", "s_chrp_allteamsdoyouhaveavi"];
    level.battlechatter.eventstrings["CFS_L"]["report_idle"] = ["s_irpr_status", "s_irpr_sitrep", "s_irpr_yougood", "s_irpr_gotanything", "s_irpr_report"];
    level.battlechatter.eventstrings["CFS_L"]["ally_missing_multi"] = ["s_alms_multipleteamsarentre", "s_alms_anotherteamfailedtor", "s_alms_wevelostcontactwitha", "s_alms_anotherteamlostcomms"];
    level.battlechatter.eventstrings["CFS_L"]["order_search_start"] = ["s_aior_searchthearea", "s_aior_pullsecuritysweepthe", "s_aior_securetheperimeter"];
    level.battlechatter.eventstrings["CFS_L"]["order_report_back"] = ["s_aior_soundoffifyoufindsom", "s_aior_reportbackifyoufinda", "s_aior_usecommsifyoufindsom"];
    level.battlechatter.eventstrings["CFS_L"]["hunt_patrol_noresp"] = ["s_hpnr_stingrayisntrespondi", "s_hpnr_stingraydidntcheckin", "s_hpnr_stingrayisntanswerin", "s_hpnr_icantreachstingray"];
    if (!ismp()) {
        level.battlechatter.eventstrings["LVS"]["enemy_moving_up"] = ["m_etca_onesgettingclose", "m_etca_onesmovingup"];
        level.battlechatter.eventstrings["LVS"]["left"] = ["m_posn_ontheleft", "m_posn_leftside"];
        level.battlechatter.eventstrings["LVS"]["right"] = ["m_posn_lookontheright", "m_posn_rightside"];
        level.battlechatter.eventstrings["LVS"]["order_attack"] = ["m_ator_shootthem", "m_ator_attack", "m_ator_fireyourweapon"];
        level.battlechatter.eventstrings["LVS"]["using_grenade"] = ["m_atac_throwinggrenade", "m_atac_grenadeout"];
        level.battlechatter.eventstrings["LVS"]["attacking"] = ["m_atac_attacking", "m_atac_engaging", "m_atac_firing"];
        level.battlechatter.eventstrings["LVS"]["movingup"] = ["m_tcac_immovingup", "m_tcac_movingforward", "m_tcac_movingup"];
        level.battlechatter.eventstrings["LVS"]["reloading"] = ["m_tcac_changingmags", "m_tcac_imreloading"];
        level.battlechatter.eventstrings["LVS"]["moving"] = ["m_tcac_moving", "m_tcac_immoving", "m_tcac_movingnow"];
        level.battlechatter.eventstrings["LVS"]["getting_cover"] = ["m_tcac_takingcover", "m_tcac_movingtocover"];
        level.battlechatter.eventstrings["LVS"]["enemy_using_flash"] = ["m_eata_flashbang", "m_eata_flashbangwatchout"];
        level.battlechatter.eventstrings["LVS"]["enemy_using_grenade"] = ["m_eata_grenade", "m_eata_grenade_01", "m_eata_grenadegetback"];
        level.battlechatter.eventstrings["LVS"]["enemy_using_rpg"] = ["m_eata_rpg", "m_eata_rocket"];
        level.battlechatter.eventstrings["LVS"]["enemy_attacking"] = ["m_eata_imtakingfire", "m_eata_contact", "m_eata_takingeffectivefire"];
        level.battlechatter.eventstrings["LVS"]["enemy_moving"] = ["m_etca_onesmoving", "m_etca_iseeonemoving"];
        level.battlechatter.eventstrings["LVS"]["enemy_getting_cover"] = ["m_etca_theyretakingcover", "m_etca_enemytakingcover"];
        level.battlechatter.eventstrings["LVS"]["enemy_reloading"] = ["m_etca_onesreloading", "m_etca_iseeonereloading"];
        level.battlechatter.eventstrings["LVS"]["target_getting_cover"] = ["m_ttca_hesgoingforcover", "m_ttca_hestryingtohide"];
        level.battlechatter.eventstrings["LVS"]["target_reloading"] = ["m_ttca_hesreloading", "m_ttca_hestryingtoreload"];
        level.battlechatter.eventstrings["LVS"]["target_moving"] = ["m_ttca_hesmoving", "m_ttca_heyhesmoving"];
        level.battlechatter.eventstrings["LVS"]["target_moving_up"] = ["m_ttca_hesmovingup", "m_ttca_hesmovingourway"];
        level.battlechatter.eventstrings["LVS"]["enemy_soldiers"] = ["m_enmy_iseethem", "m_enmy_iseeenemies", "m_enmy_enemies"];
        level.battlechatter.eventstrings["LVS"]["aquired_target"] = ["m_aqen_hesrightthere", "m_aqen_icanseehim", "m_aqen_ifoundhim"];
        level.battlechatter.eventstrings["LVS"]["neg_target"] = ["m_aqen_where", "m_aqen_idontseeanyone", "m_aqen_whereishe"];
        level.battlechatter.eventstrings["LVS"]["enemy_exposed"] = ["m_exco_onesoutofcover", "m_exco_gotoneintheopen", "m_exco_onesintheopenyouseeh"];
        level.battlechatter.eventstrings["LVS"]["target_exposed"] = ["m_exco_hesoutofcover", "m_exco_hesmovingfromcover"];
        level.battlechatter.eventstrings["LVS"]["youre_exposed"] = ["m_exco_takecover", "m_exco_gettocover", "m_exco_getbehindsomething"];
        level.battlechatter.eventstrings["LVS"]["target_covered"] = ["m_exco_hesincover", "m_exco_hestakingcover"];
        level.battlechatter.eventstrings["LVS"]["killfirm_enemy"] = ["m_firm_gotone", "m_firm_enemydown", "m_firm_downedone"];
        level.battlechatter.eventstrings["LVS"]["killfirm_target"] = ["m_firm_ishothim", "m_firm_igothim"];
        level.battlechatter.eventstrings["LVS"]["casualties"] = ["m_casu_werelosingmen", "m_casu_weregettingkilledout"];
        level.battlechatter.eventstrings["LVS"]["copy"] = ["m_conf_copy", "m_conf_copythat", "m_conf_roger"];
        level.battlechatter.eventstrings["LVS"]["low_ammo"] = ["m_stat_ineedammunition", "m_stat_ineedammo", "m_stat_whohasammo"];
        level.battlechatter.eventstrings["LVS"]["wounded"] = ["m_stat_imhit", "m_stat_medic"];
        level.battlechatter.eventstrings["LVS"]["wounded_enemy"] = ["m_aens_iwoundedone", "m_aens_ihitone"];
        level.battlechatter.eventstrings["LVS"]["wounded_target"] = ["m_atas_heshurt", "m_atas_ihithim"];
        level.battlechatter.eventstrings["LVS"]["coverme"] = ["m_tcor_coverme", "m_tcor_ineedcover"];
        level.battlechatter.eventstrings["LVS"]["casualty"] = ["m_canm_dude", "m_canm_theykilledoneofours", "m_canm_theykilledhim"];
        level.battlechatter.eventstrings["LVS"]["suppressing"] = ["m_aqsp_gotyoucovered", "m_aqsp_imcoveringyou"];
    }
    if (!issp() && !iscp()) {
        return;
    }
    level.battlechatter.eventstrings["pric"]["left"] = ["m_posn_theyreflankingleft", "m_posn_leftside", "m_posn_left", "m_posn_checkleft"];
    level.battlechatter.eventstrings["pric"]["right"] = ["m_posn_rightside", "m_posn_theyreflankingright", "m_posn_right", "m_posn_checkright"];
    level.battlechatter.eventstrings["pric"]["order_attack"] = ["m_ator_engage", "m_ator_weaponsfree", "m_ator_dustem", "m_ator_weaponshot", "m_ator_openfire"];
    level.battlechatter.eventstrings["pric"]["using_smoke"] = ["m_atac_throwingsmoke", "m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["pric"]["using_flash"] = ["m_atac_flashout", "m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["pric"]["using_grenade"] = ["m_atac_fragout", "m_atac_grenadeout"];
    level.battlechatter.eventstrings["pric"]["using_molotov"] = ["m_atac_throwingmolotov", "m_atac_molotovout"];
    level.battlechatter.eventstrings["pric"]["reloading"] = ["m_tcac_reloading", "m_tcac_changingmags"];
    level.battlechatter.eventstrings["pric"]["moving"] = ["m_tcac_moving"];
    level.battlechatter.eventstrings["pric"]["enemy_using_flash"] = ["m_eata_flashincoming"];
    level.battlechatter.eventstrings["pric"]["enemy_using_grenade"] = ["m_eata_grenade", "m_eata_grenademove", "m_eata_incoming"];
    level.battlechatter.eventstrings["pric"]["enemy_using_molotov"] = ["m_eata_molotov", "m_eata_molotovgetback"];
    level.battlechatter.eventstrings["pric"]["enemy_using_rpg"] = ["m_eata_rpg", "m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["pric"]["enemy_attacking"] = ["m_eata_takingeffectivefire", "m_eata_contact", "m_eata_imtakingfire"];
    level.battlechatter.eventstrings["pric"]["enemy_soldier"] = ["m_enmy_xrayspotted", "m_enmy_xrayhere"];
    level.battlechatter.eventstrings["pric"]["enemy_soldiers"] = ["m_enmy_multiplexrays", "m_enmy_visualontargets", "m_enmy_multipletargets"];
    level.battlechatter.eventstrings["pric"]["aquired_target"] = ["m_aqen_gotavisual", "m_aqen_gotavisualonhim", "m_aqen_iseehim", "m_aqen_iseethebastard"];
    level.battlechatter.eventstrings["pric"]["neg_target"] = ["m_aqen_novisual", "m_aqen_idontseehim", "m_aqen_novisualonhim"];
    level.battlechatter.eventstrings["pric"]["enemy_exposed"] = ["m_exco_onesintheopen", "m_exco_onesintheopen_01", "m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["pric"]["youre_exposed"] = ["m_exco_findcover"];
    level.battlechatter.eventstrings["pric"]["target_exposed"] = ["m_exco_hesintheopen", "m_exco_theyreintheopen", "m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["pric"]["target_covered"] = ["m_exco_hesbehindcover", "m_exco_hesgotcover", "m_exco_hestakingcover"];
    level.battlechatter.eventstrings["pric"]["killfirm_bigrig"] = ["m_firm_xraydown"];
    level.battlechatter.eventstrings["pric"]["killfirm_enemy"] = ["m_firm_droppedem", "m_firm_shooterdown"];
    level.battlechatter.eventstrings["pric"]["killfirm_target"] = ["m_firm_slottedthatone"];
    level.battlechatter.eventstrings["pric"]["killfirm_truck"] = ["m_firm_truckdestroyed", "m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["pric"]["killfirm_helo"] = ["m_firm_helodestroyed", "m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["pric"]["praise"] = ["m_pras_nicelyfuckindone", "m_pras_fuckinbrilliant", "m_pras_thatllfuckindoit"];
    level.battlechatter.eventstrings["pric"]["low_ammo"] = ["m_stat_ammosrunninglow", "m_stat_imlowonammo"];
    level.battlechatter.eventstrings["pric"]["wounded"] = ["m_stat_imhit"];
    level.battlechatter.eventstrings["pric"]["enemy_sniper"] = ["m_enws_takingsniperfire", "m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["pric"]["checkfire"] = ["m_chck_checkyourbloodyfire", "m_chck_watchyourfire", "m_chck_paingruntbloodyhelly", "m_chck_paingrunthowdamoppet"];
    level.battlechatter.eventstrings["grav"]["left"] = ["m_posn_leftside", "m_posn_left", "m_posn_checkleft", "m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["grav"]["right"] = ["m_posn_rightside", "m_posn_theyreflankingright", "m_posn_right", "m_posn_checkright"];
    level.battlechatter.eventstrings["grav"]["order_attack"] = ["m_ator_engage", "m_ator_weaponsfree", "m_ator_shootem", "m_ator_weaponshot", "m_ator_openfire"];
    level.battlechatter.eventstrings["grav"]["using_smoke"] = ["m_atac_throwingsmoke", "m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["grav"]["using_flash"] = ["m_atac_flashout", "m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["grav"]["using_grenade"] = ["m_atac_fragout", "m_atac_grenadeout"];
    level.battlechatter.eventstrings["grav"]["using_molotov"] = ["m_atac_throwingmolotov", "m_atac_molotovout"];
    level.battlechatter.eventstrings["grav"]["reloading"] = ["m_tcac_reloading", "m_tcac_changingmags"];
    level.battlechatter.eventstrings["grav"]["moving"] = ["m_tcac_moving"];
    level.battlechatter.eventstrings["grav"]["enemy_using_flash"] = ["m_eata_flashincoming"];
    level.battlechatter.eventstrings["grav"]["enemy_using_grenade"] = ["m_eata_grenade", "m_eata_grenademove", "m_eata_incoming"];
    level.battlechatter.eventstrings["grav"]["enemy_using_molotov"] = ["m_eata_molotov", "m_eata_molotovgetback"];
    level.battlechatter.eventstrings["grav"]["enemy_using_rpg"] = ["m_eata_rpg", "m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["grav"]["enemy_attacking"] = ["m_eata_takingeffectivefire", "m_eata_contact", "m_eata_imtakingfire"];
    level.battlechatter.eventstrings["grav"]["enemy_soldier"] = ["m_enmy_threatspotted", "m_enmy_enemy"];
    level.battlechatter.eventstrings["grav"]["enemy_soldiers"] = ["m_enmy_enemies", "m_enmy_visualontargets", "m_enmy_multipletargets"];
    level.battlechatter.eventstrings["grav"]["aquired_target"] = ["m_aqen_gotavisual", "m_aqen_gotavisualonhim", "m_aqen_iseehim", "m_aqen_iseethebastard"];
    level.battlechatter.eventstrings["grav"]["neg_target"] = ["m_aqen_novisual", "m_aqen_idontseehim", "m_aqen_novisualonhim"];
    level.battlechatter.eventstrings["grav"]["enemy_exposed"] = ["m_exco_onesintheopen", "m_exco_onesintheopen_01", "m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["grav"]["youre_exposed"] = ["m_exco_findcover"];
    level.battlechatter.eventstrings["grav"]["target_exposed"] = ["m_exco_hesintheopen", "m_exco_theyreintheopen", "m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["grav"]["target_covered"] = ["m_exco_hesbehindcover", "m_exco_hesgotcover", "m_exco_hestakingcover"];
    level.battlechatter.eventstrings["grav"]["killfirm_bigrig"] = ["m_firm_enemydown"];
    level.battlechatter.eventstrings["grav"]["killfirm_enemy"] = ["m_firm_droppedone", "m_firm_targetdown"];
    level.battlechatter.eventstrings["grav"]["killfirm_target"] = ["m_firm_gotthatsumbitch"];
    level.battlechatter.eventstrings["grav"]["killfirm_truck"] = ["m_firm_truckdestroyed", "m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["grav"]["killfirm_helo"] = ["m_firm_tookouttheirhelo", "m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["grav"]["praise"] = ["m_pras_thatswhatimtalkinabo", "m_pras_hellyeah", "m_pras_nicefuckinwork"];
    level.battlechatter.eventstrings["grav"]["low_ammo"] = ["m_stat_imrunninglow", "m_stat_ammosgettinglow"];
    level.battlechatter.eventstrings["grav"]["wounded"] = ["m_stat_imhit"];
    level.battlechatter.eventstrings["grav"]["enemy_sniper"] = ["m_enws_takingsniperfire", "m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["grav"]["checkfire"] = ["m_chck_watchwhereyoureshoot", "m_chck_checkfire", "m_chck_dontshootatmedumbass", "m_chck_checkyourdamnfire"];
    level.battlechatter.eventstrings["gazz"]["left"] = ["m_posn_leftside", "m_posn_left", "m_posn_checkleft", "m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["gazz"]["right"] = ["m_posn_rightside", "m_posn_theyreflankingright", "m_posn_right", "m_posn_checkright"];
    level.battlechatter.eventstrings["gazz"]["order_attack"] = ["m_ator_engage", "m_ator_weaponsfree", "m_ator_dustem", "m_ator_weaponshot", "m_ator_openfire"];
    level.battlechatter.eventstrings["gazz"]["using_smoke"] = ["m_atac_throwingsmoke", "m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["gazz"]["using_flash"] = ["m_atac_flashout", "m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["gazz"]["using_grenade"] = ["m_atac_fragout", "m_atac_grenadeout"];
    level.battlechatter.eventstrings["gazz"]["using_molotov"] = ["m_atac_throwingmolotov", "m_atac_molotovout"];
    level.battlechatter.eventstrings["gazz"]["reloading"] = ["m_tcac_reloading", "m_tcac_changingmags"];
    level.battlechatter.eventstrings["gazz"]["moving"] = ["m_tcac_moving"];
    level.battlechatter.eventstrings["gazz"]["enemy_using_flash"] = ["m_eata_flashincoming"];
    level.battlechatter.eventstrings["gazz"]["enemy_using_grenade"] = ["m_eata_grenade", "m_eata_grenademove", "m_eata_incoming"];
    level.battlechatter.eventstrings["gazz"]["enemy_using_molotov"] = ["m_eata_molotov", "m_eata_molotovgetback"];
    level.battlechatter.eventstrings["gazz"]["enemy_using_rpg"] = ["m_eata_rpg", "m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["gazz"]["enemy_attacking"] = ["m_eata_takingeffectivefire", "m_eata_contact", "m_eata_imtakingfire"];
    level.battlechatter.eventstrings["gazz"]["enemy_soldier"] = ["m_enmy_xrayspotted", "m_enmy_xrayhere"];
    level.battlechatter.eventstrings["gazz"]["enemy_soldiers"] = ["m_enmy_multiplexrays", "m_enmy_visualontargets", "m_enmy_multipletargets"];
    level.battlechatter.eventstrings["gazz"]["aquired_target"] = ["m_aqen_gotavisual", "m_aqen_gotavisualonhim", "m_aqen_iseehim", "m_aqen_iseethebastard"];
    level.battlechatter.eventstrings["gazz"]["neg_target"] = ["m_aqen_novisual", "m_aqen_idontseehim", "m_aqen_novisualonhim"];
    level.battlechatter.eventstrings["gazz"]["enemy_exposed"] = ["m_exco_onesintheopen", "m_exco_onesintheopen_01", "m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["gazz"]["youre_exposed"] = ["m_exco_findcover"];
    level.battlechatter.eventstrings["gazz"]["target_exposed"] = ["m_exco_hesintheopen", "m_exco_theyreintheopen", "m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["gazz"]["target_covered"] = ["m_exco_hesbehindcover", "m_exco_hesgotcover", "m_exco_hestakingcover"];
    level.battlechatter.eventstrings["gazz"]["killfirm_bigrig"] = ["m_firm_xraydown"];
    level.battlechatter.eventstrings["gazz"]["killfirm_enemy"] = ["m_firm_droppedem", "m_firm_droppedanxray"];
    level.battlechatter.eventstrings["gazz"]["killfirm_target"] = ["m_firm_brassedemup"];
    level.battlechatter.eventstrings["gazz"]["killfirm_truck"] = ["m_firm_truckdestroyed", "m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["gazz"]["killfirm_helo"] = ["m_firm_helodestroyed", "m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["gazz"]["praise"] = ["m_pras_solidmate", "m_pras_niceone", "m_pras_fuckinright"];
    level.battlechatter.eventstrings["gazz"]["low_ammo"] = ["m_stat_ammosrunninglow", "m_stat_imlowonammo"];
    level.battlechatter.eventstrings["gazz"]["wounded"] = ["m_stat_imhit"];
    level.battlechatter.eventstrings["gazz"]["enemy_sniper"] = ["m_enws_takingsniperfire", "m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["gazz"]["checkfire"] = ["m_chck_checkyourbloodyfire", "m_chck_watchyourfire", "m_chck_paingruntbloodyhellw", "m_chck_paingruntcheckfirech"];
    level.battlechatter.eventstrings["alej"]["using_molotov"] = ["m_atac_throwingmolotov", "m_atac_molotovout"];
    level.battlechatter.eventstrings["alej"]["left"] = ["m_posn_leftside", "m_posn_left", "m_posn_checkleft", "m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["alej"]["right"] = ["m_posn_rightside", "m_posn_theyreflankingright", "m_posn_right", "m_posn_checkright"];
    level.battlechatter.eventstrings["alej"]["order_attack"] = ["m_ator_engage", "m_ator_shootem", "m_ator_dropem", "m_ator_openup", "m_ator_openfire"];
    level.battlechatter.eventstrings["alej"]["using_smoke"] = ["m_atac_throwingsmoke", "m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["alej"]["using_flash"] = ["m_atac_flashout", "m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["alej"]["using_grenade"] = ["m_atac_fragout", "m_atac_grenadeout"];
    level.battlechatter.eventstrings["alej"]["reloading"] = ["m_tcac_reloading", "m_tcac_changingmags"];
    level.battlechatter.eventstrings["alej"]["moving"] = ["m_tcac_moving"];
    level.battlechatter.eventstrings["alej"]["enemy_using_flash"] = ["m_eata_flashincoming"];
    level.battlechatter.eventstrings["alej"]["enemy_using_grenade"] = ["m_eata_grenade", "m_eata_grenademove", "m_eata_incoming"];
    level.battlechatter.eventstrings["alej"]["enemy_using_molotov"] = ["m_eata_molotov", "m_eata_molotovgetback"];
    level.battlechatter.eventstrings["alej"]["enemy_using_rpg"] = ["m_eata_rpg", "m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["alej"]["enemy_attacking"] = ["m_eata_takingeffectivefire", "m_eata_contact", "m_eata_imtakingfire"];
    level.battlechatter.eventstrings["alej"]["enemy_soldier"] = ["m_enmy_targetspotted", "m_enmy_enemy"];
    level.battlechatter.eventstrings["alej"]["enemy_soldiers"] = ["m_enmy_multipletargets", "m_enmy_visualontargets", "m_enmy_enemies"];
    level.battlechatter.eventstrings["alej"]["aquired_target"] = ["m_aqen_gotavisual", "m_aqen_gotavisualonhim", "m_aqen_iseehim", "m_aqen_goteyeson"];
    level.battlechatter.eventstrings["alej"]["neg_target"] = ["m_aqen_novisual", "m_aqen_idontseehim", "m_aqen_cantfindhim"];
    level.battlechatter.eventstrings["alej"]["enemy_exposed"] = ["m_exco_onesintheopen", "m_exco_onesintheopen_01", "m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["alej"]["youre_exposed"] = ["m_exco_findcover"];
    level.battlechatter.eventstrings["alej"]["target_exposed"] = ["m_exco_hesintheopen", "m_exco_theyreintheopen", "m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["alej"]["target_covered"] = ["m_exco_hesbehindcover", "m_exco_hesgotcover", "m_exco_hestakingcover"];
    level.battlechatter.eventstrings["alej"]["killfirm_bigrig"] = ["m_firm_targetdown"];
    level.battlechatter.eventstrings["alej"]["killfirm_enemy"] = ["m_firm_droppedem", "m_firm_enemydown"];
    level.battlechatter.eventstrings["alej"]["killfirm_target"] = ["m_firm_igotem"];
    level.battlechatter.eventstrings["alej"]["killfirm_truck"] = ["m_firm_theirtrucksdown", "m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["alej"]["killfirm_helo"] = ["m_firm_helodestroyed", "m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["alej"]["praise"] = ["m_pras_goodworkhermano", "m_pras_ahuevo", "m_pras_niceone"];
    level.battlechatter.eventstrings["alej"]["low_ammo"] = ["m_stat_ammosrunninglow", "m_stat_imlowonammo"];
    level.battlechatter.eventstrings["alej"]["wounded"] = ["m_stat_imhit"];
    level.battlechatter.eventstrings["alej"]["enemy_sniper"] = ["m_enws_takingsniperfire", "m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["alej"]["checkfire"] = ["m_chck_checkfirecheckfire", "m_chck_heywatchyourfire", "m_chck_paingruntshoottheene", "m_chck_paingruntcheckyourfi"];
    level.battlechatter.eventstrings["rodo"]["enemy_attacking"] = ["m_eata_imtakingfire", "m_eata_takingeffectivefire", "m_eata_contact"];
    level.battlechatter.eventstrings["rodo"]["left"] = ["m_posn_leftside", "m_posn_left", "m_posn_checkleft", "m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["rodo"]["right"] = ["m_posn_rightside", "m_posn_theyreflankingright", "m_posn_right", "m_posn_checkright"];
    level.battlechatter.eventstrings["rodo"]["order_attack"] = ["m_ator_engage", "m_ator_shootem", "m_ator_dropem", "m_ator_openup", "m_ator_openfire"];
    level.battlechatter.eventstrings["rodo"]["using_smoke"] = ["m_atac_throwingsmoke", "m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["rodo"]["using_flash"] = ["m_atac_flashout", "m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["rodo"]["using_grenade"] = ["m_atac_fragout", "m_atac_grenadeout"];
    level.battlechatter.eventstrings["rodo"]["using_molotov"] = ["m_atac_throwingmolotov", "m_atac_molotovout"];
    level.battlechatter.eventstrings["rodo"]["reloading"] = ["m_tcac_reloading", "m_tcac_changingmags"];
    level.battlechatter.eventstrings["rodo"]["moving"] = ["m_tcac_moving"];
    level.battlechatter.eventstrings["rodo"]["enemy_using_flash"] = ["m_eata_flashincoming"];
    level.battlechatter.eventstrings["rodo"]["enemy_using_grenade"] = ["m_eata_grenade", "m_eata_grenademove", "m_eata_incoming"];
    level.battlechatter.eventstrings["rodo"]["enemy_using_molotov"] = ["m_eata_molotov", "m_eata_molotovgetback"];
    level.battlechatter.eventstrings["rodo"]["enemy_using_rpg"] = ["m_eata_rpg", "m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["rodo"]["enemy_soldier"] = ["m_enmy_targetspotted", "m_enmy_enemy"];
    level.battlechatter.eventstrings["rodo"]["enemy_soldiers"] = ["m_enmy_multipletargets", "m_enmy_visualontargets", "m_enmy_enemies"];
    level.battlechatter.eventstrings["rodo"]["aquired_target"] = ["m_aqen_gotavisual", "m_aqen_gotavisualonhim", "m_aqen_iseehim", "m_aqen_goteyeson"];
    level.battlechatter.eventstrings["rodo"]["neg_target"] = ["m_aqen_novisual", "m_aqen_idontseehim", "m_aqen_cantfindhim"];
    level.battlechatter.eventstrings["rodo"]["enemy_exposed"] = ["m_exco_onesintheopen", "m_exco_onesintheopen_01", "m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["rodo"]["youre_exposed"] = ["m_exco_findcover"];
    level.battlechatter.eventstrings["rodo"]["target_exposed"] = ["m_exco_hesintheopen", "m_exco_theyreintheopen", "m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["rodo"]["target_covered"] = ["m_exco_hesbehindcover", "m_exco_hesgotcover", "m_exco_hestakingcover"];
    level.battlechatter.eventstrings["rodo"]["killfirm_bigrig"] = ["m_firm_targetdown"];
    level.battlechatter.eventstrings["rodo"]["killfirm_enemy"] = ["m_firm_droppedem", "m_firm_enemydown"];
    level.battlechatter.eventstrings["rodo"]["killfirm_target"] = ["m_firm_igotem"];
    level.battlechatter.eventstrings["rodo"]["killfirm_truck"] = ["m_firm_theirtrucksdown", "m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["rodo"]["killfirm_helo"] = ["m_firm_helodestroyed", "m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["rodo"]["praise"] = ["m_pras_goodworkhermano", "m_pras_ahuevo", "m_pras_niceone"];
    level.battlechatter.eventstrings["rodo"]["low_ammo"] = ["m_stat_ammosrunninglow", "m_stat_imlowonammo"];
    level.battlechatter.eventstrings["rodo"]["wounded"] = ["m_stat_imhit"];
    level.battlechatter.eventstrings["rodo"]["enemy_sniper"] = ["m_enws_takingsniperfire", "m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["rodo"]["checkfire"] = ["m_chck_checkfirecheckfire", "m_chck_heywatchyourfire", "m_chck_paingruntshoottheene", "m_chck_paingruntcheckyourfi"];
    level.battlechatter.eventstrings["ghos"]["low_ammo"] = ["m_stat_ineedmags"];
    level.battlechatter.eventstrings["ghos"]["left"] = ["m_posn_watchleft", "m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["ghos"]["right"] = ["m_posn_watchright", "m_posn_theyreflankingright", "m_posn_checkright"];
    level.battlechatter.eventstrings["ghos"]["order_attack"] = ["m_ator_engage", "m_ator_cutemdown", "m_ator_pickemoff"];
    level.battlechatter.eventstrings["ghos"]["using_smoke"] = ["m_atac_throwingsmoke", "m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["ghos"]["using_flash"] = ["m_atac_flashout", "m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["ghos"]["using_grenade"] = ["m_atac_fragout", "m_atac_grenadeout"];
    level.battlechatter.eventstrings["ghos"]["using_molotov"] = ["m_atac_throwingmolotov", "m_atac_molotovout"];
    level.battlechatter.eventstrings["ghos"]["reloading"] = ["m_tcac_reloading", "m_tcac_changingmags"];
    level.battlechatter.eventstrings["ghos"]["moving"] = ["m_tcac_moving"];
    level.battlechatter.eventstrings["ghos"]["enemy_using_flash"] = ["m_eata_flashincoming"];
    level.battlechatter.eventstrings["ghos"]["enemy_using_grenade"] = ["m_eata_grenade", "m_eata_gettocover", "m_eata_incoming"];
    level.battlechatter.eventstrings["ghos"]["enemy_using_molotov"] = ["m_eata_molotov", "m_eata_molotovgetback"];
    level.battlechatter.eventstrings["ghos"]["enemy_using_rpg"] = ["m_eata_rpg", "m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["ghos"]["enemy_attacking"] = ["m_eata_takingeffectivefire", "m_eata_contact", "m_eata_takingfire"];
    level.battlechatter.eventstrings["ghos"]["enemy_soldier"] = ["m_enmy_targetspotted", "m_enmy_enemyhere"];
    level.battlechatter.eventstrings["ghos"]["enemy_soldiers"] = ["m_enmy_multipleenemyhere", "m_enmy_visualontheenemy", "m_enmy_multipletargetsright"];
    level.battlechatter.eventstrings["ghos"]["aquired_target"] = ["m_aqen_iseehim"];
    level.battlechatter.eventstrings["ghos"]["youre_exposed"] = ["m_exco_takecover"];
    level.battlechatter.eventstrings["ghos"]["target_covered"] = ["m_exco_hesbehindcover"];
    level.battlechatter.eventstrings["ghos"]["killfirm_bigrig"] = ["m_firm_xraydown"];
    level.battlechatter.eventstrings["ghos"]["killfirm_enemy"] = ["m_firm_sortedthatone", "m_firm_dustedem"];
    level.battlechatter.eventstrings["ghos"]["killfirm_target"] = ["m_firm_slottedem"];
    level.battlechatter.eventstrings["ghos"]["killfirm_truck"] = ["m_firm_enemytruckdestroyed", "m_firm_enemytruckisdown"];
    level.battlechatter.eventstrings["ghos"]["killfirm_helo"] = ["m_firm_gottheirhelo", "m_firm_enemyheloisdown"];
    level.battlechatter.eventstrings["ghos"]["praise"] = ["m_pras_nicelydone", "m_pras_fuckinacemate", "m_pras_thatwassoundmate"];
    level.battlechatter.eventstrings["ghos"]["wounded"] = ["m_stat_painefforttookaround"];
    level.battlechatter.eventstrings["ghos"]["enemy_sniper"] = ["m_enws_snipersonme", "m_enws_paineffortsniper"];
    level.battlechatter.eventstrings["ghos"]["checkfire"] = ["m_chck_paineffortcheckyerbl", "m_chck_paineffortdontshootm", "m_chck_paineffortcheckyourf", "m_chck_paineffortwatchyourb"];
    level.battlechatter.eventstrings["fara"]["low_ammo"] = ["c_stat_ineedmags", "c_stat_imlowonammo", "c_stat_lastmag"];
    level.battlechatter.eventstrings["fara"]["using_smoke"] = ["c_atac_throwingsmoke", "c_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["fara"]["using_flash"] = ["c_atac_flashout", "c_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["fara"]["using_grenade"] = ["c_atac_throwinggrenade", "c_atac_grenadeout"];
    level.battlechatter.eventstrings["fara"]["using_molotov"] = ["c_atac_throwingmolotov", "c_atac_molotovout"];
    level.battlechatter.eventstrings["fara"]["reloading"] = ["c_tcac_reloading", "c_tcac_loading"];
    level.battlechatter.eventstrings["fara"]["moving"] = ["c_tcac_moving"];
    level.battlechatter.eventstrings["fara"]["enemy_using_flash"] = ["c_eata_flashincoming"];
    level.battlechatter.eventstrings["fara"]["enemy_using_grenade"] = ["c_eata_grenade", "c_eata_grenademove", "c_eata_incoming"];
    level.battlechatter.eventstrings["fara"]["enemy_using_molotov"] = ["c_eata_molotov", "c_eata_molotovgetback"];
    level.battlechatter.eventstrings["fara"]["enemy_using_rpg"] = ["c_eata_rpg", "c_eata_rpgtakecover"];
    level.battlechatter.eventstrings["fara"]["enemy_attacking"] = ["c_eata_takingeffectivefire", "c_eata_contact", "c_eata_imtakingfire"];
    level.battlechatter.eventstrings["fara"]["enemy_soldier"] = ["c_enmy_enemyspotted", "c_enmy_enemyfighterhere"];
    level.battlechatter.eventstrings["fara"]["enemy_soldiers"] = ["c_enmy_hostilesspotted", "c_enmy_visualontargets", "c_enmy_multipletargets"];
    level.battlechatter.eventstrings["fara"]["aquired_target"] = ["c_aqen_enemyvisual", "c_aqen_visualontheenemy", "c_aqen_heythreatspotted"];
    level.battlechatter.eventstrings["fara"]["youre_exposed"] = ["c_exco_takecover"];
    level.battlechatter.eventstrings["fara"]["killfirm_bigrig"] = ["c_firm_targetdown"];
    level.battlechatter.eventstrings["fara"]["killfirm_enemy"] = ["c_firm_enemyisdown", "c_firm_onedead"];
    level.battlechatter.eventstrings["fara"]["killfirm_target"] = ["c_firm_theyredownmove"];
    level.battlechatter.eventstrings["fara"]["killfirm_truck"] = ["c_firm_truckdestroyed", "c_firm_enemytruckdestroyed"];
    level.battlechatter.eventstrings["fara"]["killfirm_helo"] = ["c_firm_helodestroyed", "c_firm_gottheirhelo"];
    level.battlechatter.eventstrings["fara"]["praise"] = ["c_pras_youfightlikeus", "c_pras_welldone", "c_pras_niceone"];
    level.battlechatter.eventstrings["fara"]["wounded"] = ["c_stat_imhit"];
    level.battlechatter.eventstrings["fara"]["enemy_sniper"] = ["c_enws_takingsniperfire", "c_enws_snipergotme"];
    level.battlechatter.eventstrings["fara"]["checkfire"] = ["c_chck_imonyourside", "c_chck_dontshootme", "c_chck_checkfire", "c_chck_watchyourfire"];
    level.battlechatter.eventstrings["soap"]["low_ammo"] = ["c_stat_imredonammo", "c_stat_lastmag", "c_stat_ineedmags"];
    level.battlechatter.eventstrings["soap"]["using_smoke"] = ["c_atac_throwingsmoke", "c_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["soap"]["using_flash"] = ["c_atac_flashout", "c_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["soap"]["using_grenade"] = ["c_atac_fragout", "c_atac_tossinggrenade"];
    level.battlechatter.eventstrings["soap"]["using_molotov"] = ["c_atac_throwingmolotov", "c_atac_molotovout"];
    level.battlechatter.eventstrings["soap"]["reloading"] = ["c_tcac_reloading", "c_tcac_imreloading"];
    level.battlechatter.eventstrings["soap"]["moving"] = ["c_tcac_moving"];
    level.battlechatter.eventstrings["soap"]["enemy_using_flash"] = ["c_eata_flashincoming"];
    level.battlechatter.eventstrings["soap"]["enemy_using_grenade"] = ["c_eata_grenade_01", "c_eata_incoming", "c_eata_grenade"];
    level.battlechatter.eventstrings["soap"]["enemy_using_molotov"] = ["c_eata_molotov", "c_eata_molotovgetback"];
    level.battlechatter.eventstrings["soap"]["enemy_using_rpg"] = ["c_eata_rpg", "c_eata_rpgtakecover"];
    level.battlechatter.eventstrings["soap"]["enemy_attacking"] = ["c_eata_takingeffectivefire", "c_eata_contact", "c_eata_imtakingfire"];
    level.battlechatter.eventstrings["soap"]["enemy_soldier"] = ["c_enmy_enemyinthearea", "c_enmy_enemyinthearea_01"];
    level.battlechatter.eventstrings["soap"]["enemy_soldiers"] = ["c_enmy_multiplemoversspotte", "c_enmy_threatssighted", "c_enmy_targetssighted"];
    level.battlechatter.eventstrings["soap"]["aquired_target"] = ["c_aqen_enemyfighterhere", "c_aqen_enemyhere", "c_aqen_gotonesightedhere", "c_aqen_enemyvisual"];
    level.battlechatter.eventstrings["soap"]["youre_exposed"] = ["c_exco_takecover"];
    level.battlechatter.eventstrings["soap"]["killfirm_bigrig"] = ["c_firm_targetdown"];
    level.battlechatter.eventstrings["soap"]["killfirm_enemy"] = ["c_firm_droppedem", "c_firm_enemydown"];
    level.battlechatter.eventstrings["soap"]["killfirm_target"] = ["c_firm_targetdismissed"];
    level.battlechatter.eventstrings["soap"]["killfirm_truck"] = ["c_firm_enemytruckneutralize", "c_firm_enemytruckdown"];
    level.battlechatter.eventstrings["soap"]["killfirm_helo"] = ["c_firm_heloisdown", "c_firm_gunshipdestroyed"];
    level.battlechatter.eventstrings["soap"]["praise"] = ["c_pras_brilliant", "c_pras_gieitlaldy", "c_pras_thatwaspurebarrymate"];
    level.battlechatter.eventstrings["soap"]["wounded"] = ["c_stat_imhit"];
    level.battlechatter.eventstrings["soap"]["enemy_sniper"] = ["c_enws_tookasniperround", "c_enws_snipergetdown"];
    level.battlechatter.eventstrings["soap"]["checkfire"] = ["c_chck_checkyerbloodyfire", "c_chck_dontshootmeyadaftbas", "c_chck_watchyerfire", "c_chck_shootthemnotme"];
}

