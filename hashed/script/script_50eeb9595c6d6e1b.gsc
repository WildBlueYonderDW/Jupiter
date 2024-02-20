// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using script_35de402efc5acfb3;
#using script_f4e8d02d2f70888;
#using script_433d8f78f7e5fb;
#using script_3212cc02a2700260;
#using script_5d265b4fca61f070;
#using script_77c18cdedec620b3;
#using scripts\engine\math.gsc;

#namespace namespace_40868d6c43ced754;

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d70
// Size: 0x13a
function function_f5154a3d477820d9() {
    if (function_8f59caa9212fcc56()) {
        return;
    }
    if (utility::issp() && !isalive(level.player)) {
        return;
    }
    if (function_9f810aae92ac7bf1(3) && !isdefined(self.battlechatter.var_2aa26fb8b4bf8a1) || isdefined(self.battlechatter.var_20e68057b05a543)) {
        if (!isdefined(self.battlechatter.var_2aa26fb8b4bf8a1)) {
            var_971153a5e8911fef = 999;
        } else {
            var_971153a5e8911fef = (gettime() - self.battlechatter.var_20e68057b05a543) / 1000;
        }
        self.battlechatter.var_2aa26fb8b4bf8a1 = gettime();
        self.battlechatter.var_20e68057b05a543 = undefined;
        if (var_971153a5e8911fef > 30) {
            return function_5634ad9c7902c703();
        }
    }
    self.battlechatter.var_2aa26fb8b4bf8a1 = gettime();
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10eb1
// Size: 0x112
function function_5634ad9c7902c703() {
    other = getclosestfriendlyspeaker();
    if (!isdefined(other)) {
        return;
    }
    if (utility::issp() && (!isdefined(self.enemy) || !isdefined(self.enemy.origin) || istrue(!self canshoot(self.enemy.origin + (0, 0, 40))))) {
        return;
    }
    if (function_51d76700600cebe3(40)) {
        var_be1ff2030ad6ba18 = [0:0.3, 1:"enemy_soldier", 2:&set_target, 3:other, 4:&function_d2b3539e8cdd93e7];
    } else {
        var_be1ff2030ad6ba18 = [0:0.3, 1:"enemy_soldier", 2:&set_target];
    }
    if (function_51d76700600cebe3(65)) {
        var_be1ff2030ad6ba18 = array_combine(var_be1ff2030ad6ba18, [0:other, 1:0.1, 2:"aquired_target"]);
    }
    function_93b4f17e4a3474b("aquired_target", var_be1ff2030ad6ba18);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10fca
// Size: 0xc0
function function_d2b3539e8cdd93e7() {
    if (!isdefined(self.speaker) || !isdefined(self.var_6727329a89208345) || !isdefined(self.speaker.enemy)) {
        return;
    }
    direction = self.var_6727329a89208345 function_3893e3db7e7694d5(self.var_6727329a89208345.enemy);
    if (!isdefined(direction)) {
        return;
    }
    if (!self.speaker seerecently(self.speaker.enemy, 3)) {
        return [0:0.4, 1:"neg_target", 2:self.var_6727329a89208345, 3:0.2, 4:direction];
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11091
// Size: 0x27
function function_6de481ebc9a12469() {
    var_be1ff2030ad6ba18 = function_f06047156c190734();
    if (!isdefined(var_be1ff2030ad6ba18)) {
        return;
    }
    function_93b4f17e4a3474b("order_attack", var_be1ff2030ad6ba18);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110bf
// Size: 0xb4
function function_f06047156c190734() {
    other = getclosestfriendlyspeaker();
    if (!isdefined(other)) {
        return;
    }
    var_185936c4e070c511 = other function_2008b43adf7e18ef();
    if (function_51d76700600cebe3(30)) {
        var_185936c4e070c511 = 0;
    }
    if (function_51d76700600cebe3(40)) {
        var_be1ff2030ad6ba18 = [0:var_185936c4e070c511, 1:"order_attack", 2:other, 3:0.3, 4:"copy", 5:0.1, 6:"attacking"];
    } else {
        var_be1ff2030ad6ba18 = [0:var_185936c4e070c511, 1:"order_attack", 2:other, 3:0.2, 4:&function_e5312c6dfa471fdb];
    }
    return var_be1ff2030ad6ba18;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1117b
// Size: 0x22
function function_e5312c6dfa471fdb() {
    return ter_op(self.speaker recentlysawenemy(), "aquired_target", "target_covered");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x111a5
// Size: 0xbf
function function_a06c6f8b2f6d82d0(direction) {
    if (self.enemy isnear(self, level.var_fb605061a3778884)) {
        return;
    }
    if (!function_45f570789ff9a0fd(5, 1)) {
        return;
    }
    if (!isdefined(direction)) {
        direction = function_3893e3db7e7694d5(self.enemy);
    }
    if (!isdefined(direction) || direction == "ahead") {
        return;
    }
    var_be1ff2030ad6ba18 = [0:direction, 1:&set_target];
    other = getclosestfriendlyspeaker();
    if (isdefined(other)) {
        return 0;
    }
    var_be1ff2030ad6ba18 = array_combine(var_be1ff2030ad6ba18, [0:other, 1:0.1, 2:&function_e5312c6dfa471fdb]);
    function_93b4f17e4a3474b("enemy_direction", var_be1ff2030ad6ba18);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1126b
// Size: 0x174
function function_3893e3db7e7694d5(target) {
    if (!isdefined(target) || !isdefined(target.origin) || !isdefined(target.team)) {
        return;
    }
    if (target.origin[2] > self.origin[2] + 100) {
        return "high";
    }
    allies = function_fd9e4cb348a5f283(self.origin, level.var_63a73645a8e030ad, self.team);
    if (self.team == "allies") {
        allies = array_combine(allies, function_2aa175082bdb56f5(self.origin, level.var_798aa343368f724e));
    }
    if (allies.size == 0) {
        return;
    }
    var_8005708c7112c01d = get_average_origin(allies);
    var_d5f00d2293024573 = vectornormalize(function_7969d683dfc4fb9e(allies));
    var_53b34aadf7b8e731 = vectornormalize(target.origin - var_8005708c7112c01d);
    dotproduct = vectordot(var_53b34aadf7b8e731, var_d5f00d2293024573);
    if (dotproduct > 0.95) {
        return "ahead";
    }
    if (dotproduct < -0.1) {
        return "behind";
    }
    right = vectorcross((0, 0, 1), var_d5f00d2293024573);
    dotproduct = vectordot(var_53b34aadf7b8e731, right);
    return ter_op(dotproduct < 0, "right", "left");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x113e7
// Size: 0x19b
function function_a1b5ccd038b58c59(start, end, color, var_cdc08c2c59a55365, var_b7973e4dba31564c, var_3f809d1940bbae5c, depthtest, duration) {
    angle = vectortoangles(end - start);
    var_46f432042b3473d8 = length(end - start);
    if (isdefined(var_3f809d1940bbae5c) && var_3f809d1940bbae5c <= 1) {
        var_3f809d1940bbae5c = var_46f432042b3473d8 * var_3f809d1940bbae5c;
    }
    right = anglestoright(angle);
    forward = anglestoforward(angle);
    var_cdc08c2c59a55365 = function_53c4c53197386572(var_cdc08c2c59a55365, 2);
    var_b7973e4dba31564c = function_53c4c53197386572(var_b7973e4dba31564c, var_cdc08c2c59a55365 * 4);
    var_3f809d1940bbae5c = function_53c4c53197386572(var_3f809d1940bbae5c, var_b7973e4dba31564c * 3);
    depthtest = function_53c4c53197386572(depthtest, 1);
    duration = function_53c4c53197386572(duration, 1);
    var_3a7377042d23723c = start + forward * (var_46f432042b3473d8 - var_3f809d1940bbae5c);
    arrow = [0:end];
    arrow[arrow.size] = var_3a7377042d23723c + right * var_b7973e4dba31564c / 2;
    arrow[arrow.size] = var_3a7377042d23723c + right * var_cdc08c2c59a55365 / 2;
    arrow[arrow.size] = start + right * var_cdc08c2c59a55365 / 2;
    arrow[arrow.size] = start - right * var_cdc08c2c59a55365 / 2;
    arrow[arrow.size] = var_3a7377042d23723c - right * var_cdc08c2c59a55365 / 2;
    arrow[arrow.size] = var_3a7377042d23723c - right * var_b7973e4dba31564c / 2;
    for (p = 0; p < arrow.size; p++) {
        /#
            line(arrow[p], arrow[(p + 1) % arrow.size], color, 1, depthtest, duration);
        #/
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11589
// Size: 0x90
function get_average_origin(guys, max_count) {
    max_count = function_53c4c53197386572(max_count, guys.size);
    origins = [];
    foreach (guy in guys) {
        if (origins.size >= max_count) {
            break;
        }
        origins[origins.size] = guy.origin;
    }
    return averagepoint(origins);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11621
// Size: 0xb1
function function_7969d683dfc4fb9e(guys, max_count) {
    max_count = function_53c4c53197386572(max_count, guys.size);
    var_4f8bf27d0fadf637 = [];
    foreach (guy in guys) {
        if (var_4f8bf27d0fadf637.size >= max_count) {
            break;
        }
        if (isdefined(guy.node)) {
            guy = guy.node;
        }
        var_4f8bf27d0fadf637[var_4f8bf27d0fadf637.size] = anglestoforward(guy.angles);
    }
    return averagenormal(var_4f8bf27d0fadf637);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116da
// Size: 0xe4
function function_8d862c3d37cb8ebd(enemy) {
    if (!isdefined(enemy) || !isdefined(enemy.origin) || !isdefined(enemy.team) || !isai(enemy) || isbot(enemy)) {
        return 0;
    }
    if (isdefined(enemy.battlechatter) && istrue(enemy.battlechatter.var_d611e2f69fa1cac4)) {
        return 0;
    }
    if (!enemy seerecently(self, 5)) {
        return 0;
    }
    var_9d683edc4be7acce = enemy getclosestfriendlyspeaker();
    var_92efd1e1e657aee9 = isalive(var_9d683edc4be7acce) && var_9d683edc4be7acce isnear(enemy, level.var_798aa343368f724e);
    if (!var_92efd1e1e657aee9) {
        return 0;
    }
    if (!function_2aa175082bdb56f5(enemy.origin, level.var_63a73645a8e030ad).size > 0) {
        return 0;
    }
    return 1;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117c6
// Size: 0xf4
function function_771bace1bff17684() {
    self endon("death");
    self endon("bcs_stateChange");
    if (is_dead_or_dying(self)) {
        return;
    }
    if (!function_ead4bed232d015ed("target_getting_cover") || !function_ead4bed232d015ed("enemy_getting_cover")) {
        return;
    }
    enemy = self.enemy;
    if (function_8d862c3d37cb8ebd(enemy)) {
        return enemy function_93b4f17e4a3474b("target_getting_cover", [0:"target_getting_cover"]);
    }
    var_eb835b5fde3371bd = function_e457176b043f3f8b();
    if (isdefined(var_eb835b5fde3371bd) && var_eb835b5fde3371bd.size > 0) {
        foreach (var_92376eb4e2dcce2b in var_eb835b5fde3371bd) {
            if (function_8d862c3d37cb8ebd(var_92376eb4e2dcce2b)) {
                return var_92376eb4e2dcce2b function_93b4f17e4a3474b("enemy_getting_cover", [0:"enemy_getting_cover"]);
            }
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118c1
// Size: 0xb5
function function_402ee78fe1df3ace() {
    self endon("death");
    self endon("bcs_stateChange");
    if (is_dead_or_dying(self) || isdefined(self.battlechatter) && istrue(self.battlechatter.var_d611e2f69fa1cac4)) {
        return;
    }
    wait(0.5);
    enemy = self.enemy;
    if (!isdefined(enemy) || !isdefined(enemy.origin) || !isdefined(enemy.team)) {
        return;
    }
    if (!function_ead4bed232d015ed("getting_cover")) {
        return;
    }
    if (!function_45f570789ff9a0fd(5, 1)) {
        return;
    }
    return function_93b4f17e4a3474b("getting_cover", [0:"getting_cover"]);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1197e
// Size: 0x11b
function function_c5ece4fa44d2894e() {
    allies = function_fd9e4cb348a5f283(self.origin, level.var_798aa343368f724e, self.team);
    foreach (ally in allies) {
        if (ally == self) {
            continue;
        }
        if (!isdefined(ally.node) || !isdefined(ally.node.type) || ally.node.type == "Exposed 3D" || ally.node.type == "Path 3D") {
            var_782921312b88fd8f = ally function_2008b43adf7e18ef();
            return function_93b4f17e4a3474b("ally_exposure", [0:var_782921312b88fd8f, 1:0.1, 2:"youre_exposed"]);
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11aa0
// Size: 0x2a
function function_859d741dc99bf1a4() {
    maxhealth = function_53c4c53197386572(self.maxhealth, 100);
    return self.health < maxhealth;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ad2
// Size: 0x87
function function_16c83724c6b1446d(enemy) {
    enemy = function_53c4c53197386572(enemy, self.enemy);
    if (!function_45f570789ff9a0fd(5, 1)) {
        return;
    }
    enemy_weapon = enemy get_weapon();
    if (!isdefined(enemy_weapon)) {
        return;
    }
    var_be2008030ad6ea7a = function_1609ef297b7a32cf(enemy, "target_" + enemy_weapon, "enemy_" + enemy_weapon);
    return function_93b4f17e4a3474b("enemy_weapon", [0:0.3, 1:var_be2008030ad6ea7a, 2:&set_target]);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b61
// Size: 0xe4
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
        break;
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c4c
// Size: 0xbe
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d12
// Size: 0x56
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d70
// Size: 0x90
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e08
// Size: 0x99
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
            break;
        }
    } else {
        return undefined;
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ea8
// Size: 0x7e
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f2e
// Size: 0x24e
function function_656c8ba582163660(type, var_7cf0530cd57b14) {
    if (!isdefined(type) || !isstring(type)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("sniper");
            }
        #/
        return;
    }
    var_58686d35610dc65 = isai(self);
    var_cd10f4029aaf6c37 = function_e12a23f3c8aa65bb(type);
    if (var_58686d35610dc65 && function_5d6cfae8ba773d66(self)) {
        if (isdefined(var_cd10f4029aaf6c37)) {
            sequence = [0:self, 1:var_cd10f4029aaf6c37];
            if (istrue(var_7cf0530cd57b14)) {
                var_776811fd7338978c = function_7846ced6c23280a9(type);
                var_88e1555f4a402ea5 = function_d8c3c539bc71c7af(self.team);
                if (isdefined(var_88e1555f4a402ea5) && isdefined(var_776811fd7338978c)) {
                    sequence = [0:var_88e1555f4a402ea5, 1:var_776811fd7338978c, 2:self, 3:var_cd10f4029aaf6c37];
                } else {
                    /#
                        if (getdvarint(@"hash_864d3ab12f741516")) {
                            function_51c8ea07cf76cbd7("reply_okay" + type + "ai_inside_solo_radius");
                        }
                    #/
                }
            }
            function_93b4f17e4a3474b("use_" + type, sequence, level.battlechatter.settings["use_"]);
        } else {
            /#
                if (getdvarint(@"hash_864d3ab12f741516")) {
                    function_51c8ea07cf76cbd7("finished_or_cancelled" + type + "ai_inside_solo_radius");
                }
            #/
        }
    }
    var_32ffe93e49cf51c0 = function_b4d191cb892d2ed9(type);
    if (isdefined(var_32ffe93e49cf51c0)) {
        var_4acfa36a6dd8b797 = 0.5;
        if (var_58686d35610dc65) {
            var_e8276998c5e311d9 = function_8db2aa6f0377958(undefined, undefined, 1, undefined, var_4acfa36a6dd8b797);
        } else {
            var_eb835b5fde3371bd = function_74b5af7f20c85724(self.origin, undefined, self.team);
            var_e8276998c5e311d9 = function_b1ab02cfbfd12e43(var_eb835b5fde3371bd, undefined, undefined, 1, var_4acfa36a6dd8b797);
        }
        if (isdefined(var_e8276998c5e311d9) && isai(var_e8276998c5e311d9)) {
            var_e8276998c5e311d9 function_93b4f17e4a3474b("enemy_using_" + type, var_32ffe93e49cf51c0, level.battlechatter.settings["enemy_using_"]);
        }
    } else {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("area_clear" + type + "ai_inside_solo_radius");
            }
        #/
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12183
// Size: 0x20f
function function_cffa856196d037ae(grenade) {
    if (!isdefined(grenade)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("report_nothing");
            }
        #/
        return;
    }
    objweapon = grenade.weapon_object;
    if (!isdefined(objweapon)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("comb_fulld_enemy_cover");
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
                function_51c8ea07cf76cbd7("s_wrnk_heyiwarnedyou");
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
                function_51c8ea07cf76cbd7("c_atac_usingflashgrenade");
            }
        #/
        return;
    }
    var_96e268f0039be2bd = fusetime / 1000 - 1.5;
    var_96e268f0039be2bd = max(var_96e268f0039be2bd, 0);
    wait(var_96e268f0039be2bd);
    dangerradius = function_53c4c53197386572(getgrenadedamageradius(objweapon), 100);
    var_ef8f7e66dc0feb2c = grenade.origin;
    var_8c63e160ff1b629d = function_74b5af7f20c85724(var_ef8f7e66dc0feb2c, dangerradius, ownerteam);
    if (isdefined(var_8c63e160ff1b629d) && var_8c63e160ff1b629d.size > 0) {
        var_4005592fa1462834 = function_b1ab02cfbfd12e43(var_8c63e160ff1b629d);
        if (isdefined(var_4005592fa1462834)) {
            var_cc22949a3adbc834 = "enemy_grenade_close";
            if (var_8c63e160ff1b629d.size > 1) {
                var_cc22949a3adbc834 = "team_enemy_grenade_close";
            }
            var_4005592fa1462834 function_93b4f17e4a3474b("grenade_danger", var_cc22949a3adbc834, level.battlechatter.settings["grenade_danger"]);
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12399
// Size: 0xb0
function function_373aa775ac5f550c(type) {
    if (!isdefined(type) || !isstring(type)) {
        /#
            if (getdvarint(@"hash_864d3ab12f741516")) {
                function_51c8ea07cf76cbd7("c_etca_theenemyistakingcove");
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
                function_51c8ea07cf76cbd7("c_exco_anenemyisintheopen" + type + "c_stat_whohasanothermagazin");
            }
        #/
        return;
    }
    function_93b4f17e4a3474b("hurt_by_" + type, var_cc22949a3adbc834, level.battlechatter.settings["hurt_by_"]);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12450
// Size: 0xb6
function function_a3b5180187a17623() {
    self endon("death");
    if (utility::issp() && !isalive(level.player)) {
        return;
    }
    wait(0.3);
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1250d
// Size: 0x10f
function function_f25a368b5b190924(var_feadede69284e4f2) {
    if (!isdefined(var_feadede69284e4f2)) {
        return;
    }
    if (var_feadede69284e4f2 == "target_wounded") {
        if (function_51d76700600cebe3(50)) {
            function_93b4f17e4a3474b("target_wounded", "wounded_target");
        } else {
            ally = function_d8c3c539bc71c7af(self.team);
            if (isdefined(ally)) {
                var_be1ff2030ad6ba18 = [0:ally, 1:"ask_target_wounded", 2:0.2, 3:self, 4:"wounded_target"];
                function_93b4f17e4a3474b("target_wounded", var_be1ff2030ad6ba18);
            }
        }
    } else if (var_feadede69284e4f2 == "target_unhurt") {
        if (function_51d76700600cebe3(50)) {
            function_93b4f17e4a3474b("target_unhurt", "target_unhurt");
        } else {
            ally = function_d8c3c539bc71c7af(self.team);
            if (isdefined(ally)) {
                var_be1ff2030ad6ba18 = [0:ally, 1:"ask_target_wounded", 2:0.2, 3:self, 4:"target_unhurt"];
                function_93b4f17e4a3474b("target_unhurt", var_be1ff2030ad6ba18);
            }
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12623
// Size: 0x18a
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
    if (function_51d76700600cebe3(15)) {
        var_80cbe5eacee17577 = function_2008b43adf7e18ef();
        var_6341aa6491f84cca = [0:ally, 1:var_80cbe5eacee17577, 2:"ask_low_ammo"];
        var_c5525bbc1964db31 = [];
        var_f33cee0439636b57 = clipammo / clipsize;
        if (var_f33cee0439636b57 <= 0.3) {
            if (function_51d76700600cebe3(50)) {
                var_c5525bbc1964db31 = [0:0.2, 1:self, 2:"reply_low_ammo"];
            } else {
                var_c5525bbc1964db31 = [0:0.2, 1:self, 2:"low_ammo"];
            }
        } else {
            var_c5525bbc1964db31 = [0:0.2, 1:self, 2:"reply_okay", 3:0.2, 4:ally, 5:"reply_keepshooting"];
        }
        sequence = array_combine(var_6341aa6491f84cca, var_c5525bbc1964db31);
        function_93b4f17e4a3474b("ammo_status", sequence);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x127b4
// Size: 0x3
function function_8bdff60054ce5866() {
    
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127be
// Size: 0x1aa
function function_c4e2e61a7ce330c0() {
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
    if (function_ead4bed232d015ed("enemy_reloading")) {
        if (isplayer(self)) {
            enemies = function_fd9e4cb348a5f283(self.origin, level.var_587de0e7b537210a, "axis");
        } else {
            enemies = function_e457176b043f3f8b();
        }
    }
    foreach (enemy in enemies) {
        if (utility::issp() && isplayer(self) && !enemy canshoot(self.origin + (0, 0, 40))) {
            continue;
        }
        if (is_equal(enemy.enemy, self) && enemy seerecently(self, 5)) {
            var_be1ff2030ad6ba18 = [0:0.3, 1:function_1609ef297b7a32cf(enemy, "target_reloading", "enemy_reloading")];
            if (function_51d76700600cebe3(60)) {
                var_f06047156c190734 = enemy function_f06047156c190734();
                if (isdefined(var_f06047156c190734)) {
                    var_be1ff2030ad6ba18 = array_combine(var_be1ff2030ad6ba18, var_f06047156c190734);
                }
            }
            enemy function_93b4f17e4a3474b("enemy_reloading", var_be1ff2030ad6ba18);
            return;
        }
    }
    function_93b4f17e4a3474b("reloading", "reloading");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1296f
// Size: 0x124
function function_56e490b1816855eb(var_cac102b2d7b66836, var_41f0b8e7a4d79253) {
    self endon("removed from battleChatter");
    self endon("death");
    self endon("bcs_stateChange");
    if (!isalive(var_cac102b2d7b66836)) {
        return;
    }
    if (function_8f59caa9212fcc56()) {
        return;
    }
    if (!function_ead4bed232d015ed("enemy_movement_" + var_41f0b8e7a4d79253)) {
        return;
    }
    enemies = function_e457176b043f3f8b();
    if (enemies.size == 0) {
        return;
    }
    sequence = undefined;
    if (self seerecently(var_cac102b2d7b66836, 5)) {
        switch (var_41f0b8e7a4d79253) {
        case #"hash_184bba7053cc1c15":
            sequence = [0:self, 1:"target_moving_up", 2:0.7];
            break;
        case #"hash_a64459fb02c72b3e":
            sequence = [0:self, 1:"target_moving_up", 2:0.7];
            break;
        case #"hash_20cd76d83c2f7487":
            sequence = [0:self, 1:"target_moving", 2:0.7];
            break;
        default:
            return;
        }
    }
    if (isdefined(sequence)) {
        function_93b4f17e4a3474b("enemy_movement_" + var_41f0b8e7a4d79253, sequence);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a9a
// Size: 0x2e8
function function_42c77c7f13a1beb8(var_12853466ce806612) {
    if (utility::issp() && !isalive(level.player)) {
        return;
    }
    if (function_8f59caa9212fcc56()) {
        return;
    }
    if (!function_ead4bed232d015ed("enemy_movement")) {
        var_12853466ce806612 = 0;
    }
    enemies = function_e457176b043f3f8b();
    if (enemies.size == 0) {
        return;
    }
    var_d40324edc38301c9 = get_average_origin(enemies);
    var_a2bde827fd591515 = var_d40324edc38301c9 - self.origin;
    var_aeb1cf2a75782056 = self.goalpos - self.origin;
    dotproduct = function_c1aa7c066ec92ca5(var_a2bde827fd591515, var_aeb1cf2a75782056);
    if (function_53c4c53197386572(var_12853466ce806612, 1)) {
        foreach (enemy in enemies) {
            if (isplayer(enemy)) {
                continue;
            }
            if (is_equal(enemy.enemy, self) && enemy seerecently(self, 5)) {
                if (dotproduct > 0.65) {
                    var_be1ff2030ad6ba18 = function_1609ef297b7a32cf(enemy, "target_moving_up", "enemy_moving_up");
                } else {
                    var_be1ff2030ad6ba18 = function_1609ef297b7a32cf(enemy, "target_moving", "enemy_moving");
                }
                if (function_51d76700600cebe3(60)) {
                    var_f06047156c190734 = enemy function_f06047156c190734();
                    if (isdefined(var_f06047156c190734)) {
                        var_be1ff2030ad6ba18 = array_insert(var_f06047156c190734, var_be1ff2030ad6ba18, 0);
                    }
                }
                enemy function_93b4f17e4a3474b("enemy_movement", var_be1ff2030ad6ba18);
                return;
            }
        }
    }
    guy1 = self;
    guy2 = function_d8c3c539bc71c7af(self.team);
    var_c266d2aa4e2eaad7 = ter_op(dotproduct > 0.65, "movingup", "moving");
    if (var_c266d2aa4e2eaad7 == "movingup") {
        var_efeb4d8361b85fac = "moveup";
    } else {
        var_efeb4d8361b85fac = "move";
    }
    if (isdefined(guy2) && function_51d76700600cebe3(65)) {
        var_948d565f600a3ed3 = guy1 function_2008b43adf7e18ef();
        if (function_51d76700600cebe3(30)) {
            var_948d565f600a3ed3 = 0;
        }
        var_be1ff2030ad6ba18 = [0:guy2, 1:0.1, 2:var_948d565f600a3ed3, 3:0.2, 4:var_efeb4d8361b85fac, 5:guy1, 6:0.2, 7:var_c266d2aa4e2eaad7];
    } else {
        var_be1ff2030ad6ba18 = var_c266d2aa4e2eaad7;
    }
    if (isdefined(guy2) && guy2 function_9f810aae92ac7bf1(3)) {
        var_be1ff2030ad6ba18 = [0:var_be1ff2030ad6ba18, 1:0.2, 2:"coverme", 3:guy2, 4:0.3, 5:"suppressing"];
    }
    function_93b4f17e4a3474b("ally_movement", var_be1ff2030ad6ba18);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d89
// Size: 0x190
function function_453b3867c6ec0ceb(enemy, team, type) {
    wait(0.6);
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
        sequence = [0:0.4, 1:"praise"];
        name = "player_killfirm";
    } else if (function_51d76700600cebe3(30)) {
        sequence = [0:0.4, 1:sequence, 2:0.25, 3:other, 4:"praise"];
    } else {
        sequence = [0:0.4, 1:sequence];
    }
    if (!isalive(speaker)) {
        return;
    }
    if (name == "player_killfirm") {
        speaker function_93b4f17e4a3474b(name, sequence, level.battlechatter.settings["player_killfirm"]);
    } else {
        speaker function_93b4f17e4a3474b(name, sequence, level.battlechatter.settings["killfirm"]);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f20
// Size: 0x10b
function function_f649c4ef3acdec1d(team) {
    wait(0.7);
    if (!isdefined(self) || !isdefined(team) || team == "dead") {
        return;
    }
    if (utility::issp()) {
        speaker = getclosestfriendlyspeaker(team, "combat", 1);
    } else {
        speaker = getclosestfriendlyspeaker(team, "combat", 0);
    }
    var_b6606917990cd887 = function_8271e180c87b8970();
    if (!isdefined(speaker)) {
        return;
    }
    if (!speaker function_ead4bed232d015ed("casualty")) {
        speaker function_93b4f17e4a3474b("casualties", "casualties");
        return;
    }
    if (isdefined(var_b6606917990cd887)) {
        if (cointoss()) {
            sequence = [0:0.4, 1:var_b6606917990cd887];
        } else {
            sequence = [0:0.4, 1:var_b6606917990cd887, 2:0.5, 3:"casualty"];
        }
    } else {
        sequence = [0:0.4, 1:"casualty"];
    }
    speaker function_93b4f17e4a3474b("casualty", sequence);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13032
// Size: 0x8b
function function_d8ed6827953bcac2() {
    self endon("death");
    wait(0.15);
    if (isdefined(self.var_261aaf24a09d231d)) {
        foreach (var_5564a66c3ec1c07b in self.var_261aaf24a09d231d) {
            if (!istrue(var_5564a66c3ec1c07b.var_79498adf23c51e6a)) {
                return;
            }
        }
    }
    function_93b4f17e4a3474b("friendlyfire", "checkfire");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130c4
// Size: 0x2e
function function_45b841e13dd6cf9c(root, suffix) {
    var_b6606917990cd887 = getname();
    if (!isdefined(var_b6606917990cd887)) {
        return;
    }
    return root + var_b6606917990cd887;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130fa
// Size: 0xa6
function function_8271e180c87b8970() {
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.countryid) && (isstartstr(self.battlechatter.countryid, "AQ") || isstartstr(self.battlechatter.countryid, "CTM") || isstartstr(self.battlechatter.countryid, "PMC"))) {
        return function_45b841e13dd6cf9c("c_canm_");
    } else {
        return function_45b841e13dd6cf9c("c_cbnm_");
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131a7
// Size: 0xa6
function function_2008b43adf7e18ef() {
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.countryid) && (isstartstr(self.battlechatter.countryid, "AQ") || isstartstr(self.battlechatter.countryid, "CTM") || isstartstr(self.battlechatter.countryid, "PMC"))) {
        return function_45b841e13dd6cf9c("c_ator");
    } else {
        return function_45b841e13dd6cf9c("c_cbnm_");
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13254
// Size: 0xe
function function_7e6d670c76d60628() {
    return function_45b841e13dd6cf9c("s_idnm_");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1326a
// Size: 0xa6
function function_472b1d721b3b7618() {
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.countryid) && (isstartstr(self.battlechatter.countryid, "AQ") || isstartstr(self.battlechatter.countryid, "CTM") || isstartstr(self.battlechatter.countryid, "PMC"))) {
        return function_45b841e13dd6cf9c("s_idcn_");
    } else {
        return function_45b841e13dd6cf9c("s_idnm_");
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13317
// Size: 0xe
function function_3e144fda9848fd5() {
    return function_45b841e13dd6cf9c("s_hnnm_");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1332d
// Size: 0xe
function function_479fa1bceacac04b() {
    return function_45b841e13dd6cf9c("s_alcn_its");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13343
// Size: 0x3e3
function function_f06007e1f432ce27() {
    if (!isdefined(self.team) || self.team == "dead") {
        return;
    }
    if (function_ead4bed232d015ed("status_report")) {
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
        aliases = function_ac566e2d34bccaa2("idle_conv");
        if (!isdefined(aliases)) {
            return;
        }
        var_7f9bb0b911c426bc = [];
        var_7f0f9e1b37721777 = 1;
        foreach (alias in aliases) {
            var_7f9bb0b911c426bc[var_7f9bb0b911c426bc.size] = randomfloatrange(0.5, 1);
            var_7f9bb0b911c426bc[var_7f9bb0b911c426bc.size] = alias;
            var_7f9bb0b911c426bc[var_7f9bb0b911c426bc.size] = guys[var_7f0f9e1b37721777];
            var_7f0f9e1b37721777 = !var_7f0f9e1b37721777;
        }
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("idle_convo", var_7f9bb0b911c426bc, undefined, [0:"stealth_investigate", 1:"stealth_combat", 2:"outside_convo_dist"]);
        if (isdefined(var_3a7aea3989ae851a) && isstruct(var_3a7aea3989ae851a)) {
            var_3a7aea3989ae851a thread function_749f5c9deca36473("idle_convo", guys);
        }
    } else {
        var_75be11c0a0a035dc = function_fd9e4cb348a5f283(self.origin, level.var_d809dc9f8a466642, self.team);
        var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
        if (var_542b15e7d1da2adb == 1) {
            aliases = function_ac566e2d34bccaa2("idle_solo");
            if (!isdefined(aliases)) {
                return;
            }
            var_f1b8ad2dd240f13 = function_573b9ff9ed152518(self, 0);
            var_703183f87b6cf0e2 = [0:self, 1:var_f1b8ad2dd240f13];
            var_b1a50b07377f7752 = 1;
            sequence = [];
            foreach (alias in aliases) {
                sequence[sequence.size] = randomfloatrange(0.5, 1);
                sequence[sequence.size] = alias;
                sequence[sequence.size] = var_703183f87b6cf0e2[var_b1a50b07377f7752];
                var_b1a50b07377f7752 = !var_b1a50b07377f7752;
            }
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("idle", sequence, undefined, [0:"stealth_investigate", 1:"stealth_combat", 2:"ai_inside_solo_radius"]);
            if (isdefined(var_3a7aea3989ae851a) && isstruct(var_3a7aea3989ae851a)) {
                var_3a7aea3989ae851a thread function_749f5c9deca36473("idle_solo", guys);
            }
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1372d
// Size: 0x1f1
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
                guys[0] function_e23b0906b02cd179("idle_convo", level.var_dafa42d7384e9ef5);
                /#
                    if (getdvarint(@"hash_864d3ab12f741516")) {
                        function_51c8ea07cf76cbd7("c_stat_areyougoodbrother" + namespace_d8bd5ac27a00a48d::function_600b37e8cf3f2de9(guys[0]) + "c_enws_theyhaveamachinegunn" + namespace_d8bd5ac27a00a48d::function_600b37e8cf3f2de9(guys[1]));
                    }
                #/
                return;
            }
        } else if (event == "idle_solo") {
            var_75be11c0a0a035dc = function_fd9e4cb348a5f283(guys[0].origin, level.var_d809dc9f8a466642, guys[0].team);
            var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
            if (var_542b15e7d1da2adb > 1) {
                guys[0] notify("ai_inside_solo_radius");
                guys[0] function_e23b0906b02cd179("idle", level.var_dafa42d7384e9ef5);
                /#
                    if (getdvarint(@"hash_864d3ab12f741516")) {
                        function_51c8ea07cf76cbd7("c_enws_oneofthemhasashotgun" + namespace_d8bd5ac27a00a48d::function_600b37e8cf3f2de9(guys[0]));
                    }
                #/
                return;
            }
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13925
// Size: 0x56
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13982
// Size: 0x1f1
function function_1e4f162bf544387() {
    if (!isdefined(level.stealth) || istrue(level.var_b8b68f147d0eeb36)) {
        return;
    }
    sequence = [];
    agent = self;
    leader = function_592f13f1a0e078ff(agent);
    var_b6606917990cd887 = agent function_7e6d670c76d60628();
    if (isdefined(var_b6606917990cd887) && function_51d76700600cebe3(60)) {
        sequence = array_combine(sequence, [0:leader, 1:0.1, 2:var_b6606917990cd887]);
    }
    if (function_51d76700600cebe3(60)) {
        sequence = array_combine(sequence, [0:leader, 1:0.15, 2:"ask_how_copy", 3:agent, 4:0.15, 5:"reply_hear_you"]);
    }
    var_a4a81419d5dc1a07 = random([0:"report_idle", 1:"ask_found_anything"]);
    sequence = array_combine(sequence, [0:leader, 1:0.2, 2:var_a4a81419d5dc1a07, 3:agent, 4:0.3, 5:"report_reply_idle", 6:leader, 7:0.1, 8:"confirming"]);
    if (function_51d76700600cebe3(40)) {
        var_e58fa9c1fffeee86 = undefined;
        if (function_16dce705f14f4b84() == "hunt") {
            var_e58fa9c1fffeee86 = random([0:"order_continue_search", 1:"order_find_target", 2:"order_find_perimeter"]);
        } else {
            var_e58fa9c1fffeee86 = random([0:"order_stay_alert", 1:"good_hunting", 2:"signoff"]);
        }
        if (isdefined(var_e58fa9c1fffeee86)) {
            sequence = array_combine(sequence, [0:leader, 1:0.2, 2:var_e58fa9c1fffeee86]);
        }
    }
    agent function_93b4f17e4a3474b("status_report", sequence, undefined, [0:"stealth_investigate", 1:"stealth_combat"]);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b7a
// Size: 0x7e
function function_e3a09ac9c428dbea(array) {
    foreach (guy in array) {
        if (guy == self || !isdefined(guy.battlechatter)) {
            continue;
        }
        if (guy function_16dce705f14f4b84() == "combat") {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13c00
// Size: 0x62
function private function_e8cbb4eef70a6e9c() {
    if (isdefined(self.owner.closest_ally)) {
        return self.owner.closest_ally;
    } else if (isdefined(self.owner.team)) {
        return getclosestfriendlyspeaker(self.owner.team);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13c69
// Size: 0x292
function function_842319303719440c(radio) {
    allies = function_fd9e4cb348a5f283(self.origin, level.var_587de0e7b537210a, self.team);
    allies = array_remove(allies, self);
    closest_ally = sortbydistance(allies, self.origin)[0];
    radio.closest_ally = closest_ally;
    if (isdefined(closest_ally)) {
        var_782921312b88fd8f = closest_ally function_7e6d670c76d60628();
    } else {
        var_782921312b88fd8f = 0;
    }
    sequence = 0;
    if (utility::issp()) {
        var_328a443cdfe40d7 = function_479fa1bceacac04b();
        sequence = [0:1.5, 1:&function_607fd7b62a18e9dc, 2:"react_noreply", 3:&function_c315a1b81d2e3288, 4:0.7, 5:&function_607fd7b62a18e9dc, 6:var_782921312b88fd8f, 7:0.3, 8:&function_607fd7b62a18e9dc, 9:var_328a443cdfe40d7, 10:0.1, 11:&function_607fd7b62a18e9dc, 12:"inv_no_response", 13:0.3, 14:&function_607fd7b62a18e9dc];
        if (!is_dead_or_dying(closest_ally) && isdefined(closest_ally.fnsetstealthstate)) {
            if (!istrue(level.var_2b9d0f1e2beb4de2) || !closest_ally function_abc132c5c51197c9(self.origin)) {
                sequence2 = [0:"order_stay_alert", 1:&function_e8cbb4eef70a6e9c, 2:0.2, 3:&function_1e0fd010aa69762d, 4:"confirming"];
            } else {
                sequence2 = [0:"order_get_visual", 1:0.2, 2:&function_c7da930cd7ba754f, 3:&function_e8cbb4eef70a6e9c, 4:&function_64d791a1d9d155b1, 5:0.1, 6:&function_1e0fd010aa69762d, 7:"moving_there"];
            }
            sequence = array_combine(sequence, sequence2);
        }
    } else {
        order = ter_op(function_16dce705f14f4b84() == "combat", "order_stay_alert", "order_stay_aware");
        sequence = [0:1.5, 1:&function_607fd7b62a18e9dc, 2:"react_noreply", 3:&function_c315a1b81d2e3288, 4:0.7, 5:&function_607fd7b62a18e9dc, 6:var_782921312b88fd8f, 7:0.3, 8:&function_607fd7b62a18e9dc, 9:"report_alert", 10:0.2, 11:order];
    }
    return sequence;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f03
// Size: 0x8b
function function_607fd7b62a18e9dc() {
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f96
// Size: 0xc9
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
    self.var_5c1322185369efcd = guy;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14066
// Size: 0x38
function function_c7da930cd7ba754f() {
    if (is_dead_or_dying(self.sequence[self.index])) {
        return [0:1.5, 1:"ally_missing_multi", 2:undefined];
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140a5
// Size: 0x34
function function_c315a1b81d2e3288() {
    parent = self.speaker.var_868e98cf48b92cfb;
    if (isdefined(parent)) {
        parent.var_6ef5f7ac4d441cbb = 1;
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140e0
// Size: 0x63
function function_64d791a1d9d155b1() {
    thread function_4dc52e4105914357();
    self.owner.battlechatter.npcid = self.speaker.battlechatter.npcid;
    self.owner.battlechatter.var_37962ca7989c729a = undefined;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1414a
// Size: 0xdd
function function_4dc52e4105914357() {
    self.speaker endon("stealth_combat");
    self.speaker endon("stealth_update_investigate");
    corpse = self.owner.var_868e98cf48b92cfb;
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1422e
// Size: 0x57
function function_abc132c5c51197c9(target_origin, var_574307d4cdbdac4c) {
    dist_sq = squared(function_53c4c53197386572(var_574307d4cdbdac4c, 100));
    path = self findpath(self.origin, target_origin);
    return distancesquared(path[path.size - 1], target_origin) < dist_sq;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1428d
// Size: 0x1b
function function_bffb62c0764278a7() {
    self.var_6727329a89208345 delaycall(0.5, &kill);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142af
// Size: 0x9f
function function_64e63285a83e3efe() {
    self endon("death");
    if (is_dead_or_dying(self) || istrue(self.battlechatter.var_d611e2f69fa1cac4)) {
        return;
    }
    function_b145367392d5843d(2, 1);
    result = function_d54e84a9513b0e45("initial_combat", [0:0.2, 1:"surprise", 2:0.7, 3:"react_first_combat"], 1, 0.5, 15);
    if (!isdefined(result) || !isint(result) || result) {
        function_e23b0906b02cd179("enter_combat", 15);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14355
// Size: 0x47
function function_23a29830a84af4cf() {
    self endon("death");
    self endon("stealth_combat");
    sequence = [0:self, 1:0.5, 2:"disguise_enter_investigate"];
    function_d54e84a9513b0e45("disguise_enter_investigate", sequence, 1, 2, 10);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143a3
// Size: 0x192
function function_bbb539fd7c238608() {
    if (!isdefined(self.var_bdf67b527ec1547a) || self.var_bdf67b527ec1547a == "none") {
        return;
    }
    sequence = undefined;
    other = getclosestfriendlyspeaker();
    var_b70b49dc45959168 = isalive(other) && isdefined(other.stealth) && other isnear(self, level.var_798aa343368f724e);
    if (var_b70b49dc45959168 && other.var_fe5ebefa740c7106 == 1) {
        sequence = [0:self, 1:0, 2:"react_multi", 3:other, 4:1.5, 5:"ask_saw_that", 6:self, 7:1, 8:"confirming", 9:other, 10:1.5, 11:"team_heard_something"];
    } else if (var_b70b49dc45959168) {
        sequence = [0:self, 1:0, 2:"muttered_confusion", 3:other, 4:1.5, 5:"ask_saw_that", 6:self, 7:1, 8:"confirming", 9:other, 10:1, 11:"hunt_inv_order"];
    } else {
        sequence = [0:self, 1:0, 2:"react_multi", 3:self, 4:1.5, 5:"heard_something"];
    }
    var_3a7aea3989ae851a = function_93b4f17e4a3474b("announce_", sequence);
    thread function_c9011e302f0673bc(var_3a7aea3989ae851a);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1453c
// Size: 0x91
function function_c9011e302f0673bc(var_3a7aea3989ae851a) {
    self endon("death");
    self endon("stealth_combat");
    if (isdefined(var_3a7aea3989ae851a)) {
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    }
    sequence = undefined;
    leader = function_592f13f1a0e078ff(self);
    sequence = [0:leader, 1:1, 2:"confirming", 3:leader, 4:1, 5:"order_get_visual", 6:leader, 7:1, 8:"order_report_back"];
    function_93b4f17e4a3474b("investigate_start", sequence);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145d4
// Size: 0x261
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
        if (function_51d76700600cebe3(50)) {
            sequence = [0:self, 1:0, 2:"ask_found_anything", 3:other, 4:1.5, 5:"resp_sound_first"];
        } else {
            sequence = [0:self, 1:0, 2:"ask_found_anything", 3:other, 4:1.5, 5:"area_clear"];
        }
    } else {
        var_5eccc50a8593c7f9 = function_7e6d670c76d60628();
        var_f19e0e54d778fc5e = leader function_7e6d670c76d60628();
        if (function_51d76700600cebe3(33)) {
            sequence = [0:self, 1:0, 2:var_f19e0e54d778fc5e, 3:leader, 4:0.7, 5:"report_search", 6:self, 7:1, 8:"resp_sound_first", 9:leader, 10:1, 11:"confirming"];
        } else if (function_51d76700600cebe3(50)) {
            sequence = [0:self, 1:0, 2:var_f19e0e54d778fc5e, 3:leader, 4:0.7, 5:var_5eccc50a8593c7f9, 6:self, 7:1, 8:"area_clear", 9:leader, 10:1, 11:"confirming"];
        } else {
            sequence = [0:self, 1:0, 2:var_f19e0e54d778fc5e, 3:leader, 4:1.5, 5:"reply_hear_you", 6:leader, 7:1, 8:"report_search", 9:self, 10:1, 11:"area_clear", 12:leader, 13:1, 14:"confirming"];
        }
    }
    function_93b4f17e4a3474b("investigate_pos_reached", sequence);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1483c
// Size: 0x113
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
    wait(randomfloatrange(2, 2.5));
    if (var_b70b49dc45959168) {
        sequence = [0:self, 1:0, 2:"team_return_idle", 3:other, 4:1.5, 5:"confirming"];
    } else {
        sequence = [0:leader, 1:0, 2:"inv_patrol", 3:self, 4:1.5, 5:"confirming"];
    }
    function_93b4f17e4a3474b("return_to_idle", sequence);
    self.var_28cda4aa4cbd4932 = undefined;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14956
// Size: 0x16d
function function_e906749f6343f822() {
    self endon("death");
    self endon("stealth_combat");
    if (is_dead_or_dying(self)) {
        return;
    }
    if (!function_ead4bed232d015ed("saw_corpse_1") || !function_ead4bed232d015ed("saw_corpse_2")) {
        return;
    }
    leader = function_592f13f1a0e078ff(self);
    if (!isdefined(leader)) {
        return;
    }
    other = getclosestfriendlyspeaker();
    var_b70b49dc45959168 = isalive(other) && other isnear(self, level.var_798aa343368f724e);
    if (var_b70b49dc45959168) {
        sequence = [0:self, 1:2, 2:"team_have_something", 3:self, 4:2, 5:"team_see_something"];
    } else {
        sequence = [0:self, 1:2, 2:"have_something", 3:self, 4:2, 5:"see_something"];
    }
    var_3a7aea3989ae851a = function_93b4f17e4a3474b("saw_corpse_1", sequence);
    function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    sequence2 = [0:leader, 1:2, 2:"confirming", 3:leader, 4:2, 5:"order_get_visual", 6:leader, 7:2, 8:"order_report_back"];
    var_3a7aea3989ae851a = function_93b4f17e4a3474b("saw_corpse_2", sequence);
    function_67445f0a05bfcfad(var_3a7aea3989ae851a);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14aca
// Size: 0x275
function function_f713a4757399049c(other) {
    leader = function_592f13f1a0e078ff(self);
    if (!isdefined(self.alertlevel) || self.alertlevel != "alert") {
        sequence = [0:other, 1:1, 2:"surprise", 3:self, 4:1, 5:"react_found_corpse", 6:leader, 7:1, 8:"hunt_report_alert"];
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("found_corpse_1", sequence);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    } else if (function_51d76700600cebe3(50)) {
        var_5063e1574b9411d7 = [0:other, 1:1, 2:"surprise", 3:self, 4:1, 5:"react_found_corpse", 6:leader, 7:1, 8:"order_continue_search"];
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("found_corpse_2", var_5063e1574b9411d7);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    } else {
        var_ab7df55129fd6369 = undefined;
        if (utility::issp()) {
            corpses = [[ level.var_621af16ef0684a11 ]](level.var_798aa343368f724e);
            if (corpses.size > 0) {
                corpse = sortbydistance(corpses, self.origin)[0];
                var_ab7df55129fd6369 = corpse function_479fa1bceacac04b();
                corpse.var_6ef5f7ac4d441cbb = 1;
            }
        } else if (isdefined(level.var_276311a22caaf5ac)) {
            corpses = [[ level.var_276311a22caaf5ac ]](self.origin, level.var_798aa343368f724e);
            if (corpses.size > 0) {
                corpse = sortbydistance(corpses, self.origin)[0];
                var_ab7df55129fd6369 = corpse function_479fa1bceacac04b();
                corpse.var_6ef5f7ac4d441cbb = 1;
            }
        }
        if (!isdefined(var_ab7df55129fd6369)) {
            var_ab7df55129fd6369 = 0;
        }
        sequence2 = [0:other, 1:1, 2:"surprise", 3:self, 4:1, 5:"react_found_corpse", 6:leader, 7:1, 8:"leader_ask_corpse_name", 9:self, 10:1, 11:var_ab7df55129fd6369, 12:leader, 13:1, 14:"order_continue_search"];
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("found_corpse_3", sequence2);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d46
// Size: 0x68
function function_4dffa550c687b071() {
    self endon("death");
    self endon("stealth_combat");
    if (!function_ead4bed232d015ed("found_corpse_1") || !function_ead4bed232d015ed("found_corpse_2") || !function_ead4bed232d015ed("found_corpse_3")) {
        return;
    }
    other = getclosestfriendlyspeaker();
    if (!isdefined(other)) {
        function_f713a4757399049c(self);
    } else {
        function_f713a4757399049c(other);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14db5
// Size: 0x116
function function_91ae298fcc3884c2(type, event) {
    if (event.type == "cover_blown") {
        return;
    }
    if (event.type == "investigate") {
        return;
    }
    if (!isdefined(self.team) || self.team == "dead") {
        return;
    }
    if (function_16dce705f14f4b84() == "combat") {
        return;
    }
    if (function_e3a09ac9c428dbea(function_fd9e4cb348a5f283(self.origin, 4000, self.team))) {
        return;
    }
    if (type == "found_corpse" || type == "saw_corpse") {
        return;
    }
    if (isstartstr(type, "gunshot") || type == "bulletwhizby" || type == "ally_damaged") {
        var_785e3b8ea1895c6b = "surprise";
    } else {
        var_785e3b8ea1895c6b = "muttered_confusion";
    }
    function_93b4f17e4a3474b("announce_" + type, var_785e3b8ea1895c6b, level.battlechatter.settings["announce_"], "stealth_combat");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ed2
// Size: 0x3
function function_22d252d6cfa50edd() {
    
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14edc
// Size: 0x1b
function function_e64dbaaae396fbb8(previousstate) {
    if (previousstate == 1) {
        thread function_ba8bab0dfce1b7d1();
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14efe
// Size: 0x227
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
            if (function_51d76700600cebe3(33)) {
                sequence = [0:self, 1:0, 2:"alert_search_orders", 3:other, 4:1.5, 5:"confirming", 6:other, 7:1, 8:"order_dir_resp"];
            } else if (function_51d76700600cebe3(50)) {
                sequence = [0:self, 1:0, 2:"order_investigate", 3:other, 4:1.5, 5:"confirming", 6:other, 7:1, 8:"order_dir_resp"];
            } else {
                sequence = [0:self, 1:0, 2:"order_dir", 3:other, 4:1.5, 5:"confirming", 6:other, 7:1, 8:"order_dir_resp"];
            }
            function_93b4f17e4a3474b("investigate_loop", sequence);
        } else {
            if (function_51d76700600cebe3(50)) {
                sequence = [0:self, 1:0, 2:"report_investigating", 3:leader, 4:1.5, 5:"confirming"];
            } else {
                sequence = [0:self, 1:0, 2:"searching_here", 3:leader, 4:1.5, 5:"confirming"];
            }
            function_93b4f17e4a3474b("investigate_loop", sequence);
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1512c
// Size: 0xb7
function private function_5748768636a2cea8(player) {
    self endon("bc_hunt_hunt_cleared");
    player endon("bc_hunt_hunt_cleared");
    /#
        function_74607ea2ea3af85e(self);
    #/
    self.var_e76e4e828c793c74 = 1;
    player.var_e76e4e828c793c74 = 1;
    thread function_b00184a8810e1cb2(player);
    childthread function_9e4b25719bada8d0(player);
    leader = function_592f13f1a0e078ff(self);
    if (!istrue(self.var_8fc1a615203f7bd1)) {
        other = function_63229dcf04e0598d(player, leader);
    }
    self.var_8fc1a615203f7bd1 = 1;
    while (1) {
        if (!isdefined(other) || !isalive(other)) {
            other = getclosestfriendlyspeaker();
        }
        function_2ccdf897f3472bcb(player, leader, other);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x151ea
// Size: 0x82
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15273
// Size: 0x2a
function function_9e4b25719bada8d0(player) {
    while (1) {
        if (function_200e534b0a853905(player)) {
            self notify("bc_hunt_hunt_loop_finish");
            return 1;
        }
        waitframe();
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x152a4
// Size: 0x371
function private function_63229dcf04e0598d(player, leader) {
    var_8764defdd9c68067 = [0:self, 1:"ask_target_location", 2:0.6];
    var_3a7aea3989ae851a = function_93b4f17e4a3474b("hunt_initial", var_8764defdd9c68067);
    function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    wait(5);
    var_80cbe5eacee17577 = function_3e144fda9848fd5();
    other = getclosestfriendlyspeaker();
    var_8953ca56a954cbd0 = isdefined(other) && isalive(other) && isdefined(other.stealth) && other.var_fe5ebefa740c7106 == 2;
    if (var_8953ca56a954cbd0) {
        var_b70b49dc45959168 = other isnear(self, level.var_798aa343368f724e);
        var_9dcd869ad60b99fb = [];
        if (var_b70b49dc45959168) {
            if (cointoss()) {
                var_9dcd869ad60b99fb = [0:leader, 1:var_80cbe5eacee17577, 2:0.6, 3:"report_search", 4:0.6, 5:self, 6:"hunt_neg", 7:0.6, 8:"target_still_close", 9:0.6, 10:leader, 11:"order_continue_search", 12:0.6, 13:self, 14:"hunt_copy", 15:0.6];
            } else {
                var_9dcd869ad60b99fb = [0:leader, 1:var_80cbe5eacee17577, 2:0.6, 3:"report_search", 4:0.6, 5:self, 6:"reply_found_nothing", 7:0.6, 8:"target_still_close", 9:0.6, 10:leader, 11:"order_continue_search", 12:0.6, 13:"order_find_target", 14:0.6, 15:self, 16:"hunt_copy", 17:0.6];
            }
        } else {
            var_9dcd869ad60b99fb = [0:leader, 1:var_80cbe5eacee17577, 2:0.6, 3:"report_search", 4:0.6, 5:self, 6:"reply_found_nothing", 7:0.6, 8:"target_still_close", 9:0.6, 10:leader, 11:"order_continue_search", 12:0.6, 13:"order_find_target", 14:0.6, 15:self, 16:"hunt_copy", 17:0.6];
        }
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("hunt_duo_enter", var_9dcd869ad60b99fb);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
        wait(15);
        return other;
    } else {
        var_b7091ec49f4caf96 = [0:leader, 1:var_80cbe5eacee17577, 2:0.6, 3:"report_search", 4:0.6, 5:self, 6:"hunt_neg", 7:0.6, 8:"target_still_close", 9:0.6, 10:leader, 11:"order_find_target", 12:0.6, 13:"order_find_perimeter", 14:0.6, 15:self, 16:"hunt_copy", 17:0.6];
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("hunt_solo_enter", var_b7091ec49f4caf96);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
        wait(15);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1561c
// Size: 0x325
function private function_2ccdf897f3472bcb(player, leader, other) {
    if (isdefined(other)) {
        var_8953ca56a954cbd0 = isalive(other) && isdefined(other.stealth) && other.var_fe5ebefa740c7106 == 2;
        var_b70b49dc45959168 = other isnear(self, level.var_8e8e487a64d9aa1b);
        var_bffcbc62498722ae = ter_op(var_8953ca56a954cbd0 && cointoss(), [0:other, 1:self], [0:self, 1:other]);
        var_10476307e1008b11 = var_bffcbc62498722ae[1];
        var_10476007e1008478 = var_bffcbc62498722ae[0];
        if (!var_8953ca56a954cbd0 || var_b70b49dc45959168) {
            var_34a29ee860da9247 = [0:var_10476007e1008478, 1:var_10476007e1008478 function_7e6d670c76d60628(), 2:0.6, 3:leader, 4:"reply_hear_you", 5:0.6, 6:"report_search", 7:0.6, 8:var_10476007e1008478, 9:"report_reply_search", 10:0.6, 11:leader, 12:"confirming", 13:0.6, 14:"order_continue_search", 15:0.6];
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("hunt_duo_loop_near", var_34a29ee860da9247);
            function_67445f0a05bfcfad(var_3a7aea3989ae851a);
            wait(15);
        } else {
            var_34a29ee860da9247 = [0:var_10476007e1008478, 1:"inv_ask_first", 2:0.6, 3:var_10476307e1008b11, 4:"hunt_neg", 5:0.6, 6:"report_searching", 7:0.6];
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("hunt_duo_loop_far_1", var_34a29ee860da9247);
            function_67445f0a05bfcfad(var_3a7aea3989ae851a);
            wait(10);
            if (!isdefined(var_10476007e1008478) || !isdefined(var_10476307e1008b11)) {
                return;
            }
            var_8953ca56a954cbd0 = isalive(var_10476307e1008b11) && isdefined(var_10476307e1008b11.stealth) && var_10476307e1008b11.var_fe5ebefa740c7106 == 2;
            var_b70b49dc45959168 = var_10476307e1008b11 isnear(var_10476007e1008478, level.var_8e8e487a64d9aa1b);
            if (var_8953ca56a954cbd0 && !var_b70b49dc45959168) {
                var_34a29fe860da947a = [0:var_10476007e1008478, 1:"inv_ask_second", 2:0.6, 3:var_10476307e1008b11, 4:"report_nothing", 5:0.6];
                var_3a7aea3989ae851a = function_93b4f17e4a3474b("hunt_duo_loop_far_2", var_34a29fe860da947a);
                function_67445f0a05bfcfad(var_3a7aea3989ae851a);
                wait(15);
            }
        }
    } else {
        var_b7091ec49f4caf96 = [0:leader, 1:"report_search", 2:0.6, 3:self, 4:"report_searching", 5:0.6, 6:leader, 7:"confirming", 8:0.6, 9:"order_continue_search", 10:0.6, 11:"signoff", 12:0.6];
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("hunt_solo_loop", var_b7091ec49f4caf96);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
        wait(15);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15948
// Size: 0x3
function function_7ce36b78c85185c2() {
    
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15952
// Size: 0xa9
function function_65f8179711192d2b() {
    foreach (player in function_2aa175082bdb56f5(self.origin, level.var_587de0e7b537210a)) {
        if (istrue(player.var_9f44126029ba3947)) {
            player notify("bc_combat_hunt_to_be_cleared");
        }
    }
    if (isdefined(self.var_1f0c460946af0866)) {
        self.var_1f0c460946af0866 = undefined;
        self.var_ed4d33da8aedbae0 = undefined;
        self.var_8fc1a615203f7bd1 = undefined;
        self notify("bc_hunt_left");
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a02
// Size: 0x3e
function function_facb9692c3fba174() {
    if (istrue(self.var_9f44126029ba3947)) {
        self notify("bc_combat_hunt_loop_finish");
    }
    if (is_equal(self.var_1f0c460946af0866, 0)) {
        self.var_1f0c460946af0866 = 1;
        self notify("bc_hunt_transitioned");
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a47
// Size: 0xc3
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b11
// Size: 0x10c
function function_c6b8da8a2c73763b(player, leader, var_10476007e1008478) {
    self waittill("bc_combat_hunt_loop_finish");
    if (!function_200e534b0a853905(player) && (!isdefined(player.var_177d5d34a6473dbe) || gettime() - player.var_177d5d34a6473dbe > 10000)) {
        var_5eccc50a8593c7f9 = function_3e144fda9848fd5();
        var_20791ff5069d43f4 = [0:leader, 1:var_5eccc50a8593c7f9, 2:0.7, 3:leader, 4:"ask_found_anything", 5:0.7, 6:var_10476007e1008478, 7:"hunt_neg", 8:0.6, 9:leader, 10:"order_continue_search", 11:0.7, 12:var_10476007e1008478, 13:"cmb_hunt_confirmation", 14:0.6];
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("enter_hunt_6", var_20791ff5069d43f4);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    }
    player notify("bc_combat_hunt_to_be_cleared");
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c24
// Size: 0x72
function function_d63963e99c9ae77b() {
    foreach (player in function_2aa175082bdb56f5(self.origin, level.var_587de0e7b537210a)) {
        if (istrue(player.var_9f44126029ba3947)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c9e
// Size: 0x2a
function function_288d22f8e8481fa3(player) {
    while (1) {
        if (function_200e534b0a853905(player)) {
            self notify("bc_combat_hunt_loop_finish");
            return 1;
        }
        waitframe();
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ccf
// Size: 0x5c
function function_200e534b0a853905(player) {
    if (is_dead_or_dying(self)) {
        return 1;
    }
    if (!isdefined(player) || !isdefined(player.origin)) {
        return 1;
    }
    if (distancesquared(self.origin, player.origin) > level.var_e49b54322cbd63c1) {
        return 1;
    }
    return 0;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d33
// Size: 0x20b
function function_849082e11feeba9a(player, leader, soldier) {
    self endon("bc_combat_hunt_loop_finish");
    childthread function_288d22f8e8481fa3(player);
    while (1) {
        var_3500bf2042abb37c = [0:leader, 1:"report_target_location", 2:0.7, 3:soldier, 4:"neg_target", 5:0.6, 6:soldier, 7:"target_still_close", 8:0.7, 9:leader, 10:"order_continue_search", 11:0.7, 12:leader, 13:"order_stay_alert", 14:0.7, 15:soldier, 16:"cmb_hunt_confirmation", 17:0.6];
        var_3500c22042abba15 = [0:leader, 1:"report_target_location", 2:0.7, 3:soldier, 4:"neg_target", 5:0.6, 6:soldier, 7:"target_still_close", 8:0.7, 9:leader, 10:"order_find_target", 11:0.7, 12:leader, 13:"order_stay_alert", 14:0.7, 15:soldier, 16:"cmb_hunt_confirmation", 17:0.6];
        var_3500c12042abb7e2 = [0:soldier, 1:"hunt", 2:0.7];
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("enter_hunt_3", var_3500bf2042abb37c);
        player.var_177d5d34a6473dbe = gettime();
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
        wait(15);
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("enter_hunt_4", var_3500c22042abba15);
        player.var_177d5d34a6473dbe = gettime();
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
        wait(15);
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("enter_hunt_5", var_3500c12042abb7e2);
        player.var_177d5d34a6473dbe = gettime();
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
        wait(30);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f45
// Size: 0x3ca
function function_cdf55cf331718d81(player) {
    self endon("bc_combat_hunt_ai_na");
    self endon("bc_combat_hunt_cleared");
    player endon("bc_combat_hunt_cleared");
    /#
        function_74607ea2ea3af85e(self);
    #/
    player.var_9f44126029ba3947 = 1;
    self.var_9f44126029ba3947 = 1;
    thread function_9e2e203621d4db83(player);
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(self.origin, level.var_8b1a7cec63f2e832, self.team);
    var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
    leader = function_592f13f1a0e078ff(self);
    var_10476007e1008478 = self;
    if (var_542b15e7d1da2adb == 1) {
        if (cointoss()) {
            var_8764defdd9c68067 = [0:var_10476007e1008478, 1:"ask_target_location", 2:0.6];
        } else {
            var_8764defdd9c68067 = [0:var_10476007e1008478, 1:"lost_enemy_solo", 2:0.6, 3:leader, 4:"order_find_target", 5:0.7, 6:var_10476007e1008478, 7:"cmb_hunt_confirmation", 8:0.6];
        }
    } else if (var_542b15e7d1da2adb > 1) {
        var_10476307e1008b11 = function_573b9ff9ed152518(self, 0);
        if (cointoss()) {
            var_8764defdd9c68067 = [0:var_10476007e1008478, 1:"ask_target_location", 2:0.6, 3:var_10476307e1008b11, 4:"target_still_close", 5:0.6];
        } else {
            var_f19e0e54d778fc5e = leader function_7e6d670c76d60628();
            var_8764defdd9c68067 = [0:var_10476007e1008478, 1:var_f19e0e54d778fc5e, 2:0.6, 3:var_10476007e1008478, 4:"lost_enemy_duo", 5:0.6, 6:leader, 7:"order_find_target", 8:0.6, 9:var_10476007e1008478, 10:"cmb_hunt_confirmation", 11:0.6];
        }
    }
    if (!istrue(self.var_ed4d33da8aedbae0)) {
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("enter_hunt_1", var_8764defdd9c68067);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
        wait(10);
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
        var_efabc8652e73437a = [0:var_10476007e1008478, 1:order, 2:0.6, 3:other, 4:"confirming", 5:0.6, 6:other, 7:"moving_following", 8:0.6];
    } else if (var_542b15e7d1da2adb > 1) {
        var_efabc8652e73437a = [0:var_10476007e1008478, 1:"hunt_report_alert", 2:0.6, 3:other, 4:"cmb_hunt_confirmation", 5:0.6];
    }
    if (isdefined(var_efabc8652e73437a) && !istrue(self.var_ed4d33da8aedbae0)) {
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("enter_hunt_2", var_efabc8652e73437a);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
        wait(10);
    }
    if (function_200e534b0a853905(player)) {
        player notify("bc_combat_hunt_to_be_cleared");
        return;
    }
    self.var_ed4d33da8aedbae0 = 1;
    childthread function_c6b8da8a2c73763b(player, leader, var_10476007e1008478);
    childthread function_849082e11feeba9a(player, leader, var_10476007e1008478);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16316
// Size: 0x35
function function_f4671f61a3031990() {
    if (!isdefined(self.var_1f0c460946af0866)) {
        self.var_1f0c460946af0866 = 0;
        self notify("bc_hunt_entered");
        thread function_1b1effa3effc7dda();
        /#
            thread function_502e8d1a02a57d3f();
        #/
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16352
// Size: 0x1b
function private function_fc52f6275d262cdb() {
    return istrue(self.var_9f44126029ba3947) || istrue(self.var_e76e4e828c793c74);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16375
// Size: 0x27
function private function_127cbd3f9e8cab92() {
    return isdefined(self) && !function_fc52f6275d262cdb() && isalive(self) && !istrue(self.inlaststand);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x163a4
// Size: 0xe1
function private function_1b1effa3effc7dda() {
    self endon("death");
    while (1) {
        if (!isdefined(self.var_1f0c460946af0866) || is_dead_or_dying(self) || istrue(self._blackboard.invehicle)) {
            break;
        }
        if (!function_fc52f6275d262cdb()) {
            foreach (player in function_2aa175082bdb56f5(self.origin, level.var_3c8c2ca8a1d0e8a7)) {
                if (!player function_127cbd3f9e8cab92()) {
                    continue;
                }
                if (self.var_1f0c460946af0866 == 0) {
                    thread function_78c4f1260a3e4c9c(player);
                } else {
                    thread function_78c4f4260a3e5335(player);
                }
                break;
            }
        }
        wait(3);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1648c
// Size: 0x124
function private function_502e8d1a02a57d3f() {
    /#
        self endon("s_idin_hmphokay");
        for (;;) {
            for (;;) {
                if (!getdvarint(@"hash_864d3ab12f741516") || !isdefined(self.var_1f0c460946af0866) || is_dead_or_dying(self)) {
                    goto LOC_0000011e;
                }
                position = self.origin + (0, 0, 70);
                if (self.var_1f0c460946af0866 == 0) {
                    color = ter_op(isdefined(self.var_9f44126029ba3947), (1, 0, 0), (0.5, 0.5, 0.5));
                    text = ter_op(isdefined(self.var_ed4d33da8aedbae0), "s_alrc_ifoundabodyitsoneofo", "s_unrc_itcamefromoverthere");
                } else {
                    color = ter_op(isdefined(self.var_e76e4e828c793c74), (1, 1, 0), (0.5, 0.5, 0.5));
                    text = ter_op(isdefined(self.var_8fc1a615203f7bd1), "s_idrc_wha", "s_idio_gocheckjusttobesure");
                }
                debugstar(position, color, 1, text, 0.2);
            LOC_0000011e:
            }
        }
    #/
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x165b7
// Size: 0x86
function private function_74607ea2ea3af85e(var_7ff4d5dd09d5b806) {
    /#
        foreach (guy in getaiarray(var_7ff4d5dd09d5b806.team)) {
            /#
                assert(guy == var_7ff4d5dd09d5b806 || !guy function_fc52f6275d262cdb(), "s_idir_thoughtiheardsomethi" + guy getentitynumber());
            #/
        }
    #/
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16644
// Size: 0x5f
function private function_78c4f1260a3e4c9c(player) {
    self endon("death");
    thread function_cdf55cf331718d81(player);
    waittill_any_4("bc_combat_hunt_ai_na", "bc_combat_hunt_cleared", "bc_hunt_transitioned", "bc_hunt_left");
    if (!player function_127cbd3f9e8cab92()) {
        return;
    }
    if (is_equal(self.var_1f0c460946af0866, 1)) {
        thread function_5748768636a2cea8(player);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x166aa
// Size: 0x15
function private function_78c4f4260a3e5335(player) {
    thread function_5748768636a2cea8(player);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x166c6
// Size: 0xa9
function function_7cc890e658e3f93() {
    if (!isalive(self.speaker)) {
        return;
    }
    groupmembers = array_remove(level.stealth.groupdata.groups[self.speaker.script_stealthgroup].members, self.speaker);
    if (groupmembers.size > 0) {
        return function_248a7374a1a0605a(self.speaker.origin, groupmembers, self.speaker.battlechatter.npcid);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16776
// Size: 0x17b
function function_da9e3311b63335e1(var_bbe3bc9d5de09af8) {
    self endon("death");
    self endon("bcs_stateChange");
    if (!isdefined(var_bbe3bc9d5de09af8) || !isalive(var_bbe3bc9d5de09af8) || !isplayer(var_bbe3bc9d5de09af8)) {
        return;
    }
    if (!function_ead4bed232d015ed("lost_target_elapsed_1") || !function_ead4bed232d015ed("lost_target_elapsed_2")) {
        return;
    }
    var_3a7aea3989ae851a = function_93b4f17e4a3474b("lost_target_elapsed_1", [0:self, 1:"ask_target_location", 2:0.7]);
    function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    if (!isdefined(var_bbe3bc9d5de09af8) || !isalive(var_bbe3bc9d5de09af8)) {
        return;
    }
    other = getclosestfriendlyspeaker();
    var_2bd00dd4702caf70 = isdefined(other) && isalive(other) && distancesquared(self.origin, other.origin) < level.var_defb33e34eb9dee7;
    if (!var_2bd00dd4702caf70 || !isdefined(other.stealth) || other.var_fe5ebefa740c7106 != 3) {
        return;
    }
    var_e33e63f0b2178301 = int(function_c89ed1840c8d0f0f(getdvarfloat(@"hash_5fb2e8cfc2ccb6a0")));
    var_ad0bace8f0942cb7 = other seerecently(var_bbe3bc9d5de09af8, var_e33e63f0b2178301);
    if (!istrue(var_ad0bace8f0942cb7)) {
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("lost_target_elapsed_2", [0:other, 1:"neg_target", 2:0.7]);
        function_67445f0a05bfcfad(var_3a7aea3989ae851a);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x168f8
// Size: 0x13b
function private function_adc542e4e2305c6b() {
    struct = spawnstruct();
    foreach (player in level.players) {
        if (isdefined(player.last_weapon_fired_time) && gettime() <= player.last_weapon_fired_time + 100) {
            var_7bb9290d450b028b = distancesquared(player.origin, self.origin);
            if (isenemyteam(player.team, self.team) && var_7bb9290d450b028b < (level.var_63a73645a8e030ad + 1000) * (level.var_63a73645a8e030ad + 1000) && player namespace_d3f3cb0a543667c1::is_point_in_front(self.origin)) {
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16a3a
// Size: 0x4e
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16a90
// Size: 0x15
function private function_ca5cf7e5c88dea1f() {
    self.var_10476307e1008b11 = self.speaker;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16aac
// Size: 0x37
function private function_9af3ce5b350c9330(var_bc2e64c41ca31711) {
    if (!isdefined(var_bc2e64c41ca31711)) {
        var_bc2e64c41ca31711 = 1;
    }
    return isdefined(self.damagedby) && namespace_3c37cb17ade254d::time_has_passed(self.damagetime, var_bc2e64c41ca31711);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16aeb
// Size: 0x37
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16b2a
// Size: 0x3a
function private function_2691ad67de7d62fa(var_bc2e64c41ca31711) {
    if (!isdefined(var_bc2e64c41ca31711)) {
        var_bc2e64c41ca31711 = 2;
    }
    var_fa8c6ee684b9e0ff = function_c6adbc3f1ac04730();
    if (isdefined(var_fa8c6ee684b9e0ff)) {
        return !namespace_3c37cb17ade254d::time_has_passed(var_fa8c6ee684b9e0ff, var_bc2e64c41ca31711);
    }
    return 0;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16b6c
// Size: 0x56
function private function_fe408f094c61eee7() {
    var_fa8c6ee684b9e0ff = 0;
    if (isdefined(self.enemy)) {
        var_fa8c6ee684b9e0ff = self.enemy function_c6adbc3f1ac04730();
    }
    if (isdefined(var_fa8c6ee684b9e0ff)) {
        var_3a122ac91b97d719 = gettime() - var_fa8c6ee684b9e0ff;
        if (recentlysawenemy(var_3a122ac91b97d719)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16bca
// Size: 0x53
function private function_41bd563abffd40ba() {
    if (self._blackboard.coverstate != "none") {
        return 1;
    }
    node = self function_162a7655714ba4c8(3);
    if (isdefined(node) && node.type != "Exposed") {
        return 1;
    }
    return 0;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c25
// Size: 0x5
function private function_1309aeea62c4607f() {
    return 1;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16c32
// Size: 0x67
function private function_d004e724b5e2939b(guy, radius) {
    if (!isdefined(guy)) {
        return 0;
    }
    var_9476a7e439809294 = getaiarrayinradius(guy.origin, radius, guy.team);
    var_39b5f80fa0ceed4d = function_2aa175082bdb56f5(guy.origin, radius);
    return var_9476a7e439809294.size + var_39b5f80fa0ceed4d.size - 1;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16ca1
// Size: 0x192
function private function_68217f6b6c2e6dd5() {
    var_10476007e1008478 = self.owner;
    var_10476307e1008b11 = self.var_10476307e1008b11;
    if (!isalive(var_10476307e1008b11)) {
        var_10476307e1008b11 = function_d8c3c539bc71c7af(var_10476007e1008478.team);
    }
    var_c8977bdbd8aaa098 = var_10476007e1008478 function_41bd563abffd40ba() || var_10476307e1008b11 function_41bd563abffd40ba();
    var_6b7353c9fd470817 = isdefined(var_10476007e1008478.enemy) && var_10476007e1008478.enemy function_2691ad67de7d62fa(8) || isdefined(var_10476307e1008b11.enemy) && var_10476307e1008b11.enemy function_2691ad67de7d62fa(8);
    var_8690dde5c97f495c = var_10476307e1008b11 function_9af3ce5b350c9330();
    var_3365202662df8a86 = function_1309aeea62c4607f();
    if (var_6b7353c9fd470817 && var_c8977bdbd8aaa098 && var_8690dde5c97f495c) {
        return [0:var_10476007e1008478, 1:"ask_wounded", 2:0.2, 3:var_10476307e1008b11, 4:"reply_wounded", 5:0.2];
    } else if (var_6b7353c9fd470817 && var_c8977bdbd8aaa098 && !var_8690dde5c97f495c) {
        return [0:var_10476007e1008478, 1:"ask_wounded", 2:0.2, 3:var_10476307e1008b11, 4:"reply_ok", 5:0.2];
    } else if (var_3365202662df8a86) {
        return [0:var_10476007e1008478, 1:"order_attack", 2:0.2, 3:var_10476307e1008b11, 4:"attacking", 5:0.2];
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16e3a
// Size: 0x12f
function private function_6b784b3654e92ad5(var_10476007e1008478, var_6bae4604edc5e4a9, var_7aaefaa2648b4d9c) {
    var_ad50dc5663c77b40 = 1;
    var_6a1c22bcff227f70 = isdefined(var_10476007e1008478.enemy) && distancesquared(var_10476007e1008478.origin, var_10476007e1008478.enemy.origin) < 1000000;
    if (var_6bae4604edc5e4a9 && !var_7aaefaa2648b4d9c && var_6a1c22bcff227f70) {
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_rs_saw_enemy_on_pos", [0:"react_first_combat", 1:0.7, 2:"at_my_location"]);
    } else if (var_6bae4604edc5e4a9 && !var_7aaefaa2648b4d9c && !var_6a1c22bcff227f70) {
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_rs_saw_enemy_out_pos", [0:"react_first_combat", 1:0.7, 2:"over_there"]);
    } else if (var_6bae4604edc5e4a9 && var_7aaefaa2648b4d9c) {
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_rs_saw_shot_but_enemy_hid", [0:"react_first_combat", 1:0.7, 2:"whizby_resp"]);
    } else {
        var_ad50dc5663c77b40 = 0;
    }
    return [0:var_3a7aea3989ae851a, 1:var_ad50dc5663c77b40];
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16f71
// Size: 0x6d9
function private function_e18a7412d8dd1189(var_10476007e1008478, var_6bae4604edc5e4a9, ai_event, var_f962f4443b32b75b) {
    var_ad50dc5663c77b40 = 1;
    var_a444c26c770a5baf = var_6bae4604edc5e4a9;
    var_64bda20dcbb0ce78 = undefined;
    if (var_a444c26c770a5baf) {
        var_9a14bbbe486374b = self.enemy function_a6a6363c1dd4ba36();
        var_98d2a5998bce56b2 = distancesquared(self.enemy.origin, self.origin);
    } else if (isdefined(var_f962f4443b32b75b)) {
        var_9a14bbbe486374b = weaponclass(var_f962f4443b32b75b.var_23f37822d0802641);
        var_98d2a5998bce56b2 = var_f962f4443b32b75b.var_7bb9290d450b028b;
        var_64bda20dcbb0ce78 = var_f962f4443b32b75b.enemy;
    }
    if (isdefined(var_98d2a5998bce56b2) && isdefined(var_9a14bbbe486374b)) {
        var_8ac9f5a6073c2868 = var_98d2a5998bce56b2 * 0.00694444;
        /#
            var_fc6b3378f008ac6 = sqrt(var_98d2a5998bce56b2);
            var_fe5bb378f22ee3f = var_fc6b3378f008ac6 * 0.0833333;
        #/
        if (!var_a444c26c770a5baf && var_8ac9f5a6073c2868 >= 2500 && var_9a14bbbe486374b == "sniper") {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_full_unaware_sniper", [0:"enemy_sniper", 1:0.7, 2:"youre_exposed", 3:0.7]);
        } else if (!var_a444c26c770a5baf && var_8ac9f5a6073c2868 >= 225 && var_8ac9f5a6073c2868 <= 6400 && var_9a14bbbe486374b == "mg") {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_full_unaware_lmg", [0:"enemy_lmg", 1:0.7]);
        } else if (!var_a444c26c770a5baf && var_8ac9f5a6073c2868 <= 6400 && var_9a14bbbe486374b == "spread") {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_full_unaware_shotgun", [0:"enemy_shotgun", 1:0.7]);
        } else if (var_a444c26c770a5baf && var_8ac9f5a6073c2868 >= 2500 && var_9a14bbbe486374b == "sniper") {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_full_aware_sniper", [0:"target_sniper", 1:0.7, 2:"youre_exposed", 3:0.7]);
        } else if (var_a444c26c770a5baf && var_8ac9f5a6073c2868 >= 225 && var_8ac9f5a6073c2868 <= 6400 && var_9a14bbbe486374b == "mg") {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_full_aware_lmg", [0:"target_lmg", 1:0.7]);
        } else if (var_a444c26c770a5baf && var_8ac9f5a6073c2868 <= 6400 && var_9a14bbbe486374b == "spread") {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_full_aware_shotgun", [0:"target_shotgun", 1:0.7]);
        } else {
            var_ad50dc5663c77b40 = 0;
        }
    } else {
        var_ad50dc5663c77b40 = 0;
    }
    if (var_ad50dc5663c77b40) {
        return [0:var_3a7aea3989ae851a, 1:1];
    }
    var_10476307e1008b11 = function_d8c3c539bc71c7af(self.team, undefined, undefined, level.var_798aa343368f724e + 200);
    var_7d6314b2e164bd36 = isdefined(var_10476307e1008b11);
    if (var_7d6314b2e164bd36) {
        var_b9565ef78cfc2905 = isdefined(var_10476007e1008478.enemy) && var_10476007e1008478.enemy function_2691ad67de7d62fa() || isdefined(var_10476307e1008b11.enemy) && var_10476307e1008b11.enemy function_2691ad67de7d62fa() || isdefined(var_64bda20dcbb0ce78) && var_64bda20dcbb0ce78 function_2691ad67de7d62fa();
        var_547820c918ed54f8 = var_10476007e1008478 recentlysawenemy(0.05) || var_10476307e1008b11 recentlysawenemy(0.05);
        var_cf22f65a01029532 = var_10476007e1008478 function_fe408f094c61eee7() || var_10476307e1008b11 function_fe408f094c61eee7();
        var_f794fb43f8a2d2ab = (var_10476007e1008478 recentlysawenemy() || var_10476307e1008b11 recentlysawenemy()) && (var_10476007e1008478 function_1309aeea62c4607f() || var_10476307e1008b11 function_1309aeea62c4607f());
        var_1cc6b5c882d3828a = function_d004e724b5e2939b(var_10476007e1008478.enemy, level.var_63a73645a8e030ad) > 1 || function_d004e724b5e2939b(var_10476307e1008b11.enemy, level.var_63a73645a8e030ad) > 1 || function_d004e724b5e2939b(var_64bda20dcbb0ce78, level.var_63a73645a8e030ad) > 1;
        if (!var_cf22f65a01029532) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_fulld_didnt_see_shooting", [0:var_10476007e1008478, 1:"enemy_attacking", 2:0.7, 3:var_10476007e1008478, 4:"ask_enemy_loc", 5:0.7, 6:var_10476007e1008478, 7:"ask_enemy_count", 8:var_10476307e1008b11, 9:"enemy_loc_resp", 10:0.7, 11:var_10476307e1008b11, 12:&function_ca5cf7e5c88dea1f, 13:&function_68217f6b6c2e6dd5]);
        } else if (!var_1cc6b5c882d3828a && var_f794fb43f8a2d2ab && var_547820c918ed54f8) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_fulld_enemy_open", [0:var_10476007e1008478, 1:"enemy_attacking", 2:0.7, 3:var_10476007e1008478, 4:"target_exposed", 5:0.7, 6:var_10476007e1008478, 7:"order_attack", 8:0.5, 9:var_10476307e1008b11, 10:"attacking"]);
        } else if (!var_1cc6b5c882d3828a && var_f794fb43f8a2d2ab && !var_547820c918ed54f8) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_fulld_enemy_cover", [0:var_10476007e1008478, 1:"enemy_attacking", 2:0.7, 3:var_10476007e1008478, 4:"target_covered", 5:0.7, 6:var_10476007e1008478, 7:"order_attack", 8:0.5, 9:var_10476307e1008b11, 10:"attacking"]);
        } else if (var_1cc6b5c882d3828a && var_f794fb43f8a2d2ab && var_547820c918ed54f8) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_fulld_enemies_open", [0:var_10476007e1008478, 1:"enemy_attacking", 2:0.7, 3:var_10476007e1008478, 4:"enemy_exposed", 5:0.7, 6:var_10476007e1008478, 7:"order_attack", 8:0.5, 9:var_10476307e1008b11, 10:"attacking"]);
        } else if (var_1cc6b5c882d3828a && var_f794fb43f8a2d2ab && !var_547820c918ed54f8) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("comb_fulld_enemies_cover", [0:var_10476007e1008478, 1:"enemy_attacking", 2:0.7, 3:var_10476007e1008478, 4:"enemy_covered", 5:0.7, 6:var_10476007e1008478, 7:"order_attack", 8:0.5, 9:var_10476307e1008b11, 10:"attacking"]);
        } else {
            var_ad50dc5663c77b40 = 0;
        }
    } else {
        var_ad50dc5663c77b40 = 0;
    }
    return [0:var_3a7aea3989ae851a, 1:var_ad50dc5663c77b40];
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17652
// Size: 0x290
function private function_bb7d302d01228a41(var_10476007e1008478, ai_event, previous_state) {
    var_ad50dc5663c77b40 = 1;
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(self.origin, level.var_63a73645a8e030ad, self.team);
    var_542b15e7d1da2adb = var_75be11c0a0a035dc.size;
    if (ai_event == "bulletwhizby" || ai_event == "gunshot_impact" || ai_event == "silenced_shot_impact") {
        if (var_542b15e7d1da2adb == 1) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("initial_combat", [0:&function_e872439019a2560c, 1:var_10476007e1008478, 2:"hunt_reactions", 3:0.1, 4:"react_whizby", 5:0.5, 6:"unaware_backup"]);
        } else if (var_542b15e7d1da2adb == 2) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("initial_combat_2", [0:&function_e872439019a2560c, 1:var_10476007e1008478, 2:"hunt_reactions", 3:0.1, 4:"react_whizby", 5:&function_12014207b3e66976, 6:"youre_exposed", 7:var_10476007e1008478, 8:"unaware_backup"]);
        } else {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("initial_combat_N", [0:&function_e872439019a2560c, 1:var_10476007e1008478, 2:"hunt_reactions", 3:0.1, 4:"react_whizby", 5:&function_12014207b3e66976, 6:"youre_exposed"]);
        }
    } else if (previous_state != 3) {
        if (var_542b15e7d1da2adb == 1) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("initial_combat_nonshot_1", [0:&function_e872439019a2560c, 1:var_10476007e1008478, 2:"react_first_combat", 3:0.7, 4:"unaware_backup", 5:0.2]);
        } else if (var_542b15e7d1da2adb == 2) {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("initial_combat_nonshot_2", [0:&function_e872439019a2560c, 1:var_10476007e1008478, 2:"react_first_combat", 3:0.4, 4:"youre_exposed", 5:0.4, 6:"unaware_backup", 7:0.2]);
        } else {
            var_3a7aea3989ae851a = function_93b4f17e4a3474b("initial_combat_nonshot_N", [0:&function_e872439019a2560c, 1:var_10476007e1008478, 2:"react_first_combat", 3:0.4, 4:"youre_exposed", 5:0.4]);
        }
    } else {
        var_ad50dc5663c77b40 = 0;
    }
    return [0:var_3a7aea3989ae851a, 1:0];
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178ea
// Size: 0x20
function function_80bfded61c19c9cc(previous_state, ai_event) {
    thread function_1ae088b4c06d0525(previous_state, ai_event, 1);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17912
// Size: 0x311
function function_1ae088b4c06d0525(previous_state, ai_event, var_de837dfd8bcdc3af) {
    if (!isdefined(ai_event)) {
        ai_event = "none";
    }
    var_63f509639a8c705 = 0;
    self endon("death");
    var_10476007e1008478 = self;
    var_d24851273de8ff3d = previous_state == 1 || previous_state == 2;
    var_55be4d7bbf3f76de = ai_event == "sight";
    var_ddc90174461e7335 = (ai_event == "gunshot" || ai_event == "gunshot_impact" || ai_event == "silenced_shot_impact" || ai_event == "silenced_shot") && !var_10476007e1008478 recentlysawenemy(0.05);
    var_f962f4443b32b75b = var_10476007e1008478 function_adc542e4e2305c6b();
    if (istrue(var_de837dfd8bcdc3af)) {
        if (var_ddc90174461e7335) {
            wait(1.2);
        } else if (ai_event == "bulletwhizby") {
            wait(0.6);
        } else {
            wait(0.75);
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
    var_7aaefaa2648b4d9c = var_10476007e1008478 recentlysawenemy(3) && !var_10476007e1008478 recentlysawenemy(0.05);
    var_698be5c37a79f2fb = var_55be4d7bbf3f76de || var_ddc90174461e7335 && var_10476007e1008478 recentlysawenemy(1.2);
    if ((ai_event == "sight" || var_698be5c37a79f2fb) && var_d24851273de8ff3d) {
        var_c0013d62498c3438 = function_6b784b3654e92ad5(var_10476007e1008478, var_698be5c37a79f2fb, var_7aaefaa2648b4d9c);
        var_63f509639a8c705 = var_c0013d62498c3438[1];
        var_3a7aea3989ae851a = var_c0013d62498c3438[0];
    }
    if ((ai_event == "gunshot" || ai_event == "gunshot_impact" || ai_event == "bulletwhizby") && !var_63f509639a8c705 && !var_39bf97269a97bf86) {
        var_6eb60849133fe70f = var_698be5c37a79f2fb || ai_event == "bulletwhizby" && var_10476007e1008478 recentlysawenemy(0.6);
        var_c0014462498c439d = function_e18a7412d8dd1189(var_10476007e1008478, var_6eb60849133fe70f, ai_event, var_f962f4443b32b75b);
        var_63f509639a8c705 = var_c0014462498c439d[1];
        var_3a7aea3989ae851a = var_c0014462498c439d[0];
    }
    if ((ai_event == "bulletwhizby" || ai_event == "gunshot_impact" || ai_event == "silenced_shot_impact" || previous_state != 3) && !var_63f509639a8c705) {
        var_c0014362498c416a = function_bb7d302d01228a41(var_10476007e1008478, ai_event, previous_state);
        var_63f509639a8c705 = var_c0014362498c416a[1];
        var_3a7aea3989ae851a = var_c0014362498c416a[0];
    }
    if (!isdefined(var_3a7aea3989ae851a) || !isint(var_3a7aea3989ae851a) || var_3a7aea3989ae851a) {
        function_e23b0906b02cd179("enter_combat", 15);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17c2a
// Size: 0x9f
function private function_34a791e14c9f44d0(guys) {
    var_be66de030b25508c = (0, 0, 0);
    count = 0;
    foreach (guy in guys) {
        if (isalive(guy)) {
            var_be66de030b25508c = var_be66de030b25508c + guy.goalpos;
            count++;
        }
    }
    /#
        assert(count != 0);
    #/
    return var_be66de030b25508c / count;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17cd1
// Size: 0x9f
function private function_f1f2c29f80ac4b2f() {
    var_10476007e1008478 = self.owner;
    if (!function_96144b7f4c1c227e()) {
        if (cointoss()) {
            return [0:var_10476007e1008478, 1:"moving_alone", 2:0.2];
        } else {
            return [0:var_10476007e1008478, 1:"moving_there", 2:0.2];
        }
    } else if (cointoss()) {
        return [0:var_10476007e1008478, 1:"moving_together", 2:0.2];
    } else {
        return [0:var_10476007e1008478, 1:"moving_there", 2:0.2];
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17d77
// Size: 0x74
function private function_e872439019a2560c() {
    owner = self.owner;
    var_75be11c0a0a035dc = function_fd9e4cb348a5f283(owner.origin, level.var_63a73645a8e030ad, self.team);
    self.var_98a49d4dd75fff17 = var_75be11c0a0a035dc.size;
    self.var_bd758acb28777c09 = function_34a791e14c9f44d0(var_75be11c0a0a035dc);
    self.var_25ae1a4f78cb39c5 = owner.origin;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17df2
// Size: 0x8b
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
    } else {
        return 0;
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e84
// Size: 0x60
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17eeb
// Size: 0xee
function function_baa35784be25b993(target) {
    target = function_53c4c53197386572(target, self.enemy);
    groupdata = level.stealth.groupdata.groups[self.script_stealthgroup];
    foreach (groupmember in groupdata.members) {
        if (self == groupmember) {
            continue;
        }
        if (isdefined(target) && isdefined(target.origin)) {
            groupmember aieventlistenerevent("combat", target, target.origin);
        } else {
            groupmember aieventlistenerevent("combat", self, self.origin);
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fe0
// Size: 0xaf
function function_881ab22021be3c6b(var_56d4e883d1ed4129) {
    self endon("death");
    wait(2);
    if (is_dead_or_dying(self) || !isdefined(self.team) || self.team == "dead") {
        return;
    }
    if (utility::issp() && function_fd9e4cb348a5f283(self.origin, level.var_798aa343368f724e, self.team).size == 1) {
        return;
    }
    var_be1ff2030ad6ba18 = random([0:"order_attack", 1:"attacking", 2:"suppressing"]);
    function_93b4f17e4a3474b("join_combat", var_be1ff2030ad6ba18);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18096
// Size: 0x16f
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
    if (!function_ead4bed232d015ed("enter_combat")) {
        return;
    }
    var_785e3b8ea1895c6b = ter_op(cointoss(), "found_target", "found_you");
    var_13eaef47aa5ba1bd = "at_my_location";
    if (utility::issp()) {
        var_7a3107322bc6ab13 = 0;
        other = level.player;
        if (isdefined(other) && (isagent(other) || isplayer(other))) {
            var_7a3107322bc6ab13 = other isswimming() || other function_6f55d55ccff20d14();
        }
        if (var_7a3107322bc6ab13) {
            var_13eaef47aa5ba1bd = "report_target_water";
        } else if (distancesquared(other.origin, self.origin) > level.var_c1ed820e79e07b7c) {
            var_13eaef47aa5ba1bd = "over_there";
        }
    }
    function_93b4f17e4a3474b("enter_combat", [0:var_785e3b8ea1895c6b, 1:0.5, 2:var_13eaef47aa5ba1bd]);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1820c
// Size: 0x129
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
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("red_alert_1", [0:&function_e872439019a2560c, 1:leader, 2:"report_alert_combat", 3:0.2, 4:&function_f1f2c29f80ac4b2f]);
    } else {
        var_3a7aea3989ae851a = function_93b4f17e4a3474b("red_alert_N", [0:&function_e872439019a2560c, 1:leader, 2:"report_alert_combat", 3:0.2, 4:&function_f1f2c29f80ac4b2f]);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1833c
// Size: 0x6c
function function_e2d4e5c64d62278e(other) {
    var_7a3107322bc6ab13 = 0;
    if (isdefined(other) && (isagent(other) || isplayer(other))) {
        var_7a3107322bc6ab13 = other isswimming() || other function_6f55d55ccff20d14();
    }
    if (var_7a3107322bc6ab13) {
        function_93b4f17e4a3474b("losing_target_water", "lost_target_water");
    } else {
        function_93b4f17e4a3474b("losing_target", "lost_target");
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183af
// Size: 0x26f
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
                var_8e75e25718adee6d = issp() && self.team == "allies";
                if (!var_8e75e25718adee6d) {
                    self.var_caff0e9895ed03b3 = gettime() + int(self.var_6a2525ae2b942b46 * 1000);
                }
            }
        }
        var_10476007e1008478 = self;
        var_10476307e1008b11 = getclosestfriendlyspeaker();
        leader = function_592f13f1a0e078ff(self);
        if (!isdefined(var_10476307e1008b11)) {
            function_93b4f17e4a3474b("flanked_1", [0:var_10476007e1008478, 1:"flanked", 2:0.2, 3:leader, 4:"order_attack"]);
        } else {
            function_93b4f17e4a3474b("flanked_N", [0:var_10476007e1008478, 1:"flanked", 2:0.2, 3:var_10476307e1008b11, 4:"order_attack"]);
        }
    } else {
        enemies = function_e457176b043f3f8b();
        var_96fd8098b75efd0f = 0;
        foreach (enemy in enemies) {
            if (enemy != targetent && self cansee(enemy, 3)) {
                var_96fd8098b75efd0f = 1;
                break;
            }
        }
        if (var_96fd8098b75efd0f) {
            function_93b4f17e4a3474b("enemy_sighted_N", [0:"enemy_soldiers"]);
        } else {
            function_93b4f17e4a3474b("enemy_sighted_1", [0:"enemy_soldier"]);
        }
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18625
// Size: 0x19
function function_71da86464a72718d() {
    function_93b4f17e4a3474b("cover_destroyed", [0:"repositioning"]);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18645
// Size: 0x54
function function_7825e0643a6c5600() {
    var_10476307e1008b11 = getclosestfriendlyspeaker();
    if (isdefined(var_10476307e1008b11)) {
        var_f89f4b49aca39611 = var_10476307e1008b11 function_2008b43adf7e18ef();
        function_93b4f17e4a3474b("reacquire_push_towards", [0:self, 1:var_f89f4b49aca39611, 2:0.2, 3:"order_check_last"]);
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186a0
// Size: 0x19
function function_45eb140ec25c64a1() {
    function_93b4f17e4a3474b("semtex_stuck", [0:"semtex_stuck"]);
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x186c0
// Size: 0xc
function function_79b973bc437563db(var_3da06140a804e127) {
    
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x186d3
// Size: 0x14
function area_clear(region, var_168c108518d4bac9) {
    
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x186ee
// Size: 0x14
function function_4531d54403fe6d07(var_3da06140a804e127, var_168c108518d4bac9) {
    
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18709
// Size: 0x15e
function function_ac566e2d34bccaa2(event_name, data) {
    if (!isdefined(self.battlechatter)) {
        /#
            assertmsg("battlechatter on self is undefined");
        #/
        return;
    }
    countryid = function_53c4c53197386572(self.battlechatter.var_96a045a4858e3f20, self.battlechatter.countryid);
    faction = function_53c4c53197386572(self.battlechatter.var_37962ca7989c729a, countryid);
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
        event = function_c1c2326db1c9b81d(event, event_name, faction);
    }
    if (isfunction(event)) {
        event = [[ event ]](data);
    }
    if (isstring(event) || isarray(event)) {
        return event;
    }
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1886e
// Size: 0x1f3
function function_c1c2326db1c9b81d(event, event_name, faction) {
    if (utility::ismp()) {
        return event[randomint(event.size)];
    }
    index = undefined;
    if (isdefined(self.var_868e98cf48b92cfb)) {
        origin = self.var_868e98cf48b92cfb.origin;
    } else {
        origin = self.origin;
    }
    if (!isdefined(origin)) {
        return undefined;
    }
    if (utility::issp()) {
        nearby_players = [0:level.player];
    } else {
        nearby_players = function_2aa175082bdb56f5(origin, level.var_587de0e7b537210a);
    }
    foreach (player in nearby_players) {
        if (isdefined(player.var_2036ddd05c3ffdc9) && isdefined(player.var_2036ddd05c3ffdc9[faction]) && isdefined(player.var_2036ddd05c3ffdc9[faction][event_name])) {
            index = player.var_2036ddd05c3ffdc9[faction][event_name];
            break;
        }
    }
    index = function_53c4c53197386572(index, randomint(event.size));
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

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18a69
// Size: 0x35
function function_21333116b170a5bb(faction, key, values) {
    level.battlechatter.eventstrings[faction][key] = values;
}

// Namespace namespace_40868d6c43ced754/namespace_24b7b4457f51f1a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18aa5
// Size: 0x17cbc
function function_bd1704b44a1a730e() {
    level.battlechatter.eventstrings["DGG"]["warn_getBack"] = [0:"s_wrnf_heygetthefuckback"];
    level.battlechatter.eventstrings["DGG"]["warn_getBackNow"] = [0:"s_wrnf_getbackgetbackrightn"];
    level.battlechatter.eventstrings["DGG"]["warn_getOut"] = [0:"s_wrnf_heyyougetthefuckouto"];
    level.battlechatter.eventstrings["DGG"]["warn_curse"] = [0:"s_wrnk_motherfucker"];
    level.battlechatter.eventstrings["DGG"]["warn_attack"] = [0:"s_wrnk_heyiwarnedyou", 1:"s_wrnk_youwerewarned", 2:"s_wrnk_heyyoujustfuckedup"];
    level.battlechatter.eventstrings["DGG"]["react_aware"] = [0:"s_rcaw_surprisedeffort", 1:"s_rcaw_surprisedeffort_01", 2:"s_rcaw_surprisedeffort_02", 3:"s_rcaw_ohfuck", 4:"s_rcaw_ohshit"];
    level.battlechatter.eventstrings["DGG"]["react_multi"] = [0:"s_rcml_takingcontact", 1:"s_rcml_contactcontact"];
    level.battlechatter.eventstrings["DGG"]["react_unaware"] = [0:"s_rcun_whothefuckthrewthat", 1:"s_rcun_whothrewthat", 2:"s_rcun_wheredthatcomefrom", 3:"s_rcun_whereditcomefrom"];
    level.battlechatter.eventstrings["AQS"]["right"] = [0:"c_posn_toourright", 1:"c_posn_ontheright", 2:"c_posn_rightsdie", 3:"c_posn_rightright"];
    level.battlechatter.eventstrings["AQS"]["ahead"] = [0:"c_posn_aheadahead", 1:"c_posn_rightinfrontofus", 2:"c_posn_aheadofus", 3:"c_posn_lookforward", 4:"c_posn_thatwayaheadofyou"];
    level.battlechatter.eventstrings["AQS"]["behind"] = [0:"c_posn_watchbehindus", 1:"c_posn_lookbehindus", 2:"c_posn_watchourbacksbrother", 3:"c_posn_checkbehindus", 4:"c_posn_turnaround", 5:"c_posn_behindusbrother"];
    level.battlechatter.eventstrings["AQS"]["high"] = [0:"c_posn_upup", 1:"c_posn_upthere", 2:"c_posn_aboveus"];
    level.battlechatter.eventstrings["AQS"]["left"] = [0:"c_posn_ontheleft", 1:"c_posn_leftside", 2:"c_posn_left", 3:"c_posn_toourleft"];
    level.battlechatter.eventstrings["AQS"]["use_flash"] = [0:"c_ator_useaflashgrenade", 1:"c_ator_throwaflashgrenade", 2:"c_ator_blindthemwithaflashg"];
    level.battlechatter.eventstrings["AQS"]["use_grenade"] = [0:"c_ator_useagrenade", 1:"c_ator_throwagrenade", 2:"c_ator_attackthemwithagrena"];
    level.battlechatter.eventstrings["AQS"]["use_molotov"] = [0:"c_ator_throwamolotov", 1:"c_ator_useamolotov", 2:"c_ator_burnthemwithamolotov"];
    level.battlechatter.eventstrings["AQS"]["use_rpg"] = [0:"c_ator_firearocketatthem", 1:"c_ator_useyourrockets", 2:"c_ator_therocketusetherocke"];
    level.battlechatter.eventstrings["AQS"]["order_attack"] = [0:"c_ator_shootthem", 1:"c_ator_startshooting", 2:"c_ator_shootshoot", 3:"c_ator_fireonthem", 4:"c_ator_attackthem", 5:"c_ator_shootyourweapon", 6:"c_ator_shootthemthisisanord"];
    level.battlechatter.eventstrings["AQS"]["move"] = [0:"c_tcor_getmoving", 1:"c_tcor_move", 2:"c_tcor_movenow", 3:"c_tcor_getupmove", 4:"c_tcor_startmoving", 5:"c_tcor_gobrothermove", 6:"c_tcor_moveoverthere", 7:"c_tcor_gonowgo"];
    level.battlechatter.eventstrings["AQS"]["moveup"] = [0:"c_tcor_moveup", 1:"c_tcor_movetowardsthem", 2:"c_tcor_goup", 3:"c_tcor_getupthere", 4:"c_tcor_goforwardmove"];
    level.battlechatter.eventstrings["AQS"]["coverme"] = [0:"c_tcor_coverme", 1:"c_tcor_covermebrother", 2:"c_tcor_ineedcover"];
    level.battlechatter.eventstrings["AQS"]["using_flash"] = [0:"c_atac_usingflashgrenade", 1:"c_atac_tossingaflashgrenade"];
    level.battlechatter.eventstrings["AQS"]["using_grenade"] = [0:"c_atac_usinggrenade", 1:"c_atac_tossingagrenade"];
    level.battlechatter.eventstrings["AQS"]["using_molotov"] = [0:"c_atac_usingamolotov", 1:"c_atac_tossingamolotov"];
    level.battlechatter.eventstrings["AQS"]["using_rpg"] = [0:"c_atac_usingarocket", 1:"c_atac_launchingarocket"];
    level.battlechatter.eventstrings["AQS"]["using_smoke"] = [0:"c_atac_throwingsmoke", 1:"c_atac_smokegrenadeout"];
    level.battlechatter.eventstrings["AQS"]["attacking"] = [0:"c_atac_openingfire", 1:"c_atac_imshooting", 2:"c_atac_firing"];
    level.battlechatter.eventstrings["AQS"]["movingup"] = [0:"c_tcac_immovingup", 1:"c_tcac_followme", 2:"c_tcac_thiswaybrothers", 3:"c_tcac_movingforward"];
    level.battlechatter.eventstrings["AQS"]["reloading"] = [0:"c_tcac_changingmagazine", 1:"c_tcac_imreloading"];
    level.battlechatter.eventstrings["AQS"]["moving"] = [0:"c_tcac_moving", 1:"c_tcac_immoving", 2:"c_tcac_heyimmoving"];
    level.battlechatter.eventstrings["AQS"]["getting_cover"] = [0:"c_tcac_takingcover", 1:"c_tcac_movingtocover", 2:"c_tcac_gettingcover"];
    level.battlechatter.eventstrings["AQS"]["enemy_using_flash"] = [0:"c_eata_reactionimblind", 1:"c_eata_reactionicantsee", 2:"c_eata_flashgrenade"];
    level.battlechatter.eventstrings["AQS"]["enemy_using_grenade"] = [0:"c_eata_grenade", 1:"c_eata_ohshit", 2:"c_eata_grenadewatchout"];
    level.battlechatter.eventstrings["AQS"]["enemy_using_molotov"] = [0:"c_eata_molotov", 1:"c_eata_watchthefire", 2:"c_eata_molotovmove"];
    level.battlechatter.eventstrings["AQS"]["enemy_using_rpg"] = [0:"c_eata_rpg", 1:"c_eata_rpg_01", 2:"c_eata_rocketrocket"];
    level.battlechatter.eventstrings["AQS"]["enemy_attacking"] = [0:"c_eata_imtakingfire", 1:"c_eata_imgettingshotat", 2:"c_eata_theyreshootingatus"];
    level.battlechatter.eventstrings["AQS"]["enemy_flanking_left"] = [0:"c_etca_guardtheleftflank", 1:"c_etca_theenemyisflankingle", 2:"c_etca_theyreflankingleft"];
    level.battlechatter.eventstrings["AQS"]["enemy_flanking_right"] = [0:"c_etca_guardtherightflank", 1:"c_etca_theenemyisflankingri", 2:"c_etca_theyreflankingright"];
    level.battlechatter.eventstrings["AQS"]["enemy_moving"] = [0:"c_etca_onesmoving", 1:"c_etca_iseeonemoving", 2:"c_etca_theresonemoving"];
    level.battlechatter.eventstrings["AQS"]["enemy_moving_up"] = [0:"c_etca_onesmovingtowardsus", 1:"c_etca_onesmovingup", 2:"c_etca_onesmovingthisway"];
    level.battlechatter.eventstrings["AQS"]["enemy_getting_cover"] = [0:"c_etca_theenemyistakingcove", 1:"c_etca_enemytakingcover", 2:"c_etca_onestakingcover"];
    level.battlechatter.eventstrings["AQS"]["enemy_reloading"] = [0:"c_etca_onesreloading", 1:"c_etca_iseeonereloading", 2:"c_etca_heyonesreloading"];
    level.battlechatter.eventstrings["AQS"]["target_getting_cover"] = [0:"c_ttca_theyretakingcover", 1:"c_ttca_theyreincover", 2:"c_ttca_theyrebehindcover"];
    level.battlechatter.eventstrings["AQS"]["target_reloading"] = [0:"c_ttca_theyrereloading", 1:"c_ttca_iseethemreloading", 2:"c_ttca_thatonesreloading"];
    level.battlechatter.eventstrings["AQS"]["target_moving"] = [0:"c_ttca_theyremoving", 1:"c_ttca_heytheyremoving", 2:"c_ttca_theyremovingrightnow"];
    level.battlechatter.eventstrings["AQS"]["target_moving_up"] = [0:"c_ttca_theyremovingup", 1:"c_ttca_theyremovingforward", 2:"c_ttca_theyremovingtowardsu"];
    level.battlechatter.eventstrings["AQS"]["target_near_patrol"] = [0:"c_ttca_theyreswimmingnearth", 1:"c_ttca_theyreswimmingyourwa", 2:"c_ttca_interceptthem"];
    level.battlechatter.eventstrings["AQS"]["enemy_soldier"] = [0:"c_enmy_iseeanenemy", 1:"c_enmy_iseeone", 2:"c_enmy_enemy"];
    level.battlechatter.eventstrings["AQS"]["enemy_soldiers"] = [0:"c_enmy_enemiesenemies", 1:"c_enmy_iseeenemies", 2:"c_enmy_enemies"];
    level.battlechatter.eventstrings["AQS"]["aquired_target"] = [0:"c_aqen_hesrightthere", 1:"c_aqen_icanseehim", 2:"c_aqen_ifoundhim", 3:"c_aqen_thereheis"];
    level.battlechatter.eventstrings["AQS"]["neg_target"] = [0:"c_aqen_where", 1:"c_aqen_idontseeanyone", 2:"c_aqen_whereishe", 3:"c_aqen_icantseehim", 4:"c_aqen_idontseehimbrother", 5:"c_aqen_whatshislocation"];
    level.battlechatter.eventstrings["AQS"]["enemy_exposed"] = [0:"c_exco_onesoutofcover", 1:"c_exco_anenemyisintheopen", 2:"c_exco_onesintheopen"];
    level.battlechatter.eventstrings["AQS"]["target_exposed"] = [0:"c_exco_theyreoutofcover", 1:"c_exco_theyreintheopen", 2:"c_exco_theyrenotincover"];
    level.battlechatter.eventstrings["AQS"]["youre_exposed"] = [0:"c_exco_tothecovertothecover", 1:"c_exco_gettocover", 2:"c_exco_getbehindthecover"];
    level.battlechatter.eventstrings["AQS"]["target_covered"] = [0:"c_exco_theyrebehindthecover", 1:"c_exco_theyretakingcover", 2:"c_exco_theyreincover"];
    level.battlechatter.eventstrings["AQS"]["killfirm_enemy"] = [0:"c_firm_gotone", 1:"c_firm_ikilledone", 2:"c_firm_ishotone"];
    level.battlechatter.eventstrings["AQS"]["killfirm_target"] = [0:"c_firm_theyredead", 1:"c_firm_ikilledthemthatpig", 2:"c_firm_ishotthatone"];
    level.battlechatter.eventstrings["AQS"]["killfirm_truck"] = [0:"c_firm_theirtruckisdestroye", 1:"c_firm_theirtruckisdown", 2:"c_firm_idestroyedtheirtruck"];
    level.battlechatter.eventstrings["AQS"]["killfirm_bigrig"] = [0:"c_firm_itookouttheirbigrig", 1:"c_firm_wedestroyedtheirbigr", 2:"c_firm_theirbigrigisdestroy"];
    level.battlechatter.eventstrings["AQS"]["killfirm_helo"] = [0:"c_firm_ishotdowntheirhelico", 1:"c_firm_idestroyedtheirhelic", 2:"c_firm_theirhelicopterisdow"];
    level.battlechatter.eventstrings["AQS"]["casualties"] = [0:"c_casu_werelosingtoomany", 1:"c_casu_theyrekillingus"];
    level.battlechatter.eventstrings["AQS"]["copy"] = [0:"c_conf_igotit", 1:"c_conf_yesbrother", 2:"c_conf_understood", 3:"c_conf_iknow", 4:"c_conf_iam", 5:"c_aqcp_copy", 6:"c_aqcp_copythat"];
    level.battlechatter.eventstrings["AQS"]["praise"] = [0:"c_pras_goodgood", 1:"c_pras_goodworknowkillanoth", 2:"c_pras_forsulamanmayhissoul", 3:"c_pras_goodihopetheysuffere", 4:"c_pras_yesbrotherkillthemal"];
    level.battlechatter.eventstrings["AQS"]["low_ammo"] = [0:"c_stat_ineedammunition", 1:"c_stat_ineedmoreammunition", 2:"c_stat_whohasanothermagazin", 3:"c_stat_ineedamagazine", 4:"c_stat_ineedanothermagazine"];
    level.battlechatter.eventstrings["AQS"]["wounded"] = [0:"c_stat_imhit", 1:"c_stat_imhurtbrother", 2:"c_stat_imwounded"];
    level.battlechatter.eventstrings["AQS"]["ask_wounded"] = [0:"c_stat_areyouwounded", 1:"c_stat_areyouhurtbrother", 2:"c_stat_areyouhit"];
    level.battlechatter.eventstrings["AQS"]["ask_low_ammo"] = [0:"c_stat_howsyourammunition", 1:"c_stat_doyouneedammunition", 2:"c_stat_areyougoodonammuniti"];
    level.battlechatter.eventstrings["AQS"]["ask_status"] = [0:"c_stat_areyouokay", 1:"c_stat_areyougoodbrother", 2:"c_stat_iseverythinggood"];
    level.battlechatter.eventstrings["AQS"]["reply_wounded"] = [0:"c_stat_theyshotme", 1:"c_stat_thosepigsshotme", 2:"c_stat_igothit"];
    level.battlechatter.eventstrings["AQS"]["reply_low_ammo"] = [0:"c_stat_runninglow", 1:"c_stat_imlow", 2:"c_stat_imalmostout"];
    level.battlechatter.eventstrings["AQS"]["reply_okay"] = [0:"c_stat_imokay", 1:"c_stat_imgoodbrother", 2:"c_stat_imgood"];
    level.battlechatter.eventstrings["AQS"]["wounded_enemy"] = [0:"c_aens_iwoundedthatone", 1:"c_aens_gotoneheswounded", 2:"c_aens_ihitoneofthem"];
    level.battlechatter.eventstrings["AQS"]["ask_target_loc"] = [0:"c_tast_whatstheirlocation", 1:"c_tast_doyouseethem", 2:"c_tast_wherearethey"];
    level.battlechatter.eventstrings["AQS"]["ask_target_wounded"] = [0:"c_tast_aretheydead", 1:"c_tast_didyoushootthem", 2:"c_tast_aretheyhitbrother"];
    level.battlechatter.eventstrings["AQS"]["target_wounded"] = [0:"c_tast_theyrewounded", 1:"c_tast_theyrehurtkillthem", 2:"c_tast_theyrebleeding"];
    level.battlechatter.eventstrings["AQS"]["target_unhurt"] = [0:"c_tast_theygotaway", 1:"c_tast_ididntgetthem", 2:"c_tast_imissedthembrother"];
    level.battlechatter.eventstrings["AQS"]["wounded_target"] = [0:"c_atas_heshurt", 1:"c_atas_heswounded", 2:"c_atas_iinjuredhim"];
    level.battlechatter.eventstrings["AQS"]["enemy_lmg"] = [0:"c_enws_machinegunner", 1:"c_enws_theyhaveamachinegunn", 2:"c_enws_onehasamachinegun"];
    level.battlechatter.eventstrings["AQS"]["enemy_shotgun"] = [0:"c_enws_shotgun", 1:"c_enws_shotgun_01", 2:"c_enws_oneofthemhasashotgun"];
    level.battlechatter.eventstrings["AQS"]["enemy_sniper"] = [0:"c_enws_theyhaveasniper", 1:"c_enws_snipergetdown", 2:"c_enws_carefulonessniping"];
    level.battlechatter.eventstrings["AQS"]["target_lmg"] = [0:"c_taws_machinegunmachinegun", 1:"c_taws_thatonehasamachinegu", 2:"c_taws_carefulbrothertheyha"];
    level.battlechatter.eventstrings["AQS"]["target_shotgun"] = [0:"c_taws_thatonehasashotgun", 1:"c_taws_shotgun"];
    level.battlechatter.eventstrings["AQS"]["target_sniper"] = [0:"c_taws_sniper", 1:"c_taws_hessnipingatus"];
    level.battlechatter.eventstrings["AQS"]["casualty"] = [0:"c_canm_mybrother", 1:"c_canm_theykilledoneofours", 2:"c_canm_theykilledhim", 3:"c_canm_theykilledourbrother", 4:"c_canm_abrotherhasfallen"];
    level.battlechatter.eventstrings["AQS"]["hostile_burst"] = [0:"c_hsbr_yournationswillburn", 1:"c_hsbr_wearethekillers", 2:"c_hsbr_weareyourexecutioner", 3:"c_hsbr_wearethewolvesofsula"];
    level.battlechatter.eventstrings["AQS"]["suppressing"] = [0:"c_aqsp_gotyoucovered", 1:"c_aqsp_coveringyou", 2:"c_aqsp_imcoveringyougo", 3:"c_aqsp_getbackgo"];
    level.battlechatter.eventstrings["AQS"]["reply_hear_you"] = [0:"s_idrp_yesbrother", 1:"s_idrp_goahead", 2:"s_idrp_yesihearyou", 3:"s_idrp_ihearyougoahead"];
    level.battlechatter.eventstrings["AQS"]["resp_patrol"] = [0:"s_idrp_thisispatrol", 1:"s_ahrp_thisispatrol"];
    level.battlechatter.eventstrings["AQS"]["muttered_confusion"] = [0:"s_idin_whatthefuck", 1:"s_idin_whatthehell", 2:"s_idin_whatthefuckisthat", 3:"s_idin_whatthehellisthat"];
    level.battlechatter.eventstrings["AQS"]["investigating"] = [0:"s_idin_imgoingtocheckitout", 1:"s_idin_illcheckitout", 2:"s_idin_illgocheck"];
    level.battlechatter.eventstrings["AQS"]["inv_arrive"] = [0:"s_idin_hmm", 1:"s_idin_hmphokay", 2:"s_idin_huhwhatwasthat", 3:"s_idin_hrm", 4:"s_idin_huhthehell"];
    level.battlechatter.eventstrings["AQS"]["react_found_corpse"] = [0:"s_alrc_welostaman", 1:"s_alrc_ifoundabodyitsoneofo", 2:"s_alrc_oneofourpatrolsgothi", 3:"s_alrc_welostabrother"];
    level.battlechatter.eventstrings["AQS"]["ask_corpse_name"] = [0:"s_alrc_whoisit", 1:"s_alrc_who", 2:"s_alrc_whodidwelose"];
    level.battlechatter.eventstrings["AQS"]["need_backup"] = [0:"s_alrc_sendbackup", 1:"s_alrc_illneedbackup", 2:"s_albc_getmesomebackup"];
    level.battlechatter.eventstrings["AQS"]["hunt_affirm"] = [0:"s_hnrs_yesbrother"];
    level.battlechatter.eventstrings["AQS"]["hunt_copy"] = [0:"s_hnrs_okay", 1:"s_hnrs_gotit", 2:"s_hnrs_copy"];
    level.battlechatter.eventstrings["AQS"]["hunt_neg"] = [0:"s_hnrs_nobrother"];
    level.battlechatter.eventstrings["AQS"]["react_whizby"] = [0:"s_unrc_someoneshotatme", 1:"s_unrc_ijustgotshotat", 2:"s_unrc_imgettingshotat", 3:"s_unrc_someonetriedtoshootm", 4:"s_unrc_itookfire"];
    level.battlechatter.eventstrings["AQS"]["react_loc"] = [0:"s_unrc_itcamefromoverthere", 1:"s_unrc_itcamefromthatdirect", 2:"s_unrc_itwasfromthatway", 3:"s_unrc_itcamefromthatway", 4:"s_unrc_itwasfromthatdirecti"];
    level.battlechatter.eventstrings["AQS"]["react_unaware"] = [0:"s_unrc_imtakingfire", 1:"s_unrc_contact", 2:"s_unrc_imunderattack"];
    level.battlechatter.eventstrings["AQS"]["over_there"] = [0:"s_hnfn_overthere", 1:"s_hnfn_theyreoverthere", 2:"s_hnfn_theyreoverthatway"];
    level.battlechatter.eventstrings["AQS"]["surprise"] = [0:"s_hurc_ohgod", 1:"s_hurc_ohfuck", 2:"s_hurc_ohshit"];
    level.battlechatter.eventstrings["AQS"]["report_reply_idle"] = [0:"s_idrr_nothinghere", 1:"s_idrr_secure", 2:"s_idrr_weregoodbrother", 3:"s_idrr_allclear", 4:"s_idrr_goodhere", 5:"s_idrr_nothingtoreport", 6:"s_idrr_quietherebrother"];
    level.battlechatter.eventstrings["AQS"]["react_first"] = [0:"s_idrc_huh", 1:"s_idrc_wha", 2:"s_idrc_hm", 3:"s_idrc_eh", 4:"s_idrc_hrm", 5:"s_idrc_hmph"];
    level.battlechatter.eventstrings["AQS"]["react_second"] = [0:"s_idrc_whatthefuckwasthat", 1:"s_idrc_whatthehellwasthat", 2:"s_idrc_whosthere"];
    level.battlechatter.eventstrings["AQS"]["react_multi"] = [0:"s_idrm_whatthefuckisgoingon", 1:"s_idrm_okaywhatthefuck", 2:"s_idrm_issomeonefuckingwith"];
    level.battlechatter.eventstrings["AQS"]["react_interrupt"] = [0:"s_idli_whatswrong", 1:"s_idli_whatwasthat", 2:"s_idli_areyouokaybrother"];
    level.battlechatter.eventstrings["AQS"]["react_noreply"] = [0:"s_idli_areyouthere", 1:"s_idli_wheredyougo", 2:"s_idli_canyouhearme"];
    level.battlechatter.eventstrings["AQS"]["order_investigate"] = [0:"s_idio_gocheckitout", 1:"s_idio_goseewhatitwas", 2:"s_idio_gocheckjusttobesure"];
    level.battlechatter.eventstrings["AQS"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["AQS"]["idle_good_hunting"] = [0:"s_idls_besafebrother", 1:"s_idls_staysharpbrother", 2:"s_idls_keepyoureyesopenbrot"];
    level.battlechatter.eventstrings["AQS"]["inv_ask_first"] = [0:"s_idia_whatwasit", 1:"s_idia_whatdidyousee", 2:"s_idia_yougotanything", 3:"s_idia_didyouseeanything", 4:"s_idia_findanything"];
    level.battlechatter.eventstrings["AQS"]["inv_ask_second"] = [0:"s_idia_whatwasitthistime", 1:"s_idia_seeanythingthistime", 2:"s_idia_stillnothing", 3:"s_idia_stilldidntfindanythi", 4:"s_idia_findanythingthistime"];
    level.battlechatter.eventstrings["AQS"]["resp_water_first"] = [0:"s_idir_soundedlikesomething", 1:"s_idir_iheardsplashingbutit", 2:"s_idir_thewaterwasmovingbut", 3:"s_idir_thoughtiheardsomethi"];
    level.battlechatter.eventstrings["AQS"]["resp_sound_first"] = [0:"s_idir_nothingididntseeanyo", 1:"s_idir_ididntseeanyonewereg", 2:"s_idir_thoughtiheardsomeone", 3:"s_idir_soundedlikesomeoneru"];
    level.battlechatter.eventstrings["AQS"]["order_check_together"] = [0:"s_idit_letsgocheckitout", 1:"s_idit_thiswayfollowme", 2:"s_idit_overherecoverme"];
    level.battlechatter.eventstrings["AQS"]["covering_investigate"] = [0:"s_idit_rightbehindyou", 1:"s_idit_imwithyou", 2:"s_idit_ivegotyourback"];
    level.battlechatter.eventstrings["AQS"]["team_return_idle"] = [0:"s_idid_letsheadback", 1:"s_idid_fuckitletsgetback", 2:"s_idid_alrightweshouldgetba"];
    level.battlechatter.eventstrings["AQS"]["ask_heard_that"] = [0:"s_alre_didyouhearthat", 1:"s_alre_youheardthatright", 2:"s_alre_youheardthattoo"];
    level.battlechatter.eventstrings["AQS"]["ask_saw_that"] = [0:"s_alre_didyouseethat", 1:"s_alre_tellmeyousawthat", 2:"s_alre_yousawthatright"];
    level.battlechatter.eventstrings["AQS"]["have_something"] = [0:"s_alre_imighthavesomething", 1:"s_alre_ithinkihavesomething", 2:"s_alre_ithinksomethingsover"];
    level.battlechatter.eventstrings["AQS"]["heard_something"] = [0:"s_alre_iheardsomething", 1:"s_alre_iheardanoise", 2:"s_alre_iheardanoisebyme"];
    level.battlechatter.eventstrings["AQS"]["saw_something"] = [0:"s_alre_isawsomething", 1:"s_alre_ithinkisawsomething", 2:"s_alre_ithinksomeonesnearme"];
    level.battlechatter.eventstrings["AQS"]["see_something"] = [0:"s_alre_iseesomething", 1:"s_alre_ithinkiseesomething", 2:"s_alre_iseesomethingnearme"];
    level.battlechatter.eventstrings["AQS"]["team_have_something"] = [0:"s_alre_wemighthavesomething", 1:"s_alre_ithinkwegotsomething", 2:"s_alre_wemayhavesomethinghe"];
    level.battlechatter.eventstrings["AQS"]["team_heard_something"] = [0:"s_alre_weheardsomething", 1:"s_alre_weheardsomethingnear", 2:"s_alre_weheardanoise"];
    level.battlechatter.eventstrings["AQS"]["team_saw_something"] = [0:"s_alre_wesawsomething", 1:"s_alre_wesawsomethingnearus", 2:"s_alre_wesawsomethingnearou"];
    level.battlechatter.eventstrings["AQS"]["team_see_something"] = [0:"s_alre_weseesomething"];
    level.battlechatter.eventstrings["AQS"]["bottle_whizby"] = [0:"s_alre_whothefuckthrewthat", 1:"s_alre_whothrewthat", 2:"s_alre_youmissed"];
    level.battlechatter.eventstrings["AQS"]["object_whizby"] = [0:"s_alre_whothefuckthrewthat", 1:"s_alre_whothrewthat", 2:"s_alre_youmissed"];
    level.battlechatter.eventstrings["AQS"]["jailer_body_react"] = [0:"s_idrm_okaywhatthefuck", 1:"s_idrm_whatthefuckisgoingon", 2:"s_idrm_issomeonefuckingwith"];
    level.battlechatter.eventstrings["AQS"]["jailer_head_react"] = [0:"s_unrc_imtakingfire", 1:"s_unrc_contact", 2:"s_unrc_imunderattack", 3:"s_unrc_itookfire"];
    level.battlechatter.eventstrings["AQS"]["react_resp"] = [0:"s_alrr_yeah", 1:"s_alrr_yesbrother", 2:"s_alrr_yeahidid"];
    level.battlechatter.eventstrings["AQS"]["alert_investigating"] = [0:"s_alin_imgoingtocheckitout", 1:"s_alin_imcheckingitout", 2:"s_alin_imgoingtochecktheare"];
    level.battlechatter.eventstrings["AQS"]["team_alert_investigating"] = [0:"s_alin_weregoingtocheckitou", 1:"s_alin_werecheckingitout", 2:"s_alin_weregoingtoseewhatit"];
    level.battlechatter.eventstrings["AQS"]["alert_confirming"] = [0:"s_alcf_roger", 1:"s_alcf_copy", 2:"s_alcf_copythat"];
    level.battlechatter.eventstrings["AQS"]["inv_ask"] = [0:"s_alia_youseeanything", 1:"s_alia_yougotsomething", 2:"s_alia_whatvewegot", 3:"s_alia_youseesomething"];
    level.battlechatter.eventstrings["AQS"]["inv_patrol"] = [0:"s_alip_illsecurethisareayou", 1:"s_alip_illsearcharoundgetba", 2:"s_alip_headbacktoyourpatrol", 3:"s_alip_keeppatrollingillsec"];
    level.battlechatter.eventstrings["AQS"]["report_reply_search"] = [0:"s_alir_nothingyet", 1:"s_alir_nothingsofar", 2:"s_alir_itsbeenquietsofar", 3:"s_alir_weregoodfornow", 4:"s_alir_allclearrightnow", 5:"s_alir_sofarsogood", 6:"s_alir_notseeinganythingyet", 7:"s_alir_haventseenanything", 8:"s_alir_nothingfornow", 9:"s_alir_itsclearfornow", 10:"s_alir_weregoodsofar"];
    level.battlechatter.eventstrings["AQS"]["ask_enemy_loc"] = [0:"s_unwl_wheredthatcomefrom", 1:"s_unwl_whereditcomefrom", 2:"s_unwl_wherethefuckarethey"];
    level.battlechatter.eventstrings["AQS"]["enemy_loc_resp"] = [0:"s_unrs_idontknow", 1:"s_unrs_ididntseethem", 2:"s_unrs_idontfuckingknow", 3:"s_unrs_ididntsee"];
    level.battlechatter.eventstrings["AQS"]["ask_enemy_count"] = [0:"s_unwc_howmanyarethere", 1:"s_unwc_howmanyofem", 2:"s_unwc_howmany"];
    level.battlechatter.eventstrings["AQS"]["unaware_backup"] = [0:"s_unwb_ineedbackupnow", 1:"s_unwb_getbackupoverhere", 2:"s_unwb_sendbackupnow"];
    level.battlechatter.eventstrings["AQS"]["react_first_combat"] = [0:"s_awrr_enemy", 1:"s_awrr_theenemyishere", 2:"s_awrr_enemyrighthere", 3:"s_awrr_theresanenemy", 4:"s_awrr_enemyenemy", 5:"s_awrr_someoneshere", 6:"s_awrr_enemyhere"];
    level.battlechatter.eventstrings["AQS"]["at_my_location"] = [0:"s_awrr_hererighthere", 1:"s_awrr_rightherebrothers", 2:"s_awrr_heyoverhere", 3:"s_awrr_righthererighthere", 4:"s_awrr_heytheyrerighthere", 5:"s_awrr_theyrehereiseethem", 6:"s_awrr_heytheyreoverhere", 7:"s_awrr_heytheyrehere"];
    level.battlechatter.eventstrings["AQS"]["found_you"] = [0:"s_awrr_motherfucker", 1:"s_awrr_pieceofshit", 2:"s_awrr_youbitch", 3:"s_awrr_fuckyou", 4:"s_awrr_gotyou"];
    level.battlechatter.eventstrings["AQS"]["report_target_water"] = [0:"s_awrr_theyreinthewaterover", 1:"s_awrr_theyreswimmingoverth", 2:"s_awrr_heytheyreswimmingove", 3:"s_awrr_theyreswimmingthiswa", 4:"s_awrr_icanhearthemtheyrein", 5:"s_awrr_theyreswimmingoverhe", 6:"s_awrr_heytheyreswimmingtha"];
    level.battlechatter.eventstrings["AQS"]["found_target"] = [0:"s_awrr_heytheyrerightthere", 1:"s_awrr_heyiseethem", 2:"s_awrr_ifoundthem", 3:"s_awrr_igotthem", 4:"s_awrr_theretheyare", 5:"s_awrr_theyrerightoverthere"];
    level.battlechatter.eventstrings["AQS"]["order_check_last"] = [0:"s_advo_moveontheirlocationg", 1:"s_advo_checkiftheyrethere", 2:"s_advo_moveonthem"];
    level.battlechatter.eventstrings["AQS"]["lost_target"] = [0:"s_lkpl_frustratedgrunttheyr", 1:"s_lkpl_frustratedgrunttheyr_01", 2:"s_lkpl_frustratedgruntwelos_01", 3:"s_lkpl_frustratedgruntfuckt"];
    level.battlechatter.eventstrings["AQS"]["lost_target_water"] = [0:"s_lkpw_theywentunderwater", 1:"s_lkpw_theyreinthewater", 2:"s_lkpw_theyjumpedinthewater", 3:"s_lkpw_theywentinthewater"];
    level.battlechatter.eventstrings["AQS"]["ask_target_location"] = [0:"s_lklr_wherearethey", 1:"s_lklr_doyouseethem", 2:"s_lklr_youseewheretheywent", 3:"s_lklr_wheredtheygo", 4:"s_lklr_wherethefuckarethey", 5:"s_lklr_whereisthisperson"];
    level.battlechatter.eventstrings["AQS"]["wait_target_surface"] = [0:"s_lkwr_whentheycomesupforai", 1:"s_lkwr_theypoptheirheadouty", 2:"s_lkwr_whentheycomeupyoukil", 3:"s_lkwr_theygoforairyoutaket", 4:"s_lkwr_whentheypopuptheyred", 5:"s_lkwr_theyllcomeupforairwh"];
    level.battlechatter.eventstrings["AQS"]["water_use_grenade"] = [0:"s_lkwf_dontusebulletsusegre", 1:"s_lkwf_throwagrenadeinthere", 2:"s_lkwf_useyourgrenadesthrow"];
    level.battlechatter.eventstrings["AQS"]["target_still_close"] = [0:"s_lkpc_theywerehere", 1:"s_lkpc_theywererighthere", 2:"s_lkpc_theycantbefar", 3:"s_lkpc_theyreclose", 4:"s_lkpc_theyrehiding", 5:"s_lkpc_theyvegottabehere", 6:"s_lkpc_theydidntjustdisappe", 7:"s_lkpc_theyreheresomewhere"];
    level.battlechatter.eventstrings["AQS"]["order_clear_building"] = [0:"s_cmho_clearthebuilding", 1:"s_cmho_securethebuilding", 2:"s_cmho_getthisbuildingclear"];
    level.battlechatter.eventstrings["AQS"]["order_search_water"] = [0:"s_cmho_searchthewater", 1:"s_cmho_checkthewater", 2:"s_cmho_keepyoureyesonthewat", 3:"s_cmho_watchthewater", 4:"s_cmho_theywereinthewater"];
    level.battlechatter.eventstrings["AQS"]["clearing_east"] = [0:"s_cmhs_checkingeast", 1:"s_cmhs_movingeast", 2:"s_cmhs_searchingeast"];
    level.battlechatter.eventstrings["AQS"]["clearing_north"] = [0:"s_cmhs_scoutingnorth", 1:"s_cmhs_checkingnorth", 2:"s_cmhs_movingnorth"];
    level.battlechatter.eventstrings["AQS"]["clearing_south"] = [0:"s_cmhs_movingsouth", 1:"s_cmhs_checkingsouth", 2:"s_cmhs_scanningsouth"];
    level.battlechatter.eventstrings["AQS"]["clearing_west"] = [0:"s_cmhs_movingwest", 1:"s_cmhs_scoutingwest", 2:"s_cmhs_checkingwest"];
    level.battlechatter.eventstrings["AQS"]["searching_here"] = [0:"s_cmhc_thisareasgood", 1:"s_cmhc_thisareasclear", 2:"s_cmhc_myareaisclear"];
    level.battlechatter.eventstrings["AQS"]["cmb_hunt_confirmation"] = [0:"s_cmhr_yesbrother", 1:"s_cmhr_copythat", 2:"s_cmhr_okay", 3:"s_cmhr_gotit", 4:"s_cmhr_nobrother"];
    level.battlechatter.eventstrings["AQS"]["good_hunting"] = [0:"s_hnts_besafebrother", 1:"s_hnts_stayalertbrother", 2:"s_hnts_onyourtoesbrother"];
    level.battlechatter.eventstrings["AQS"]["moving_there"] = [0:"s_hntm_movingnow", 1:"s_hntm_movingtherenow", 2:"s_hntm_moving"];
    level.battlechatter.eventstrings["AQS"]["moving_alone"] = [0:"s_hntm_onmywaybrother", 1:"s_hntm_immoving", 2:"s_hntm_imheadingtherenow"];
    level.battlechatter.eventstrings["AQS"]["moving_following"] = [0:"s_hntm_imwithyoubrother", 1:"s_hntm_ihaveyourback", 2:"s_hntm_illguardyourback"];
    level.battlechatter.eventstrings["AQS"]["moving_together"] = [0:"s_hntm_weremoving", 1:"s_hntm_weremovingtherenow", 2:"s_hntm_onourwaybrother"];
    level.battlechatter.eventstrings["AQS"]["order_follow_me"] = [0:"s_hntm_letsmovestaytogether", 1:"s_hntm_followmeletsgo", 2:"s_hntm_yourewithmeletsmove"];
    level.battlechatter.eventstrings["AQS"]["order_take_point"] = [0:"s_hntm_taketheleadbrotherle", 1:"s_hntm_letskeepmovingyoulea", 2:"s_hntm_letsgetovertherelead", 3:"s_aqhr_letsgoillcoveryou", 4:"s_aqhr_letsgetovertherelead", 5:"s_aqhr_letsmoveyoulead"];
    level.battlechatter.eventstrings["AQS"]["ask_found_anything"] = [0:"s_aqhr_gotanything", 1:"s_aqhr_yougotsomething", 2:"s_aqhr_findanything", 3:"s_aqhr_youseethem", 4:"s_aqhr_didyoufindsomething", 5:"s_aqhr_whatdoyougot"];
    level.battlechatter.eventstrings["AQS"]["reply_found_nothing"] = [0:"s_aqhr_nothingyet", 1:"s_aqhr_nothingsofar", 2:"s_aqhr_nothingherebrother"];
    level.battlechatter.eventstrings["AQS"]["report_searching"] = [0:"s_aqhr_stillsweepingthisare", 1:"s_aqhr_stillsearching", 2:"s_aqhr_stilllookingforthem"];
    level.battlechatter.eventstrings["AQS"]["report_nothing"] = [0:"s_aqhr_theresnothinghere", 1:"s_aqhr_nosignofthemyet", 2:"s_aqhr_noonesherebrother"];
    level.battlechatter.eventstrings["AQS"]["report_investigating"] = [0:"s_aqhr_checkingthisarea", 1:"s_aqhr_securingthisarea", 2:"s_aqhr_searchingthisarea"];
    level.battlechatter.eventstrings["AQS"]["area_clear"] = [0:"s_aqhr_thisareaisclear", 1:"s_aqhr_clearhere", 2:"s_aqhr_areaclear"];
    level.battlechatter.eventstrings["AQS"]["order_dir"] = [0:"s_aqhs_checkthatway", 1:"s_aqhs_heysearchoverthere", 2:"s_aqhs_checkoverthere", 3:"s_aqhs_searchthatway"];
    level.battlechatter.eventstrings["AQS"]["order_dir_resp"] = [0:"s_aqhs_illsearchoverhere", 1:"s_aqhs_illtakethisway", 2:"s_aqhs_illtakeoverhere", 3:"s_aqhs_illsearchthisway"];
    level.battlechatter.eventstrings["AQS"]["hunt_search_object"] = [0:"s_aqhs_itsclear", 1:"s_aqhs_clear", 2:"s_aqhs_nothinghere", 3:"s_aqhs_goodhere"];
    level.battlechatter.eventstrings["AQS"]["hunt"] = [0:"s_aqhb_wherethefuckareyou", 1:"s_aqhb_wherethefuckishe", 2:"s_aqhb_whereisthispieceofsh", 3:"s_aqhb_comeonwhereareyouhid", 4:"s_aqhb_wherethefuckdidyougo", 5:"s_aqhb_pieceofshitshowyours", 6:"s_aqhb_motherfuckerwhereare"];
    level.battlechatter.eventstrings["AQS"]["hunt_inv_order"] = [0:"s_ahii_checkit", 1:"s_ahii_checkitout", 2:"s_ahii_gocheckit", 3:"s_ahii_searchit"];
    level.battlechatter.eventstrings["AQS"]["hunt_inv_event"] = [0:"s_ahir_ithinktheyrenearme", 1:"s_ahir_imighthavethem", 2:"s_ahir_ijustheardthem", 3:"s_ahir_imighthavefoundthem"];
    level.battlechatter.eventstrings["AQS"]["hunt_reactions"] = [0:"s_ahnr_surprisedinttenserea", 1:"s_ahnr_surprisedinttenserea_01", 2:"s_ahnr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["AQS"]["cmb_reactions"] = [0:"s_aqcr_surprisedinttenserea", 1:"s_aqcr_surprisedinttenserea_01", 2:"s_aqcr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["AQS"]["whizby_resp"] = [0:"s_aqal_itcamefromoverthere", 1:"s_aqal_itcamefromthatway", 2:"s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["AQS"]["hunt_cornercheck"] = [0:"s_aqho_checkyourcorners", 1:"s_aqho_checkthecorners", 2:"s_aqho_searcheverycornerfin"];
    level.battlechatter.eventstrings["AQS"]["hunt_order_hold"] = [0:"s_aqho_holdup", 1:"s_aqho_wait", 2:"s_aqho_hold"];
    level.battlechatter.eventstrings["AQS"]["alert_cornercheck"] = [0:"s_aqao_besuretocheckthecorn", 1:"s_aqao_checkthecornersjustt", 2:"s_aqao_remembertochecktheco"];
    level.battlechatter.eventstrings["AQS"]["alert_order_hold"] = [0:"s_aqao_holdup", 1:"s_aqao_wait", 2:"s_aqao_hold"];
    level.battlechatter.eventstrings["AQS"]["alert_search_orders"] = [0:"s_aqao_checkthatway", 1:"s_aqao_gothatway", 2:"s_aqao_checkoverthere", 3:"s_aqao_searchoverthere", 4:"s_aqao_searchthatway", 5:"s_aqao_lookoverthere"];
    level.battlechatter.eventstrings["AQS"]["attack_orders"] = [0:"s_aato_patrol"];
    level.battlechatter.eventstrings["AQS"]["lkp_patrol_search"] = [0:"s_alwp_justwatchthewater", 1:"s_alwp_keepwatchingthatside", 2:"s_alwp_justkeepyoureyesonth"];
    level.battlechatter.eventstrings["AQS"]["hunt_report_alert"] = [0:"s_aqlo_spreadoutfindthem", 1:"s_aqlo_searchtheareafindthe", 2:"s_aqlo_spreadoutsearchthear"];
    level.battlechatter.eventstrings["AQS"]["disguise_enter_investigate"] = [0:"s_idrc_whosthere", 1:"s_idli_areyouokaybrother", 2:"s_alrc_whoisit", 3:"s_idin_huhwhatwasthat", 4:"s_idin_hmphokay", 5:"s_idin_hmm"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"] = [];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][0] = [0:"s_idsl_wewillkillalltheysen", 1:"s_idsl_likegrandfatherdid", 2:"s_idsl_theydontcareaboutthi", 3:"s_idsl_itmeansnothingtothem", 4:"s_idsl_notheywantsomething", 5:"s_idsl_theyalwayswantsometh", 6:"s_idsl_neverheretohelptofix", 7:"s_idsl_justtakeandtake", 8:"s_idsl_untileverythingisdea", 9:"s_idsl_thesemercenaries", 10:"s_idsl_youwanttostealfromus", 11:"s_idsl_illsendallyoudemonsb"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][1] = [0:"s_idsl_ourwarisnotforourfai", 1:"s_idsl_wefighttoremoveallfo", 2:"s_idsl_wearealqatalaweareth", 3:"s_idsl_wefightwithoutsorrow", 4:"s_idsl_wewagewarwithoutsymp", 5:"s_idsl_thisistheonlywaytoli", 6:"s_idsl_atruesoldier"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][2] = [0:"s_idsl_ourwarisnotforourfai_01", 1:"s_idsl_wefighttoremovetorem", 2:"s_idsl_startoverokayourwari", 3:"s_idsl_wefighttoremoveuhall", 4:"s_idsl_wewagewarswithnosymp", 5:"s_idsl_itistheonlywaytolive", 6:"s_idsl_atruesoldieratruesol", 7:"s_idsl_okayonemoretime"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][3] = [0:"s_idsl_goahead", 1:"s_idsl_anysecondnow", 2:"s_idsl_askmetoreportin", 3:"s_idsl_everyfewminutesthisf", 4:"s_idsl_illreportinwhenthere"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][4] = [0:"s_idsl_mastaphakazithekingo", 1:"s_idsl_wetookyourcrownandsl", 2:"s_idsl_nowalmasrareturnstoh", 3:"s_idsl_whowillalwaysfightto"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][5] = [0:"s_idsl_goingtobealongday", 1:"s_idsl_cantsleep", 2:"s_idsl_themercenairesrisewi", 3:"s_idsl_juststayfocused", 4:"s_idsl_rememberwhyyoufighth", 5:"s_idsl_dontgetlazy", 6:"s_idsl_ifyourelazyyoudie"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][6] = [0:"s_idsl_thisfuckingheat", 1:"s_idsl_whycantwefightduring", 2:"s_idsl_atleasticoulddiecomf"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][7] = [0:"s_idsl_irangivesusarmorandw", 1:"s_idsl_couldatleastgiveusso", 2:"s_idsl_weneedtocontrolthesk", 3:"s_idsl_thennoonewillfuckwit"];
    level.battlechatter.eventstrings["AQS"]["idle_solo"][8] = [0:"s_idsl_ishouldbeonthefrontl", 1:"s_idsl_notdefendinggarbage", 2:"s_idsl_ihopeanenemyshowsuph", 3:"s_idsl_thenitwontbesofuckin", 4:"s_idsl_icouldseesomecombat", 5:"s_idsl_getmyfirstkill"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"] = [];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][0] = [0:"s_idcv_haveyoutrainedforthe", 1:"s_idcv_yeahlastmonth", 2:"s_idcv_whatplacedoyouwantto", 3:"s_idcv_spainiwanttoworkwith", 4:"s_idcv_thatismyfirstchoices", 5:"s_idcv_notamsterdamthatshit", 6:"s_idcv_idontcareatleastitsc"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][1] = [0:"s_idcv_haveyoufoughtthembef", 1:"s_idcv_themercenaries", 2:"s_idcv_yesthelegionorthaton", 3:"s_idcv_nonotthemifoughtones", 4:"s_idcv_youwereinverdansk", 5:"s_idcv_yesbrotheriwastherew", 6:"s_idcv_whatwasitlike", 7:"s_idcv_hehitwashellbutfunto", 8:"s_idcv_iwantedtogotheykeptm", 9:"s_idcv_russiansiranianswhen", 10:"s_idcv_wehavenewweaponsbett", 11:"s_idcv_yeahwealsohaveabigge", 12:"s_idcv_sobeitillfightanyone", 13:"s_idcv_yeahsurejustkeepaloo"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][2] = [0:"s_idcv_howmuchlonger", 1:"s_idcv_untilwhat", 2:"s_idcv_untilthiswarisover", 3:"s_idcv_hehwhenthebastardsfi", 4:"s_idcv_thatwillneverhappenw", 5:"s_idcv_liketherussians", 6:"s_idcv_themandtheamericans", 7:"s_idcv_anddictatorskazithat", 8:"s_idcv_dontforgettheirarmie", 9:"s_idcv_andnowtheirmercenari", 10:"s_idcv_yeahwellkillthemtoo", 11:"s_idcv_thatsrightbrother"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][3] = [0:"s_idcv_whatwasyourfirstbigb", 1:"s_idcv_theattackonthecoast", 2:"s_idcv_youwereontheship", 3:"s_idcv_yeahiwaswiththesnipe", 4:"s_idcv_iheardyouguyskilleds", 5:"s_idcv_eitherthebulletsorfl", 6:"s_idcv_thatsbadassthatshipw"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][4] = [0:"s_idcv_heyiseeone", 1:"s_idcv_noyoudontstopdoingth", 2:"s_idcv_imboredmanineedenter", 3:"s_idcv_yeahwelldontgetuskil", 4:"s_idcv_itwasajoke", 5:"s_idcv_doesntmatterwhenyoua", 6:"s_idcv_okayokayfairenough"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][5] = [0:"s_idcv_heyyoudead", 1:"s_idcv_stillalive", 2:"s_idcv_sometimesithinkicoul", 3:"s_idcv_sometimes", 4:"s_idcv_youthinkthatcouldhap", 5:"s_idcv_no", 6:"s_idcv_ithoughtmyfrienddied", 7:"s_idcv_aoneleggedamericando", 8:"s_idcv_imsayingtheamericani", 9:"s_idcv_howdyouknowhehadonel", 10:"s_idcv_nobutothersdidtheyto", 11:"s_idcv_tohellwiththattraito", 12:"s_idcv_youknowherownbrother", 13:"s_idcv_andhewasrighttodoitn", 14:"s_idcv_okaywellletmethinkof"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][6] = [0:"s_idcv_iheardthemercenaries", 1:"s_idcv_didourbrothersstopth", 2:"s_idcv_easilytheykilledallo", 3:"s_idcv_goodforthem"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][7] = [0:"s_idcv_ithinkiknowawaytoend", 1:"s_idcv_yeahwhatsthat", 2:"s_idcv_justdoitliketheoldda", 3:"s_idcv_andwhosourbestyou", 4:"s_idcv_nobutevenicouldslaug", 5:"s_idcv_sowewoulddefinitelyw", 6:"s_idcv_itellyoutakeawaythei", 7:"s_idcv_ohsoyouthinkthiswoul", 8:"s_idcv_managainstmanwewould", 9:"s_idcv_yourefullofshitjustp"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][8] = [0:"s_idcv_whatdoyouthinkofthel", 1:"s_idcv_idontknowalotabouthi", 2:"s_idcv_thewolftrustedhim", 3:"s_idcv_andhowdidthatturnout", 4:"s_idcv_ibelieveinhimheisbol", 5:"s_idcv_thosearemiraclesinth", 6:"s_idcv_youresayinghesatyran", 7:"s_idcv_imsayinghemustprovew"];
    level.battlechatter.eventstrings["AQS"]["idle_conv"][9] = [0:"s_idcv_youknowwhywereguardi", 1:"s_idcv_thisisourhome", 2:"s_idcv_nobrotheritstostopth", 3:"s_idcv_becausetheywanttotak", 4:"s_idcv_theydontgiveashitabo", 5:"s_idcv_nowhat", 6:"s_idcv_abrokenwatchandsomec", 7:"s_idcv_theyrejustthieves", 8:"s_idcv_simplesmallbrainedth", 9:"s_idcv_pathetic"];
    map_name = function_53c4c53197386572(level.script, "");
    level.battlechatter.eventstrings["RU"]["idle_solo"] = [];
    level.battlechatter.eventstrings["RU"]["idle_solo"][0] = [0:"s_ic01_ineedastatusupdate", 1:"s_ic01_stillinprogress", 2:"s_ic01_whatstheholdup", 3:"s_ic01_itwentoffline", 4:"s_ic01_eta", 5:"s_ic01_10mikes"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][1] = [0:"s_ic03_howsyourperimeter", 1:"s_ic03_justfinishedasweepal", 2:"s_ic03_copy", 3:"s_ic03_illtakeanotherpassin", 4:"s_ic03_goodstayonit", 5:"s_ic03_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][2] = [0:"s_ic05_delta03howmuchlonger", 1:"s_ic05_5mikes", 2:"s_ic05_whenyouredonemoveont", 3:"s_ic05_rogerwantmetocomebac", 4:"s_ic05_sendcharliesquadover", 5:"s_ic05_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][3] = [0:"s_ic07_alpha02anyhostiles", 1:"s_ic07_negativenothingyet", 2:"s_ic07_copymaintainposition", 3:"s_ic07_youseeanything", 4:"s_ic07_negativebutstayalert", 5:"s_ic07_rogerthatalpha01"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][4] = [0:"s_ic09_alpha03areyoudone", 1:"s_ic09_negativeinprogress", 2:"s_ic09_shouldvebeenfinished", 3:"s_ic09_itllbeonschedule", 4:"s_ic09_pickupthepacecommand", 5:"s_ic09_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][5] = [0:"s_ic11_alphateamreport", 1:"s_ic11_thisisalphawerewrapp", 2:"s_ic11_copyyouarecleartopro", 3:"s_ic11_whatsdeltassituation", 4:"s_ic11_halfwaydoneonschedul", 5:"s_ic11_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][6] = [0:"s_ic13_tango02whenyouredone", 1:"s_ic13_copy", 2:"s_ic13_makeitquick", 3:"s_ic13_didsomethinghappen", 4:"s_ic13_captainwantstwomanfi", 5:"s_ic13_rogertango01"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][7] = [0:"s_ic15_alphateamreport", 1:"s_ic15_inpositionnomovement", 2:"s_ic15_copystayonalert", 3:"s_ic15_anythingfromtheother", 4:"s_ic15_negativenocontacts", 5:"s_ic15_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][8] = [0:"s_ic17_alpha03havereinforce", 1:"s_ic17_negativewearestillwa", 2:"s_ic17_updatemewhentheydo", 3:"s_ic17_copystillonschedule", 4:"s_ic17_notiftangodoesntgeth", 5:"s_ic17_illmakesuretheydo"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][9] = [0:"s_ic19_commandthisisalpha01", 1:"s_ic19_lastknownlocation", 2:"s_ic19_sector7", 3:"s_ic19_inspectitbeonguard", 4:"s_ic19_copy", 5:"s_ic19_givemeupdateseveryfi"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][10] = [0:"s_ic21_delta02haveyoufounda", 1:"s_ic21_negativeandyou", 2:"s_ic21_nothingyet", 3:"s_ic21_wasourinteloff", 4:"s_ic21_keepsearchingitshere", 5:"s_ic21_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][11] = [0:"s_ic23_whiskey02areweready", 1:"s_ic23_negativeinprogress", 2:"s_ic23_eta", 3:"s_ic23_tenmikes", 4:"s_ic23_movefasterclocksrunn", 5:"s_ic23_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][12] = [0:"s_ic25_alpha03toallteamspos", 1:"s_ic25_goodcommandsnotfucki", 2:"s_ic25_shouldimeetwithecho", 3:"s_ic25_negativeholdposition", 4:"s_ic25_rogerstandingby", 5:"s_ic25_updateinfive"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][13] = [0:"s_ic27_thisisdelta02noactiv", 1:"s_ic27_copy02", 2:"s_ic27_goingtofindcharliehi", 3:"s_ic27_copystayalerthostile", 4:"s_ic27_willradiowhenivemade", 5:"s_ic27_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][14] = [0:"s_ic29_whiskey04reportingal", 1:"s_ic29_copywhiskeykeepmeupd"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][15] = [0:"s_ic31_thisisalpha02allquie", 1:"s_ic31_copythatalphamaintai", 2:"s_ic31_roger", 3:"s_ic31_deltasstill10mikesou", 4:"s_ic31_willholduntiltheyarr", 5:"s_ic31_beonguard"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][16] = [0:"s_ic33_rotationcommencingin", 1:"s_ic33_copywhostakingover", 2:"s_ic33_delta", 3:"s_ic33_canyouconfirmournext", 4:"s_ic33_affirmativesector3no", 5:"s_ic33_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][17] = [0:"s_ic35_thisistango01iminpos", 1:"s_ic35_copyhowdoesitlook", 2:"s_ic35_areaislocked", 3:"s_ic35_sweepagainstayonthis", 4:"s_ic35_copywillupdateinfive", 5:"s_ic35_copy"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][18] = [0:"s_ic37_thisischarlie01givem", 1:"s_ic37_charlie01exfilinboun", 2:"s_ic37_markingstationone", 3:"s_ic37_affirmative", 4:"s_ic37_beonguard", 5:"s_ic37_willradiowheniseethe"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][19] = [0:"s_ic39_whatsyourstatustango", 1:"s_ic39_tango02allclear", 2:"s_ic39_copyyouseecharlie", 3:"s_ic39_affirmativecharlieis", 4:"s_ic39_stayalertandholdposi", 5:"s_ic39_roger"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][20] = [0:"s_ic41_thisissierra02inposi", 1:"s_ic41_copysierrazuluandalp", 2:"s_ic41_eta", 3:"s_ic41_tminusfour", 4:"s_ic41_statusonecho", 5:"s_ic41_movingnow"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][21] = [0:"s_ic43_delta01inpositionare", 1:"s_ic43_copy01youconnectwith", 2:"s_ic43_affirmativetheyreinp", 3:"s_ic43_copy", 4:"s_ic43_therearealotofteamso", 5:"s_ic43_commandsnottakingany"];
    level.battlechatter.eventstrings["RU"]["idle_solo"][22] = [0:"s_ic45_zulu02inposition", 1:"s_ic45_copystayputcommsares", 2:"s_ic45_contact", 3:"s_ic45_unknownstayonguardun", 4:"s_ic45_rogergunsareready", 5:"s_ic45_copy"];
    level.battlechatter.eventstrings["RU"]["idle_conv"] = [];
    level.battlechatter.eventstrings["RU"]["idle_conv"][0] = [0:"s_ic02_whatsyourstatus", 1:"s_ic02_workingonit", 2:"s_ic02_helosarealreadyinbou", 3:"s_ic02_illbringintangotohel", 4:"s_ic02_getitdonein15", 5:"s_ic02_willdoitin10"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][1] = [0:"s_ic04_anyactivity", 1:"s_ic04_perimetersclear", 2:"s_ic04_sweepitagain", 3:"s_ic04_copywillheadoutinfiv", 4:"s_ic04_staysharp", 5:"s_ic04_rog"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][2] = [0:"s_ic06_eta", 1:"s_ic06_shouldbedonein20", 2:"s_ic06_hopedforsooner", 3:"s_ic06_whatmattersisthatits", 4:"s_ic06_captainstimelinenotm", 5:"s_ic06_wereonit"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][3] = [0:"s_ic08_anymovement", 1:"s_ic08_negativeyou", 2:"s_ic08_notyet", 3:"s_ic08_hostilescouldbeplayi", 4:"s_ic08_ingoodpositionwerese", 5:"s_ic08_copythatkeepingwatch"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][4] = [0:"s_ic10_howarewedoingonprep", 1:"s_ic10_everythingisset", 2:"s_ic10_sector2", 3:"s_ic10_tangoteamsgotitlocke", 4:"s_ic10_wewillmeetwiththemon", 5:"s_ic10_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][5] = [0:"s_ic12_captainwantsanupdate", 1:"s_ic12_tenmoreminutes", 2:"s_ic12_makeitinfive", 3:"s_ic12_weneedmorebodiesonit", 4:"s_ic12_charlieteam", 5:"s_ic12_theyshouldbewrappeds"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][6] = [0:"s_ic14_wereceiveneworders", 1:"s_ic14_affirmativeweretomee", 2:"s_ic14_location", 3:"s_ic14_outerperimeterfullsw", 4:"s_ic14_copy", 5:"s_ic14_letsmove"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][7] = [0:"s_ic16_wherearetheothers", 1:"s_ic16_alpha02and03aresecur", 2:"s_ic16_andthecaptain", 3:"s_ic16_syncingwithdeltateam", 4:"s_ic16_justyouandmethen", 5:"s_ic16_morethanenough"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][8] = [0:"s_ic18_commandsentanupdater", 1:"s_ic18_gooddeltaneedsmoresu", 2:"s_ic18_andzulu", 3:"s_ic18_finishedtenminutesag", 4:"s_ic18_tellthemtosupportdel", 5:"s_ic18_copy"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][9] = [0:"s_ic20_deltamissedacommchec", 1:"s_ic20_whatwastheirlastloca", 2:"s_ic20_patrollingthefarside", 3:"s_ic20_notifytangotheyreclo", 4:"s_ic20_shouldwejoin", 5:"s_ic20_negativestayonpost"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][10] = [0:"s_ic22_anyupdates", 1:"s_ic22_negative", 2:"s_ic22_itsgoingtobearoundhe", 3:"s_ic22_permissiontoredirect", 4:"s_ic22_negativealphasonpatr", 5:"s_ic22_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][11] = [0:"s_ic24_youhaveenoughcharges", 1:"s_ic24_negativerunninglow", 2:"s_ic24_locatedeltaforresupp", 3:"s_ic24_copy", 4:"s_ic24_needtobedoneinfive", 5:"s_ic24_onit"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][12] = [0:"s_ic26_commandwantseverythi", 1:"s_ic26_charliesdoinganother", 2:"s_ic26_makesuretheyrethorou", 3:"s_ic26_roger", 4:"s_ic26_nowitnesses", 5:"s_ic26_willreportbackwhenwe"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][13] = [0:"s_ic28_sector2isclear", 1:"s_ic28_wehavereportsofhosti", 2:"s_ic28_yessir", 3:"s_ic28_youseeanythingradioa", 4:"s_ic28_copy", 5:"s_ic28_switchinfourhours"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][14] = [0:"s_ic30_whiskeysquadscombing", 1:"s_ic30_andecho", 2:"s_ic30_patrolling", 3:"s_ic30_copybereadytomove", 4:"s_ic30_yessir", 5:"s_ic30_untilthenbevigilant"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][15] = [0:"s_ic32_cantseeshit", 1:"s_ic32_wellholdhere", 2:"s_ic32_alphassweepingsector", 3:"s_ic32_keepwatchiftheymoves", 4:"s_ic32_roger", 5:"s_ic32_illupdatecommand"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][16] = [0:"s_ic34_deltasshiftingtosect", 1:"s_ic34_whythechange", 2:"s_ic34_alphasquadarrived", 3:"s_ic34_copy", 4:"s_ic34_weremorethancoveredn", 5:"s_ic34_letsgetamoveon"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][17] = [0:"s_ic36_sierrasinposition", 1:"s_ic36_zulusontheperimeter", 2:"s_ic36_radiocommandtellthem", 3:"s_ic36_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][18] = [0:"s_ic38_whatsthestatusonexfi", 1:"s_ic38_commandsayshelosared", 2:"s_ic38_howmany", 3:"s_ic38_three", 4:"s_ic38_copyholdyourposition", 5:"s_ic38_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][19] = [0:"s_ic40_commandwantstheaoloc", 1:"s_ic40_onit", 2:"s_ic40_keepthosecornersclea", 3:"s_ic40_anythinginbound", 4:"s_ic40_nothingyetordersaret", 5:"s_ic40_copy"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][20] = [0:"s_ic42_whiskeyisinposition", 1:"s_ic42_zulu", 2:"s_ic42_inboundinfive", 3:"s_ic42_theyrelate", 4:"s_ic42_charliewillcover", 5:"s_ic42_copy"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][21] = [0:"s_ic44_weset", 1:"s_ic44_affirmative", 2:"s_ic44_status", 3:"s_ic44_allclear", 4:"s_ic44_stayvigilantcheckini", 5:"s_ic44_roger"];
    level.battlechatter.eventstrings["RU"]["idle_conv"][22] = [0:"s_ic46_commandgavewordtomov", 1:"s_ic46_arewecoveringtheirse", 2:"s_ic46_negativetheyrehandle", 3:"s_ic46_copywelldoanotherswe", 4:"s_ic46_agreedwellsplitthete", 5:"s_ic46_roger"];
    if (map_name == "cp_jup_port") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = [0:"s_icsp_statusreport", 1:"s_icsp_haventlocatedthepayl", 2:"s_icsp_hesnotgonnabehappyab", 3:"s_icsp_thecompanysgonethrou", 4:"s_icsp_thenitshiddensomewhe", 5:"s_icsp_keepyoureyesopen"];
        level.battlechatter.eventstrings["RU"]["idle_solo"][24] = [0:"s_isp2_wedonthavetimeforthi", 1:"s_isp2_weremarkingaswegowel", 2:"s_isp2_howmuchhavewesearche", 3:"s_isp2_aboutfortypercentoft", 4:"s_isp2_onlyforty", 5:"s_isp2_wecanbruteforceitweh"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = [0:"s_id01_perimeterclear", 1:"s_id01_affirmativenoactivit", 2:"s_id01_theambushwaseffectiv", 3:"s_id01_charliesstillmopping", 4:"s_id01_tellthemtohurryuplet", 5:"s_id01_copythat"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = [0:"s_icdf_youfoundherfarahkari", 1:"s_icdf_onlythebodyoftheharb", 2:"s_icdf_wastheshipsmanifesto", 3:"s_icdf_negative", 4:"s_icdf_thenwellhavetodothis", 5:"s_icdf_gotateamontheboatnow"];
    }
    if (map_name == "cp_jup_chemical") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = [0:"s_icsc_anysignoftheulf", 1:"s_icsc_negative", 2:"s_icsc_thatcanchangegotword", 3:"s_icsc_ifulfstheretheyrenot", 4:"s_icsc_juststayalert", 5:"s_icsc_copythat"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = [0:"s_ichg_wefindthatpayloadwen", 1:"s_ichg_alphasquadsonit", 2:"s_ichg_fasterwefindthepaylo", 3:"s_ichg_illradiocharlieseeif", 4:"s_ichg_gotcheckinseveryfive", 5:"s_ichg_copythat"];
    }
    if (map_name == "cp_jup_ranch") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = [0:"s_icsr_delta02toalpha01what", 1:"s_icsr_delta02perimeterclea", 2:"s_icsr_copykeepitlockeddown", 3:"s_icsr_isalphadonewiththebo", 4:"s_icsr_almostwillkeepyouupd", 5:"s_icsr_rogerthat"];
        level.battlechatter.eventstrings["RU"]["idle_solo"][24] = [0:"s_isr2_locatedanything", 1:"s_isr2_foundacouplecellsnea", 2:"s_isr2_ifanythingsurvivedwe", 3:"s_isr2_illdoanotherlooparou", 4:"s_isr2_reportbackinfive", 5:"s_isr2_copy"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = [0:"s_icdr_findanything", 1:"s_icdr_negativejustdebrisyo", 2:"s_icdr_notyet", 3:"s_icdr_searchteamsaremaking", 4:"s_icdr_thatjustleavesthecel", 5:"s_icdr_wefindanyfootagethat"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = [0:"s_icso_seeanyphonesoverther", 1:"s_icso_negativemovingontoth", 2:"s_icso_searchteamspulledthe", 3:"s_icso_goodanythingelsefrom", 4:"s_icso_tightenperimeter", 5:"s_icso_noonewillgetinoroutu"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][25] = [0:"s_icut_notfindingmuchjustde", 1:"s_icut_keepsearchingbosswan", 2:"s_icut_phonescameras", 3:"s_icut_anythingthatsnotours", 4:"s_icut_roger", 5:"s_icut_wefindanythingthatim"];
    }
    if (map_name == "cp_jup_resort") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = [0:"s_icst_weshoulddoanothersea", 1:"s_icst_romanovawantsanupdat", 2:"s_icst_everyfiveminutes", 3:"s_icst_sheknowswhatshesdoin", 4:"s_icst_tellcharlieanddeltat", 5:"s_icst_copythatrelaying"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = [0:"s_icor_romanovasbeengetting", 1:"s_icor_deltasmonitoringfori", 2:"s_icor_thingsaregettinghot", 3:"s_icor_wellneedtotightensec", 4:"s_icor_intruderslikelythen", 5:"s_icor_affirmativesweepthea"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = [0:"s_icsf_charlieanddeltasquad", 1:"s_icsf_romanovawantsupdates", 2:"s_icsf_copythatillletthemkn", 3:"s_icsf_anynewsfromtheothers", 4:"s_icsf_theyreclear", 5:"s_icsf_tellthemtocheckagain"];
    }
    if (map_name == "cp_jup_dam") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = [0:"s_icsd_charlie04thisisalpha", 1:"s_icsd_payloadssetperimeter", 2:"s_icsd_checkitagaincantbeto", 3:"s_icsd_youveseenthechemical", 4:"s_icsd_lethalashelldontdrop", 5:"s_icsd_solidcopy"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = [0:"s_icpa_anyupdatesfromteam4", 1:"s_icpa_theirpayloadsalmosts", 2:"s_icpa_tellthemtohurryitup", 3:"s_icpa_copy", 4:"s_icpa_havethesnipersholdon", 5:"s_icpa_theyrealreadyinposit"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = [0:"s_id03_charlieteamsaysthepa", 1:"s_id03_tellthemtostayalertd", 2:"s_id03_copythat", 3:"s_id03_thenwegottamove", 4:"s_id03_jltvsarestandingby", 5:"s_id03_dontwanttobeanywhere"];
    }
    if (map_name == "cp_jup_apt") {
        level.battlechatter.eventstrings["RU"]["idle_solo"][23] = [0:"s_ic47_delta04status", 1:"s_ic47_shipmentsnearlyready", 2:"s_ic47_notraces", 3:"s_ic47_wewereneverhere", 4:"s_ic47_illupdatenolanlethim", 5:"s_ic47_copythat"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][23] = [0:"s_ic49_tangoandcharliedeplo", 1:"s_ic49_wheretheyheaded", 2:"s_ic49_easternurzikstan", 3:"s_ic49_whataboutus", 4:"s_ic49_willgetourdestinatio", 5:"s_ic49_solidcopy"];
        level.battlechatter.eventstrings["RU"]["idle_conv"][24] = [0:"s_ic48_pingdeltacommandwant", 1:"s_ic48_truckswerelatetheyre", 2:"s_ic48_nolansnotgoingtolike", 3:"s_ic48_illtellthemtopickupt", 4:"s_ic48_goodtheyreexpectingt", 5:"s_ic48_copythat"];
    }
    level.battlechatter.eventstrings["AQS_L"]["reply_hear_you"] = [0:"s_idrp_yesbrother", 1:"s_idrp_goahead", 2:"s_idrp_thisiscommand", 3:"s_idrp_whatisitbrother", 4:"s_idrp_yesihearyou", 5:"s_idrp_ihearyougoahead"];
    level.battlechatter.eventstrings["AQS_L"]["react_interrupt"] = [0:"s_idli_whatswrong", 1:"s_idli_whatwasthat", 2:"s_idli_whathappened", 3:"s_idli_ididnthearyoubrother", 4:"s_idli_issomethingwrong", 5:"s_idli_areyouokaybrother"];
    level.battlechatter.eventstrings["AQS_L"]["react_noreply"] = [0:"s_idli_areyouthere", 1:"s_idli_didiloseyou", 2:"s_idli_canyouhearmebrother"];
    level.battlechatter.eventstrings["AQS_L"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["AQS_L"]["signoff"] = [0:"s_idls_outhere", 1:"s_idls_commandout", 2:"s_idls_staysafebrotherout", 3:"s_idls_out"];
    level.battlechatter.eventstrings["AQS_L"]["inv_patrol"] = [0:"s_alip_resumeyourpatrolkeep", 1:"s_alip_getbacktoyourpatrolb", 2:"s_alip_returntoyourpatrolbu"];
    level.battlechatter.eventstrings["AQS_L"]["report_search"] = [0:"s_alip_whatsyourstatus", 1:"s_aias_reportin", 2:"s_aias_haveyoufoundanything", 3:"s_aias_givemeanupdate", 4:"s_aias_whathaveyougot"];
    level.battlechatter.eventstrings["AQS_L"]["wait_target_surface"] = [0:"s_lkwr_whentheycomesupforai", 1:"s_lkwr_theypoptheirheadouty", 2:"s_lkwr_whentheycomeupyoukil", 3:"s_lkwr_theygoforairyoutaket", 4:"s_lkwr_whentheypopuptheyred", 5:"s_lkwr_theyllcomeupforairwh"];
    level.battlechatter.eventstrings["AQS_L"]["order_find_target"] = [0:"s_cmho_findthem", 1:"s_cmho_searcheverywherefind", 2:"s_cmho_huntthemdown"];
    level.battlechatter.eventstrings["AQS_L"]["order_find_perimeter"] = [0:"s_cmho_cleartheperimeter", 1:"s_cmho_securetheperimeter", 2:"s_cmho_gettheperimeterclear"];
    level.battlechatter.eventstrings["AQS_L"]["order_search_water"] = [0:"s_cmho_searchthewater", 1:"s_cmho_checkthewater", 2:"s_cmho_theywereinthewater", 3:"s_cmho_keepyoureyesonthewat", 4:"s_cmho_watchthewater"];
    level.battlechatter.eventstrings["AQS_L"]["good_hunting"] = [0:"s_hnts_besafebrother", 1:"s_hnts_stayvigilantbrother", 2:"s_hnts_becarefuloutthere", 3:"s_aisg_copybesafebrother"];
    level.battlechatter.eventstrings["AQS_L"]["ask_found_anything"] = [0:"s_aqhr_haveyoufoundanything", 1:"s_aqhr_whathaveyoufound", 2:"s_aqhr_whathaveyougot"];
    level.battlechatter.eventstrings["AQS_L"]["order_take_point"] = [0:"s_aqhr_reportin", 1:"s_aqhr_givemesomething", 2:"s_aqhr_tellmeyouhavesomethi"];
    level.battlechatter.eventstrings["AQS_L"]["hunt_report_alert"] = [0:"s_aqhr_anenemyisintheareahu", 1:"s_aqhr_wehaveanenemyinsidet", 2:"s_aqhr_brotherstheresanenem", 3:"s_aqlo_spreadoutfindthem", 4:"s_aqlo_searchtheareafindthe", 5:"s_aqlo_spreadoutsearchthear"];
    level.battlechatter.eventstrings["AQS_L"]["order_continue_search"] = [0:"s_aqho_continuesweeping", 1:"s_aqho_keepsearchingthearea", 2:"s_aqho_searchtheareauntilyo"];
    level.battlechatter.eventstrings["AQS_L"]["order_stay_alert"] = [0:"s_aqho_stayalert", 1:"s_aqho_keepyoureyesopen", 2:"s_aqho_stayfocusedbrother"];
    level.battlechatter.eventstrings["AQS_L"]["order_stay_aware"] = [0:"s_aqho_guardyourselfbrother", 1:"s_aqho_donotunderestimateth", 2:"s_aqho_keepyourguardup"];
    level.battlechatter.eventstrings["AQS_L"]["ask_how_copy"] = [0:"s_idcm_doyouhearmebrother", 1:"s_idcm_comein", 2:"s_idcm_thisiscommand"];
    level.battlechatter.eventstrings["AQS_L"]["inv_no_response"] = [0:"s_iinr_hesnotrespondingonra", 1:"s_iinr_icantreachhim", 2:"s_iinr_hesnotansweringhisra", 3:"s_iinr_hesnotresponding"];
    level.battlechatter.eventstrings["AQS_L"]["order_get_visual"] = [0:"s_iinr_canyougocheckitout", 1:"s_iinr_checkitoutmakesureno", 2:"s_iinr_seeifyoucanfindhimok", 3:"s_iinr_ineedyoucheckitout"];
    level.battlechatter.eventstrings["AQS_L"]["inv_patrol_noresp"] = [0:"s_iinr_patrolisntresponding", 1:"s_iinr_patroldidntcheckin", 2:"s_iinr_patrolisntansweringo", 3:"s_iinr_icantreachpatrol"];
    level.battlechatter.eventstrings["AQS_L"]["hunt_patrol_noresp"] = [0:"s_iinr_patrolisntresponding_01", 1:"s_iinr_patroldidntcheckin_01", 2:"s_iinr_patrolisntansweringo_01", 3:"s_iinr_icantreachpatrol_01", 4:"s_hpnr_patrolisntresponding", 5:"s_hpnr_patroldidntcheckin", 6:"s_hpnr_patrolisntansweringo", 7:"s_hpnr_icantreachpatrol"];
    level.battlechatter.eventstrings["AQS_L"]["report_alert"] = [0:"s_airp_brotherswemayhavecom", 1:"s_airp_allteamswemayhaveasi", 2:"s_airp_everyonetightenupwem", 3:"s_airp_brotherskeepyoureyes"];
    level.battlechatter.eventstrings["AQS_L"]["report_reply_search"] = [0:"s_wrpl_iftheyshowupagainyou", 1:"s_wrpl_ifyouseethemagainope", 2:"s_wrpl_iftheyshowbackupyour"];
    level.battlechatter.eventstrings["AQS_L"]["warn_reply"] = [0:"s_wrpl_iftheyshowupagainsho", 1:"s_wrpl_ifyouseethemagainope_01", 2:"s_wrpl_iftheyreturnjustkill"];
    level.battlechatter.eventstrings["AQS_L"]["report_target_location"] = [0:"s_chrp_givemeanupdatedoesan", 1:"s_chrp_talktomeguyswhatsthe", 2:"s_chrp_starttalkingguysiwan", 3:"s_chrp_reportinguyswhereare"];
    level.battlechatter.eventstrings["AQS_L"]["report_idle"] = [0:"s_irpr_status", 1:"s_irpr_report", 2:"s_irpr_anythingtoreport", 3:"s_irpr_gotanything", 4:"s_irpr_checkin"];
    level.battlechatter.eventstrings["AQS_L"]["ally_missing_multi"] = [0:"s_alms_multipleteamsarentre", 1:"s_alms_anothergroupisntresp", 2:"s_alms_wevelostcontactwitha", 3:"s_alms_anotherteamfailedtor"];
    level.battlechatter.eventstrings["AQS_L"]["order_search_start"] = [0:"s_aior_searchthearea", 1:"s_aior_searcharound", 2:"s_aior_sweeptheperimeter"];
    level.battlechatter.eventstrings["AQS_L"]["order_report_back"] = [0:"s_aior_reportwhatyoufind", 1:"s_aior_radioifyoufindanythi", 2:"s_aior_reportbackifyoufinds"];
    level.battlechatter.eventstrings["PMC"]["left"] = [0:"c_posn_leftside", 1:"c_posn_left", 2:"c_posn_checkleft", 3:"c_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["PMC"]["right"] = [0:"c_posn_rightside", 1:"c_posn_theyreflankingright", 2:"c_posn_right", 3:"c_posn_checkright"];
    level.battlechatter.eventstrings["PMC"]["ahead"] = [0:"c_posn_straightahead", 1:"c_posn_rightinfrontofus", 2:"c_posn_aheadofus", 3:"c_posn_front", 4:"c_posn_deadahead"];
    level.battlechatter.eventstrings["PMC"]["behind"] = [0:"c_posn_behindus", 1:"c_posn_onoursix", 2:"c_posn_checkrear", 3:"c_posn_rear"];
    level.battlechatter.eventstrings["PMC"]["high"] = [0:"c_posn_uptop", 1:"c_posn_checkhigh"];
    level.battlechatter.eventstrings["PMC"]["use_flash"] = [0:"c_ator_useaflashbang", 1:"c_ator_throwaflashbang", 2:"c_ator_tossaflashbang"];
    level.battlechatter.eventstrings["PMC"]["use_grenade"] = [0:"c_ator_useagrenade", 1:"c_ator_throwafrag", 2:"c_ator_tossafrag"];
    level.battlechatter.eventstrings["PMC"]["use_molotov"] = [0:"c_ator_throwamolotov", 1:"c_ator_useamolotov", 2:"c_ator_tossamolotov"];
    level.battlechatter.eventstrings["PMC"]["use_rpg"] = [0:"c_ator_hitemwitharocket", 1:"c_ator_usearocket", 2:"c_ator_rocket"];
    level.battlechatter.eventstrings["PMC"]["order_attack"] = [0:"c_ator_engage", 1:"c_ator_giveemsome", 2:"c_ator_dumpem", 3:"c_ator_gohot", 4:"c_ator_fuckinshootem", 5:"c_ator_startsmokinem"];
    level.battlechatter.eventstrings["PMC"]["attacking"] = [0:"c_atac_goinghot", 1:"c_atac_engaging", 2:"c_atac_openinup"];
    level.battlechatter.eventstrings["PMC"]["using_rpg"] = [0:"c_atac_rocket", 1:"c_atac_rocket_01"];
    level.battlechatter.eventstrings["PMC"]["using_smoke"] = [0:"c_atac_throwingsmoke", 1:"c_atac_smokeout"];
    level.battlechatter.eventstrings["PMC"]["using_flash"] = [0:"c_atac_flashbangout", 1:"c_atac_throwingflashbang"];
    level.battlechatter.eventstrings["PMC"]["using_grenade"] = [0:"c_atac_fragout", 1:"c_atac_throwingafrag"];
    level.battlechatter.eventstrings["PMC"]["using_molotov"] = [0:"c_atac_throwingmolotov", 1:"c_atac_molotovout"];
    level.battlechatter.eventstrings["PMC"]["movingup"] = [0:"c_tcac_impushingup", 1:"c_tcac_pushingforward", 2:"c_tcac_movingup", 3:"c_tcac_pushinup"];
    level.battlechatter.eventstrings["PMC"]["getting_cover"] = [0:"c_tcac_covercover", 1:"c_tcac_takingcover", 2:"c_tcac_movingtocover"];
    level.battlechatter.eventstrings["PMC"]["reloading"] = [0:"c_tcac_reloading", 1:"c_tcac_changingmags"];
    level.battlechatter.eventstrings["PMC"]["moving"] = [0:"c_tcac_moving", 1:"c_tcac_immoving", 2:"c_tcac_heyimmoving"];
    level.battlechatter.eventstrings["PMC"]["enemy_using_flash"] = [0:"c_eata_flashincoming", 1:"c_eata_flashgrenade", 2:"c_eata_flash", 3:"c_eata_flashgrenade_01"];
    level.battlechatter.eventstrings["PMC"]["enemy_using_grenade"] = [0:"c_eata_grenade", 1:"c_eata_grenadewatchout", 2:"c_eata_grenadeincoming"];
    level.battlechatter.eventstrings["PMC"]["enemy_using_molotov"] = [0:"c_eata_molotov", 1:"c_eata_molotovincoming", 2:"c_eata_molotov_01"];
    level.battlechatter.eventstrings["PMC"]["enemy_using_rpg"] = [0:"c_eata_rpg", 1:"c_eata_rpgincoming", 2:"c_eata_rpggetdown"];
    level.battlechatter.eventstrings["PMC"]["enemy_attacking"] = [0:"c_eata_takingfire", 1:"c_eata_contact", 2:"c_eata_shadowsincontact"];
    level.battlechatter.eventstrings["PMC"]["enemy_moving_up"] = [0:"c_etca_onespushing", 1:"c_etca_gotonemovingup", 2:"c_etca_onesmovingup"];
    level.battlechatter.eventstrings["PMC"]["enemy_getting_cover"] = [0:"c_etca_novisualontarget", 1:"c_etca_gotonetakingcover", 2:"c_etca_onesmovingtocover", 3:"c_etca_novisualontarget_01"];
    level.battlechatter.eventstrings["PMC"]["enemy_reloading"] = [0:"c_etca_onesreloading", 1:"c_etca_onesreloading_01", 2:"c_etca_oneschangingmags"];
    level.battlechatter.eventstrings["PMC"]["enemy_flanking_left"] = [0:"c_etca_onesmovingleft", 1:"c_etca_leftflank", 2:"c_etca_guardleft"];
    level.battlechatter.eventstrings["PMC"]["enemy_flanking_right"] = [0:"c_etca_guardright", 1:"c_etca_rightflank", 2:"c_etca_onesmovingright"];
    level.battlechatter.eventstrings["PMC"]["enemy_moving"] = [0:"c_etca_onesmovin", 1:"c_etca_thatonesmoving", 2:"c_etca_gotonemoving"];
    level.battlechatter.eventstrings["PMC"]["target_getting_cover"] = [0:"c_ttca_theyremovingtocover", 1:"c_ttca_hesgoingforcover", 2:"c_ttca_hestakingcover"];
    level.battlechatter.eventstrings["PMC"]["target_reloading"] = [0:"c_ttca_theyrereloading", 1:"c_ttca_hesout", 2:"c_ttca_hesreloading"];
    level.battlechatter.eventstrings["PMC"]["target_moving"] = [0:"c_ttca_theyremoving", 1:"c_ttca_hesmoving", 2:"c_ttca_hesrunning"];
    level.battlechatter.eventstrings["PMC"]["target_moving_up"] = [0:"c_ttca_theyremovingup", 1:"c_ttca_hescominguponyou", 2:"c_ttca_hesmovingup"];
    level.battlechatter.eventstrings["PMC"]["target_near_patrol"] = [0:"c_ttca_theyreswimmingnearth", 1:"c_ttca_theyreswimmingyourwa", 2:"c_ttca_interceptthem"];
    level.battlechatter.eventstrings["PMC"]["enemy_soldier"] = [0:"c_enmy_visualonatarget", 1:"c_enmy_targetspotted", 2:"c_enmy_gotatarget"];
    level.battlechatter.eventstrings["PMC"]["enemy_soldiers"] = [0:"c_enmy_targets", 1:"c_enmy_targets_01", 2:"c_enmy_wegotbadguys"];
    level.battlechatter.eventstrings["PMC"]["neg_target"] = [0:"c_aqen_idontseeem", 1:"c_aqen_novisual", 2:"c_aqen_cantseehim", 3:"c_aqen_wherethefuckishe"];
    level.battlechatter.eventstrings["PMC"]["aquired_target"] = [0:"c_aqen_gotavisual", 1:"c_aqen_targetacquired", 2:"c_aqen_iseehim", 3:"c_aqen_thereheis"];
    level.battlechatter.eventstrings["PMC"]["enemy_exposed"] = [0:"c_exco_onesintheopen", 1:"c_exco_onesintheopen_01", 2:"c_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["PMC"]["target_exposed"] = [0:"c_exco_theyreintheopen", 1:"c_exco_hesintheopen", 2:"c_exco_theyreintheopen_01"];
    level.battlechatter.eventstrings["PMC"]["youre_exposed"] = [0:"c_exco_findcover"];
    level.battlechatter.eventstrings["PMC"]["target_covered"] = [0:"c_exco_hesbehindcover", 1:"c_exco_hesgotcover", 2:"c_exco_hestakingcover"];
    level.battlechatter.eventstrings["PMC"]["killfirm_bigrig"] = [0:"c_firm_theyresemitrucksdown", 1:"c_firm_destroyedtheirsemitr", 2:"c_firm_enemysemitrucksdown"];
    level.battlechatter.eventstrings["PMC"]["killfirm_enemy"] = [0:"c_firm_gotone", 1:"c_firm_ekia", 2:"c_firm_targetdown"];
    level.battlechatter.eventstrings["PMC"]["killfirm_target"] = [0:"c_firm_hesdone", 1:"c_firm_hesdown", 2:"c_firm_dumpedhim"];
    level.battlechatter.eventstrings["PMC"]["killfirm_truck"] = [0:"c_firm_truckdestroyed", 1:"c_firm_theirtrucksdown", 2:"c_firm_enemytrucksdown"];
    level.battlechatter.eventstrings["PMC"]["killfirm_helo"] = [0:"c_firm_helodown", 1:"c_firm_helodestroyed", 2:"c_firm_theirhelosdown"];
    level.battlechatter.eventstrings["PMC"]["casualties"] = [0:"c_casu_weretakingheavies", 1:"c_casu_weregettingourassesk", 2:"c_casu_werelosingshooters", 3:"c_casu_weretakingcasualties"];
    level.battlechatter.eventstrings["PMC"]["copy"] = [0:"c_conf_copy", 1:"c_conf_check", 2:"c_conf_copythat", 3:"c_conf_goodcopy", 4:"c_conf_solidcopy", 5:"c_aqcp_copy", 6:"c_aqcp_solidcopy"];
    level.battlechatter.eventstrings["PMC"]["praise"] = [0:"c_pras_hellyeah", 1:"c_pras_niceone", 2:"c_pras_fuckina", 3:"c_pras_yeah", 4:"c_pras_getyousome"];
    level.battlechatter.eventstrings["PMC"]["low_ammo"] = [0:"c_stat_ineedamag", 1:"c_stat_lowonammo", 2:"c_stat_lastmag", 3:"c_stat_needammo", 4:"c_stat_imwinchester"];
    level.battlechatter.eventstrings["PMC"]["wounded"] = [0:"c_stat_imhit", 1:"c_stat_imshot", 2:"c_stat_medic"];
    level.battlechatter.eventstrings["PMC"]["ask_wounded"] = [0:"c_stat_yougood", 1:"c_stat_youwounded", 2:"c_stat_youhit"];
    level.battlechatter.eventstrings["PMC"]["ask_low_ammo"] = [0:"c_stat_howsyourammo", 1:"c_stat_checkyourammo", 2:"c_stat_whatsyourroundcount"];
    level.battlechatter.eventstrings["PMC"]["ask_status"] = [0:"c_stat_youokay", 1:"c_stat_whatsyourstatus", 2:"c_stat_status"];
    level.battlechatter.eventstrings["PMC"]["reply_wounded"] = [0:"c_stat_itookaround", 1:"c_stat_imgood", 2:"c_stat_yeahroundhittheplate"];
    level.battlechatter.eventstrings["PMC"]["reply_low_ammo"] = [0:"c_stat_runninglow", 1:"c_stat_imlow", 2:"c_stat_almostout"];
    level.battlechatter.eventstrings["PMC"]["reply_okay"] = [0:"c_stat_imsolid", 1:"c_stat_goodtogo", 2:"c_stat_goodhere"];
    level.battlechatter.eventstrings["PMC"]["wounded_enemy"] = [0:"c_aens_igothim", 1:"c_aens_clippedhim", 2:"c_aens_hitone"];
    level.battlechatter.eventstrings["PMC"]["ask_target_loc"] = [0:"c_tast_wheresheat", 1:"c_tast_doesanyonehaveavisua", 2:"c_tast_wherethefuckretheyat"];
    level.battlechatter.eventstrings["PMC"]["ask_target_wounded"] = [0:"c_tast_yougethim", 1:"c_tast_youhithim", 2:"c_tast_youdrophim"];
    level.battlechatter.eventstrings["PMC"]["target_wounded"] = [0:"c_tast_heshit", 1:"c_tast_heswounded", 2:"c_tast_hesbleeding"];
    level.battlechatter.eventstrings["PMC"]["target_unhurt"] = [0:"c_tast_hegotaway", 1:"c_tast_heranoff", 2:"c_tast_hesfallingback"];
    level.battlechatter.eventstrings["PMC"]["wounded_target"] = [0:"c_atas_woundedhim", 1:"c_atas_ihithim", 2:"c_atas_itaggedem"];
    level.battlechatter.eventstrings["PMC"]["enemy_shotgun"] = [0:"c_enws_shotgunwatchout", 1:"c_enws_onesgotashotgun", 2:"c_enws_shotgun"];
    level.battlechatter.eventstrings["PMC"]["enemy_sniper"] = [0:"c_enws_thatsasniper", 1:"c_enws_sniper", 2:"c_enws_enemysniper"];
    level.battlechatter.eventstrings["PMC"]["enemy_lmg"] = [0:"c_enws_enemymachinegunner", 1:"c_enws_lmg", 2:"c_enws_machinegun"];
    level.battlechatter.eventstrings["PMC"]["target_lmg"] = [0:"c_taws_theyreusingamachineg", 1:"c_taws_hesgotamachinegun", 2:"c_taws_machinegunner"];
    level.battlechatter.eventstrings["PMC"]["target_shotgun"] = [0:"c_taws_theyvegotashotgun", 1:"c_taws_hesgotashotgun"];
    level.battlechatter.eventstrings["PMC"]["target_sniper"] = [0:"c_taws_hessnipingus", 1:"c_taws_hesasniper"];
    level.battlechatter.eventstrings["PMC"]["checkfire"] = [0:"c_chck_checkyourfire", 1:"c_chck_watchyourfire", 2:"c_chck_blueblue", 3:"c_chck_checkfirecheckfire"];
    level.battlechatter.eventstrings["PMC"]["move"] = [0:"c_tcor_move", 1:"c_tcor_igotyoumove", 2:"c_tcor_startmoving", 3:"c_tcor_go"];
    level.battlechatter.eventstrings["PMC"]["moveup"] = [0:"c_tcor_moveup", 1:"c_tcor_moveupgo", 2:"c_tcor_pushup", 3:"c_tcor_getupthere", 4:"c_tcor_pushforward"];
    level.battlechatter.eventstrings["PMC"]["coverme"] = [0:"c_tcor_coverme", 1:"c_tcor_ineedcoverfire", 2:"c_tcor_coverme_01"];
    level.battlechatter.eventstrings["PMC"]["casualty"] = [0:"c_canm_wegotacasualty", 1:"c_canm_shadowdown", 2:"c_canm_wehaveashadowdown", 3:"c_canm_wevegotwounded", 4:"c_canm_mandown"];
    level.battlechatter.eventstrings["PMC"]["suppressing"] = [0:"c_aqsp_suppressingfire", 1:"c_aqsp_imcoveringyou", 2:"c_aqsp_coveringfire"];
    level.battlechatter.eventstrings["PMC"]["disguise_enter_combat"] = [0:"s_awrr_motherfucker", 1:"s_awrr_foundyou", 2:"s_awrr_igotyou", 3:"s_awrr_troopsincontact", 4:"s_awrr_gotyou", 5:"s_awrr_ifoundyou"];
    level.battlechatter.eventstrings["PMC"]["reply_hear_you"] = [0:"s_idrp_go", 1:"s_idrp_goahead", 2:"s_idrp_imhere", 3:"s_idrp_rogergoahead"];
    level.battlechatter.eventstrings["PMC"]["resp_patrol"] = [0:"s_idrp_thisisthresher", 1:"s_ahrp_thisisthresher"];
    level.battlechatter.eventstrings["PMC"]["muttered_confusion"] = [0:"s_idin_whatthefuck", 1:"s_idin_whatthehell", 2:"s_idin_whatthefuckwasthat", 3:"s_idin_whatthehellwasthat"];
    level.battlechatter.eventstrings["PMC"]["investigating"] = [0:"s_idin_illseewhatsup", 1:"s_idin_illcheckitout", 2:"s_idin_illgocheck"];
    level.battlechatter.eventstrings["PMC"]["inv_arrive"] = [0:"s_idin_hmm", 1:"s_idin_hmphokay", 2:"s_idin_huhwhatwasthat", 3:"s_idin_hrm", 4:"s_idin_huhthehell"];
    level.battlechatter.eventstrings["PMC"]["react_found_corpse"] = [0:"s_alrc_wegotamandown", 1:"s_alrc_wegotacasualty", 2:"s_alrc_gotashadowdown", 3:"s_alrc_wegotakia"];
    level.battlechatter.eventstrings["PMC"]["ask_corpse_name"] = [0:"s_alrc_whoisit", 1:"s_alrc_who", 2:"s_alrc_whodidwelose"];
    level.battlechatter.eventstrings["PMC"]["need_backup"] = [0:"s_alrc_sendshadows", 1:"s_alrc_sendreinforcements", 2:"s_albc_sendreinforcements"];
    level.battlechatter.eventstrings["PMC"]["hunt_affirm"] = [0:"s_hnrs_rog"];
    level.battlechatter.eventstrings["PMC"]["hunt_copy"] = [0:"s_hnrs_copy", 1:"s_hnrs_rogerthat", 2:"s_hnrs_copythat"];
    level.battlechatter.eventstrings["PMC"]["hunt_neg"] = [0:"s_hnrs_negative"];
    level.battlechatter.eventstrings["PMC"]["react_whizby"] = [0:"s_unrc_imtakingfire", 1:"s_unrc_thatsclose", 2:"s_unrc_someonesshootinatme", 3:"s_unrc_takineffectivefire", 4:"s_unrc_imgettingshotat"];
    level.battlechatter.eventstrings["PMC"]["react_loc"] = [0:"s_unrc_itcamefromoverthere", 1:"s_unrc_camefromthatway", 2:"s_unrc_thatwaythatway", 3:"s_unrc_itwasoverthatway", 4:"s_unrc_itcamefromthatdirect"];
    level.battlechatter.eventstrings["PMC"]["react_unaware"] = [0:"s_unrc_takingcontact", 1:"s_unrc_contactcontact", 2:"s_unrc_takingindirectfire"];
    level.battlechatter.eventstrings["PMC"]["over_there"] = [0:"s_hnfn_overthere", 1:"s_hnfn_theyreoverthere", 2:"s_hnfn_rightthere"];
    level.battlechatter.eventstrings["PMC"]["surprise"] = [0:"s_hurc_surprisedeffort", 1:"s_hurc_surprisedeffort_01", 2:"s_hurc_surprisedeffort_02", 3:"s_hurc_ohfuck", 4:"s_hurc_ohshit"];
    level.battlechatter.eventstrings["PMC"]["report_reply_idle"] = [0:"s_idrr_gotnothing", 1:"s_idrr_secure", 2:"s_idrr_clearhere", 3:"s_idrr_allclear", 4:"s_idrr_goodhere", 5:"s_idrr_allquiet", 6:"s_idrr_areassecure"];
    level.battlechatter.eventstrings["PMC"]["react_first"] = [0:"s_idrc_huh", 1:"s_idrc_wha", 2:"s_idrc_hm", 3:"s_idrc_eh", 4:"s_idrc_hrm", 5:"s_idrc_hmph"];
    level.battlechatter.eventstrings["PMC"]["react_second"] = [0:"s_idrc_whatthefuckisthat", 1:"s_idrc_whatthehellisthat", 2:"s_idrc_thefuckisgoingon"];
    level.battlechatter.eventstrings["PMC"]["react_multi"] = [0:"s_idrm_whosoutthere", 1:"s_idrm_okaywhatthefuck", 2:"s_idrm_whatisthisshit"];
    level.battlechatter.eventstrings["PMC"]["react_interrupt"] = [0:"s_idli_missedyourlastover", 1:"s_idli_sayagainover", 2:"s_idli_yougood"];
    level.battlechatter.eventstrings["PMC"]["react_noreply"] = [0:"s_idli_youreceivingme", 1:"s_idli_youcopy", 2:"s_idli_doyoureadme"];
    level.battlechatter.eventstrings["PMC"]["order_investigate"] = [0:"s_idio_gocheckit", 1:"s_idio_checkitout", 2:"s_idio_gocheckthatout"];
    level.battlechatter.eventstrings["PMC"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["PMC"]["idle_good_hunting"] = [0:"s_idls_stayfrosty", 1:"s_idls_keepittight", 2:"s_idls_staysharp"];
    level.battlechatter.eventstrings["PMC"]["inv_ask_first"] = [0:"s_idia_whatwasit", 1:"s_idia_whatdyoufind", 2:"s_idia_yougotanything", 3:"s_idia_seeanything", 4:"s_idia_findanything"];
    level.battlechatter.eventstrings["PMC"]["inv_ask_second"] = [0:"s_idia_whatwasitthistime", 1:"s_idia_anythingthistime", 2:"s_idia_stillnothing", 3:"s_idia_stilldidntfindanythi", 4:"s_idia_findanythingthistime"];
    level.battlechatter.eventstrings["PMC"]["resp_window_first"] = [0:"s_idir_awindowwasleftopenwe", 1:"s_idir_foundanopenwindowche", 2:"s_idir_someoneleftawindowop"];
    level.battlechatter.eventstrings["PMC"]["resp_water_first"] = [0:"s_idir_checkedthewaterthere", 1:"s_idir_sweptthewaterdidntfi", 2:"s_idir_checkednearthewaterw", 3:"s_idir_nothinginthewaterwer"];
    level.battlechatter.eventstrings["PMC"]["resp_sound_first"] = [0:"s_idir_nothingnobody", 1:"s_idir_negativewereclear", 2:"s_idir_nahweresecure", 3:"s_idir_nothingnovisual"];
    level.battlechatter.eventstrings["PMC"]["resp_window_multi"] = [0:"s_idir_sawanotheropenwindow", 1:"s_idir_anotheropenwindowwer", 2:"s_idir_therewasanotheropenw"];
    level.battlechatter.eventstrings["PMC"]["order_check_together"] = [0:"s_idit_letsgocheckitout", 1:"s_idit_letscheckitwatchmyba", 2:"s_idit_letsgocheckcoverme"];
    level.battlechatter.eventstrings["PMC"]["covering_investigate"] = [0:"s_idit_covering", 1:"s_idit_imwithyou", 2:"s_idit_gotyoucovered"];
    level.battlechatter.eventstrings["PMC"]["team_return_idle"] = [0:"s_idid_okayletsheadback", 1:"s_idid_weregoodhereletsgetb", 2:"s_idid_backtoourpostsletsgo"];
    level.battlechatter.eventstrings["PMC"]["ask_heard_that"] = [0:"s_alre_youhearthat", 1:"s_alre_youheardthatright", 2:"s_alre_youheardthattoo"];
    level.battlechatter.eventstrings["PMC"]["ask_saw_that"] = [0:"s_alre_didyouseethat", 1:"s_alre_yougeteyesonthat", 2:"s_alre_youcatchthat"];
    level.battlechatter.eventstrings["PMC"]["have_something"] = [0:"s_alre_imighthavesomething", 1:"s_alre_ithinkihavesomething", 2:"s_alre_igotapossiblethreat"];
    level.battlechatter.eventstrings["PMC"]["heard_something"] = [0:"s_alre_iheardsomething", 1:"s_alre_heardsomethingnearme", 2:"s_alre_iheardanoise"];
    level.battlechatter.eventstrings["PMC"]["saw_something"] = [0:"s_alre_isawsomething", 1:"s_alre_thoughtisawsomething", 2:"s_alre_ithinksomeonesnearme"];
    level.battlechatter.eventstrings["PMC"]["see_something"] = [0:"s_alre_iseesomething", 1:"s_alre_ithinkiseesomething", 2:"s_alre_iseesomethingnearme"];
    level.battlechatter.eventstrings["PMC"]["team_have_something"] = [0:"s_alre_wemighthavesomething", 1:"s_alre_ithinkwegotsomething", 2:"s_alre_wegotapossiblethreat"];
    level.battlechatter.eventstrings["PMC"]["team_heard_something"] = [0:"s_alre_weheardsomething", 1:"s_alre_weheardsomethingclos", 2:"s_alre_weheardanoise"];
    level.battlechatter.eventstrings["PMC"]["team_saw_something"] = [0:"s_alre_wesawsomething", 1:"s_alre_wesawsomethingnearus", 2:"s_alre_wesawsomethingnearou"];
    level.battlechatter.eventstrings["PMC"]["team_see_something"] = [0:"s_alre_weseesomething"];
    level.battlechatter.eventstrings["PMC"]["bottle_whizby"] = [0:"s_alre_whothefuckthrewthat", 1:"s_alre_whothrewthat", 2:"s_alre_youmissed"];
    level.battlechatter.eventstrings["PMC"]["object_whizby"] = [0:"s_alre_whothefuckthrewthat", 1:"s_alre_whothrewthat", 2:"s_alre_youmissed"];
    level.battlechatter.eventstrings["PMC"]["jailer_body_react"] = [0:"s_idrm_okaywhatthefuck", 1:"s_idrm_whatthefuckisgoingon", 2:"s_idrm_issomeonefuckingwith"];
    level.battlechatter.eventstrings["PMC"]["jailer_head_react"] = [0:"s_unrc_contact", 1:"s_unrc_imunderattack", 2:"s_unrc_itookfire"];
    level.battlechatter.eventstrings["PMC"]["react_resp"] = [0:"s_alrr_yeah", 1:"s_alrr_afirm", 2:"s_alrr_yeahrogerthat"];
    level.battlechatter.eventstrings["PMC"]["alert_investigating"] = [0:"s_alin_imgonnareccethearea", 1:"s_alin_imcheckingitout", 2:"s_alin_imgonnacheckitout"];
    level.battlechatter.eventstrings["PMC"]["team_alert_investigating"] = [0:"s_alin_wellcheckthearea", 1:"s_alin_werecheckingitout", 2:"s_alin_weregonnacheckitout"];
    level.battlechatter.eventstrings["PMC"]["alert_confirming"] = [0:"s_alcf_roger", 1:"s_alcf_copy", 2:"s_alcf_copythat"];
    level.battlechatter.eventstrings["PMC"]["alert_ask"] = [0:"s_alia_seeanything", 1:"s_alia_yougotsomething", 2:"s_alia_anything", 3:"s_alia_gotanything"];
    level.battlechatter.eventstrings["PMC"]["alert_patrol"] = [0:"s_alip_illpullsecurityherea", 1:"s_alip_illsecuretheareakeep", 2:"s_alip_headbackillpullsecur", 3:"s_alip_ivegotthisareagetbac"];
    level.battlechatter.eventstrings["PMC"]["report_reply_search"] = [0:"s_alir_negativenothingyet", 1:"s_alir_nothingsofar", 2:"s_alir_nothing", 3:"s_alir_goodsofar", 4:"s_alir_igotnothingyet", 5:"s_alir_sofarsogood", 6:"s_alir_notseeinganything", 7:"s_alir_negativegotnothing", 8:"s_alir_nothingfornow", 9:"s_alir_itsclearsofar", 10:"s_alir_weregoodfornow"];
    level.battlechatter.eventstrings["PMC"]["warn_report"] = [0:"s_wrnr_hadanunknowninsideth", 1:"s_wrnr_hadanunknowninsideth_01", 2:"s_wrnr_anunknownwasintheare"];
    level.battlechatter.eventstrings["PMC"]["warn_spotted"] = [0:"s_wrnf_heygetthefuckback", 1:"s_wrnf_heyyougetthefuckoutt", 2:"s_wrnf_getbackgetbackrightn"];
    level.battlechatter.eventstrings["PMC"]["warn_conv"] = [0:"s_wrni_scaredthehelloutofem", 1:"s_wrni_probablyshittingthem", 2:"s_wrni_whatthehellweretheyd", 3:"s_wrni_whatthefuckweretheyt"];
    level.battlechatter.eventstrings["PMC"]["warn_conv_reply"] = [0:"s_wrir_almostgotthemselvesk", 1:"s_wrir_iwasreadytodumpthatm", 2:"s_wrir_luckytheydidntcatcha"];
    level.battlechatter.eventstrings["PMC"]["warn_attack"] = [0:"s_wrnk_heyiwarnedyou", 1:"s_wrnk_youwerewarned", 2:"s_wrnk_heyyoujustfuckedup"];
    level.battlechatter.eventstrings["PMC"]["ask_enemy_loc"] = [0:"s_unwl_wheredthatcomefrom", 1:"s_unwl_whereditcomefrom", 2:"s_unwl_wherethefuckarethey"];
    level.battlechatter.eventstrings["PMC"]["enemy_loc_resp"] = [0:"s_unrs_idontknowbutthatwasa", 1:"s_unrs_ididntseeem", 2:"s_unrs_idontfuckingknow", 3:"s_unrs_novisualdidntseeem"];
    level.battlechatter.eventstrings["PMC"]["ask_enemy_count"] = [0:"s_unwc_howmanyarethere", 1:"s_unwc_howmanyofem", 2:"s_unwc_howmany"];
    level.battlechatter.eventstrings["PMC"]["unaware_backup"] = [0:"s_unwb_ineedreinforcements", 1:"s_unwb_getmoreshadowshereno", 2:"s_unwb_sendreinforcementsmy"];
    level.battlechatter.eventstrings["PMC"]["react_first_combat"] = [0:"s_awrr_contact", 1:"s_awrr_troopsincontact", 2:"s_awrr_enemymyposition", 3:"s_awrr_enemy", 4:"s_awrr_enemyshere", 5:"s_awrr_gotenemyhere", 6:"s_awrr_enemysclose"];
    level.battlechatter.eventstrings["PMC"]["report_target_water"] = [0:"s_awrr_targetsinthewater", 1:"s_awrr_gotavisualtheyreinth", 2:"s_awrr_iseeeminthewater", 3:"s_awrr_inthewaterinthewater", 4:"s_awrr_enemyinthewater", 5:"s_awrr_theyremovinginthewat", 6:"s_awrr_heytheyreinthewater"];
    level.battlechatter.eventstrings["PMC"]["at_my_location"] = [0:"s_awrr_righthere", 1:"s_awrr_onmeonme", 2:"s_awrr_myposition", 3:"s_awrr_righthererighthere", 4:"s_awrr_onme", 5:"s_awrr_theyrerighthere", 6:"s_awrr_overhere", 7:"s_awrr_theyreoverhere"];
    level.battlechatter.eventstrings["PMC"]["found_target"] = [0:"s_awrr_gotem", 1:"s_awrr_iseeem", 2:"s_awrr_foundem", 3:"s_awrr_hey", 4:"s_awrr_visual", 5:"s_awrr_targetspotted"];
    level.battlechatter.eventstrings["PMC"]["found_you"] = [0:"s_awrr_motherfucker", 1:"s_awrr_foundyou", 2:"s_awrr_igotyou", 3:"s_awrr_ifoundyou", 4:"s_awrr_gotyou"];
    level.battlechatter.eventstrings["PMC"]["order_check_last"] = [0:"s_advo_moveonemgo", 1:"s_advo_forceuponemgo", 2:"s_advo_pushtheirpositiongo"];
    level.battlechatter.eventstrings["PMC"]["lost_target"] = [0:"s_lkpl_frustratedgrunttheyr", 1:"s_lkpl_frustratedgrunttheyr_01", 2:"s_lkpl_frustratedgruntnovis", 3:"s_lkpl_frustratedgrunttheyg"];
    level.battlechatter.eventstrings["PMC"]["lost_target_water"] = [0:"s_lkpw_theywentunderwater", 1:"s_lkpw_theyreinthewater", 2:"s_lkpw_theyjumpedinthewater", 3:"s_lkpw_targetsinthewater"];
    level.battlechatter.eventstrings["PMC"]["ask_target_location"] = [0:"s_lklr_gotavisual", 1:"s_lklr_youseeem", 2:"s_lklr_whatstheirlocation", 3:"s_lklr_wherearethey", 4:"s_lklr_wherethefuckarethey", 5:"s_lklr_getmealocation"];
    level.battlechatter.eventstrings["PMC"]["wait_target_surface"] = [0:"s_lkwr_whentheycomeupsmokee", 1:"s_lkwr_theypopupyoushootem", 2:"s_lkwr_whentheysurfaceopenu", 3:"s_lkwr_theygoforairyoudrope", 4:"s_lkwr_waittiltheysurfaceth", 5:"s_lkwr_theysurfaceyoulighte"];
    level.battlechatter.eventstrings["PMC"]["water_use_grenade"] = [0:"s_lkwf_dontwasteammousegren", 1:"s_lkwf_throwagrenadeinthere", 2:"s_lkwf_getagrenadeinthewate"];
    level.battlechatter.eventstrings["PMC"]["target_still_close"] = [0:"s_lkpc_theywerehere", 1:"s_lkpc_theywererighthere", 2:"s_lkpc_theycantbefar", 3:"s_lkpc_theyreclose", 4:"s_lkpc_theyrehiding", 5:"s_lkpc_theygottabeclose", 6:"s_lkpc_theydidntmakeitfar", 7:"s_lkpc_theyrestillheresomew"];
    level.battlechatter.eventstrings["PMC"]["order_clear_building"] = [0:"s_cmho_clearthebuilding", 1:"s_cmho_securethebuilding", 2:"s_cmho_getthisbuildingsecur"];
    level.battlechatter.eventstrings["PMC"]["order_search_water"] = [0:"s_cmho_searchthewater", 1:"s_cmho_checkthewater", 2:"s_cmho_targetwasinthewater", 3:"s_cmho_geteyesonthewater", 4:"s_cmho_watchthewater"];
    level.battlechatter.eventstrings["PMC"]["clearing_east"] = [0:"s_cmhs_checkingeast", 1:"s_cmhs_movingeast", 2:"s_cmhs_securingeast"];
    level.battlechatter.eventstrings["PMC"]["clearing_north"] = [0:"s_cmhs_checkingnorth", 1:"s_cmhs_movingnorth", 2:"s_cmhs_securingnorth"];
    level.battlechatter.eventstrings["PMC"]["clearing_south"] = [0:"s_cmhs_checkingsouth", 1:"s_cmhs_movingsouth", 2:"s_cmhs_securingsouth"];
    level.battlechatter.eventstrings["PMC"]["clearing_west"] = [0:"s_cmhs_checkingwest", 1:"s_cmhs_movingwest", 2:"s_cmhs_securingwest"];
    level.battlechatter.eventstrings["PMC"]["searching_here"] = [0:"s_cmhc_checkingthisarea", 1:"s_cmhc_securingthisarea", 2:"s_cmhc_searchingthisarea"];
    level.battlechatter.eventstrings["PMC"]["cmb_hunt_confirmation"] = [0:"s_cmhr_rog", 1:"s_cmhr_rogerthat", 2:"s_cmhr_copy", 3:"s_cmhr_copythat", 4:"s_cmhr_negative"];
    level.battlechatter.eventstrings["PMC"]["good_hunting"] = [0:"s_hnts_staysharp", 1:"s_hnts_stayfrosty", 2:"s_hnts_keepittight"];
    level.battlechatter.eventstrings["PMC"]["moving_there"] = [0:"s_hntm_movingnow", 1:"s_hntm_movingtherenow", 2:"s_hntm_moving"];
    level.battlechatter.eventstrings["PMC"]["moving_alone"] = [0:"s_hntm_iminbound", 1:"s_hntm_immoving", 2:"s_hntm_immovingnow"];
    level.battlechatter.eventstrings["PMC"]["moving_following"] = [0:"s_hntm_gotyoursix", 1:"s_hntm_imwithyou", 2:"s_hntm_gotyourback"];
    level.battlechatter.eventstrings["PMC"]["moving_together"] = [0:"s_hntm_weremoving", 1:"s_hntm_weremovingtherenow", 2:"s_hntm_wereinboundnow"];
    level.battlechatter.eventstrings["PMC"]["order_follow_me"] = [0:"s_hntm_illleadletsgo", 1:"s_hntm_onme", 2:"s_hntm_illtakepointletsmove"];
    level.battlechatter.eventstrings["PMC"]["order_take_point"] = [0:"s_hntm_takepointmoveout", 1:"s_hntm_youtakepointletsgo", 2:"s_hntm_onyouletsmove", 3:"s_aqhr_takeitoutigotyourbac", 4:"s_aqhr_takepointillcover", 5:"s_aqhr_takepointletsroll"];
    level.battlechatter.eventstrings["PMC"]["ask_found_anything"] = [0:"s_aqhr_gotanything", 1:"s_aqhr_yougotsomething", 2:"s_aqhr_findanything", 3:"s_aqhr_gotavisual", 4:"s_aqhr_anyvisual", 5:"s_aqhr_whatdoyougot"];
    level.battlechatter.eventstrings["PMC"]["reply_found_nothing"] = [0:"s_aqhr_novisualonthetarget", 1:"s_aqhr_nosignofem", 2:"s_aqhr_novisual"];
    level.battlechatter.eventstrings["PMC"]["report_searching"] = [0:"s_aqhr_stillsweeping", 1:"s_aqhr_stillsearching", 2:"s_aqhr_stilllookingforem"];
    level.battlechatter.eventstrings["PMC"]["report_nothing"] = [0:"s_aqhr_nothingyet", 1:"s_aqhr_nothingsofar", 2:"s_aqhr_nothinghere"];
    level.battlechatter.eventstrings["PMC"]["report_investigating"] = [0:"s_aqhr_immovingin", 1:"s_aqhr_imcheckingitout", 2:"s_aqhr_movingtosecure"];
    level.battlechatter.eventstrings["PMC"]["area_clear"] = [0:"s_aqhr_thisareassecure", 1:"s_aqhr_securehere", 2:"s_aqhr_areasecure"];
    level.battlechatter.eventstrings["PMC"]["order_dir"] = [0:"s_aqhs_securethatarea", 1:"s_aqhs_clearthatarea", 2:"s_aqhs_cordonthatarea", 3:"s_aqhs_checkthatway"];
    level.battlechatter.eventstrings["PMC"]["order_dir_resp"] = [0:"s_aqhs_illsecurethisarea", 1:"s_aqhs_illtakethisway", 2:"s_aqhs_illcheckoverhere", 3:"s_aqhs_illsearchthisway"];
    level.battlechatter.eventstrings["PMC"]["hunt_search_object"] = [0:"s_aqhs_itsclear", 1:"s_aqhs_clear", 2:"s_aqhs_secure", 3:"s_aqhs_weresecure"];
    level.battlechatter.eventstrings["PMC"]["hunt"] = [0:"s_aqhb_wherethefuckareyou", 1:"s_aqhb_motherfuckers", 2:"s_aqhb_yourehidingiknowyour", 3:"s_aqhb_youreheresomewherear", 4:"s_aqhb_comeonout", 5:"s_aqhb_gonnafindyou", 6:"s_aqhb_wheredyoufuckinggo"];
    level.battlechatter.eventstrings["PMC"]["hunt_inv_order"] = [0:"s_ahii_checkit", 1:"s_ahii_gocheckitout", 2:"s_ahii_checkthatout", 3:"s_ahii_gocheckthat"];
    level.battlechatter.eventstrings["PMC"]["hunt_inv_event"] = [0:"s_ahir_ithinktheyrenearme", 1:"s_ahir_imighthaveem", 2:"s_ahir_ithinkigotem", 3:"s_ahir_thinkifoundem"];
    level.battlechatter.eventstrings["PMC"]["hunt_reactions"] = [0:"s_ahnr_surprisedinttenserea", 1:"s_ahnr_surprisedinttenserea_01", 2:"s_ahnr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["PMC"]["cmb_reactions"] = [0:"s_aqcr_surprisedinttenserea", 1:"s_aqcr_surprisedinttenserea_01", 2:"s_aqcr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["PMC"]["whizby_resp"] = [0:"s_aqal_itcamefromoverthere", 1:"s_aqal_itcamefromthatway", 2:"s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["PMC"]["hunt_cornercheck"] = [0:"s_aqho_checkyourcorners", 1:"s_aqho_checkcornersfindem", 2:"s_aqho_checkthosecorners"];
    level.battlechatter.eventstrings["PMC"]["hunt_order_hold"] = [0:"s_aqho_holdup", 1:"s_aqho_standfast", 2:"s_aqho_hold"];
    level.battlechatter.eventstrings["PMC"]["alert_cornercheck"] = [0:"s_aqao_checkthecorners", 1:"s_aqao_watchyourcorners", 2:"s_aqao_checkthosecorners"];
    level.battlechatter.eventstrings["PMC"]["alert_order_hold"] = [0:"s_aqao_holdup", 1:"s_aqao_standfast", 2:"s_aqao_hold"];
    level.battlechatter.eventstrings["PMC"]["alert_search_orders"] = [0:"s_aqao_checkthatway", 1:"s_aqao_gothatway", 2:"s_aqao_checkoverthere", 3:"s_aqao_searchoverthere", 4:"s_aqao_searchthatway", 5:"s_aqao_securethatarea"];
    level.battlechatter.eventstrings["PMC"]["attack_orders"] = [0:"s_aato_thresher"];
    level.battlechatter.eventstrings["PMC"]["lkp_patrol_search"] = [0:"s_alwp_justwatchthewater", 1:"s_alwp_keepwatchingthatside", 2:"s_alwp_justkeepyoureyesonth"];
    level.battlechatter.eventstrings["PMC"]["hunt_report_alert"] = [0:"s_aqlo_cordonandsearchthear", 1:"s_aqlo_fanoutsearchthearea", 2:"s_aqlo_cordonofftheareafind"];
    level.battlechatter.eventstrings["PMC"]["resp_glass_first"] = [0:"s_airs_brokenglasshere", 1:"s_airs_itsbrokenglass", 2:"s_airs_gotsomebrokenglass"];
    level.battlechatter.eventstrings["PMC"]["resp_glass_multi"] = [0:"s_airs_moreglass", 1:"s_airs_gotsomemoreglass", 2:"s_airs_theresmorebrokenglas"];
    level.battlechatter.eventstrings["PMC"]["disguise_enter_investigate"] = [0:"s_alrc_whoisit", 1:"s_alrc_who", 2:"s_idrc_hmph", 3:"s_idrc_hrm", 4:"s_idrc_eh", 5:"s_idrc_hm", 6:"s_idrc_wha"];
    level.battlechatter.eventstrings["PMC"]["lost_enemy_duo"] = [0:"c_tast_welostem", 1:"c_tast_welostthem", 2:"c_tast_welosttrackofem"];
    level.battlechatter.eventstrings["PMC"]["lost_enemy_solo"] = [0:"c_tast_ilosttrackofthem", 1:"c_tast_fuckilostem", 2:"c_tast_fuckilostthem"];
    level.battlechatter.eventstrings["PMC_L"]["reply_hear_you"] = [0:"s_idrp_rogergoahead", 1:"s_idrp_go", 2:"s_idrp_goahead", 3:"s_idrp_thisisactualgoahead", 4:"s_idrp_thisisactual", 5:"s_idrp_goforactual"];
    level.battlechatter.eventstrings["PMC_L"]["react_interrupt"] = [0:"s_idli_missedyourlastover", 1:"s_idli_sayagainover", 2:"s_idli_yougood", 3:"s_idli_sayagainyourlastover", 4:"s_idli_commscheck", 5:"s_idli_missedyourlastsayaga"];
    level.battlechatter.eventstrings["PMC_L"]["react_noreply"] = [0:"s_idli_youreceivingme", 1:"s_idli_youcopy", 2:"s_idli_doyoureadme"];
    level.battlechatter.eventstrings["PMC_L"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["PMC_L"]["signoff"] = [0:"s_idls_out", 1:"s_idls_actualout", 2:"s_idls_stayfrosty", 3:"s_idls_out_01"];
    level.battlechatter.eventstrings["PMC_L"]["inv_patrol"] = [0:"s_alip_continueyourpatrolst", 1:"s_alip_getbacktoyourrouteke", 2:"s_alip_returntoyourpatrolst"];
    level.battlechatter.eventstrings["PMC_L"]["wait_target_surface"] = [0:"s_lkwr_waitforemtocomeupthe", 1:"s_lkwr_whentheycomeupforair", 2:"s_lkwr_whentheycomeupyourec", 3:"s_lkwr_whentheygoforairyout", 4:"s_lkwr_lightemupwhentheygof", 5:"s_lkwr_waitforemtosurfaceth"];
    level.battlechatter.eventstrings["PMC_L"]["order_find_target"] = [0:"s_cmho_weneedalocationonthe", 1:"s_cmho_locatethetargetnow", 2:"s_cmho_huntemdown"];
    level.battlechatter.eventstrings["PMC_L"]["order_find_perimeter"] = [0:"s_cmho_getthisarealockeddow", 1:"s_cmho_securetheperimeter", 2:"s_cmho_iwantthisarealockedd"];
    level.battlechatter.eventstrings["PMC_L"]["order_search_water"] = [0:"s_cmho_searchthewater", 1:"s_cmho_checkthewater", 2:"s_cmho_theywereinthewater", 3:"s_cmho_keepyoureyesonthewat", 4:"s_cmho_watchthewater"];
    level.battlechatter.eventstrings["PMC_L"]["good_hunting"] = [0:"s_hnts_goodhunting", 1:"s_hnts_staysharpoutthere", 2:"s_hnts_out", 3:"s_aisg_copystaysharp"];
    level.battlechatter.eventstrings["PMC_L"]["ask_found_anything"] = [0:"s_aqhr_whatsyourstatus", 1:"s_aqhr_whatveyougot", 2:"s_aqhr_givemeasitrep", 3:"s_aqhr_sitrep", 4:"s_aqhr_youfindanything", 5:"s_aqhr_tellmeyougotsomethin"];
    level.battlechatter.eventstrings["PMC_L"]["hunt_report_alert"] = [0:"s_aqhr_allshadowswehaveenem", 1:"s_aqhr_allshadowsenemyisins", 2:"s_aqhr_allshadowsperimeteri", 3:"s_aqlo_fanoutsecuretheperim", 4:"s_aqlo_setcontainmentfindem", 5:"s_aqlo_spreadoutsearchthear"];
    level.battlechatter.eventstrings["PMC_L"]["order_continue_search"] = [0:"s_aqho_keeplookingforem", 1:"s_aqho_keepsweeping", 2:"s_aqho_keepsearchingthearea"];
    level.battlechatter.eventstrings["PMC_L"]["order_stay_alert"] = [0:"s_aqho_staysharp", 1:"s_aqho_keepittight", 2:"s_aqho_eyesopen"];
    level.battlechatter.eventstrings["PMC_L"]["order_stay_aware"] = [0:"s_aqho_dontlettheseguysgett", 1:"s_aqho_theseguysaretf141don", 2:"s_aqho_keepyourguardupwitht"];
    level.battlechatter.eventstrings["PMC_L"]["ask_how_copy"] = [0:"s_idcm_howcopy", 1:"s_idcm_doyoucopy", 2:"s_idcm_commscheck"];
    level.battlechatter.eventstrings["PMC_L"]["inv_no_response"] = [0:"s_iinr_hesradiosilent", 1:"s_iinr_icantreachhim", 2:"s_iinr_hesnotoncomms", 3:"s_iinr_hesnotresponding"];
    level.battlechatter.eventstrings["PMC_L"]["order_get_visual"] = [0:"s_iinr_seeifyoucanfindoutwh", 1:"s_iinr_checkitoutmakesureno", 2:"s_iinr_canyougetavisualonem", 3:"s_iinr_ineedyoutocheckitout"];
    level.battlechatter.eventstrings["PMC_L"]["inv_patrol_noresp"] = [0:"s_iinr_thresherisntrespondi", 1:"s_iinr_thresherdidntcheckin", 2:"s_iinr_thresherisntoncomms", 3:"s_iinr_icantreachthresher"];
    level.battlechatter.eventstrings["PMC_L"]["report_search"] = [0:"s_aias_sitrep", 1:"s_aias_whatsyourstatus", 2:"s_aias_findanything", 3:"s_aias_gotanything", 4:"s_aias_status"];
    level.battlechatter.eventstrings["PMC_L"]["report_alert"] = [0:"s_airp_allshadowsgetswitche", 1:"s_airp_allshadowsperimeterm", 2:"s_airp_allshadowspossibleen", 3:"s_airp_allshadowssetsecurit"];
    level.battlechatter.eventstrings["PMC_L"]["warn_reply"] = [0:"s_wrpl_youreclearedhotifthe", 1:"s_wrpl_youseeemagainputemin", 2:"s_wrpl_theycomebackyourecle"];
    level.battlechatter.eventstrings["PMC_L"]["report_target_location"] = [0:"s_chrp_doesanyonehaveavisua", 1:"s_chrp_talktomeguyswhatsthe", 2:"s_chrp_cmonshadowsineedaloc", 3:"s_chrp_allshadowsdoyouhavea"];
    level.battlechatter.eventstrings["PMC_L"]["report_idle"] = [0:"s_irpr_status", 1:"s_irpr_sitrep", 2:"s_irpr_yougood", 3:"s_irpr_gotanything", 4:"s_irpr_report"];
    level.battlechatter.eventstrings["PMC_L"]["ally_missing_multi"] = [0:"s_alms_multipleshadowsarent", 1:"s_alms_moreshadowsarentresp", 2:"s_alms_wevelostcontactwithm", 3:"s_alms_anotherteamlostcomms"];
    level.battlechatter.eventstrings["PMC_L"]["order_search_start"] = [0:"s_aior_searchthearea", 1:"s_aior_pullsecuritysweepthe", 2:"s_aior_securetheperimeter"];
    level.battlechatter.eventstrings["PMC_L"]["order_report_back"] = [0:"s_aior_soundoffifyoufindsom", 1:"s_aior_imstandingbyifyoufin", 2:"s_aior_usecommsifyoufindsom"];
    level.battlechatter.eventstrings["PMC_L"]["hunt_patrol_noresp"] = [0:"s_hpnr_thresherisntrespondi", 1:"s_hpnr_thresherdidntcheckin", 2:"s_hpnr_thresherisntanswerin", 3:"s_hpnr_icantreachthresher"];
    level.battlechatter.eventstrings["RU"]["ahead"] = [0:"c_posn_straightahead", 1:"c_posn_rightinfrontofus", 2:"c_posn_aheadofus", 3:"c_posn_front", 4:"c_posn_deadahead"];
    level.battlechatter.eventstrings["RU"]["aquired_target"] = [0:"c_aqen_gotavisual", 1:"c_aqen_targetacquired", 2:"c_aqen_iseehim", 3:"c_aqen_thereheis"];
    level.battlechatter.eventstrings["RU"]["ask_low_ammo"] = [0:"c_stat_howsyourammo", 1:"c_stat_checkyourammo", 2:"c_stat_whatsyourroundcount"];
    level.battlechatter.eventstrings["RU"]["ask_status"] = [0:"c_stat_youokay", 1:"c_stat_whatsyourstatus", 2:"c_stat_status"];
    level.battlechatter.eventstrings["RU"]["ask_target_wounded"] = [0:"c_tast_yougethim", 1:"c_tast_youhithim", 2:"c_tast_youdrophim"];
    level.battlechatter.eventstrings["RU"]["ask_wounded"] = [0:"c_stat_yougood", 1:"c_stat_youwounded", 2:"c_stat_youhit"];
    level.battlechatter.eventstrings["RU"]["attacking"] = [0:"c_atac_goinghot", 1:"c_atac_engaging", 2:"c_atac_openinup"];
    level.battlechatter.eventstrings["RU"]["behind"] = [0:"c_posn_behindus", 1:"c_posn_onoursix", 2:"c_posn_checkrear", 3:"c_posn_rear"];
    level.battlechatter.eventstrings["RU"]["casualties"] = [0:"c_casu_weretakingheavies", 1:"c_casu_weregettingourassesk", 2:"c_casu_werelosingshooters", 3:"c_casu_weretakingcasualties"];
    level.battlechatter.eventstrings["RU"]["casualty"] = [0:"c_canm_wegotacasualty", 1:"c_canm_shadowdown", 2:"c_canm_wehaveashadowdown", 3:"c_canm_wevegotwounded", 4:"c_canm_mandown"];
    level.battlechatter.eventstrings["RU"]["checkfire"] = [0:"c_chck_checkyourfire", 1:"c_chck_watchyourfire", 2:"c_chck_blueblue", 3:"c_chck_checkfirecheckfire"];
    level.battlechatter.eventstrings["RU"]["copy"] = [0:"c_conf_check", 1:"c_conf_copythat", 2:"c_conf_copy", 3:"c_conf_goodcopy", 4:"c_conf_solidcopy", 5:"c_aqcp_copy", 6:"c_aqcp_solidcopy"];
    level.battlechatter.eventstrings["RU"]["coverme"] = [0:"c_tcor_coverme", 1:"c_tcor_ineedcoverfire", 2:"c_tcor_coverme_01"];
    level.battlechatter.eventstrings["RU"]["enemy_attacking"] = [0:"c_eata_takingfire", 1:"c_eata_contact", 2:"c_eata_shadowsincontact", 3:"s_unrc_imtakingfire", 4:"s_unrc_someonesshootinatme", 5:"s_unrc_takineffectivefire", 6:"s_unrc_imgettingshotat"];
    level.battlechatter.eventstrings["RU"]["enemy_covered"] = [0:"c_exco_onesbehindcover", 1:"c_exco_oneofthemisbehindcov", 2:"c_exco_gotoneofthembehindco"];
    level.battlechatter.eventstrings["RU"]["enemy_exposed"] = [0:"c_exco_onesintheopen", 1:"c_exco_onesintheopen_01", 2:"c_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["RU"]["enemy_flanking_left"] = [0:"c_etca_onesmovingleft", 1:"c_etca_leftflank", 2:"c_etca_guardleft", 3:"c_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["RU"]["enemy_flanking_right"] = [0:"c_etca_guardright", 1:"c_etca_rightflank", 2:"c_etca_onesmovingright", 3:"c_posn_theyreflankingright"];
    level.battlechatter.eventstrings["RU"]["enemy_getting_cover"] = [0:"c_etca_novisualontarget", 1:"c_etca_gotonetakingcover", 2:"c_etca_onesmovingtocover", 3:"c_etca_novisualontarget_01"];
    level.battlechatter.eventstrings["RU"]["enemy_grenade_close"] = [0:"c_glna_fuckpleaseno", 1:"c_glna_fuck", 2:"c_glna_noplease"];
    level.battlechatter.eventstrings["RU"]["enemy_lmg"] = [0:"c_enws_enemymachinegunner", 1:"c_enws_lmg", 2:"c_enws_machinegun"];
    level.battlechatter.eventstrings["RU"]["enemy_moving"] = [0:"c_etca_onesmovin", 1:"c_etca_thatonesmoving", 2:"c_etca_gotonemoving"];
    level.battlechatter.eventstrings["RU"]["enemy_moving_up"] = [0:"c_etca_onespushing", 1:"c_etca_gotonemovingup", 2:"c_etca_onesmovingup"];
    level.battlechatter.eventstrings["RU"]["enemy_reloading"] = [0:"c_etca_onesreloading", 1:"c_etca_theyrereloading", 2:"c_etca_oneschangingmags"];
    level.battlechatter.eventstrings["RU"]["enemy_shotgun"] = [0:"c_enws_shotgunwatchout", 1:"c_enws_onesgotashotgun", 2:"c_enws_shotgun"];
    level.battlechatter.eventstrings["RU"]["enemy_sniper"] = [0:"c_enws_thatsasniper", 1:"c_enws_sniper", 2:"c_enws_enemysniper"];
    level.battlechatter.eventstrings["RU"]["enemy_soldier"] = [0:"c_enmy_visualonatarget", 1:"c_enmy_targetspotted", 2:"c_enmy_gotatarget"];
    level.battlechatter.eventstrings["RU"]["enemy_soldiers"] = [0:"c_enmy_targets", 1:"c_enmy_targets_01", 2:"c_enmy_wegotbadguys"];
    level.battlechatter.eventstrings["RU"]["enemy_unhurt"] = [0:"c_tast_ijustmissedone", 1:"c_tast_justmissedone", 2:"c_tast_barelymissedone"];
    level.battlechatter.eventstrings["RU"]["enemy_using_flash"] = [0:"c_eata_flashincoming", 1:"c_eata_flashgrenade", 2:"c_eata_flash", 3:"c_eata_flashgrenade_01"];
    level.battlechatter.eventstrings["RU"]["enemy_using_grenade"] = [0:"c_eata_grenade", 1:"c_eata_grenadewatchout", 2:"c_eata_grenadeincoming"];
    level.battlechatter.eventstrings["RU"]["enemy_using_molotov"] = [0:"c_eata_molotov", 1:"c_eata_molotovincoming", 2:"c_eata_molotov_01"];
    level.battlechatter.eventstrings["RU"]["enemy_using_rpg"] = [0:"c_eata_rpg", 1:"c_eata_rpgincoming", 2:"c_eata_rpggetdown"];
    level.battlechatter.eventstrings["RU"]["getting_cover"] = [0:"c_tcac_covercover", 1:"c_tcac_takingcover", 2:"c_tcac_movingtocover"];
    level.battlechatter.eventstrings["RU"]["high"] = [0:"c_posn_uptop", 1:"c_posn_checkhigh", 2:"c_posn_coverup"];
    level.battlechatter.eventstrings["RU"]["hurt_by_molotov"] = [0:"c_mtvd_fuckthatburns", 1:"c_mtvd_ahfuckthatshot", 2:"c_mtvd_ahthatsfuckinghot"];
    level.battlechatter.eventstrings["RU"]["killfirm_bigrig"] = [0:"c_firm_theyresemitrucksdown", 1:"c_firm_destroyedtheirsemitr", 2:"c_firm_enemysemitrucksdown"];
    level.battlechatter.eventstrings["RU"]["killfirm_enemy"] = [0:"c_firm_gotone", 1:"c_firm_ekia", 2:"c_firm_targetdown"];
    level.battlechatter.eventstrings["RU"]["killfirm_helo"] = [0:"c_firm_helodown", 1:"c_firm_helodestroyed", 2:"c_firm_theirhelosdown"];
    level.battlechatter.eventstrings["RU"]["killfirm_target"] = [0:"c_firm_hesdone", 1:"c_firm_hesdown", 2:"c_firm_dumpedhim"];
    level.battlechatter.eventstrings["RU"]["killfirm_truck"] = [0:"c_firm_truckdestroyed", 1:"c_firm_theirtrucksdown", 2:"c_firm_enemytrucksdown"];
    level.battlechatter.eventstrings["RU"]["left"] = [0:"c_posn_leftside", 1:"c_posn_left", 2:"c_posn_checkleft"];
    level.battlechatter.eventstrings["RU"]["lost_enemy_duo"] = [0:"c_tast_welostem", 1:"c_tast_welostthem", 2:"c_tast_welosttrackofem"];
    level.battlechatter.eventstrings["RU"]["lost_enemy_solo"] = [0:"c_tast_ilosttrackofthem", 1:"c_tast_fuckilostem", 2:"c_tast_fuckilostthem"];
    level.battlechatter.eventstrings["RU"]["low_ammo"] = [0:"c_stat_ineedamag", 1:"c_stat_lowonammo", 2:"c_stat_lastmag", 3:"c_stat_needammo", 4:"c_stat_imwinchester"];
    level.battlechatter.eventstrings["RU"]["move"] = [0:"c_tcor_move", 1:"c_tcor_igotyoumove", 2:"c_tcor_startmoving", 3:"c_tcor_go"];
    level.battlechatter.eventstrings["RU"]["moveup"] = [0:"c_tcor_moveup", 1:"c_tcor_moveupgo", 2:"c_tcor_pushup", 3:"c_tcor_getupthere", 4:"c_tcor_pushforward"];
    level.battlechatter.eventstrings["RU"]["moving"] = [0:"c_tcac_moving", 1:"c_tcac_immoving", 2:"c_tcac_heyimmoving"];
    level.battlechatter.eventstrings["RU"]["movingup"] = [0:"c_tcac_impushingup", 1:"c_tcac_pushingforward", 2:"c_tcac_movingup", 3:"c_tcac_pushinup"];
    level.battlechatter.eventstrings["RU"]["neg_target"] = [0:"c_aqen_idontseeem", 1:"c_aqen_novisual", 2:"c_aqen_cantseehim", 3:"c_aqen_wherethefuckishe"];
    level.battlechatter.eventstrings["RU"]["order_attack"] = [0:"c_ator_engage", 1:"c_ator_giveemsome", 2:"c_ator_dumpem", 3:"c_ator_gohot", 4:"c_ator_youreclearedhot", 5:"c_ator_startsmokinem"];
    level.battlechatter.eventstrings["RU"]["praise"] = [0:"c_pras_hellyeah", 1:"c_pras_niceone", 2:"c_pras_fuckina", 3:"c_pras_yeah", 4:"c_pras_getyousome"];
    level.battlechatter.eventstrings["RU"]["reloading"] = [0:"c_tcac_reloading", 1:"c_tcac_changingmags"];
    level.battlechatter.eventstrings["RU"]["reply_keepshooting"] = [0:"c_stat_keepshootinguntilthe", 1:"c_stat_thenkeepshootingthem", 2:"c_stat_useeverylastbulletto"];
    level.battlechatter.eventstrings["RU"]["reply_low_ammo"] = [0:"c_stat_runninglow", 1:"c_stat_imlow", 2:"c_stat_almostout"];
    level.battlechatter.eventstrings["RU"]["reply_okay"] = [0:"c_stat_imsolid", 1:"c_stat_goodtogo", 2:"c_stat_goodhere"];
    level.battlechatter.eventstrings["RU"]["reply_wounded"] = [0:"c_stat_itookaround", 1:"c_stat_imgood", 2:"c_stat_yeahroundhittheplate"];
    level.battlechatter.eventstrings["RU"]["repositioning"] = [0:"c_posn_mycoversblownimrepos", 1:"c_posn_imrepositioning", 2:"c_posn_gottoreposition"];
    level.battlechatter.eventstrings["RU"]["right"] = [0:"c_posn_rightside", 1:"c_posn_right", 2:"c_posn_checkright"];
    level.battlechatter.eventstrings["RU"]["suppressing"] = [0:"c_aqsp_suppressingfirefallb", 1:"c_aqsp_suppressingfire", 2:"c_aqsp_imcoveringyou", 3:"c_aqsp_coveringfire"];
    level.battlechatter.eventstrings["RU"]["target_covered"] = [0:"c_exco_hesbehindcover", 1:"c_exco_hesgotcover", 2:"c_exco_hestakingcover"];
    level.battlechatter.eventstrings["RU"]["target_exposed"] = [0:"c_exco_theyreintheopen", 1:"c_exco_hesintheopen", 2:"c_exco_theyreintheopen_01"];
    level.battlechatter.eventstrings["RU"]["target_getting_cover"] = [0:"c_ttca_theyremovingtocover", 1:"c_ttca_hesgoingforcover", 2:"c_ttca_hestakingcover"];
    level.battlechatter.eventstrings["RU"]["target_lmg"] = [0:"c_taws_theyreusingamachineg", 1:"c_taws_hesgotamachinegun", 2:"c_taws_machinegunner"];
    level.battlechatter.eventstrings["RU"]["target_moving"] = [0:"c_ttca_theyremoving", 1:"c_ttca_hesmoving", 2:"c_ttca_hesrunning"];
    level.battlechatter.eventstrings["RU"]["target_moving_up"] = [0:"c_ttca_theyremovingup", 1:"c_ttca_hesmovingup", 2:"c_ttca_hescominguponyou"];
    level.battlechatter.eventstrings["RU"]["target_near_patrol"] = [0:"c_ttca_theyreswimmingnearth", 1:"c_ttca_theyreswimmingyourwa", 2:"c_ttca_interceptthem"];
    level.battlechatter.eventstrings["RU"]["target_reloading"] = [0:"c_ttca_theyrereloading", 1:"c_ttca_hesout", 2:"c_ttca_hesreloading"];
    level.battlechatter.eventstrings["RU"]["target_shotgun"] = [0:"c_taws_theyvegotashotgun", 1:"c_taws_hesgotashotgun"];
    level.battlechatter.eventstrings["RU"]["target_sniper"] = [0:"c_taws_hessnipingus", 1:"c_taws_hesasniper"];
    level.battlechatter.eventstrings["RU"]["target_unhurt"] = [0:"c_tast_hegotaway", 1:"c_tast_heranoff", 2:"c_tast_hesfallingback"];
    level.battlechatter.eventstrings["RU"]["team_enemy_grenade_close"] = [0:"c_glna_fuckweredead", 1:"c_glna_werefuckingdead", 2:"c_glna_fucknoweredead"];
    level.battlechatter.eventstrings["RU"]["use_flash"] = [0:"c_ator_useaflashbang", 1:"c_ator_throwaflashbang", 2:"c_ator_tossaflashbang"];
    level.battlechatter.eventstrings["RU"]["use_grenade"] = [0:"c_ator_useagrenade", 1:"c_ator_throwafrag", 2:"c_ator_tossafrag"];
    level.battlechatter.eventstrings["RU"]["use_molotov"] = [0:"c_ator_throwamolotov", 1:"c_ator_useamolotov", 2:"c_ator_tossamolotov"];
    level.battlechatter.eventstrings["RU"]["use_smoke"] = [0:"c_atac_throwasmokegrenade", 1:"c_atac_useasmokegrenade", 2:"c_atac_tossasmokegrenade"];
    level.battlechatter.eventstrings["RU"]["using_flash"] = [0:"c_atac_flashbangout", 1:"c_atac_throwingflashbang"];
    level.battlechatter.eventstrings["RU"]["using_grenade"] = [0:"c_atac_fragout", 1:"c_atac_throwingafrag"];
    level.battlechatter.eventstrings["RU"]["using_molotov"] = [0:"c_atac_throwingmolotov", 1:"c_atac_molotovout"];
    level.battlechatter.eventstrings["RU"]["using_rpg"] = [0:"c_atac_rocket", 1:"c_atac_rocket_01"];
    level.battlechatter.eventstrings["RU"]["using_smoke"] = [0:"c_atac_throwingsmoke", 1:"c_atac_smokeout"];
    level.battlechatter.eventstrings["RU"]["wounded"] = [0:"c_stat_imhit", 1:"c_stat_imshot", 2:"c_stat_medic"];
    level.battlechatter.eventstrings["RU"]["wounded_enemy"] = [0:"c_aens_igothim", 1:"c_aens_clippedhim", 2:"c_aens_hitone"];
    level.battlechatter.eventstrings["RU"]["wounded_target"] = [0:"c_atas_woundedhim", 1:"c_atas_ihithim", 2:"c_atas_itaggedem"];
    level.battlechatter.eventstrings["RU"]["youre_exposed"] = [0:"c_exco_findcover", 1:"c_exco_gettocoversoldier", 2:"c_exco_youreexposedsoldierm"];
    level.battlechatter.eventstrings["RU"]["semtex_stuck"] = [0:"c_glna_fuckpleaseno", 1:"c_glna_fuck", 2:"c_glna_noplease"];
    level.battlechatter.eventstrings["RU"]["alert_cornercheck"] = [0:"s_aqao_checkthecorners", 1:"s_aqao_watchyourcorners", 2:"s_aqao_checkthosecorners"];
    level.battlechatter.eventstrings["RU"]["alert_confirming"] = [0:"s_alcf_roger", 1:"s_alcf_copy", 2:"s_alcf_copythat"];
    level.battlechatter.eventstrings["RU"]["alert_investigating"] = [0:"s_alin_imgonnareccethearea", 1:"s_alin_imcheckingitout", 2:"s_alin_imgonnacheckitout"];
    level.battlechatter.eventstrings["RU"]["alert_order_hold"] = [0:"s_aqao_holdup", 1:"s_aqao_standfast", 2:"s_aqao_hold"];
    level.battlechatter.eventstrings["RU"]["alert_patrol"] = [0:"s_alip_illpullsecurityherea", 1:"s_alip_illsecuretheareakeep", 2:"s_alip_headbackillpullsecur", 3:"s_alip_ivegotthisareagetbac"];
    level.battlechatter.eventstrings["RU"]["alert_search_orders"] = [0:"s_aqao_checkthatway", 1:"s_aqao_gothatway", 2:"s_aqao_checkoverthere", 3:"s_aqao_searchoverthere", 4:"s_aqao_searchthatway", 5:"s_aqao_securethatarea"];
    level.battlechatter.eventstrings["RU"]["area_clear"] = [0:"s_aqhr_thisareassecure", 1:"s_aqhr_securehere", 2:"s_aqhr_areasecure"];
    level.battlechatter.eventstrings["RU"]["ask_corpse_name"] = [0:"s_alrc_whoisit", 1:"s_alrc_who", 2:"s_alrc_whodidwelose"];
    level.battlechatter.eventstrings["RU"]["ask_enemy_count"] = [0:"s_unwc_howmanyarethere", 1:"s_unwc_howmanyofem", 2:"s_unwc_howmany"];
    level.battlechatter.eventstrings["RU"]["ask_enemy_loc"] = [0:"s_unwl_wheredthatcomefrom", 1:"s_unwl_whereditcomefrom", 2:"s_unwl_wherethefuckarethey"];
    level.battlechatter.eventstrings["RU"]["ask_found_anything"] = [0:"s_aqhr_gotanything", 1:"s_aqhr_yougotsomething", 2:"s_aqhr_findanything", 3:"s_aqhr_gotavisual", 4:"s_aqhr_anyvisual", 5:"s_aqhr_whatdoyougot"];
    level.battlechatter.eventstrings["RU"]["ask_heard_that"] = [0:"s_alre_youhearthat", 1:"s_alre_youheardthatright", 2:"s_alre_youheardthattoo"];
    level.battlechatter.eventstrings["RU"]["ask_saw_that"] = [0:"s_alre_didyouseethat", 1:"s_alre_yougeteyesonthat", 2:"s_alre_youcatchthat"];
    level.battlechatter.eventstrings["RU"]["ask_target_location"] = [0:"s_lklr_gotavisual", 1:"s_lklr_youseeem", 2:"s_lklr_whatstheirlocation", 3:"s_lklr_wherearethey", 4:"s_lklr_wherethefuckarethey", 5:"s_lklr_getmealocation", 6:"c_tast_wherearethey", 7:"c_tast_doesanyonehaveavisua", 8:"c_tast_wherethefuckretheyat"];
    level.battlechatter.eventstrings["RU"]["attack_orders"] = [0:"s_aato_thresher"];
    level.battlechatter.eventstrings["RU"]["at_my_location"] = [0:"s_awrr_righthere", 1:"s_awrr_onmeonme", 2:"s_awrr_myposition", 3:"s_awrr_righthererighthere", 4:"s_awrr_onme", 5:"s_awrr_theyrerighthere", 6:"s_awrr_overhere", 7:"s_awrr_theyreoverhere"];
    level.battlechatter.eventstrings["RU"]["bottle_whizby"] = [0:"s_alre_whothefuckthrewthat", 1:"s_alre_whothrewthat", 2:"s_alre_youmissed"];
    level.battlechatter.eventstrings["RU"]["cmb_hunt_confirmation"] = [0:"s_cmhr_rog", 1:"s_cmhr_rogerthat", 2:"s_cmhr_copy", 3:"s_cmhr_copythat", 4:"s_cmhr_roger"];
    level.battlechatter.eventstrings["RU"]["clearing_east"] = [0:"s_cmhs_checkingeast", 1:"s_cmhs_movingeast", 2:"s_cmhs_securingeast"];
    level.battlechatter.eventstrings["RU"]["clearing_north"] = [0:"s_cmhs_checkingnorth", 1:"s_cmhs_movingnorth", 2:"s_cmhs_securingnorth"];
    level.battlechatter.eventstrings["RU"]["clearing_south"] = [0:"s_cmhs_checkingsouth", 1:"s_cmhs_movingsouth", 2:"s_cmhs_securingsouth"];
    level.battlechatter.eventstrings["RU"]["clearing_west"] = [0:"s_cmhs_checkingwest", 1:"s_cmhs_movingwest", 2:"s_cmhs_securingwest"];
    level.battlechatter.eventstrings["RU"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["RU"]["covering_investigate"] = [0:"s_idit_covering", 1:"s_idit_imwithyou", 2:"s_idit_gotyoucovered"];
    level.battlechatter.eventstrings["RU"]["enemy_loc_resp"] = [0:"s_unrs_nearbystayalert", 1:"s_unrs_ididntseeem", 2:"s_unrs_idontfuckingknow", 3:"s_unrs_novisualdidntseeem"];
    level.battlechatter.eventstrings["RU"]["flanked"] = [0:"s_awrr_ivegotthemflanked", 1:"s_awrr_ivegotaflankonthem", 2:"s_awrr_iveflankedthem"];
    level.battlechatter.eventstrings["RU"]["found_target"] = [0:"s_awrr_gotem", 1:"s_awrr_iseeem", 2:"s_awrr_foundem", 3:"s_awrr_hey", 4:"s_awrr_visual", 5:"s_awrr_targetspotted"];
    level.battlechatter.eventstrings["RU"]["found_you"] = [0:"s_awrr_thereyouare", 1:"s_awrr_foundyou", 2:"s_awrr_igotyou", 3:"s_awrr_ifoundyou", 4:"s_awrr_gotyou"];
    level.battlechatter.eventstrings["RU"]["good_hunting"] = [0:"s_hnts_staysharp", 1:"s_hnts_stayfrosty", 2:"s_hnts_keepittight"];
    level.battlechatter.eventstrings["RU"]["have_something"] = [0:"s_alre_imighthavesomething", 1:"s_alre_ithinkihavesomething", 2:"s_alre_igotapossiblethreat"];
    level.battlechatter.eventstrings["RU"]["heard_something"] = [0:"s_alre_iheardsomething", 1:"s_alre_heardsomethingnearme", 2:"s_alre_iheardanoise"];
    level.battlechatter.eventstrings["RU"]["hunt"] = [0:"s_aqhb_wherethefuckareyou", 1:"s_aqhb_yourehidingiknowyour", 2:"s_aqhb_youreheresomewherear", 3:"s_aqhb_comeonout", 4:"s_aqhb_gonnafindyou", 5:"s_aqhb_wheredyoufuckinggo"];
    level.battlechatter.eventstrings["RU"]["hunt_copy"] = [0:"s_hnrs_copy", 1:"s_hnrs_rogerthat", 2:"s_hnrs_copythat"];
    level.battlechatter.eventstrings["RU"]["hunt_cornercheck"] = [0:"s_aqho_checkyourcorners", 1:"s_aqho_checkcornersfindem", 2:"s_aqho_checkthosecorners"];
    level.battlechatter.eventstrings["RU"]["hunt_inv_event"] = [0:"s_ahir_ithinktheyrenearme", 1:"s_ahir_imighthaveem", 2:"s_ahir_ithinkigotem", 3:"s_ahir_thinkifoundem"];
    level.battlechatter.eventstrings["RU"]["hunt_inv_order"] = [0:"s_ahii_checkit", 1:"s_ahii_gocheckitout", 2:"s_ahii_checkthatout", 3:"s_ahii_gocheckthat"];
    level.battlechatter.eventstrings["RU"]["hunt_neg"] = [0:"s_hnrs_negative", 1:"s_hnrs_no", 2:"s_hnrs_nosir"];
    level.battlechatter.eventstrings["RU"]["hunt_order_hold"] = [0:"s_aqho_holdup", 1:"s_aqho_standfast", 2:"s_aqho_hold"];
    level.battlechatter.eventstrings["RU"]["hunt_reactions"] = [0:"s_ahnr_surprisedintensereac", 1:"s_ahnr_surprisedintensereac_01", 2:"s_ahnr_surprisedintensereac_02"];
    level.battlechatter.eventstrings["RU"]["hunt_report_alert"] = [0:"s_aqlo_cordonandsearchthear", 1:"s_aqlo_fanoutsearchthearea", 2:"s_aqlo_cordonofftheareafind"];
    level.battlechatter.eventstrings["RU"]["hunt_search_object"] = [0:"s_aqhs_itsclear", 1:"s_aqhs_clear", 2:"s_aqhs_secure", 3:"s_aqhs_weresecure"];
    level.battlechatter.eventstrings["RU"]["idle_good_hunting"] = [0:"s_idls_stayfrosty", 1:"s_idls_keepittight", 2:"s_idls_staysharp"];
    level.battlechatter.eventstrings["RU"]["inv_arrive"] = [0:"s_idin_hmm", 1:"s_idin_hmphokay", 2:"s_idin_huhwhatwasthat", 3:"s_idin_hrm", 4:"s_idin_huhthehell"];
    level.battlechatter.eventstrings["RU"]["inv_ask_first"] = [0:"s_idia_whatwasit", 1:"s_idia_whatdyoufind", 2:"s_idia_yougotanything", 3:"s_idia_seeanything", 4:"s_idia_findanything", 5:"s_alia_seeanything"];
    level.battlechatter.eventstrings["RU"]["inv_ask_second"] = [0:"s_idia_whatwasitthistime", 1:"s_idia_anythingthistime", 2:"s_idia_stillnothing", 3:"s_idia_stilldidntfindanythi", 4:"s_idia_findanythingthistime"];
    level.battlechatter.eventstrings["RU"]["investigating"] = [0:"s_idin_illseewhatsup", 1:"s_idin_illcheckitout", 2:"s_idin_illgocheck"];
    level.battlechatter.eventstrings["RU"]["lkp_patrol_search"] = [0:"s_alwp_justwatchthewater", 1:"s_alwp_keepwatchingthatside", 2:"s_alwp_justkeepyoureyesonth"];
    level.battlechatter.eventstrings["RU"]["lost_target"] = [0:"s_lkpl_frustratedgrunttheyr", 1:"s_lkpl_frustratedgrunttheyr_01", 2:"s_lkpl_frustratedgruntnovis", 3:"s_lkpl_frustratedgrunttheyg"];
    level.battlechatter.eventstrings["RU"]["lost_target_water"] = [0:"s_lkpw_theywentunderwater", 1:"s_lkpw_theyreinthewater", 2:"s_lkpw_theyjumpedinthewater", 3:"s_lkpw_theyjumpedinthewater"];
    level.battlechatter.eventstrings["RU"]["moving_there"] = [0:"s_hntm_movingnow", 1:"s_hntm_movingtherenow", 2:"s_hntm_moving"];
    level.battlechatter.eventstrings["RU"]["moving_alone"] = [0:"s_hntm_iminbound", 1:"s_hntm_immoving", 2:"s_hntm_immovingnow"];
    level.battlechatter.eventstrings["RU"]["moving_following"] = [0:"s_hntm_gotyoursix", 1:"s_hntm_imwithyou", 2:"s_hntm_gotyourback"];
    level.battlechatter.eventstrings["RU"]["moving_together"] = [0:"s_hntm_weremoving", 1:"s_hntm_weremovingtherenow", 2:"s_hntm_wereinboundnow"];
    level.battlechatter.eventstrings["RU"]["muttered_confusion"] = [0:"s_idin_whatthefuck", 1:"s_idin_whatthehell", 2:"s_idin_whatthefuckwasthat", 3:"s_idin_whatthehellwasthat"];
    level.battlechatter.eventstrings["RU"]["need_backup"] = [0:"s_alrc_requestingmorekonni", 1:"s_alrc_sendreinforcements", 2:"s_albc_sendreinforcements"];
    level.battlechatter.eventstrings["RU"]["order_check_last"] = [0:"s_advo_moveonemgo", 1:"s_advo_forceuponemgo", 2:"s_advo_pushtheirpositiongo"];
    level.battlechatter.eventstrings["RU"]["order_check_together"] = [0:"s_idit_letsgocheckitout", 1:"s_idit_letscheckitwatchmyba", 2:"s_idit_letsgocheckcoverme"];
    level.battlechatter.eventstrings["RU"]["order_clear_building"] = [0:"s_cmho_clearthebuilding", 1:"s_cmho_securethebuilding", 2:"s_cmho_getthisbuildingsecur"];
    level.battlechatter.eventstrings["RU"]["order_dir"] = [0:"s_aqhs_securethatarea", 1:"s_aqhs_clearthatarea", 2:"s_aqhs_cordonthatarea", 3:"s_aqhs_checkthatway"];
    level.battlechatter.eventstrings["RU"]["order_dir_resp"] = [0:"s_aqhs_illsecurethisarea", 1:"s_aqhs_illtakethisway", 2:"s_aqhs_illcheckoverhere", 3:"s_aqhs_illsearchthisway"];
    level.battlechatter.eventstrings["RU"]["order_follow_me"] = [0:"s_hntm_illleadletsgo", 1:"s_hntm_onme", 2:"s_hntm_illtakepointletsmove"];
    level.battlechatter.eventstrings["RU"]["order_investigate"] = [0:"s_idio_gocheckit", 1:"s_idio_checkitout", 2:"s_idio_gocheckthatout"];
    level.battlechatter.eventstrings["RU"]["order_search_water"] = [0:"s_cmho_searchthewater", 1:"s_cmho_checkthewater", 2:"s_cmho_targetwasinthewater", 3:"s_cmho_geteyesonthewater", 4:"s_cmho_watchthewater"];
    level.battlechatter.eventstrings["RU"]["order_take_point"] = [0:"s_hntm_takepointmoveout", 1:"s_hntm_youtakepointletsgo", 2:"s_hntm_onyouletsmove", 3:"s_aqhr_takeitoutigotyourbac", 4:"s_aqhr_takepointillcover", 5:"s_aqhr_takepointletsroll"];
    level.battlechatter.eventstrings["RU"]["over_there"] = [0:"s_hnfn_overthere", 1:"s_hnfn_theyreoverthere", 2:"s_hnfn_rightthere"];
    level.battlechatter.eventstrings["RU"]["react_first"] = [0:"s_idrc_huh", 1:"s_idrc_wha", 2:"s_idrc_hm", 3:"s_idrc_eh", 4:"s_idrc_hrm", 5:"s_idrc_hmph", 6:"s_idin_hmm", 7:"s_idin_hmphokay", 8:"s_idin_huhwhatwasthat", 9:"s_idin_hrm", 10:"s_idin_huhthehell"];
    level.battlechatter.eventstrings["RU"]["react_first_combat"] = [0:"s_awrr_contactenemy", 1:"s_awrr_contactenemyhere", 2:"s_awrr_enemymyposition", 3:"s_awrr_enemy", 4:"s_awrr_enemyshere", 5:"s_awrr_gotenemyhere", 6:"s_awrr_enemysrighthere"];
    level.battlechatter.eventstrings["RU"]["react_found_corpse"] = [0:"s_alrc_wegotamandown", 1:"s_alrc_wegotacasualty", 2:"s_alrc_friendlysoldierdown", 3:"s_alrc_wegotakia"];
    level.battlechatter.eventstrings["RU"]["react_interrupt"] = [0:"s_idli_missedyourlastover", 1:"s_idli_sayagainover", 2:"s_idli_yougood"];
    level.battlechatter.eventstrings["RU"]["react_multi"] = [0:"s_idrm_whosoutthere", 1:"s_idrm_okaywhatthefuck", 2:"s_idrm_whatisthisshit"];
    level.battlechatter.eventstrings["RU"]["react_noreply"] = [0:"s_idli_youreceivingme", 1:"s_idli_youcopy", 2:"s_idli_doyoureadme"];
    level.battlechatter.eventstrings["RU"]["react_resp"] = [0:"s_alrr_yeah", 1:"s_alrr_afirm", 2:"s_alrr_yeahrogerthat"];
    level.battlechatter.eventstrings["RU"]["react_second"] = [0:"s_idrc_whatthefuckisthat", 1:"s_idrc_whatthehellisthat", 2:"s_idrc_thefuckisgoingon"];
    level.battlechatter.eventstrings["RU"]["react_whizby"] = [0:"s_unrc_imtakingfire", 1:"s_unrc_thatsclose", 2:"s_unrc_someonesshootinatme", 3:"s_unrc_takineffectivefire", 4:"s_unrc_imgettingshotat"];
    level.battlechatter.eventstrings["RU"]["reply_found_nothing"] = [0:"s_aqhr_novisualonthetarget", 1:"s_aqhr_nosignofem", 2:"s_aqhr_novisual"];
    level.battlechatter.eventstrings["RU"]["reply_hear_you"] = [0:"s_idrp_go", 1:"s_idrp_goahead", 2:"s_idrp_imhere", 3:"s_idrp_rogergoahead"];
    level.battlechatter.eventstrings["RU"]["report_investigating"] = [0:"s_aqhr_immovingin", 1:"s_aqhr_imcheckingitout", 2:"s_aqhr_movingtosecure"];
    level.battlechatter.eventstrings["RU"]["report_nothing"] = [0:"s_aqhr_nothingyet", 1:"s_aqhr_nothingsofar", 2:"s_aqhr_nothinghere"];
    level.battlechatter.eventstrings["RU"]["report_reply_idle"] = [0:"s_idrr_gotnothing", 1:"s_idrr_secure", 2:"s_idrr_clearhere", 3:"s_idrr_allclear", 4:"s_idrr_goodhere", 5:"s_idrr_allquiet", 6:"s_idrr_areassecure"];
    level.battlechatter.eventstrings["RU"]["report_reply_search"] = [0:"s_alir_negativenothingyet", 1:"s_alir_nothingsofar", 2:"s_alir_nothing", 3:"s_alir_goodsofar", 4:"s_alir_igotnothingyet", 5:"s_alir_sofarsogood", 6:"s_alir_notseeinganything", 7:"s_alir_negativegotnothing", 8:"s_alir_nothingfornow", 9:"s_alir_itsclearsofar", 10:"s_alir_weregoodfornow"];
    level.battlechatter.eventstrings["RU"]["report_searching"] = [0:"s_aqhr_stillsweeping", 1:"s_aqhr_stillsearching", 2:"s_aqhr_stilllookingforem"];
    level.battlechatter.eventstrings["RU"]["report_target_water"] = [0:"s_awrr_targetsinthewater", 1:"s_awrr_gotavisualtheyreinth", 2:"s_awrr_iseeeminthewater", 3:"s_awrr_inthewaterinthewater", 4:"s_awrr_enemyinthewater", 5:"s_awrr_theyremovinginthewat", 6:"s_awrr_heytheyreinthewater"];
    level.battlechatter.eventstrings["RU"]["resp_glass_first"] = [0:"s_airs_brokenglasshere", 1:"s_airs_itsbrokenglass", 2:"s_airs_gotsomebrokenglass"];
    level.battlechatter.eventstrings["RU"]["resp_glass_multi"] = [0:"s_airs_moreglass", 1:"s_airs_gotsomemoreglass", 2:"s_airs_theresmorebrokenglas"];
    level.battlechatter.eventstrings["RU"]["resp_sound_first"] = [0:"s_idir_nothingnobody", 1:"s_idir_negativewereclear", 2:"s_idir_nahweresecure", 3:"s_idir_nothingnovisual"];
    level.battlechatter.eventstrings["RU"]["resp_water_first"] = [0:"s_idir_checkedthewaterthere", 1:"s_idir_sweptthewaterdidntfi", 2:"s_idir_checkednearthewaterw", 3:"s_idir_nothinginthewaterwer"];
    level.battlechatter.eventstrings["RU"]["resp_window_first"] = [0:"s_idir_awindowwasleftopenwe", 1:"s_idir_foundanopenwindowche", 2:"s_idir_someoneleftawindowop"];
    level.battlechatter.eventstrings["RU"]["resp_window_multi"] = [0:"s_idir_sawanotheropenwindow", 1:"s_idir_anotheropenwindowwer", 2:"s_idir_therewasanotheropenw"];
    level.battlechatter.eventstrings["RU"]["saw_something"] = [0:"s_alre_isawsomething", 1:"s_alre_thoughtisawsomething", 2:"s_alre_ithinksomeonesnearme"];
    level.battlechatter.eventstrings["RU"]["searching_here"] = [0:"s_cmhc_checkingthisarea", 1:"s_cmhc_securingthisarea", 2:"s_cmhc_searchingthisarea"];
    level.battlechatter.eventstrings["RU"]["see_something"] = [0:"s_alre_iseesomething", 1:"s_alre_ithinkiseesomething", 2:"s_alre_iseesomethingnearme"];
    level.battlechatter.eventstrings["RU"]["surprise"] = [0:"s_hurc_ohfuck", 1:"s_hurc_ohshit"];
    level.battlechatter.eventstrings["RU"]["target_still_close"] = [0:"s_lkpc_theywerehere", 1:"s_lkpc_theywererighthere", 2:"s_lkpc_theycantbefar", 3:"s_lkpc_theyreclose", 4:"s_lkpc_theyrehiding", 5:"s_lkpc_theygottabeclose", 6:"s_lkpc_theydidntmakeitfar", 7:"s_lkpc_theyrestillheresomew"];
    level.battlechatter.eventstrings["RU"]["team_alert_investigating"] = [0:"s_alin_wellcheckthearea", 1:"s_alin_werecheckingitout", 2:"s_alin_weregonnacheckitout"];
    level.battlechatter.eventstrings["RU"]["team_have_something"] = [0:"s_alre_wemighthavesomething", 1:"s_alre_ithinkwegotsomething", 2:"s_alre_wegotapossiblethreat"];
    level.battlechatter.eventstrings["RU"]["team_heard_something"] = [0:"s_alre_weheardsomething", 1:"s_alre_weheardsomethingclos", 2:"s_alre_weheardanoise"];
    level.battlechatter.eventstrings["RU"]["team_return_idle"] = [0:"s_idid_okayletsheadback", 1:"s_idid_weregoodhereletsgetb", 2:"s_idid_backtoourpostsletsgo"];
    level.battlechatter.eventstrings["RU"]["team_saw_something"] = [0:"s_alre_wesawsomething", 1:"s_alre_wesawsomethingnearus", 2:"s_alre_wesawsomethingnearou"];
    level.battlechatter.eventstrings["RU"]["team_see_something"] = [0:"s_alre_weseesomething"];
    level.battlechatter.eventstrings["RU"]["unaware_backup"] = [0:"s_unwb_ineedreinforcements", 1:"s_unwb_getmorepersonnelhere", 2:"s_unwb_sendreinforcementsmy"];
    level.battlechatter.eventstrings["RU"]["wait_target_surface"] = [0:"s_lkwr_whentheycomeupsmokee", 1:"s_lkwr_theypopupyoushootem", 2:"s_lkwr_whentheysurfaceopenu", 3:"s_lkwr_theygoforairyoudrope", 4:"s_lkwr_waittiltheysurfaceth", 5:"s_lkwr_theysurfaceyoulighte"];
    level.battlechatter.eventstrings["RU"]["warn_conv"] = [0:"s_wrni_scaredthehelloutofem", 1:"s_wrni_probablyshittingthem", 2:"s_wrni_whatthehellweretheyd", 3:"s_wrni_whatthefuckweretheyt"];
    level.battlechatter.eventstrings["RU"]["warn_attack"] = [0:"s_wrnk_heyiwarnedyou", 1:"s_wrnk_youwerewarned", 2:"s_wrnk_heyyoujustfuckedup"];
    level.battlechatter.eventstrings["RU"]["warn_conv_reply"] = [0:"s_wrir_almostgotthemselvesk", 1:"s_wrir_iwasreadytodumpthatm", 2:"s_wrir_luckytheydidntcatcha"];
    level.battlechatter.eventstrings["RU"]["warn_report"] = [0:"s_wrnr_hadanunknowninsideth", 1:"s_wrnr_hadanunknowninsideth_01", 2:"s_wrnr_anunknownwasintheare"];
    level.battlechatter.eventstrings["RU"]["warn_spotted"] = [0:"s_wrnf_heygetthefuckback", 1:"s_wrnf_heyyougetthefuckoutt", 2:"s_wrnf_getbackgetbackrightn"];
    level.battlechatter.eventstrings["RU"]["water_use_grenade"] = [0:"s_lkwf_dontwasteammousegren", 1:"s_lkwf_throwagrenadeinthere", 2:"s_lkwf_getagrenadeinthewate"];
    level.battlechatter.eventstrings["RU"]["whizby_resp"] = [0:"s_aqal_itcamefromoverthere", 1:"s_aqal_itcamefromthatway", 2:"s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["RU_L"]["ally_missing_multi"] = [0:"s_alms_multipleshadowsarent", 1:"s_alms_moreshadowsarentresp", 2:"s_alms_wevelostcontactwithm", 3:"s_alms_anotherteamlostcomms"];
    level.battlechatter.eventstrings["RU_L"]["ask_found_anything"] = [0:"s_aqhr_whatsyourstatus", 1:"s_aqhr_whatveyougot", 2:"s_aqhr_givemeasitrep", 3:"s_aqhr_sitrep", 4:"s_aqhr_youfindanything", 5:"s_aqhr_tellmeyougotsomethin"];
    level.battlechatter.eventstrings["RU_L"]["ask_how_copy"] = [0:"s_idcm_howcopy", 1:"s_idcm_doyoucopy", 2:"s_idcm_commscheck"];
    level.battlechatter.eventstrings["RU_L"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["RU_L"]["good_hunting"] = [0:"s_hnts_goodhunting", 1:"s_hnts_staysharpoutthere", 2:"s_hnts_out", 3:"s_aisg_copystaysharp"];
    level.battlechatter.eventstrings["RU_L"]["hunt_patrol_noresp"] = [0:"s_hpnr_thresherisntrespondi", 1:"s_hpnr_thresherdidntcheckin", 2:"s_hpnr_thresherisntanswerin", 3:"s_hpnr_icantreachthresher"];
    level.battlechatter.eventstrings["RU_L"]["hunt_report_alert"] = [0:"s_aqlo_fanoutsecuretheperim", 1:"s_aqlo_setcontainmentfindem", 2:"s_aqlo_spreadoutsearchthear", 3:"s_aqhr_allshadowswehaveenem", 4:"s_aqhr_allshadowsenemyisins", 5:"s_aqhr_allshadowsperimeteri"];
    level.battlechatter.eventstrings["RU_L"]["inv_no_response"] = [0:"s_iinr_hesradiosilent", 1:"s_iinr_icantreachhim", 2:"s_iinr_hesnotoncomms"];
    level.battlechatter.eventstrings["RU_L"]["inv_patrol"] = [0:"s_alip_continueyourpatrolst", 1:"s_alip_getbacktoyourrouteke", 2:"s_alip_returntoyourpatrolst"];
    level.battlechatter.eventstrings["RU_L"]["inv_patrol_noresp"] = [0:"s_iinr_thresherisntrespondi", 1:"s_iinr_thresherdidntcheckin", 2:"s_iinr_thresherisntoncomms", 3:"s_iinr_icantreachthresher"];
    level.battlechatter.eventstrings["RU_L"]["leader_ask_corpse_name"] = [0:"s_alrc_whoisit", 1:"s_alrc_whodidwelose", 2:"s_alrc_whoisitthatwelost"];
    level.battlechatter.eventstrings["RU_L"]["order_continue_search"] = [0:"s_aqho_keeplookingforem", 1:"s_aqho_keepsweeping", 2:"s_aqho_keepsearchingthearea"];
    level.battlechatter.eventstrings["RU_L"]["order_find_perimeter"] = [0:"s_cmho_getthisarealockeddow", 1:"s_cmho_securetheperimeter", 2:"s_cmho_iwantthisarealockedd"];
    level.battlechatter.eventstrings["RU_L"]["order_find_target"] = [0:"s_cmho_weneedalocationonthe", 1:"s_cmho_locatethetargetnow", 2:"s_cmho_huntemdown"];
    level.battlechatter.eventstrings["RU_L"]["order_get_visual"] = [0:"s_iinr_seeifyoucanfindoutwh", 1:"s_iinr_checkitoutmakesureno", 2:"s_iinr_canyougetavisualonem", 3:"s_iinr_ineedyoutocheckitout"];
    level.battlechatter.eventstrings["RU_L"]["order_report_back"] = [0:"s_aior_soundoffifyoufindsom", 1:"s_aior_imstandingbyifyoufin", 2:"s_aior_usecommsifyoufindsom"];
    level.battlechatter.eventstrings["RU_L"]["order_search_start"] = [0:"s_aior_searchthearea", 1:"s_aior_pullsecuritysweepthe", 2:"s_aior_securetheperimeter"];
    level.battlechatter.eventstrings["RU_L"]["order_search_water"] = [0:"s_cmho_searchthewater", 1:"s_cmho_checkthewater", 2:"s_cmho_theywereinthewater", 3:"s_cmho_keepyoureyesonthewat", 4:"s_cmho_watchthewater"];
    level.battlechatter.eventstrings["RU_L"]["order_stay_alert"] = [0:"s_aqho_staysharp", 1:"s_aqho_keepittight", 2:"s_aqho_eyesopen"];
    level.battlechatter.eventstrings["RU_L"]["order_stay_aware"] = [0:"s_aqho_dontlettheseguysgett", 1:"s_aqho_theseguysaretf141don"];
    level.battlechatter.eventstrings["RU_L"]["react_interrupt"] = [0:"s_idli_missedyourlastover", 1:"s_idli_sayagainover", 2:"s_idli_yougood", 3:"s_idli_sayagainyourlastover", 4:"s_idli_commscheck", 5:"s_idli_missedyourlastsayaga"];
    level.battlechatter.eventstrings["RU_L"]["react_noreply"] = [0:"s_idli_youreceivingme", 1:"s_idli_youcopy", 2:"s_idli_doyoureadme"];
    level.battlechatter.eventstrings["RU_L"]["reply_hear_you"] = [0:"s_idrp_go", 1:"s_idrp_goahead", 2:"s_idrp_thisisactualgoahead", 3:"s_idrp_rogergoahead", 4:"s_idrp_thisisactual", 5:"s_idrp_goforactual"];
    level.battlechatter.eventstrings["RU_L"]["report_alert"] = [0:"s_airp_allshadowsgetswitche", 1:"s_airp_allshadowsperimeterm", 2:"s_airp_allshadowspossibleen", 3:"s_airp_allshadowssetsecurit"];
    level.battlechatter.eventstrings["RU_L"]["report_idle"] = [0:"s_irpr_status", 1:"s_irpr_sitrep", 2:"s_irpr_yougood", 3:"s_irpr_gotanything", 4:"s_irpr_report"];
    level.battlechatter.eventstrings["RU_L"]["report_search"] = [0:"s_aias_sitrep", 1:"s_aias_whatsyourstatus", 2:"s_aias_findanything", 3:"s_aias_gotanything", 4:"s_aias_status"];
    level.battlechatter.eventstrings["RU_L"]["report_target_location"] = [0:"s_chrp_doesanyonehaveavisua", 1:"s_chrp_talktomeguyswhatsthe", 2:"s_chrp_cmonshadowsineedaloc"];
    level.battlechatter.eventstrings["RU_L"]["signoff"] = [0:"s_idls_out", 1:"s_idls_actualout", 2:"s_idls_stayfrosty", 3:"s_idls_out_01"];
    level.battlechatter.eventstrings["RU_L"]["wait_target_surface"] = [0:"s_lkwr_waitforemtocomeupthe", 1:"s_lkwr_whentheycomeupforair", 2:"s_lkwr_whentheycomeupyourec", 3:"s_lkwr_whentheycomeupyourec", 4:"s_lkwr_lightemupwhentheygof", 5:"s_lkwr_waitforemtosurfaceth"];
    level.battlechatter.eventstrings["RU_L"]["warn_reply"] = [0:"s_wrpl_youreclearedhotifthe", 1:"s_wrpl_youseeemagainputemin", 2:"s_wrpl_theycomebackyourecle"];
    level.battlechatter.eventstrings["RU_L"]["leader_revenge"] = [0:"c_aded_iknowyoureoutthereju", 1:"c_aded_youthinkthatyouvewon", 2:"c_aded_takethissmallwinwhil"];
    level.battlechatter.eventstrings["RU_L"]["leader_revenge_backupinc"] = [0:"c_adbu_enjoythesilencewhile", 1:"c_adbu_youthoughtyoucouldki", 2:"c_adbu_ifiwereyouidrunbefor"];
    level.battlechatter.eventstrings["RU_L"]["order_attack"] = [0:"c_ator_engage", 1:"c_ator_gohot", 2:"c_ator_youreclearedhot"];
    level.battlechatter.eventstrings["RU_L"]["report_alert_combat"] = [0:"c_actr_allsoldiersenemyisin", 1:"c_actr_anenemyhasbreachedth", 2:"c_actr_allsoldiersperimeter"];
    if (!utility::ismp()) {
        level.battlechatter.eventstrings["USS"]["left"] = [0:"m_posn_ontheleft", 1:"m_posn_leftside"];
        level.battlechatter.eventstrings["USS"]["right"] = [0:"m_posn_watchright", 1:"m_posn_rightside"];
        level.battlechatter.eventstrings["USS"]["order_attack"] = [0:"m_ator_shootthem", 1:"m_ator_attack", 2:"m_ator_fireyourweapon"];
        level.battlechatter.eventstrings["USS"]["using_grenade"] = [0:"m_atac_fragout", 1:"m_atac_grenadeout"];
        level.battlechatter.eventstrings["USS"]["attacking"] = [0:"m_atac_attacking", 1:"m_atac_engaging", 2:"m_atac_firing"];
        level.battlechatter.eventstrings["USS"]["movingup"] = [0:"m_tcac_immovingup", 1:"m_tcac_movingforward", 2:"m_tcac_movingup"];
        level.battlechatter.eventstrings["USS"]["reloading"] = [0:"m_tcac_changingmags", 1:"m_tcac_imreloading"];
        level.battlechatter.eventstrings["USS"]["moving"] = [0:"m_tcac_moving", 1:"m_tcac_immoving", 2:"m_tcac_movingnow"];
        level.battlechatter.eventstrings["USS"]["getting_cover"] = [0:"m_tcac_takingcover", 1:"m_tcac_movingtocover"];
        level.battlechatter.eventstrings["USS"]["enemy_using_flash"] = [0:"m_eata_flashbang", 1:"m_eata_flashbangwatchout"];
        level.battlechatter.eventstrings["USS"]["enemy_using_grenade"] = [0:"m_eata_grenade", 1:"m_eata_grenade_01", 2:"m_eata_grenadegetback"];
        level.battlechatter.eventstrings["USS"]["enemy_using_rpg"] = [0:"m_eata_rpg", 1:"m_eata_rocket"];
        level.battlechatter.eventstrings["USS"]["enemy_attacking"] = [0:"m_eata_imtakingfire", 1:"m_eata_contact", 2:"m_eata_takingeffectivefire"];
        level.battlechatter.eventstrings["USS"]["enemy_moving"] = [0:"m_etca_onesmoving", 1:"m_etca_iseeonemoving"];
        level.battlechatter.eventstrings["USS"]["enemy_moving_up"] = [0:"m_etca_onesgettingclose", 1:"m_etca_onesmovingup"];
        level.battlechatter.eventstrings["USS"]["enemy_getting_cover"] = [0:"m_etca_theyretakingcover", 1:"m_etca_enemytakingcover"];
        level.battlechatter.eventstrings["USS"]["enemy_reloading"] = [0:"m_etca_onesreloading", 1:"m_etca_iseeonereloading"];
        level.battlechatter.eventstrings["USS"]["target_getting_cover"] = [0:"m_ttca_hesgoingforcover", 1:"m_ttca_hestryingtohide"];
        level.battlechatter.eventstrings["USS"]["target_reloading"] = [0:"m_ttca_hesreloading", 1:"m_ttca_hestryingtoreload"];
        level.battlechatter.eventstrings["USS"]["target_moving"] = [0:"m_ttca_hesmoving", 1:"m_ttca_heyhesmoving"];
        level.battlechatter.eventstrings["USS"]["target_moving_up"] = [0:"m_ttca_hesmovingup", 1:"m_ttca_hesmovingourway"];
        level.battlechatter.eventstrings["USS"]["enemy_soldiers"] = [0:"m_enmy_iseethem", 1:"m_enmy_iseeenemies", 2:"m_enmy_enemies"];
        level.battlechatter.eventstrings["USS"]["aquired_target"] = [0:"m_aqen_hesrightthere", 1:"m_aqen_icanseehim", 2:"m_aqen_ifoundhim"];
        level.battlechatter.eventstrings["USS"]["neg_target"] = [0:"m_aqen_where", 1:"m_aqen_idontseeanyone", 2:"m_aqen_whereishe"];
        level.battlechatter.eventstrings["USS"]["enemy_exposed"] = [0:"m_exco_onesoutofcover", 1:"m_exco_gotoneintheopen", 2:"m_exco_onesintheopenyouseeh"];
        level.battlechatter.eventstrings["USS"]["target_exposed"] = [0:"m_exco_hesoutofcover", 1:"m_exco_hesmovingfromcover"];
        level.battlechatter.eventstrings["USS"]["youre_exposed"] = [0:"m_exco_takecover", 1:"m_exco_gettocover", 2:"m_exco_getbehindsomething"];
        level.battlechatter.eventstrings["USS"]["target_covered"] = [0:"m_exco_hesincover", 1:"m_exco_hestakingcover"];
        level.battlechatter.eventstrings["USS"]["killfirm_enemy"] = [0:"m_firm_gotone", 1:"m_firm_enemydown", 2:"m_firm_downedone"];
        level.battlechatter.eventstrings["USS"]["killfirm_target"] = [0:"m_firm_ishothim", 1:"m_firm_igothim"];
        level.battlechatter.eventstrings["USS"]["casualties"] = [0:"m_casu_werelosingmen", 1:"m_casu_weretakingheavies"];
        level.battlechatter.eventstrings["USS"]["copy"] = [0:"m_conf_copy", 1:"m_conf_copythat", 2:"m_conf_roger"];
        level.battlechatter.eventstrings["USS"]["low_ammo"] = [0:"m_stat_ineedammunition", 1:"m_stat_ineedammo", 2:"m_stat_whohasammo"];
        level.battlechatter.eventstrings["USS"]["wounded"] = [0:"m_stat_imhit", 1:"m_stat_medic"];
        level.battlechatter.eventstrings["USS"]["wounded_enemy"] = [0:"m_aens_iwoundedone", 1:"m_aens_ihitone"];
        level.battlechatter.eventstrings["USS"]["wounded_target"] = [0:"m_atas_heshurt", 1:"m_atas_ihithim"];
        level.battlechatter.eventstrings["USS"]["coverme"] = [0:"m_tcor_coverme", 1:"m_tcor_ineedcover"];
        level.battlechatter.eventstrings["USS"]["casualty"] = [0:"m_canm_dude", 1:"m_canm_theykilledoneofours", 2:"m_canm_theykilledhim"];
        level.battlechatter.eventstrings["USS"]["suppressing"] = [0:"m_aqsp_gotyoucovered", 1:"m_aqsp_imcoveringyou"];
    }
    level.battlechatter.eventstrings["CTM"]["ahead"] = [0:"c_posn_upahead", 1:"c_posn_infrontofus", 2:"c_posn_aheadofus"];
    level.battlechatter.eventstrings["CTM"]["behind"] = [0:"c_posn_behindus", 1:"c_posn_onoursix", 2:"c_posn_checkrear"];
    level.battlechatter.eventstrings["CTM"]["high"] = [0:"c_posn_lookupup", 1:"c_posn_upthere", 2:"c_posn_aboveus"];
    level.battlechatter.eventstrings["CTM"]["left"] = [0:"c_posn_ontheleft", 1:"c_posn_leftside", 2:"c_posn_lookleft", 3:"c_posn_watchtheleft"];
    level.battlechatter.eventstrings["CTM"]["right"] = [0:"c_posn_lookontheright", 1:"c_posn_rightside", 2:"c_posn_rightright", 3:"c_posn_watchtheright"];
    level.battlechatter.eventstrings["CTM"]["use_flash"] = [0:"c_ator_useaflashgrenade", 1:"c_ator_throwaflashgrenade", 2:"c_ator_tossaflashgrenadebli"];
    level.battlechatter.eventstrings["CTM"]["use_grenade"] = [0:"c_ator_useagrenade", 1:"c_ator_throwagrenade", 2:"c_ator_getagrenadeonthem"];
    level.battlechatter.eventstrings["CTM"]["use_molotov"] = [0:"c_ator_throwamolotov", 1:"c_ator_useamolotov", 2:"c_ator_yougotamolotovburnem"];
    level.battlechatter.eventstrings["CTM"]["use_rpg"] = [0:"c_ator_firearocket", 1:"c_ator_hitthemwitharocket", 2:"c_ator_usearocket"];
    level.battlechatter.eventstrings["CTM"]["order_attack"] = [0:"c_ator_shootthem", 1:"c_ator_attack", 2:"c_ator_fireyourweapon", 3:"c_ator_fire", 4:"c_ator_fuckthemupshoot", 5:"c_ator_killthem", 6:"c_ator_shootthosefuckers"];
    level.battlechatter.eventstrings["CTM"]["attack_orders"] = [0:"c_ator_chepe", 1:"c_ator_rodrigo", 2:"c_ator_alonso", 3:"c_ator_carlos", 4:"c_ator_paco", 5:"c_ator_chava", 6:"c_ator_juan", 7:"c_ator_rami", 8:"c_ator_miguel", 9:"c_ator_mincho", 10:"c_ator_oscar", 11:"c_ator_hector", 12:"c_ator_too", 13:"c_ator_andrs", 14:"c_ator_arturo", 15:"c_ator_raul", 16:"c_ator_ramon", 17:"c_ator_chente", 18:"c_ator_manny", 19:"c_ator_temo", 20:"c_ator_nando", 21:"c_ator_central"];
    level.battlechatter.eventstrings["CTM"]["using_flash"] = [0:"c_atac_usingflashgrenade", 1:"c_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["CTM"]["using_grenade"] = [0:"c_atac_throwinggrenade", 1:"c_atac_grenadeout"];
    level.battlechatter.eventstrings["CTM"]["using_molotov"] = [0:"c_atac_usingamolotov", 1:"c_atac_throwingmolotov"];
    level.battlechatter.eventstrings["CTM"]["using_rpg"] = [0:"c_atac_imusingarocket", 1:"c_atac_firingarocket"];
    level.battlechatter.eventstrings["CTM"]["attacking"] = [0:"c_atac_attacking", 1:"c_atac_engaging", 2:"c_atac_firing"];
    level.battlechatter.eventstrings["CTM"]["using_smoke"] = [0:"c_atac_throwingsmoke", 1:"c_atac_smokegrenadeout"];
    level.battlechatter.eventstrings["CTM"]["movingup"] = [0:"c_tcac_immovingup", 1:"c_tcac_movingforward", 2:"c_tcac_movingup", 3:"c_tcac_advancing"];
    level.battlechatter.eventstrings["CTM"]["reloading"] = [0:"c_tcac_changingmagazine", 1:"c_tcac_imreloading"];
    level.battlechatter.eventstrings["CTM"]["moving"] = [0:"c_tcac_moving", 1:"c_tcac_immoving", 2:"c_tcac_movingnow"];
    level.battlechatter.eventstrings["CTM"]["getting_cover"] = [0:"c_tcac_takingcover", 1:"c_tcac_movingtocover", 2:"c_tcac_gettingcover"];
    level.battlechatter.eventstrings["CTM"]["enemy_using_flash"] = [0:"c_eata_reactionfuckmyeyes", 1:"c_eata_reactionicantsee", 2:"c_eata_flashgrenade"];
    level.battlechatter.eventstrings["CTM"]["enemy_using_grenade"] = [0:"c_eata_grenade", 1:"c_eata_ohhhshit", 2:"c_eata_grenadegetback"];
    level.battlechatter.eventstrings["CTM"]["enemy_using_molotov"] = [0:"c_eata_molotov", 1:"c_eata_molotovgetback", 2:"c_eata_molotovwatchout"];
    level.battlechatter.eventstrings["CTM"]["enemy_using_rpg"] = [0:"c_eata_rpg", 1:"c_eata_rocket", 2:"c_eata_rocketmove"];
    level.battlechatter.eventstrings["CTM"]["enemy_attacking"] = [0:"c_eata_imtakingfire", 1:"c_eata_contact", 2:"c_eata_thosebitchesareshoot"];
    level.battlechatter.eventstrings["CTM"]["enemy_flanking_left"] = [0:"c_etca_watchlefttheyreflank", 1:"c_etca_leftwatchleft", 2:"c_etca_theyreflankingleft"];
    level.battlechatter.eventstrings["CTM"]["enemy_flanking_right"] = [0:"c_etca_heywatchright", 1:"c_etca_theenemyisflankingri", 2:"c_etca_theyreflankingright"];
    level.battlechatter.eventstrings["CTM"]["enemy_moving"] = [0:"c_etca_onesmoving", 1:"c_etca_iseeonemoving", 2:"c_etca_theresonemoving"];
    level.battlechatter.eventstrings["CTM"]["enemy_moving_up"] = [0:"c_etca_onesgettingclose", 1:"c_etca_onesmovingup", 2:"c_etca_onesmovingthisway"];
    level.battlechatter.eventstrings["CTM"]["enemy_getting_cover"] = [0:"c_etca_theyretakingcover", 1:"c_etca_enemytakingcover", 2:"c_etca_onestakingcover"];
    level.battlechatter.eventstrings["CTM"]["enemy_reloading"] = [0:"c_etca_onesreloading", 1:"c_etca_iseeonereloading", 2:"c_etca_heyonesreloading"];
    level.battlechatter.eventstrings["CTM"]["target_getting_cover"] = [0:"c_ttca_hesgoingforcover", 1:"c_ttca_hestryingtohide", 2:"c_ttca_hesrunningforcover"];
    level.battlechatter.eventstrings["CTM"]["target_reloading"] = [0:"c_ttca_hesreloading", 1:"c_ttca_hestryingtoreload", 2:"c_ttca_thatonesreloading"];
    level.battlechatter.eventstrings["CTM"]["target_moving"] = [0:"c_ttca_hesmoving", 1:"c_ttca_heyhesmoving", 2:"c_ttca_hesmovingrightnow"];
    level.battlechatter.eventstrings["CTM"]["target_moving_up"] = [0:"c_ttca_hesmovingup", 1:"c_ttca_hesmovingourway", 2:"c_ttca_hesgettingclose"];
    level.battlechatter.eventstrings["CTM"]["target_near_patrol"] = [0:"c_ttca_hesinthewaternearyou", 1:"c_ttca_hesswimmingtowardsyo", 2:"c_ttca_intercepthim"];
    level.battlechatter.eventstrings["CTM"]["enemy_soldier"] = [0:"c_enmy_theresone", 1:"c_enmy_iseeone", 2:"c_enmy_enemy"];
    level.battlechatter.eventstrings["CTM"]["enemy_soldiers"] = [0:"c_enmy_iseethem", 1:"c_enmy_iseeenemies", 2:"c_enmy_enemies"];
    level.battlechatter.eventstrings["CTM"]["aquired_target"] = [0:"c_aqen_hesrightthere", 1:"c_aqen_icanseehim", 2:"c_aqen_ifoundhim", 3:"c_aqen_herestherat"];
    level.battlechatter.eventstrings["CTM"]["neg_target"] = [0:"c_aqen_where", 1:"c_aqen_idontseeanyone", 2:"c_aqen_whereishe", 3:"c_aqen_icantseehim", 4:"c_aqen_whereisthisbitch", 5:"c_aqen_whatshislocation"];
    level.battlechatter.eventstrings["CTM"]["enemy_exposed"] = [0:"c_exco_onesoutofcover", 1:"c_exco_gotoneintheopen", 2:"c_exco_onesintheopenyouseeh"];
    level.battlechatter.eventstrings["CTM"]["target_exposed"] = [0:"c_exco_hesoutofcover", 1:"c_exco_hesmovingfromcover", 2:"c_exco_hesnotincover"];
    level.battlechatter.eventstrings["CTM"]["youre_exposed"] = [0:"c_exco_takecover", 1:"c_exco_gettocover", 2:"c_exco_getbehindsomething"];
    level.battlechatter.eventstrings["CTM"]["target_covered"] = [0:"c_exco_hesincover", 1:"c_exco_hestakingcover", 2:"c_exco_heshidinglikeabitch"];
    level.battlechatter.eventstrings["CTM"]["killfirm_enemy"] = [0:"c_firm_gotone", 1:"c_firm_ishotoneofthosefucke", 2:"c_firm_killedoneofthem"];
    level.battlechatter.eventstrings["CTM"]["killfirm_target"] = [0:"c_firm_ishothim", 1:"c_firm_gotthatfucker", 2:"c_firm_killedthatlittlebitc"];
    level.battlechatter.eventstrings["CTM"]["killfirm_truck"] = [0:"c_firm_wedestroyedtheirtruc", 1:"c_firm_theirtruckisdown", 2:"c_firm_wekilledtheirtruck"];
    level.battlechatter.eventstrings["CTM"]["killfirm_bigrig"] = [0:"c_firm_itookouttheirbigrig", 1:"c_firm_wedestroyedtheirbigr", 2:"c_firm_theirbigriggotfucked"];
    level.battlechatter.eventstrings["CTM"]["killfirm_helo"] = [0:"c_firm_shottheirhelicoptero", 1:"c_firm_wetookouttheirhelico", 2:"c_firm_theirhelicopterisdow"];
    level.battlechatter.eventstrings["CTM"]["casualties"] = [0:"c_casu_werelosingmen", 1:"c_casu_weregettingkilledout"];
    level.battlechatter.eventstrings["CTM"]["copy"] = [0:"c_conf_igotit", 1:"c_conf_yesyes", 2:"c_conf_understood", 3:"c_conf_iknow", 4:"c_conf_copythat", 5:"c_aqcp_copy", 6:"c_aqcp_copythat"];
    level.battlechatter.eventstrings["CTM"]["praise"] = [0:"c_pras_yeahmakethemeatshit", 1:"c_pras_yeahkillallthesefuck", 2:"c_pras_thatsitfuckthemup", 3:"c_pras_thatwasagoodshot", 4:"c_pras_yougotthemdude"];
    level.battlechatter.eventstrings["CTM"]["low_ammo"] = [0:"c_stat_ineedammunition", 1:"c_stat_wherestheammo", 2:"c_stat_whohasammo", 3:"c_stat_ineedamagazine", 4:"c_stat_ineedanothermagazine"];
    level.battlechatter.eventstrings["CTM"]["wounded"] = [0:"c_stat_imhit", 1:"c_stat_painimhurtbaddude", 2:"c_stat_painimhit"];
    level.battlechatter.eventstrings["CTM"]["ask_wounded"] = [0:"c_stat_youstillwithus", 1:"c_stat_didyougethit", 2:"c_stat_areyouhit"];
    level.battlechatter.eventstrings["CTM"]["ask_low_ammo"] = [0:"c_stat_howsyourammunition", 1:"c_stat_doyouneedammunition", 2:"c_stat_areyougoodonammuniti"];
    level.battlechatter.eventstrings["CTM"]["ask_status"] = [0:"c_stat_areyouokay", 1:"c_stat_reportwhatsyourstatu", 2:"c_stat_heydudeyougood"];
    level.battlechatter.eventstrings["CTM"]["reply_wounded"] = [0:"c_stat_painthatfuckinbitchs", 1:"c_stat_painimshot", 2:"c_stat_fuckigothit"];
    level.battlechatter.eventstrings["CTM"]["reply_low_ammo"] = [0:"c_stat_imlowonammo", 1:"c_stat_ineedammo", 2:"c_stat_heygivemesomeammo"];
    level.battlechatter.eventstrings["CTM"]["reply_okay"] = [0:"c_stat_imfuckininvincibledu", 1:"c_stat_imokay", 2:"c_stat_imgoodimgood"];
    level.battlechatter.eventstrings["CTM"]["wounded_enemy"] = [0:"c_aens_oneshurtbad", 1:"c_aens_fuckeduponeofthem", 2:"c_aens_ihitoneofthem"];
    level.battlechatter.eventstrings["CTM"]["ask_target_loc"] = [0:"c_tast_whatstheirlocation", 1:"c_tast_doyouseethem", 2:"c_tast_wherearethey"];
    level.battlechatter.eventstrings["CTM"]["ask_target_wounded"] = [0:"c_tast_tellmeyoukilledthatb", 1:"c_tast_didyoukillthatpieceo", 2:"c_tast_didyougethim"];
    level.battlechatter.eventstrings["CTM"]["target_wounded"] = [0:"c_tast_hesbleeding", 1:"c_tast_hesfuckedupdude", 2:"c_tast_hesmissingapiece"];
    level.battlechatter.eventstrings["CTM"]["target_unhurt"] = [0:"c_tast_hegotawaytherat", 1:"c_tast_fuckididntgethim", 2:"c_tast_arhhimissedhim"];
    level.battlechatter.eventstrings["CTM"]["wounded_target"] = [0:"c_atas_heshurt", 1:"c_atas_ihithim", 2:"c_atas_ifuckedhimup"];
    level.battlechatter.eventstrings["CTM"]["enemy_lmg"] = [0:"c_enws_machinegunner", 1:"c_enws_theyhaveamachinegunn", 2:"c_enws_onehasamachinegun"];
    level.battlechatter.eventstrings["CTM"]["enemy_shotgun"] = [0:"c_enws_isawonewithashotgun", 1:"c_enws_onesgotashotgun", 2:"c_enws_carefulonesusingasho"];
    level.battlechatter.eventstrings["CTM"]["enemy_sniper"] = [0:"c_enws_theyhaveasniper", 1:"c_enws_snipergetdown", 2:"c_enws_theresasniperonus"];
    level.battlechatter.eventstrings["CTM"]["target_lmg"] = [0:"c_taws_thatfuckersusingamac", 1:"c_taws_hesgotamachinegun", 2:"c_taws_watchithesusingamach"];
    level.battlechatter.eventstrings["CTM"]["target_shotgun"] = [0:"c_taws_thatrathasashotgun", 1:"c_taws_shotgun"];
    level.battlechatter.eventstrings["CTM"]["target_sniper"] = [0:"c_taws_sniper", 1:"c_taws_hessnipingatus"];
    level.battlechatter.eventstrings["CTM"]["move"] = [0:"c_tcor_gogo", 1:"c_tcor_move", 2:"c_tcor_getmoving", 3:"c_tcor_moveyourass", 4:"c_tcor_movefast", 5:"c_tcor_gonow", 6:"c_tcor_moveasshole", 7:"c_tcor_getgoing"];
    level.battlechatter.eventstrings["CTM"]["moveup"] = [0:"c_tcor_moveup", 1:"c_tcor_movein", 2:"c_tcor_goup", 3:"c_tcor_getupthere", 4:"c_tcor_goforwardmove"];
    level.battlechatter.eventstrings["CTM"]["coverme"] = [0:"c_tcor_coverme", 1:"c_tcor_givemecoverfire", 2:"c_tcor_ineedcover"];
    level.battlechatter.eventstrings["CTM"]["hostile_burst"] = [0:"c_hsbr_gofuckyourmothers", 1:"c_hsbr_werewiththenamelessy", 2:"c_hsbr_thisisthesoulscartel", 3:"c_hsbr_longlivethesoulscart"];
    level.battlechatter.eventstrings["CTM"]["casualty"] = [0:"m_canm_theykilledhim", 1:"m_canm_dude", 2:"m_canm_theykilledoneofours", 3:"m_canm_fuckwelostaman", 4:"m_canm_welostasoul"];
    level.battlechatter.eventstrings["CTM"]["suppressing"] = [0:"c_aqsp_gotyoucovered", 1:"c_aqsp_imcoveringyou", 2:"c_aqsp_igotyougo", 3:"c_aqsp_fallbackillcoveryou"];
    level.battlechatter.eventstrings["CTM"]["reply_hear_you"] = [0:"s_idrp_yes", 1:"s_idrp_goahead", 2:"s_idrp_copyihearyou", 3:"s_idrp_ihearyougoahead"];
    level.battlechatter.eventstrings["CTM"]["muttered_confusion"] = [0:"s_idin_whatthefuck", 1:"s_idin_whatthehell", 2:"s_idin_whatthefuckisthat", 3:"s_idin_whatthehellisthat"];
    level.battlechatter.eventstrings["CTM"]["investigating"] = [0:"s_idin_goingtocheckitout", 1:"s_idin_checkingitout", 2:"s_idin_gonnagocheckit"];
    level.battlechatter.eventstrings["CTM"]["inv_arrive"] = [0:"s_idin_hmm", 1:"s_idin_hmphokay", 2:"s_idin_huhwhatwasthat", 3:"s_idin_hrm", 4:"s_idin_huhthehell"];
    level.battlechatter.eventstrings["CTM"]["react_found_corpse"] = [0:"s_alrc_welostaman", 1:"s_alrc_foundabodyoneofours", 2:"s_alrc_oneofourpatrolsgothi", 3:"s_alrc_welostaman_01"];
    level.battlechatter.eventstrings["CTM"]["hunt_affirm"] = [0:"s_hnrs_yeahyeah"];
    level.battlechatter.eventstrings["CTM"]["hunt_copy"] = [0:"s_hnrs_copiedman", 1:"s_hnrs_gotit", 2:"s_hnrs_copy"];
    level.battlechatter.eventstrings["CTM"]["hunt_neg"] = [0:"s_hnrs_negative"];
    level.battlechatter.eventstrings["CTM"]["react_whizby"] = [0:"s_unrc_someoneshotatme", 1:"s_unrc_ijustgotshotat", 2:"s_unrc_imgettingfuckinshota", 3:"s_unrc_someonetriedtoshootm", 4:"s_unrc_itookfire"];
    level.battlechatter.eventstrings["CTM"]["react_loc"] = [0:"s_unrc_itcamefromoverthere", 1:"s_unrc_itcamefromthatdirect", 2:"s_unrc_itwasfromthatway", 3:"s_unrc_itcamefromthatway", 4:"s_unrc_itwasfromthatdirecti"];
    level.battlechatter.eventstrings["CTM"]["react_unaware"] = [0:"s_unrc_imtakingfire", 1:"s_unrc_contact", 2:"s_unrc_theressomeonehere"];
    level.battlechatter.eventstrings["CTM"]["over_there"] = [0:"s_hnfn_overthere", 1:"s_hnfn_theyreoverthere", 2:"s_hnfn_theyreoverthatway"];
    level.battlechatter.eventstrings["CTM"]["surprise"] = [0:"s_hurc_ohgod", 1:"s_hurc_ohfuck", 2:"s_hurc_ohshit"];
    level.battlechatter.eventstrings["CTM"]["report_reply_idle"] = [0:"s_idrr_nothinghere", 1:"s_idrr_secure", 2:"s_idrr_weregoodman", 3:"s_idrr_allclear", 4:"s_idrr_goodhere", 5:"s_idrr_nothingtoreport", 6:"s_idrr_allquietoverhere"];
    level.battlechatter.eventstrings["CTM"]["react_first"] = [0:"s_idrc_huh", 1:"s_idrc_wha", 2:"s_idrc_hm", 3:"s_idrc_eh", 4:"s_idrc_hrm", 5:"s_idrc_hmph"];
    level.battlechatter.eventstrings["CTM"]["react_second"] = [0:"s_idrc_whatthefuckwasthat", 1:"s_idrc_whatthehellwasthat", 2:"s_idrc_whosthere"];
    level.battlechatter.eventstrings["CTM"]["react_multi"] = [0:"s_idrm_whatthefuckisgoingon", 1:"s_idrm_okaywhatthefuck", 2:"s_idrm_someonesfuckinwithme"];
    level.battlechatter.eventstrings["CTM"]["react_interrupt"] = [0:"s_idli_heywhatswrong", 1:"s_idli_whatwasthat", 2:"s_idli_areyouokayman"];
    level.battlechatter.eventstrings["CTM"]["react_noreply"] = [0:"s_idli_areyouthere", 1:"s_idli_wheredyougo", 2:"s_idli_canyouhearme"];
    level.battlechatter.eventstrings["CTM"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["CTM"]["idle_good_hunting"] = [0:"s_idls_stayfocusedoverthere", 1:"s_idls_staysharpman", 2:"s_idls_keepyoureyesopenman"];
    level.battlechatter.eventstrings["CTM"]["resp_sound_first"] = [0:"s_idir_nothingdidntseeanyon", 1:"s_idir_didntseeanyonewerego", 2:"s_idir_thoughtiheardsomeone", 3:"s_idir_soundedlikesomeonewa"];
    level.battlechatter.eventstrings["CTM"]["order_check_together"] = [0:"s_idit_letsgocheckitout", 1:"s_idit_thiswayfollowme", 2:"s_idit_overherecoverme"];
    level.battlechatter.eventstrings["CTM"]["covering_investigate"] = [0:"s_idit_rightbehindyou", 1:"s_idit_imwithyou", 2:"s_idit_ivegotyourback"];
    level.battlechatter.eventstrings["CTM"]["team_return_idle"] = [0:"s_idid_letsheadback", 1:"s_idid_fuckitletsgetback", 2:"s_idid_alrightweshouldgetba"];
    level.battlechatter.eventstrings["CTM"]["have_something"] = [0:"s_alre_mighthavesomething_01", 1:"s_alre_couldhavesomethinghe_01", 2:"s_alre_somethingsoverhere_01"];
    level.battlechatter.eventstrings["CTM"]["heard_something"] = [0:"s_alre_heardsomething_01", 1:"s_alre_heardanoise_01", 2:"s_alre_heardanoiseoverhere_01"];
    level.battlechatter.eventstrings["CTM"]["saw_something"] = [0:"s_alre_sawsomethingoverhere_01", 1:"s_alre_mighthaveeyesonsomeo_01", 2:"s_alre_thinksomeonescloseby_01"];
    level.battlechatter.eventstrings["CTM"]["see_something"] = [0:"s_alre_seeingsomethingoverh_01", 1:"s_alre_gotavisualonsomethin_01", 2:"s_alre_goteyesonsomething_01"];
    level.battlechatter.eventstrings["CTM"]["object_whizby"] = [0:"s_alre_whothefuckthrewthat", 1:"s_alre_whothrewthat", 2:"s_alre_youmissed"];
    level.battlechatter.eventstrings["CTM"]["jailer_body_react"] = [0:"s_idrm_okaywhatthefuck", 1:"s_idrm_whatthefuckisgoingon", 2:"s_idrm_issomeonefuckingwith"];
    level.battlechatter.eventstrings["CTM"]["jailer_head_react"] = [0:"s_unrc_contact", 1:"s_unrc_imunderattack", 2:"s_unrc_itookfire"];
    level.battlechatter.eventstrings["CTM"]["bottle_whizby"] = [0:"s_alre_whothefuckthrewthat", 1:"s_alre_whothrewthat", 2:"s_alre_youmissed"];
    level.battlechatter.eventstrings["CTM"]["alert_investigating"] = [0:"s_alin_goingtocheckitout", 1:"s_alin_checkingitout", 2:"s_alin_goingtocheckthearea"];
    level.battlechatter.eventstrings["CTM"]["alert_confirming"] = [0:"s_alcf_roger", 1:"s_alcf_copy", 2:"s_alcf_copythat"];
    level.battlechatter.eventstrings["CTM"]["inv_ask"] = [0:"s_alia_youseeanything", 1:"s_alia_yougotsomething", 2:"s_alia_whatvewegot", 3:"s_alia_youseesomething"];
    level.battlechatter.eventstrings["CTM"]["report_reply_search"] = [0:"s_alir_nothingyet", 1:"s_alir_nothingsofar", 2:"s_alir_itsbeenquietsofar", 3:"s_alir_weregoodfornow", 4:"s_alir_allclearrightnow", 5:"s_alir_sofarsogood", 6:"s_alir_notseeinganythingyet", 7:"s_alir_haventseenanything", 8:"s_alir_nothingfornow", 9:"s_alir_itsclearfornow", 10:"s_alir_weregoodsofar"];
    level.battlechatter.eventstrings["CTM"]["ask_enemy_loc"] = [0:"s_unwl_wheredthatcomefrom", 1:"s_unwl_whereditcomefrom", 2:"s_unwl_wherethefuckarethey"];
    level.battlechatter.eventstrings["CTM"]["enemy_loc_resp"] = [0:"s_unrs_idontknow", 1:"s_unrs_ididntseethem", 2:"s_unrs_idontfuckingknow", 3:"s_unrs_ididntsee"];
    level.battlechatter.eventstrings["CTM"]["ask_enemy_count"] = [0:"s_unwc_howmanyarethere", 1:"s_unwc_howmanyofem", 2:"s_unwc_howmany"];
    level.battlechatter.eventstrings["CTM"]["react_first_combat"] = [0:"s_awrr_enemy_01", 1:"s_awrr_theenemyishere_01", 2:"s_awrr_enemyrighthere_01", 3:"s_awrr_theresanenemy_01", 4:"s_awrr_enemyenemy_01", 5:"s_awrr_someoneshere_01", 6:"s_awrr_enemyhere_01"];
    level.battlechatter.eventstrings["CTM"]["at_my_location"] = [0:"s_awrr_hererighthere_01", 1:"s_awrr_righthereguys", 2:"s_awrr_heyoverhere_01", 3:"s_awrr_righthererighthere_01", 4:"s_awrr_heytheyrerighthere_01", 5:"s_awrr_theyrehereiseethem_01", 6:"s_awrr_heytheyreoverhere_01", 7:"s_awrr_heytheyrehere_01"];
    level.battlechatter.eventstrings["CTM"]["found_you"] = [0:"s_awrr_motherfucker", 1:"s_awrr_pieceofshit", 2:"s_awrr_youbitch", 3:"s_awrr_fuckyou", 4:"s_awrr_gotyou"];
    level.battlechatter.eventstrings["CTM"]["found_target"] = [0:"s_awrr_heytheyrerightthere_01", 1:"s_awrr_heyiseethem_01", 2:"s_awrr_ifoundthem_01", 3:"s_awrr_igotthem_01", 4:"s_awrr_theretheyare_01", 5:"s_awrr_theyrerightoverthere_01"];
    level.battlechatter.eventstrings["CTM"]["found_target_loc"] = [0:"s_awrr_attheoffrenda", 1:"s_awrr_theoffrenda", 2:"s_awrr_offrenda", 3:"s_awrr_firstfloor", 4:"s_awrr_onthefirstfloor", 5:"s_awrr_thefirstfloor", 6:"s_awrr_secondfloor", 7:"s_awrr_onthesecondfloor", 8:"s_awrr_thesecondfloor", 9:"s_awrr_ontheroof", 10:"s_awrr_theroof", 11:"s_awrr_upontheroof", 12:"s_awrr_thegarage", 13:"s_awrr_atthegarage", 14:"s_awrr_inthegarage", 15:"s_awrr_theelevator", 16:"s_awrr_attheelevator", 17:"s_awrr_neartheelevator"];
    level.battlechatter.eventstrings["CTM"]["order_check_last"] = [0:"s_advo_moveonemgo", 1:"s_advo_theyrerighttherepush", 2:"s_advo_moveuponemnownow"];
    level.battlechatter.eventstrings["CTM"]["lost_target"] = [0:"s_lkpl_frustratedgrunttheyr", 1:"s_lkpl_frustratedgrunttheyr_01", 2:"s_lkpl_frustratedgruntwelos", 3:"s_lkpl_frustratedgruntfuckt"];
    level.battlechatter.eventstrings["CTM"]["ask_target_location"] = [0:"s_lklr_wherearethey", 1:"s_lklr_doyouseethem", 2:"s_lklr_youseewheretheywent", 3:"s_lklr_wheredtheygo", 4:"s_lklr_wherethefuckarethey", 5:"s_lklr_whereisthislittlebit"];
    level.battlechatter.eventstrings["CTM"]["target_still_close"] = [0:"s_lkpc_theywerehere", 1:"s_lkpc_theywererighthere", 2:"s_lkpc_theycantbefar", 3:"s_lkpc_theyreclose", 4:"s_lkpc_theyrehiding", 5:"s_lkpc_theyvegottabehere", 6:"s_lkpc_theydidntjustdisappe", 7:"s_lkpc_theyreheresomewhere"];
    level.battlechatter.eventstrings["CTM"]["order_clear_offrenda"] = [0:"s_cmho_clearthealtarroom", 1:"s_cmho_securethealtarroom", 2:"s_cmho_sweepthealtarroom"];
    level.battlechatter.eventstrings["CTM"]["order_clear_1stfloor"] = [0:"s_cmho_clearthefirstfloor", 1:"s_cmho_securethefirstfloor", 2:"s_cmho_sweepthefirstfloor"];
    level.battlechatter.eventstrings["CTM"]["order_clear_2ndfloor"] = [0:"s_cmho_clearthesecondfloor", 1:"s_cmho_securethesecondfloor", 2:"s_cmho_sweepthesecondfloor"];
    level.battlechatter.eventstrings["CTM"]["order_clear_roof"] = [0:"s_cmho_cleartheroof", 1:"s_cmho_securetheroof", 2:"s_cmho_sweeptheroof"];
    level.battlechatter.eventstrings["CTM"]["order_clear_garage"] = [0:"s_cmho_clearthegarage", 1:"s_cmho_securethegarage", 2:"s_cmho_sweepthegarage"];
    level.battlechatter.eventstrings["CTM"]["order_clear_elevator"] = [0:"s_cmho_cleartheelevator", 1:"s_cmho_securetheelevator", 2:"s_cmho_sweeptheelevator"];
    level.battlechatter.eventstrings["CTM"]["searching_here"] = [0:"s_cmhc_thisareasgood", 1:"s_cmhc_thisareasclear", 2:"s_cmhc_myareaisclear"];
    level.battlechatter.eventstrings["CTM"]["cmb_hunt_confirmation"] = [0:"s_cmhr_yesgotit", 1:"s_cmhr_copythat", 2:"s_cmhr_okay", 3:"s_cmhr_gotit", 4:"s_cmhr_no"];
    level.battlechatter.eventstrings["CTM"]["good_hunting"] = [0:"s_hnts_watchyourbackman", 1:"s_hnts_stayalertman", 2:"s_hnts_onyourtoesman"];
    level.battlechatter.eventstrings["CTM"]["moving_there"] = [0:"s_hntm_movingnow", 1:"s_hntm_movingtherenow", 2:"s_hntm_moving", 3:"s_hntm_ontheway", 4:"s_hntm_movingthatway"];
    level.battlechatter.eventstrings["CTM"]["moving_following"] = [0:"s_hntm_imwithyouman", 1:"s_hntm_ihaveyourback", 2:"s_hntm_illguardyourback"];
    level.battlechatter.eventstrings["CTM"]["order_follow_me"] = [0:"s_hntm_letsmovestaytogether", 1:"s_hntm_followmeletsgo", 2:"s_hntm_yourewithmeletsmove"];
    level.battlechatter.eventstrings["CTM"]["ask_found_anything"] = [0:"s_aqhr_gotanything", 1:"s_aqhr_yougotsomething", 2:"s_aqhr_findanything", 3:"s_aqhr_youseethem", 4:"s_aqhr_didyoufindsomething", 5:"s_aqhr_whatdoyougot"];
    level.battlechatter.eventstrings["CTM"]["reply_found_nothing"] = [0:"s_aqhr_nothingyet", 1:"s_aqhr_nothingsofar", 2:"s_aqhr_nothinghereman"];
    level.battlechatter.eventstrings["CTM"]["report_searching"] = [0:"s_aqhr_stillsweepingthisare", 1:"s_aqhr_stillsearching", 2:"s_aqhr_stilllookingforthem"];
    level.battlechatter.eventstrings["CTM"]["report_nothing"] = [0:"s_aqhr_theresnothinghere", 1:"s_aqhr_nosignofthemyet", 2:"s_aqhr_nooneshereman"];
    level.battlechatter.eventstrings["CTM"]["report_investigating"] = [0:"s_aqhr_mighthavesomethingch", 1:"s_aqhr_heardsomethingsweepi", 2:"s_aqhr_theycouldbeclosesear"];
    level.battlechatter.eventstrings["CTM"]["area_clear"] = [0:"s_aqhr_thisareaisclear", 1:"s_aqhr_clearhere", 2:"s_aqhr_areaclear"];
    level.battlechatter.eventstrings["CTM"]["area_clear_loc"] = [0:"s_aqhr_altarroomisclear", 1:"s_aqhr_firstfloorsecure", 2:"s_aqhr_weresecureonthesecon", 3:"s_aqhr_roofisclear", 4:"s_aqhr_garageissecure", 5:"s_aqhr_elevatorssecure"];
    level.battlechatter.eventstrings["CTM"]["order_dir"] = [0:"s_aqhs_checkthatway", 1:"s_aqhs_heysearchoverthere", 2:"s_aqhs_checkoverthere", 3:"s_aqhs_searchthatway"];
    level.battlechatter.eventstrings["CTM"]["order_dir_resp"] = [0:"s_aqhs_illsearchoverhere", 1:"s_aqhs_illtakethisway", 2:"s_aqhs_illtakeoverhere", 3:"s_aqhs_illsearchthisway"];
    level.battlechatter.eventstrings["CTM"]["hunt_search_object"] = [0:"s_aqhs_itsclear", 1:"s_aqhs_clear", 2:"s_aqhs_nothinghere", 3:"s_aqhs_goodhere"];
    level.battlechatter.eventstrings["CTM"]["hunt"] = [0:"s_aqhb_wherethefuckareyou", 1:"s_aqhb_wherethefuckishe", 2:"s_aqhb_whereisthispieceofsh", 3:"s_aqhb_comeonwhereareyouhid", 4:"s_aqhb_wherethefuckdidyougo", 5:"s_aqhb_pieceofshitshowyours", 6:"s_aqhb_motherfuckerwhereare"];
    level.battlechatter.eventstrings["CTM"]["hunt_inv_order"] = [0:"s_ahii_checkit", 1:"s_ahii_checkitout", 2:"s_ahii_gocheckit", 3:"s_ahii_searchit"];
    level.battlechatter.eventstrings["CTM"]["hunt_inv_event"] = [0:"s_ahir_ithinktheyreclose", 1:"s_ahir_imighthavethem", 2:"s_ahir_ijustheardthem", 3:"s_ahir_imighthavefoundthem"];
    level.battlechatter.eventstrings["CTM"]["hunt_inv_loc"] = [0:"s_ahir_atthealtarroom", 1:"s_ahir_nearthealtarroom", 2:"s_ahir_bythealtarroom", 3:"s_ahir_firstfloor", 4:"s_ahir_onthefirstfloor", 5:"s_ahir_thefirstfloor", 6:"s_ahir_secondfloor", 7:"s_ahir_onthesecondfloor", 8:"s_ahir_thesecondfloor", 9:"s_ahir_ontheroof", 10:"s_ahir_theroof", 11:"s_ahir_upontheroof", 12:"s_ahir_thegarage", 13:"s_ahir_atthegarage", 14:"s_ahir_inthegarage", 15:"s_ahir_theelevator", 16:"s_ahir_attheelevator", 17:"s_ahir_neartheelevator"];
    level.battlechatter.eventstrings["CTM"]["hunt_reactions"] = [0:"s_ahnr_surprisedintensereac", 1:"s_ahnr_surprisedintensereac_01", 2:"s_ahnr_surprisedintensereac_02"];
    level.battlechatter.eventstrings["CTM"]["cmb_reactions"] = [0:"s_aqcr_surprisedintensereac", 1:"s_aqcr_surprisedintensereac_01", 2:"s_aqcr_surprisedintensereac_02"];
    level.battlechatter.eventstrings["CTM"]["whizby_resp"] = [0:"s_aqal_itcamefromoverthere", 1:"s_aqal_itcamefromthatway", 2:"s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["CTM"]["hunt_cornercheck"] = [0:"s_aqho_checkyourcorners", 1:"s_aqho_checkthecorners", 2:"s_aqho_searcheverycornerfin"];
    level.battlechatter.eventstrings["CTM"]["hunt_order_hold"] = [0:"s_aqho_holdup", 1:"s_aqho_wait", 2:"s_aqho_hold"];
    level.battlechatter.eventstrings["CTM"]["alert_cornercheck"] = [0:"s_aqao_besuretocheckthecorn", 1:"s_aqao_checkthecornersjustt", 2:"s_aqao_remembertochecktheco"];
    level.battlechatter.eventstrings["CTM"]["alert_search_orders"] = [0:"s_aqao_checkthatway", 1:"s_aqao_gothatway", 2:"s_aqao_checkoverthere", 3:"s_aqao_searchoverthere", 4:"s_aqao_searchthatway", 5:"s_aqao_lookoverthere"];
    level.battlechatter.eventstrings["CTM"]["hunt_report_alert"] = [0:"s_aqlo_spreadoutfindthem_01", 1:"s_aqlo_searchtheareafindthe_01", 2:"s_aqlo_spreadoutsearchthear_01"];
    level.battlechatter.eventstrings["CTM_L"]["reply_hear_you"] = [0:"s_idrp_copymanstarttalking", 1:"s_idrp_goahead", 2:"s_idrp_thisiscentral", 3:"s_idrp_whatisit", 4:"s_idrp_yesihearyou", 5:"s_idrp_ihearyougoahead"];
    level.battlechatter.eventstrings["CTM_L"]["react_interrupt"] = [0:"s_idli_whatswrong", 1:"s_idli_whatwasthat", 2:"s_idli_whathappened", 3:"s_idli_ididnthearyoumansaya", 4:"s_idli_issomethingwrong", 5:"s_idli_areyouokayman"];
    level.battlechatter.eventstrings["CTM_L"]["react_noreply"] = [0:"s_idli_areyouthere", 1:"s_idli_didiloseyou", 2:"s_idli_canyouhearmedude"];
    level.battlechatter.eventstrings["CTM_L"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["CTM_L"]["signoff"] = [0:"s_idls_outhere", 1:"s_idls_centralout", 2:"s_idls_staysafemanout", 3:"s_idls_out"];
    level.battlechatter.eventstrings["CTM_L"]["inv_patrol"] = [0:"s_alip_resumeyourpatrolkeep", 1:"s_alip_getbacktoyourpatrolb", 2:"s_alip_returntoyourpatrolbu"];
    level.battlechatter.eventstrings["CTM_L"]["report_search"] = [0:"s_alip_whatsyourstatus", 1:"s_aias_reportin", 2:"s_aias_haveyoufoundanything", 3:"s_aias_givemeanupdate", 4:"s_aias_whathaveyougot"];
    level.battlechatter.eventstrings["CTM_L"]["wait_target_surface"] = [0:"s_lkwr_whentheycomesupforai", 1:"s_lkwr_theypoptheirheadouty", 2:"s_lkwr_whentheycomeupyoukil", 3:"s_lkwr_theygoforairyoutaket", 4:"s_lkwr_whentheypopuptheyred", 5:"s_lkwr_theyllcomeupforairwh"];
    level.battlechatter.eventstrings["CTM_L"]["order_find_target"] = [0:"s_cmho_findthem", 1:"s_cmho_searcheverywherefind", 2:"s_cmho_huntthemdown"];
    level.battlechatter.eventstrings["CTM_L"]["order_find_perimeter"] = [0:"s_cmho_cleartheperimeter", 1:"s_cmho_securetheperimeter", 2:"s_cmho_gettheperimeterclear"];
    level.battlechatter.eventstrings["CTM_L"]["order_search_water"] = [0:"s_cmho_searchthewater", 1:"s_cmho_checkthewater", 2:"s_cmho_theywereinthewater", 3:"s_cmho_keepyoureyesonthewat", 4:"s_cmho_watchthewater"];
    level.battlechatter.eventstrings["CTM_L"]["good_hunting"] = [0:"s_hnts_watchyourbackoutther", 1:"s_hnts_findthismotherfucker", 2:"s_hnts_becarefuloutthere", 3:"s_aisg_copyonyourtoesbro"];
    level.battlechatter.eventstrings["CTM_L"]["ask_found_anything"] = [0:"s_aqhr_haveyoufoundanything", 1:"s_aqhr_whathaveyoufound", 2:"s_aqhr_whathaveyougot", 3:"s_aqhr_reportin", 4:"s_aqhr_givemesomething", 5:"s_aqhr_tellmeyouhavesomethi"];
    level.battlechatter.eventstrings["CTM_L"]["hunt_report_alert"] = [0:"s_aqhr_anenemyisintheareahu", 1:"s_aqhr_wehaveanenemyinsidet", 2:"s_aqhr_guystheresanenemyint", 3:"s_aqlo_spreadoutfindthem_01", 4:"s_aqlo_searchtheareafindthe_01", 5:"s_aqlo_spreadoutsearchthear_01"];
    level.battlechatter.eventstrings["CTM_L"]["order_continue_search"] = [0:"s_aqho_continuesweeping", 1:"s_aqho_keepsearchingthearea", 2:"s_aqho_searchtheareauntilyo"];
    level.battlechatter.eventstrings["CTM_L"]["order_stay_alert"] = [0:"s_aqho_stayalert", 1:"s_aqho_keepyoureyesopen", 2:"s_aqho_stayfocused"];
    level.battlechatter.eventstrings["CTM_L"]["order_stay_aware"] = [0:"s_aqho_guardyourselfman", 1:"s_aqho_donotunderestimateth", 2:"s_aqho_keepyourguardup"];
    level.battlechatter.eventstrings["CTM_L"]["ask_how_copy"] = [0:"s_idcm_doyouhearmedude", 1:"s_idcm_comein", 2:"s_idcm_thisiscentral"];
    level.battlechatter.eventstrings["CTM_L"]["inv_no_response"] = [0:"s_iinr_hesnotrespondingonra", 1:"s_iinr_icantreachhim", 2:"s_iinr_hesnotansweringhisra", 3:"s_iinr_hesnotresponding"];
    level.battlechatter.eventstrings["CTM_L"]["order_get_visual"] = [0:"s_iinr_canyougocheckitout", 1:"s_iinr_checkitoutmakesureno", 2:"s_iinr_seeifyoucanfindhimok", 3:"s_iinr_ineedyoucheckitout"];
    level.battlechatter.eventstrings["CTM_L"]["inv_patrol_noresp"] = [0:"s_iinr_patrolisntresponding", 1:"s_iinr_patroldidntcheckin", 2:"s_iinr_patrolisntansweringo", 3:"s_iinr_icantreachpatrol"];
    level.battlechatter.eventstrings["CTM_L"]["report_alert"] = [0:"s_airp_guyswemayhavecompany", 1:"s_airp_allteamswemayhaveasi", 2:"s_airp_everyonetightenupwem", 3:"s_airp_guyskeepyoureyesopen"];
    level.battlechatter.eventstrings["CTM_L"]["warn_reply"] = [0:"s_wrpl_iftheyshowupagainsho", 1:"s_wrpl_ifyouseethemagainope", 2:"s_wrpl_iftheyreturnjustkill"];
    level.battlechatter.eventstrings["CTM_L"]["report_target_location"] = [0:"s_chrp_givemeanupdatedoesan", 1:"s_chrp_talktomeguyswhatsthe", 2:"s_chrp_starttalkingguysiwan", 3:"s_chrp_reportinguyswhereare"];
    level.battlechatter.eventstrings["CTM_L"]["report_idle"] = [0:"s_irpr_status", 1:"s_irpr_report", 2:"s_irpr_anythingtoreport", 3:"s_irpr_gotanything", 4:"s_irpr_checkin"];
    level.battlechatter.eventstrings["CTM_L"]["ally_missing_multi"] = [0:"s_alms_multipleteamsarentre", 1:"s_alms_anothergroupisntresp", 2:"s_alms_wevelostcontactwitha", 3:"s_alms_anotherteamfailedtor"];
    level.battlechatter.eventstrings["CTM_L"]["order_search_start"] = [0:"s_aior_searchthearea_01", 1:"s_aior_searcharound_01", 2:"s_aior_sweeptheperimeter_01"];
    level.battlechatter.eventstrings["CTM_L"]["order_report_back"] = [0:"s_aior_reportwhatyoufind", 1:"s_aior_radioifyoufindanythi", 2:"s_aior_reportbackifyoufinds"];
    level.battlechatter.eventstrings["CTM_L"]["hunt_patrol_noresp"] = [0:"s_hpnr_patrolisntresponding", 1:"s_hpnr_patroldidntcheckin", 2:"s_hpnr_patrolisntansweringo", 3:"s_hpnr_icantreachpatrol"];
    level.battlechatter.eventstrings["CFS"]["left"] = [0:"c_posn_leftside", 1:"c_posn_left", 2:"c_posn_checkleft", 3:"c_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["CFS"]["right"] = [0:"c_posn_rightside", 1:"c_posn_theyreflankingright", 2:"c_posn_right", 3:"c_posn_checkright"];
    level.battlechatter.eventstrings["CFS"]["ahead"] = [0:"c_posn_straightahead", 1:"c_posn_rightinfrontofus", 2:"c_posn_aheadofus", 3:"c_posn_front", 4:"c_posn_deadahead"];
    level.battlechatter.eventstrings["CFS"]["behind"] = [0:"c_posn_behindus", 1:"c_posn_onoursix", 2:"c_posn_checkrear", 3:"c_posn_rear"];
    level.battlechatter.eventstrings["CFS"]["high"] = [0:"c_posn_uptop", 1:"c_posn_checkhigh", 2:"c_posn_coverup"];
    level.battlechatter.eventstrings["CFS"]["using_rpg"] = [0:"c_atac_rocket", 1:"c_atac_rocket_01"];
    level.battlechatter.eventstrings["CFS"]["attacking"] = [0:"c_atac_goinghot", 1:"c_atac_engaging", 2:"c_atac_openinup"];
    level.battlechatter.eventstrings["CFS"]["using_smoke"] = [0:"c_atac_throwingsmoke", 1:"c_atac_smokeout"];
    level.battlechatter.eventstrings["CFS"]["using_flash"] = [0:"c_atac_flashbangout", 1:"c_atac_throwingflashbang"];
    level.battlechatter.eventstrings["CFS"]["using_grenade"] = [0:"c_atac_fragout", 1:"c_atac_throwingafrag"];
    level.battlechatter.eventstrings["CFS"]["using_molotov"] = [0:"c_atac_throwingmolotov", 1:"c_atac_molotovout"];
    level.battlechatter.eventstrings["CFS"]["use_flash"] = [0:"c_ator_useaflashbang", 1:"c_ator_throwaflashbang", 2:"c_ator_tossaflashbang"];
    level.battlechatter.eventstrings["CFS"]["use_grenade"] = [0:"c_ator_useagrenade", 1:"c_ator_throwafrag", 2:"c_ator_tossafrag"];
    level.battlechatter.eventstrings["CFS"]["use_molotov"] = [0:"c_ator_throwamolotov", 1:"c_ator_useamolotov", 2:"c_ator_tossamolotov"];
    level.battlechatter.eventstrings["CFS"]["use_rpg"] = [0:"c_ator_hitemwitharocket", 1:"c_ator_usearocket", 2:"c_ator_rocket"];
    level.battlechatter.eventstrings["CFS"]["order_attack"] = [0:"c_ator_engage", 1:"c_ator_giveemsome", 2:"c_ator_dumpem", 3:"c_ator_gohot", 4:"c_ator_youreclearedhot", 5:"c_ator_fuckinshootem", 6:"c_ator_startsmokinem"];
    level.battlechatter.eventstrings["CFS"]["movingup"] = [0:"c_tcac_impushingup", 1:"c_tcac_pushingforward", 2:"c_tcac_movingup", 3:"c_tcac_pushinup"];
    level.battlechatter.eventstrings["CFS"]["getting_cover"] = [0:"c_tcac_covercover", 1:"c_tcac_takingcover", 2:"c_tcac_movingtocover"];
    level.battlechatter.eventstrings["CFS"]["reloading"] = [0:"c_tcac_reloading", 1:"c_tcac_changingmags"];
    level.battlechatter.eventstrings["CFS"]["enemy_using_flash"] = [0:"c_eata_flashincoming", 1:"c_eata_flashgrenade", 2:"c_eata_flash", 3:"c_eata_flashgrenade_01"];
    level.battlechatter.eventstrings["CFS"]["enemy_using_grenade"] = [0:"c_eata_grenade", 1:"c_eata_grenadewatchout", 2:"c_eata_grenadeincoming"];
    level.battlechatter.eventstrings["CFS"]["enemy_using_molotov"] = [0:"c_eata_molotov", 1:"c_eata_molotovincoming", 2:"c_eata_molotov_01"];
    level.battlechatter.eventstrings["CFS"]["enemy_using_rpg"] = [0:"c_eata_rpg", 1:"c_eata_rpgincoming", 2:"c_eata_rpggetdown"];
    level.battlechatter.eventstrings["CFS"]["enemy_attacking"] = [0:"c_eata_takingfire", 1:"c_eata_contact", 2:"c_eata_shadowsincontact"];
    level.battlechatter.eventstrings["CFS"]["enemy_moving_up"] = [0:"c_etca_onespushing", 1:"c_etca_gotonemovingup", 2:"c_etca_onesmovingup"];
    level.battlechatter.eventstrings["CFS"]["enemy_getting_cover"] = [0:"c_etca_novisualontarget", 1:"c_etca_gotonetakingcover", 2:"c_etca_onesmovingtocover", 3:"c_etca_novisualontarget_01"];
    level.battlechatter.eventstrings["CFS"]["enemy_reloading"] = [0:"c_etca_onesreloading", 1:"c_etca_onesreloading_01", 2:"c_etca_oneschangingmags"];
    level.battlechatter.eventstrings["CFS"]["enemy_flanking_left"] = [0:"c_etca_onesmovingleft", 1:"c_etca_leftflank", 2:"c_etca_guardleft"];
    level.battlechatter.eventstrings["CFS"]["enemy_flanking_right"] = [0:"c_etca_guardright", 1:"c_etca_rightflank", 2:"c_etca_onesmovingright"];
    level.battlechatter.eventstrings["CFS"]["enemy_moving"] = [0:"c_etca_onesmovin", 1:"c_etca_thatonesmoving", 2:"c_etca_gotonemoving"];
    level.battlechatter.eventstrings["CFS"]["target_getting_cover"] = [0:"c_ttca_theyremovingtocover", 1:"c_ttca_theyregoingforcover", 2:"c_ttca_theyretakingcover"];
    level.battlechatter.eventstrings["CFS"]["target_reloading"] = [0:"c_ttca_theyrereloading", 1:"c_ttca_theyrereloading_01", 2:"c_ttca_thebastardsreloading"];
    level.battlechatter.eventstrings["CFS"]["target_moving"] = [0:"c_ttca_theyremoving", 1:"c_ttca_hesmoving", 2:"c_ttca_hesrunning"];
    level.battlechatter.eventstrings["CFS"]["target_moving_up"] = [0:"c_ttca_theyremovingup", 1:"c_ttca_hescominguponyou", 2:"c_ttca_hesmovingup"];
    level.battlechatter.eventstrings["CFS"]["target_near_patrol"] = [0:"c_ttca_theyreswimmingnearth", 1:"c_ttca_theyreswimmingyourwa", 2:"c_ttca_interceptthem"];
    level.battlechatter.eventstrings["CFS"]["enemy_soldier"] = [0:"c_enmy_visualonatarget", 1:"c_enmy_targetspotted", 2:"c_enmy_gotatarget"];
    level.battlechatter.eventstrings["CFS"]["enemy_soldiers"] = [0:"c_enmy_targets", 1:"c_enmy_xrays", 2:"c_enmy_hostiles"];
    level.battlechatter.eventstrings["CFS"]["neg_target"] = [0:"c_aqen_idontseeem", 1:"c_aqen_novisual", 2:"c_aqen_cantseehim", 3:"c_aqen_wherethefuckishe"];
    level.battlechatter.eventstrings["CFS"]["aquired_target"] = [0:"c_aqen_gotavisual", 1:"c_aqen_targetacquired", 2:"c_aqen_iseeem", 3:"c_aqen_theyrerightthere"];
    level.battlechatter.eventstrings["CFS"]["enemy_exposed"] = [0:"c_exco_onesintheopen", 1:"c_exco_onesintheopen_01", 2:"c_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["CFS"]["target_exposed"] = [0:"c_exco_theyreintheopen", 1:"c_exco_thatonesintheopen", 2:"c_exco_theyreintheopen_01"];
    level.battlechatter.eventstrings["CFS"]["youre_exposed"] = [0:"c_exco_findcover"];
    level.battlechatter.eventstrings["CFS"]["target_covered"] = [0:"c_exco_theyrebehindcover", 1:"c_exco_theyvegotcover", 2:"c_exco_theyretakingcover"];
    level.battlechatter.eventstrings["CFS"]["killfirm_enemy"] = [0:"c_firm_gotone", 1:"c_firm_hostiledown", 2:"c_firm_xraydown"];
    level.battlechatter.eventstrings["CFS"]["killfirm_target"] = [0:"c_firm_theyredone", 1:"c_firm_theyredown", 2:"c_firm_sortedem"];
    level.battlechatter.eventstrings["CFS"]["casualties"] = [0:"c_casu_weretakingheavies", 1:"c_casu_weregettingourassesk", 2:"c_casu_werelosingshooters", 3:"c_casu_weretakingcasualties"];
    level.battlechatter.eventstrings["CFS"]["copy"] = [0:"c_conf_copy", 1:"c_conf_check", 2:"c_conf_copythat", 3:"c_conf_goodcopy", 4:"c_conf_solidcopy", 5:"c_aqcp_copy", 6:"c_aqcp_solidcopy"];
    level.battlechatter.eventstrings["CFS"]["praise"] = [0:"c_pras_hellyeah", 1:"c_pras_niceonemate", 2:"c_pras_fuckina", 3:"c_pras_yeah", 4:"c_pras_thatlldo"];
    level.battlechatter.eventstrings["CFS"]["low_ammo"] = [0:"c_stat_ineedamag", 1:"c_stat_lowonammo", 2:"c_stat_lastmag", 3:"c_stat_needammo", 4:"c_stat_imwinchester"];
    level.battlechatter.eventstrings["CFS"]["wounded"] = [0:"c_stat_imhit", 1:"c_stat_imshot", 2:"c_stat_medic"];
    level.battlechatter.eventstrings["CFS"]["ask_wounded"] = [0:"c_stat_yougood", 1:"c_stat_youwounded", 2:"c_stat_youhit"];
    level.battlechatter.eventstrings["CFS"]["ask_low_ammo"] = [0:"c_stat_howsyourammo", 1:"c_stat_checkyourammo", 2:"c_stat_whatsyourroundcount"];
    level.battlechatter.eventstrings["CFS"]["ask_status"] = [0:"c_stat_youokay", 1:"c_stat_whatsyourstatus", 2:"c_stat_status"];
    level.battlechatter.eventstrings["CFS"]["reply_wounded"] = [0:"c_stat_itookaround", 1:"c_stat_imgood", 2:"c_stat_yeahroundhittheplate"];
    level.battlechatter.eventstrings["CFS"]["reply_low_ammo"] = [0:"c_stat_runninglow", 1:"c_stat_imlow", 2:"c_stat_almostout"];
    level.battlechatter.eventstrings["CFS"]["reply_okay"] = [0:"c_stat_imsolid", 1:"c_stat_goodtogo", 2:"c_stat_goodhere"];
    level.battlechatter.eventstrings["CFS"]["wounded_enemy"] = [0:"c_aens_igothim", 1:"c_aens_clippedhim", 2:"c_aens_hitone"];
    level.battlechatter.eventstrings["CFS"]["ask_target_loc"] = [0:"c_tast_wheresheat", 1:"c_tast_doesanyonehaveavisua", 2:"c_tast_wherethefuckretheyat"];
    level.battlechatter.eventstrings["CFS"]["ask_target_wounded"] = [0:"c_tast_yougethim", 1:"c_tast_youhithim", 2:"c_tast_youdrophim"];
    level.battlechatter.eventstrings["CFS"]["target_wounded"] = [0:"c_tast_heshit", 1:"c_tast_heswounded", 2:"c_tast_hesbleeding"];
    level.battlechatter.eventstrings["CFS"]["target_unhurt"] = [0:"c_tast_hegotaway", 1:"c_tast_heranoff", 2:"c_tast_hesfallingback"];
    level.battlechatter.eventstrings["CFS"]["wounded_target"] = [0:"c_atas_woundedhim", 1:"c_atas_ihithim", 2:"c_atas_itaggedem"];
    level.battlechatter.eventstrings["CFS"]["enemy_shotgun"] = [0:"c_enws_shotgunwatchout", 1:"c_enws_onesgotashotgun", 2:"c_enws_shotgun"];
    level.battlechatter.eventstrings["CFS"]["enemy_sniper"] = [0:"c_enws_thatsasniper", 1:"c_enws_sniper", 2:"c_enws_enemysniper"];
    level.battlechatter.eventstrings["CFS"]["enemy_lmg"] = [0:"c_enws_enemymachinegunner", 1:"c_enws_lmg", 2:"c_enws_machinegun"];
    level.battlechatter.eventstrings["CFS"]["target_lmg"] = [0:"c_taws_theyreusingamachineg", 1:"c_taws_hesgotamachinegun", 2:"c_taws_machinegunner"];
    level.battlechatter.eventstrings["CFS"]["target_shotgun"] = [0:"c_taws_theyvegotashotgun", 1:"c_taws_hesgotashotgun"];
    level.battlechatter.eventstrings["CFS"]["target_sniper"] = [0:"c_taws_hessnipingus", 1:"c_taws_hesasniper"];
    level.battlechatter.eventstrings["CFS"]["checkfire"] = [0:"c_chck_checkyourfire", 1:"c_chck_watchyourfire", 2:"c_chck_blueblue", 3:"c_chck_checkfirecheckfire"];
    level.battlechatter.eventstrings["CFS"]["move"] = [0:"c_tcor_move", 1:"c_tcor_igotyoumove", 2:"c_tcor_startmoving", 3:"c_tcor_go"];
    level.battlechatter.eventstrings["CFS"]["moveup"] = [0:"c_tcor_moveup", 1:"c_tcor_moveupgo", 2:"c_tcor_pushup", 3:"c_tcor_getupthere", 4:"c_tcor_pushforward"];
    level.battlechatter.eventstrings["CFS"]["coverme"] = [0:"c_tcor_coverme", 1:"c_tcor_ineedcoverfire", 2:"c_tcor_coverme_01"];
    level.battlechatter.eventstrings["CFS"]["casualty"] = [0:"c_canm_wegotacasualty", 1:"c_canm_mandown", 2:"c_canm_wehaveamandown", 3:"c_canm_wevegotwounded", 4:"c_canm_wevegotasoldierdown"];
    level.battlechatter.eventstrings["CFS"]["suppressing"] = [0:"c_aqsp_suppressingfirefallb", 1:"c_aqsp_suppressingfire", 2:"c_aqsp_imcoveringyou", 3:"c_aqsp_coveringfire"];
    level.battlechatter.eventstrings["CFS"]["reply_hear_you"] = [0:"s_idrp_sendtraffic", 1:"s_idrp_copygoahead", 2:"s_idrp_imhere", 3:"s_idrp_goahead"];
    level.battlechatter.eventstrings["CFS"]["resp_patrol"] = [0:"s_idrp_thisisthresher", 1:"s_ahrp_thisisthresher"];
    level.battlechatter.eventstrings["CFS"]["muttered_confusion"] = [0:"s_idin_whatsthat", 1:"s_idin_whatthehellwasthat", 2:"s_idin_thebleedinhellwastha", 3:"s_idin_whatthehell"];
    level.battlechatter.eventstrings["CFS"]["inv_arrive"] = [0:"s_idin_huhwhatwasthat", 1:"s_idin_hmphokay", 2:"s_idin_hmm", 3:"s_idin_huhthehell", 4:"s_idin_hrm"];
    level.battlechatter.eventstrings["CFS"]["investigating"] = [0:"s_idin_illgocheck", 1:"s_idin_illcheckitout", 2:"s_idin_illseewhatsup"];
    level.battlechatter.eventstrings["CFS"]["react_found_corpse"] = [0:"s_alrc_wehaveasoldierdown", 1:"s_alrc_oneofoursiskia", 2:"s_alrc_gotamandown", 3:"s_alrc_wevegotacasualty"];
    level.battlechatter.eventstrings["CFS"]["ask_corpse_name"] = [0:"s_alrc_whodidwelose", 1:"s_alrc_who", 2:"s_alrc_whoisit"];
    level.battlechatter.eventstrings["CFS"]["need_backup"] = [0:"s_alrc_sendreinforcements", 1:"s_alrc_ineedreinforcements", 2:"s_albc_sendreinforcements"];
    level.battlechatter.eventstrings["CFS"]["hunt_copy"] = [0:"s_hnrs_copy", 1:"s_hnrs_rogerthat", 2:"s_hnrs_copythat"];
    level.battlechatter.eventstrings["CFS"]["react_whizby"] = [0:"s_unrc_imtakingfire", 1:"s_unrc_imgettingshotat", 2:"s_unrc_takineffectivefire", 3:"s_unrc_someonesshootinatme", 4:"s_unrc_thatsclose"];
    level.battlechatter.eventstrings["CFS"]["react_unaware"] = [0:"s_unrc_takingcontact", 1:"s_unrc_takingindirectfire", 2:"s_unrc_contactcontact"];
    level.battlechatter.eventstrings["CFS"]["over_there"] = [0:"s_hnfn_overthere", 1:"s_hnfn_theyreoverthere", 2:"s_hnfn_rightthere"];
    level.battlechatter.eventstrings["CFS"]["surprise"] = [0:"s_hurc_surprisedeffort", 1:"s_hurc_surprisedeffort_01", 2:"s_hurc_surprisedeffort_02", 3:"s_hurc_bollocks", 4:"s_hurc_ohshit"];
    level.battlechatter.eventstrings["CFS"]["report_reply_idle"] = [0:"s_idrr_gotnothing", 1:"s_idrr_secure", 2:"s_idrr_clearhere", 3:"s_idrr_allclear", 4:"s_idrr_goodhere", 5:"s_idrr_allquiet", 6:"s_idrr_areassecure"];
    level.battlechatter.eventstrings["CFS"]["react_first"] = [0:"s_idrc_huh", 1:"s_idrc_hmph", 2:"s_idrc_hrm", 3:"s_idrc_eh", 4:"s_idrc_hm", 5:"s_idrc_wha"];
    level.battlechatter.eventstrings["CFS"]["react_second"] = [0:"s_idrc_yourebloodyjokingwha", 1:"s_idrc_thebloodyhellisgoing", 2:"s_idrc_whatthehellisthat"];
    level.battlechatter.eventstrings["CFS"]["react_multi"] = [0:"s_idrm_whosoutthere", 1:"s_idrm_okaywhatthefuck", 2:"s_idrm_whatisthisshit"];
    level.battlechatter.eventstrings["CFS"]["react_interrupt"] = [0:"s_idli_missedyourlastover", 1:"s_idli_yougood", 2:"s_idli_sayagainover"];
    level.battlechatter.eventstrings["CFS"]["react_noreply"] = [0:"s_idli_doyoureadme", 1:"s_idli_youcopy", 2:"s_idli_youreceivingme"];
    level.battlechatter.eventstrings["CFS"]["order_investigate"] = [0:"s_idio_gocheckit", 1:"s_idio_checkitout", 2:"s_idio_gocheckthatout"];
    level.battlechatter.eventstrings["CFS"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["CFS"]["inv_ask_first"] = [0:"s_idia_whatwasit", 1:"s_idia_findanything", 2:"s_idia_seeanything", 3:"s_idia_yougotanything", 4:"s_idia_whatdyoufind"];
    level.battlechatter.eventstrings["CFS"]["inv_ask_second"] = [0:"s_idia_stillnothing", 1:"s_idia_anythingthistime", 2:"s_idia_whatwasitthistime", 3:"s_idia_findanythingthistime", 4:"s_idia_stilldidntfindanythi"];
    level.battlechatter.eventstrings["CFS"]["resp_sound_first"] = [0:"s_idir_nothingnovisual", 1:"s_idir_nahweresecure", 2:"s_idir_negativewereclear", 3:"s_idir_nothingnobody"];
    level.battlechatter.eventstrings["CFS"]["order_check_together"] = [0:"s_idit_letsgocheckitout", 1:"s_idit_letscheckitwatchmyba", 2:"s_idit_letsgocheckcoverme"];
    level.battlechatter.eventstrings["CFS"]["covering_investigate"] = [0:"s_idit_covering", 1:"s_idit_imwithyou", 2:"s_idit_gotyoucovered"];
    level.battlechatter.eventstrings["CFS"]["team_return_idle"] = [0:"s_idid_okayletsheadback", 1:"s_idid_weregoodhereletsgetb", 2:"s_idid_backtoourpostsletsgo"];
    level.battlechatter.eventstrings["CFS"]["ask_heard_that"] = [0:"s_alre_youhearthat", 1:"s_alre_youheardthattoo", 2:"s_alre_youheardthatright"];
    level.battlechatter.eventstrings["CFS"]["ask_saw_that"] = [0:"s_alre_didyouseethat", 1:"s_alre_yougeteyesonthat", 2:"s_alre_youcatchthat"];
    level.battlechatter.eventstrings["CFS"]["have_something"] = [0:"s_alre_imighthavesomething", 1:"s_alre_ithinkihavesomething", 2:"s_alre_igotapossiblethreat"];
    level.battlechatter.eventstrings["CFS"]["heard_something"] = [0:"s_alre_iheardsomething", 1:"s_alre_heardsomethingnearme", 2:"s_alre_iheardanoise"];
    level.battlechatter.eventstrings["CFS"]["saw_something"] = [0:"s_alre_isawsomething", 1:"s_alre_thoughtisawsomething", 2:"s_alre_ithinksomeonesnearme"];
    level.battlechatter.eventstrings["CFS"]["react_resp"] = [0:"s_alrr_yeah", 1:"s_alrr_afirm", 2:"s_alrr_yeahrogerthat"];
    level.battlechatter.eventstrings["CFS"]["alert_ask"] = [0:"s_alia_seeanything", 1:"s_alia_yougotsomething", 2:"s_alia_anything", 3:"s_alia_gotanything"];
    level.battlechatter.eventstrings["CFS"]["alert_patrol"] = [0:"s_alip_illpullsecurityheret", 1:"s_alip_illsecuretheareakeep", 2:"s_alip_headbackillpullsecur", 3:"s_alip_ivegotthisareagetbac"];
    level.battlechatter.eventstrings["CFS"]["report_reply_search"] = [0:"s_alir_negativenothingyet", 1:"s_alir_nothingfornow", 2:"s_alir_negativegotnothing", 3:"s_alir_notseeinganything", 4:"s_alir_sofarsogood", 5:"s_alir_igotnothingyet", 6:"s_alir_goodsofar", 7:"s_alir_nothing", 8:"s_alir_nothingsofar", 9:"s_alir_weregoodfornow", 10:"s_alir_itsclearsofar"];
    level.battlechatter.eventstrings["CFS"]["warn_report"] = [0:"s_wrnr_hadanunknowninsideth", 1:"s_wrnr_hadanunknowninsideth_01", 2:"s_wrnr_anunknownwasintheare"];
    level.battlechatter.eventstrings["CFS"]["warn_spotted"] = [0:"s_wrnf_heygetthefuckback", 1:"s_wrnf_heyyougetthefuckoutt", 2:"s_wrnf_getbackgetbackrightn"];
    level.battlechatter.eventstrings["CFS"]["warn_conv"] = [0:"s_wrni_scaredthehelloutofem", 1:"s_wrni_probablyshittingthem", 2:"s_wrni_whatthehellweretheyd", 3:"s_wrni_whatthefuckweretheyt"];
    level.battlechatter.eventstrings["CFS"]["warn_conv_reply"] = [0:"s_wrir_almostgotthemselvesk", 1:"s_wrir_iwasreadytodumpthatm", 2:"s_wrir_luckytheydidntcatcha"];
    level.battlechatter.eventstrings["CFS"]["warn_attack"] = [0:"s_wrnk_heyiwarnedyou", 1:"s_wrnk_youwerewarned", 2:"s_wrnk_heyyoujustfuckedup"];
    level.battlechatter.eventstrings["CFS"]["ask_enemy_loc"] = [0:"s_unwl_wheredthatcomefrom", 1:"s_unwl_whereditcomefrom", 2:"s_unwl_wherethehellarethey"];
    level.battlechatter.eventstrings["CFS"]["enemy_loc_resp"] = [0:"s_unrs_idontknowbutthatwasa", 1:"s_unrs_ididntseeem", 2:"s_unrs_idontbloodyknow", 3:"s_unrs_novisualdidntseeem"];
    level.battlechatter.eventstrings["CFS"]["react_first_combat"] = [0:"s_awrr_contact", 1:"s_awrr_enemymyposition", 2:"s_awrr_enemy", 3:"s_awrr_enemyshere", 4:"s_awrr_gotenemyhere", 5:"s_awrr_enemysclose", 6:"s_awrr_troopsincontact"];
    level.battlechatter.eventstrings["CFS"]["report_target_water"] = [0:"s_awrr_targetsinthewater", 1:"s_awrr_gotavisualtheyreinth", 2:"s_awrr_iseeeminthewater", 3:"s_awrr_inthewaterinthewater", 4:"s_awrr_enemyinthewater", 5:"s_awrr_theyremovinginthewat", 6:"s_awrr_heytheyreinthewater"];
    level.battlechatter.eventstrings["CFS"]["at_my_location"] = [0:"s_awrr_righthere", 1:"s_awrr_onmeonme", 2:"s_awrr_myposition", 3:"s_awrr_righthererighthere", 4:"s_awrr_onme", 5:"s_awrr_theyrerighthere", 6:"s_awrr_overhere", 7:"s_awrr_theyreoverhere"];
    level.battlechatter.eventstrings["CFS"]["found_target"] = [0:"s_awrr_gotem", 1:"s_awrr_iseeem", 2:"s_awrr_foundem", 3:"s_awrr_hey", 4:"s_awrr_visual", 5:"s_awrr_targetspotted"];
    level.battlechatter.eventstrings["CFS"]["found_you"] = [0:"s_awrr_iseeyoubastard", 1:"s_awrr_foundyou", 2:"s_awrr_igotyou", 3:"s_awrr_gotyou", 4:"s_awrr_ifoundyou"];
    level.battlechatter.eventstrings["CFS"]["order_check_last"] = [0:"s_advo_moveonemgo", 1:"s_advo_forceuponemgo", 2:"s_advo_pushtheirpositiongo"];
    level.battlechatter.eventstrings["CFS"]["lost_target"] = [0:"s_lkpl_frustratedgrunttheyr", 1:"s_lkpl_frustratedgrunttheyr_01", 2:"s_lkpl_frustratedgruntnovis", 3:"s_lkpl_frustratedgrunttheyg"];
    level.battlechatter.eventstrings["CFS"]["lost_target_water"] = [0:"s_lkpw_theywentunderwater", 1:"s_lkpw_theyreinthewater", 2:"s_lkpw_theyjumpedinthewater", 3:"s_lkpw_targetsinthewater"];
    level.battlechatter.eventstrings["CFS"]["ask_target_location"] = [0:"s_lklr_gotavisual", 1:"s_lklr_youseeem", 2:"s_lklr_whatstheirlocation", 3:"s_lklr_wherearethey", 4:"s_lklr_wherethefuckarethey", 5:"s_lklr_getmealocation"];
    level.battlechatter.eventstrings["CFS"]["target_still_close"] = [0:"s_lkpc_theywerehere", 1:"s_lkpc_theywererighthere", 2:"s_lkpc_theycantbefar", 3:"s_lkpc_theyreclose", 4:"s_lkpc_theyrehiding", 5:"s_lkpc_theygottabeclose", 6:"s_lkpc_theydidntmakeitfar", 7:"s_lkpc_theyrestillheresomew"];
    level.battlechatter.eventstrings["CFS"]["clearing_east"] = [0:"s_cmhs_checkingeast", 1:"s_cmhs_securingeast", 2:"s_cmhs_movingeast"];
    level.battlechatter.eventstrings["CFS"]["clearing_west"] = [0:"s_cmhs_checkingwest", 1:"s_cmhs_securingwest", 2:"s_cmhs_movingwest"];
    level.battlechatter.eventstrings["CFS"]["clearing_south"] = [0:"s_cmhs_securingsouth", 1:"s_cmhs_movingsouth", 2:"s_cmhs_checkingsouth"];
    level.battlechatter.eventstrings["CFS"]["clearing_north"] = [0:"s_cmhs_securingnorth", 1:"s_cmhs_movingnorth", 2:"s_cmhs_checkingnorth"];
    level.battlechatter.eventstrings["CFS"]["good_hunting"] = [0:"s_hnts_staysharp", 1:"s_hnts_stayfrosty", 2:"s_hnts_keepittight"];
    level.battlechatter.eventstrings["CFS"]["moving_there"] = [0:"s_hntm_movingnow", 1:"s_hntm_moving", 2:"s_hntm_movingtherenow", 3:"c_tcac_moving", 4:"c_tcac_immoving", 5:"c_tcac_heyimmoving"];
    level.battlechatter.eventstrings["CFS"]["moving_alone"] = [0:"s_hntm_iminbound", 1:"s_hntm_immoving", 2:"s_hntm_immovingnow"];
    level.battlechatter.eventstrings["CFS"]["ask_found_anything"] = [0:"s_aqhr_gotanything", 1:"s_aqhr_findanything", 2:"s_aqhr_gotavisual", 3:"s_aqhr_anyvisual", 4:"s_aqhr_whatdoyougot", 5:"s_aqhr_yougotsomething"];
    level.battlechatter.eventstrings["CFS"]["reply_found_nothing"] = [0:"s_aqhr_novisualonthetarget", 1:"s_aqhr_nosignofem", 2:"s_aqhr_novisual"];
    level.battlechatter.eventstrings["CFS"]["report_investigating"] = [0:"s_aqhr_immovingin", 1:"s_aqhr_imcheckingitout", 2:"s_aqhr_movingtosecure"];
    level.battlechatter.eventstrings["CFS"]["area_clear"] = [0:"s_aqhr_thisareassecure", 1:"s_aqhr_securehere", 2:"s_aqhr_areasecure"];
    level.battlechatter.eventstrings["CFS"]["order_dir"] = [0:"s_aqhs_securethatarea", 1:"s_aqhs_checkthatway", 2:"s_aqhs_cordonthatarea", 3:"s_aqhs_clearthatarea"];
    level.battlechatter.eventstrings["CFS"]["order_dir_resp"] = [0:"s_aqhs_illsearchthisway", 1:"s_aqhs_illcheckoverhere", 2:"s_aqhs_illtakethisway", 3:"s_aqhs_illsecurethisarea"];
    level.battlechatter.eventstrings["CFS"]["hunt"] = [0:"s_aqhb_wherethefuckareyou", 1:"s_aqhb_motherfuckers", 2:"s_aqhb_yourehidingiknowyour", 3:"s_aqhb_youreheresomewherear", 4:"s_aqhb_comeonout", 5:"s_aqhb_gonnafindyou", 6:"s_aqhb_wheredyoufuckinggo"];
    level.battlechatter.eventstrings["CFS"]["hunt_reactions"] = [0:"s_ahnr_surprisedinttenserea", 1:"s_ahnr_surprisedinttenserea_01", 2:"s_ahnr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["CFS"]["cmb_reactions"] = [0:"s_aqcr_surprisedinttenserea", 1:"s_aqcr_surprisedinttenserea_01", 2:"s_aqcr_surprisedinttenserea_02"];
    level.battlechatter.eventstrings["CFS"]["whizby_resp"] = [0:"s_aqal_itcamefromoverthere", 1:"s_aqal_itcamefromthatway", 2:"s_aqal_itwasfromoverthere"];
    level.battlechatter.eventstrings["CFS"]["hunt_cornercheck"] = [0:"s_aqho_checkyourcorners", 1:"s_aqho_checkthosecorners", 2:"s_aqho_checkcornersfindem"];
    level.battlechatter.eventstrings["CFS"]["hunt_order_hold"] = [0:"s_aqho_hold", 1:"s_aqho_standfast", 2:"s_aqho_holdup"];
    level.battlechatter.eventstrings["CFS"]["alert_search_orders"] = [0:"s_aqao_searchoverthere", 1:"s_aqao_checkoverthere", 2:"s_aqao_gothatway", 3:"s_aqao_checkthatway", 4:"s_aqao_securethatarea", 5:"s_aqao_searchthatway"];
    level.battlechatter.eventstrings["CFS"]["hunt_report_alert"] = [0:"s_aqlo_cordonandsearchthear", 1:"s_aqlo_fanoutsearchthearea", 2:"s_aqlo_cordonofftheareafind"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"] = [];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][0] = [0:"s_idsl_alqatalatakesoveralm", 1:"s_idsl_devgruandkortacmovei", 2:"s_idsl_alongcomeswhitelotus", 3:"s_idsl_blackmous", 4:"s_idsl_legionwellweknowwhat", 5:"s_idsl_thencrowngetsinvolve", 6:"s_idsl_soaqbringinthecartel", 7:"s_idsl_cartelsetsupshop", 8:"s_idsl_thosecowboysfollowem", 9:"s_idsl_andnowyouhavethispha", 10:"s_idsl_somewouldcallthatapr", 11:"s_idsl_icallitatargetrichen"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][1] = [0:"s_idsl_sharpenup", 1:"s_idsl_complacencykills", 2:"s_idsl_youknowthemomentyoug", 3:"s_idsl_somelittlefuckerisgo", 4:"s_idsl_sostaysharp", 5:"s_idsl_dontletemgetthedropo", 6:"s_idsl_wellbedoneherebefore"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][2] = [0:"s_idsl_cartelandaq", 1:"s_idsl_neverthoughtidliketo", 2:"s_idsl_shouldhavejuststayed", 3:"s_idsl_orchosenothergroupst", 4:"s_idsl_morecapablegroups", 5:"s_idsl_bestsmugglersinthewo", 6:"s_idsl_iftheyweresmarttheyd", 7:"s_idsl_anyonewhoworkswithaq"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][3] = [0:"s_idsl_shouldnthavecomehere", 1:"s_idsl_theterrorists", 2:"s_idsl_thecartel", 3:"s_idsl_andalltherestofem", 4:"s_idsl_gonnaridthisplaceofy"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][4] = [0:"s_idsl_imapeacekeepingsoldi", 1:"s_idsl_imapeacekeepingsoldi_01", 2:"s_idsl_imapeacekeepingsoldi_02", 3:"s_idsl_imaviolentbastardand"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][5] = [0:"s_idsl_shouldntbemuchlonger", 1:"s_idsl_anotherhour", 2:"s_idsl_maybetwo", 3:"s_idsl_thenyoucangetsomeshu", 4:"s_idsl_orasmoke", 5:"s_idsl_justwatchyourcorners", 6:"s_idsl_dontgetsloppy"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][6] = [0:"s_idsl_hummingasong", 1:"s_idsl_hummingasong_01", 2:"s_idsl_hummingasong_02"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][7] = [0:"s_idsl_clear", 1:"s_idsl_justlikethelasttime", 2:"s_idsl_fiftypoundssaysitscl", 3:"s_idsl_gonnabearichmanbythe"];
    level.battlechatter.eventstrings["CFS"]["idle_solo"][8] = [0:"s_idsl_touchpointpull", 1:"s_idsl_drivetoeyeline", 2:"s_idsl_lockin", 3:"s_idsl_squeezetrigger", 4:"s_idsl_recoiltargetsdown", 5:"s_idsl_bobsyouruncle"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"] = [];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][0] = [0:"s_idcv_wherewereyoubeforeth", 1:"s_idcv_allover", 2:"s_idcv_everbeentourzikstan", 3:"s_idcv_yeahgotfamilythere", 4:"s_idcv_wellthatmakestwoofus", 5:"s_idcv_smallworldeh", 6:"s_idcv_toorightmate"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][1] = [0:"s_idcv_youseenanycartelarou", 1:"s_idcv_negative", 2:"s_idcv_youknowthebosselsinn", 3:"s_idcv_whataboutem", 4:"s_idcv_ihearitsawoman", 5:"s_idcv_okay", 6:"s_idcv_imjustsaying", 7:"s_idcv_yeahiknowwhatyouresa", 8:"s_idcv_dontreadintoitmateju", 9:"s_idcv_okaywithwhat", 10:"s_idcv_yknowengaging", 11:"s_idcv_youhavinalaugh", 12:"s_idcv_whenthetimecomesyouc", 13:"s_idcv_ifthetimecomesshellb"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][2] = [0:"s_idcv_queencapturesrookh8", 1:"s_idcv_rooktod3", 2:"s_idcv_queentoa8", 3:"s_idcv_pawnc3", 4:"s_idcv_queentoa4check", 5:"s_idcv_kingtoe1", 6:"s_idcv_pawntof4", 7:"s_idcv_sneakybastardpawntof", 8:"s_idcv_kingc1", 9:"s_idcv_rooktod2", 10:"s_idcv_queentoa7resign", 11:"s_idcv_pissoff"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][3] = [0:"s_idcv_interrogative", 1:"s_idcv_goahead", 2:"s_idcv_whydidthechickencros", 3:"s_idcv_fuckinhellwhy", 4:"s_idcv_togettotheidiotshous", 5:"s_idcv_whosthere", 6:"s_idcv_thechicken"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][4] = [0:"s_idcv_gotanything", 1:"s_idcv_negativeyou", 2:"s_idcv_nothing", 3:"s_idcv_letsgiveittenthenswe", 4:"s_idcv_wegotreconup", 5:"s_idcv_airassetshavebeentas", 6:"s_idcv_sowereourownrecongot"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][5] = [0:"s_idcv_latestintelshowsaqan", 1:"s_idcv_howmanyfighters", 2:"s_idcv_adozenmaybemore", 3:"s_idcv_wecanhandlethat", 4:"s_idcv_itsnotthemimconcerne", 5:"s_idcv_whothen", 6:"s_idcv_everyoneelse", 7:"s_idcv_yourenotgettingsofto", 8:"s_idcv_theresadifferencebet", 9:"s_idcv_justkeepyourweaponre", 10:"s_idcv_wecouldusereinforcem", 11:"s_idcv_mostofourassetsareti", 12:"s_idcv_yougoodonweaponsanda", 13:"s_idcv_toppedoffandrightasr", 14:"s_idcv_okayletsstaysharp"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][6] = [0:"s_idcv_clear", 1:"s_idcv_allclear", 2:"s_idcv_watchforgreensmoketh", 3:"s_idcv_copythat"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][7] = [0:"s_idcv_impullingrecceyester", 1:"s_idcv_aqorcartel", 2:"s_idcv_neithersotheyresetti", 3:"s_idcv_howfar", 4:"s_idcv_around800meterssothe", 5:"s_idcv_areconteam", 6:"s_idcv_negativeitwascivilia", 7:"s_idcv_noshitwhatdyoudo", 8:"s_idcv_whatihadtoiwatchedit", 9:"s_idcv_welldonttellmewhowon"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][8] = [0:"s_idcv_anysignofaqorcartel", 1:"s_idcv_heardsomethinggoingd", 2:"s_idcv_rogerthatmakesureyou", 3:"s_idcv_wayaheadofyou", 4:"s_idcv_letskeepaneyeonthata", 5:"s_idcv_copymaybewellseesome", 6:"s_idcv_anymovementandyoucal", 7:"s_idcv_solidcopy"];
    level.battlechatter.eventstrings["CFS"]["idle_conv"][9] = [0:"s_idcv_wehitanaqstrongholdl", 1:"s_idcv_anycasualties", 2:"s_idcv_noneitwasmint", 3:"s_idcv_actionableintel", 4:"s_idcv_unknownatthistime", 5:"s_idcv_maybeitcanleadustoth", 6:"s_idcv_lookedliketheyhadint", 7:"s_idcv_evenus", 8:"s_idcv_wellsee", 9:"s_idcv_soundslikeweneedtohi"];
    level.battlechatter.eventstrings["CFS_L"]["wait_target_surface"] = [0:"s_lkwr_whentheygoforairtake", 1:"s_lkwr_whentheycomeupyourec", 2:"s_lkwr_whentheycomeupforair", 3:"s_lkwr_waitforthemtocomeupt", 4:"s_lkwr_waitforthemtosurface", 5:"s_lkwr_theyllhavetosurfacew"];
    level.battlechatter.eventstrings["CFS_L"]["idle_name"] = [0:"s_idnm_king", 1:"s_idnm_adams", 2:"s_idnm_baker", 3:"s_idnm_barry", 4:"s_idnm_billy", 5:"s_idnm_chapman", 6:"s_idnm_colin", 7:"s_idnm_edwards", 8:"s_idnm_fisher", 9:"s_idnm_george", 10:"s_idnm_grant", 11:"s_idnm_hall", 12:"s_idnm_james", 13:"s_idnm_matthews", 14:"s_idnm_morgan", 15:"s_idnm_parker", 16:"s_idnm_richards", 17:"s_idnm_roberts", 18:"s_idnm_shaw", 19:"s_idnm_stevens", 20:"s_idnm_thomas", 21:"s_idnm_turner", 22:"s_idnm_williams"];
    level.battlechatter.eventstrings["CFS_L"]["reply_hear_you"] = [0:"s_idrp_rogergoahead", 1:"s_idrp_thisisactualgoahead", 2:"s_idrp_goahead", 3:"s_idrp_go", 4:"s_idrp_goforactual", 5:"s_idrp_thisisactual"];
    level.battlechatter.eventstrings["CFS_L"]["idle_conf_name"] = [0:"s_idcn_doyoucopy", 1:"s_idcn_king", 2:"s_idcn_adams", 3:"s_idcn_baker", 4:"s_idcn_barry", 5:"s_idcn_billy", 6:"s_idcn_chapman", 7:"s_idcn_colin", 8:"s_idcn_edwards", 9:"s_idcn_fisher", 10:"s_idcn_george", 11:"s_idcn_grant", 12:"s_idcn_hall", 13:"s_idcn_james", 14:"s_idcn_matthews", 15:"s_idcn_morgan", 16:"s_idcn_parker", 17:"s_idcn_richards", 18:"s_idcn_roberts", 19:"s_idcn_shaw", 20:"s_idcn_stevens", 21:"s_idcn_thomas", 22:"s_idcn_turner", 23:"s_idcn_williams"];
    level.battlechatter.eventstrings["CFS_L"]["hunt_name"] = [0:"s_hnnm_king", 1:"s_hnnm_adams", 2:"s_hnnm_baker", 3:"s_hnnm_barry", 4:"s_hnnm_billy", 5:"s_hnnm_chapman", 6:"s_hnnm_colin", 7:"s_hnnm_edwards", 8:"s_hnnm_fisher", 9:"s_hnnm_george", 10:"s_hnnm_grant", 11:"s_hnnm_hall", 12:"s_hnnm_james", 13:"s_hnnm_matthews", 14:"s_hnnm_morgan", 15:"s_hnnm_parker", 16:"s_hnnm_richards", 17:"s_hnnm_roberts", 18:"s_hnnm_shaw", 19:"s_hnnm_stevens", 20:"s_hnnm_thomas", 21:"s_hnnm_turner", 22:"s_hnnm_williams"];
    level.battlechatter.eventstrings["CFS_L"]["react_noreply"] = [0:"s_idli_areyoureceivingme", 1:"s_idli_doyoureadme", 2:"s_idli_doyoucopy"];
    level.battlechatter.eventstrings["CFS_L"]["react_interrupt"] = [0:"s_idli_missedyourlastsayaga", 1:"s_idli_commscheck", 2:"s_idli_sayagainyourlastover", 3:"s_idli_areyougood", 4:"s_idli_sayagainover", 5:"s_idli_missedyourlastover"];
    level.battlechatter.eventstrings["CFS_L"]["confirming"] = [0:"s_idlc_roger", 1:"s_idlc_copy", 2:"s_idlc_copythat"];
    level.battlechatter.eventstrings["CFS_L"]["alert_corpse_name"] = [0:"s_alcn_itsking", 1:"s_alcn_itsadams", 2:"s_alcn_itsbaker", 3:"s_alcn_itsbarry", 4:"s_alcn_itsbilly", 5:"s_alcn_itschapman", 6:"s_alcn_itscolin", 7:"s_alcn_itsedwards", 8:"s_alcn_itsfisher", 9:"s_alcn_itsgeorge", 10:"s_alcn_itsgrant", 11:"s_alcn_itshall", 12:"s_alcn_itsjames", 13:"s_alcn_itsmatthews", 14:"s_alcn_itsmorgan", 15:"s_alcn_itsparker", 16:"s_alcn_itsrichards", 17:"s_alcn_itsroberts", 18:"s_alcn_itsshaw", 19:"s_alcn_itsstevens", 20:"s_alcn_itsthomas", 21:"s_alcn_itsturner", 22:"s_alcn_itswilliams"];
    level.battlechatter.eventstrings["CFS_L"]["inv_patrol"] = [0:"s_alip_continueyourpatrolst", 1:"s_alip_getbacktoyourrouteke", 2:"s_alip_returntoyourpatrolke"];
    level.battlechatter.eventstrings["CFS_L"]["good_hunting"] = [0:"s_hnts_goodhunting", 1:"s_hnts_staysharpoutthere", 2:"s_hnts_out", 3:"s_aisg_copystaysharp"];
    level.battlechatter.eventstrings["CFS_L"]["ask_found_anything"] = [0:"s_aqhr_whatsyourstatus", 1:"s_aqhr_whatveyougot", 2:"s_aqhr_givemeasitrep", 3:"s_aqhr_sitrep", 4:"s_aqhr_didyoufindanything", 5:"s_aqhr_tellmeyouhavesomethi"];
    level.battlechatter.eventstrings["CFS_L"]["hunt_report_alert"] = [0:"s_aqhr_allteamswehaveenemyi", 1:"s_aqhr_allteamsperimeterisb", 2:"s_aqhr_allteamsenemyisinsid", 3:"s_aqlo_fanoutsecuretheperim", 4:"s_aqlo_setcontainmentfindth", 5:"s_aqlo_spreadoutsearchthear"];
    level.battlechatter.eventstrings["CFS_L"]["order_stay_aware"] = [0:"s_aqho_dontletthesebastards", 1:"s_aqho_keepyourguardup", 2:"s_aqho_dontletyourguarddown"];
    level.battlechatter.eventstrings["CFS_L"]["order_stay_alert"] = [0:"s_aqho_eyesopen", 1:"s_aqho_keepittight", 2:"s_aqho_staysharp"];
    level.battlechatter.eventstrings["CFS_L"]["order_continue_search"] = [0:"s_aqho_keepsearchingthearea", 1:"s_aqho_keepsweeping", 2:"s_aqho_keeplookingforem"];
    level.battlechatter.eventstrings["CFS_L"]["signoff"] = [0:"s_idls_out", 1:"s_idls_actualout", 2:"s_idls_staysharp", 3:"s_idls_out_01"];
    level.battlechatter.eventstrings["CFS_L"]["order_find_target"] = [0:"s_cmho_weneedalocationonthe", 1:"s_cmho_locatethetargetnow", 2:"s_cmho_huntthemdown"];
    level.battlechatter.eventstrings["CFS_L"]["order_find_perimeter"] = [0:"s_cmho_getthisarealockeddow", 1:"s_cmho_securetheperimeter", 2:"s_cmho_iwantthisarealockedd"];
    level.battlechatter.eventstrings["CFS_L"]["order_search_water"] = [0:"s_cmho_searchthewater", 1:"s_cmho_checkthewater", 2:"s_cmho_theywereinthewater", 3:"s_cmho_watchthewater", 4:"s_cmho_keepyoureyesonthewat"];
    level.battlechatter.eventstrings["CFS_L"]["ask_how_copy"] = [0:"s_idcm_howcopy", 1:"s_idcm_doyoucopy", 2:"s_idcm_commscheck"];
    level.battlechatter.eventstrings["CFS_L"]["inv_no_response"] = [0:"s_iinr_hesradiosilent", 1:"s_iinr_hesnotresponding", 2:"s_iinr_hesnotoncomms", 3:"s_iinr_icantreachhim"];
    level.battlechatter.eventstrings["CFS_L"]["inv_patrol_noresp"] = [0:"s_iinr_stingraydidntcheckin", 1:"s_iinr_stingrayisntrespondi", 2:"s_iinr_icantreachstingray", 3:"s_iinr_stingrayisntoncomms"];
    level.battlechatter.eventstrings["CFS_L"]["order_get_visual"] = [0:"s_iinr_ineedyoutocheckitout", 1:"s_iinr_doyouhaveavisualonth", 2:"s_iinr_checkitoutmakesureno", 3:"s_iinr_seeifyoucanfindoutwh"];
    level.battlechatter.eventstrings["CFS_L"]["report_search"] = [0:"s_aias_sitrep", 1:"s_aias_whatsyourstatus", 2:"s_aias_findanything", 3:"s_aias_gotanything", 4:"s_aias_status"];
    level.battlechatter.eventstrings["CFS_L"]["report_alert"] = [0:"s_airp_allteamssharpenupwem", 1:"s_airp_allteamstheperimeter", 2:"s_airp_allteamspossibleenem", 3:"s_airp_allteamssetsecurityw"];
    level.battlechatter.eventstrings["CFS_L"]["warn_reply"] = [0:"s_wrpl_iftheyreturnyourecle", 1:"s_wrpl_youseethemagainsortt", 2:"s_wrpl_iftheyreturnyourecle_01"];
    level.battlechatter.eventstrings["CFS_L"]["report_target_location"] = [0:"s_chrp_doesanyonehaveavisua", 1:"s_chrp_talktomegentswhatsth", 2:"s_chrp_cmonladsineedalocati", 3:"s_chrp_allteamsdoyouhaveavi"];
    level.battlechatter.eventstrings["CFS_L"]["report_idle"] = [0:"s_irpr_status", 1:"s_irpr_sitrep", 2:"s_irpr_yougood", 3:"s_irpr_gotanything", 4:"s_irpr_report"];
    level.battlechatter.eventstrings["CFS_L"]["ally_missing_multi"] = [0:"s_alms_multipleteamsarentre", 1:"s_alms_anotherteamfailedtor", 2:"s_alms_wevelostcontactwitha", 3:"s_alms_anotherteamlostcomms"];
    level.battlechatter.eventstrings["CFS_L"]["order_search_start"] = [0:"s_aior_searchthearea", 1:"s_aior_pullsecuritysweepthe", 2:"s_aior_securetheperimeter"];
    level.battlechatter.eventstrings["CFS_L"]["order_report_back"] = [0:"s_aior_soundoffifyoufindsom", 1:"s_aior_reportbackifyoufinda", 2:"s_aior_usecommsifyoufindsom"];
    level.battlechatter.eventstrings["CFS_L"]["hunt_patrol_noresp"] = [0:"s_hpnr_stingrayisntrespondi", 1:"s_hpnr_stingraydidntcheckin", 2:"s_hpnr_stingrayisntanswerin", 3:"s_hpnr_icantreachstingray"];
    if (!ismp()) {
        level.battlechatter.eventstrings["LVS"]["enemy_moving_up"] = [0:"m_etca_onesgettingclose", 1:"m_etca_onesmovingup"];
        level.battlechatter.eventstrings["LVS"]["left"] = [0:"m_posn_ontheleft", 1:"m_posn_leftside"];
        level.battlechatter.eventstrings["LVS"]["right"] = [0:"m_posn_lookontheright", 1:"m_posn_rightside"];
        level.battlechatter.eventstrings["LVS"]["order_attack"] = [0:"m_ator_shootthem", 1:"m_ator_attack", 2:"m_ator_fireyourweapon"];
        level.battlechatter.eventstrings["LVS"]["using_grenade"] = [0:"m_atac_throwinggrenade", 1:"m_atac_grenadeout"];
        level.battlechatter.eventstrings["LVS"]["attacking"] = [0:"m_atac_attacking", 1:"m_atac_engaging", 2:"m_atac_firing"];
        level.battlechatter.eventstrings["LVS"]["movingup"] = [0:"m_tcac_immovingup", 1:"m_tcac_movingforward", 2:"m_tcac_movingup"];
        level.battlechatter.eventstrings["LVS"]["reloading"] = [0:"m_tcac_changingmags", 1:"m_tcac_imreloading"];
        level.battlechatter.eventstrings["LVS"]["moving"] = [0:"m_tcac_moving", 1:"m_tcac_immoving", 2:"m_tcac_movingnow"];
        level.battlechatter.eventstrings["LVS"]["getting_cover"] = [0:"m_tcac_takingcover", 1:"m_tcac_movingtocover"];
        level.battlechatter.eventstrings["LVS"]["enemy_using_flash"] = [0:"m_eata_flashbang", 1:"m_eata_flashbangwatchout"];
        level.battlechatter.eventstrings["LVS"]["enemy_using_grenade"] = [0:"m_eata_grenade", 1:"m_eata_grenade_01", 2:"m_eata_grenadegetback"];
        level.battlechatter.eventstrings["LVS"]["enemy_using_rpg"] = [0:"m_eata_rpg", 1:"m_eata_rocket"];
        level.battlechatter.eventstrings["LVS"]["enemy_attacking"] = [0:"m_eata_imtakingfire", 1:"m_eata_contact", 2:"m_eata_takingeffectivefire"];
        level.battlechatter.eventstrings["LVS"]["enemy_moving"] = [0:"m_etca_onesmoving", 1:"m_etca_iseeonemoving"];
        level.battlechatter.eventstrings["LVS"]["enemy_getting_cover"] = [0:"m_etca_theyretakingcover", 1:"m_etca_enemytakingcover"];
        level.battlechatter.eventstrings["LVS"]["enemy_reloading"] = [0:"m_etca_onesreloading", 1:"m_etca_iseeonereloading"];
        level.battlechatter.eventstrings["LVS"]["target_getting_cover"] = [0:"m_ttca_hesgoingforcover", 1:"m_ttca_hestryingtohide"];
        level.battlechatter.eventstrings["LVS"]["target_reloading"] = [0:"m_ttca_hesreloading", 1:"m_ttca_hestryingtoreload"];
        level.battlechatter.eventstrings["LVS"]["target_moving"] = [0:"m_ttca_hesmoving", 1:"m_ttca_heyhesmoving"];
        level.battlechatter.eventstrings["LVS"]["target_moving_up"] = [0:"m_ttca_hesmovingup", 1:"m_ttca_hesmovingourway"];
        level.battlechatter.eventstrings["LVS"]["enemy_soldiers"] = [0:"m_enmy_iseethem", 1:"m_enmy_iseeenemies", 2:"m_enmy_enemies"];
        level.battlechatter.eventstrings["LVS"]["aquired_target"] = [0:"m_aqen_hesrightthere", 1:"m_aqen_icanseehim", 2:"m_aqen_ifoundhim"];
        level.battlechatter.eventstrings["LVS"]["neg_target"] = [0:"m_aqen_where", 1:"m_aqen_idontseeanyone", 2:"m_aqen_whereishe"];
        level.battlechatter.eventstrings["LVS"]["enemy_exposed"] = [0:"m_exco_onesoutofcover", 1:"m_exco_gotoneintheopen", 2:"m_exco_onesintheopenyouseeh"];
        level.battlechatter.eventstrings["LVS"]["target_exposed"] = [0:"m_exco_hesoutofcover", 1:"m_exco_hesmovingfromcover"];
        level.battlechatter.eventstrings["LVS"]["youre_exposed"] = [0:"m_exco_takecover", 1:"m_exco_gettocover", 2:"m_exco_getbehindsomething"];
        level.battlechatter.eventstrings["LVS"]["target_covered"] = [0:"m_exco_hesincover", 1:"m_exco_hestakingcover"];
        level.battlechatter.eventstrings["LVS"]["killfirm_enemy"] = [0:"m_firm_gotone", 1:"m_firm_enemydown", 2:"m_firm_downedone"];
        level.battlechatter.eventstrings["LVS"]["killfirm_target"] = [0:"m_firm_ishothim", 1:"m_firm_igothim"];
        level.battlechatter.eventstrings["LVS"]["casualties"] = [0:"m_casu_werelosingmen", 1:"m_casu_weregettingkilledout"];
        level.battlechatter.eventstrings["LVS"]["copy"] = [0:"m_conf_copy", 1:"m_conf_copythat", 2:"m_conf_roger"];
        level.battlechatter.eventstrings["LVS"]["low_ammo"] = [0:"m_stat_ineedammunition", 1:"m_stat_ineedammo", 2:"m_stat_whohasammo"];
        level.battlechatter.eventstrings["LVS"]["wounded"] = [0:"m_stat_imhit", 1:"m_stat_medic"];
        level.battlechatter.eventstrings["LVS"]["wounded_enemy"] = [0:"m_aens_iwoundedone", 1:"m_aens_ihitone"];
        level.battlechatter.eventstrings["LVS"]["wounded_target"] = [0:"m_atas_heshurt", 1:"m_atas_ihithim"];
        level.battlechatter.eventstrings["LVS"]["coverme"] = [0:"m_tcor_coverme", 1:"m_tcor_ineedcover"];
        level.battlechatter.eventstrings["LVS"]["casualty"] = [0:"m_canm_dude", 1:"m_canm_theykilledoneofours", 2:"m_canm_theykilledhim"];
        level.battlechatter.eventstrings["LVS"]["suppressing"] = [0:"m_aqsp_gotyoucovered", 1:"m_aqsp_imcoveringyou"];
    }
    if (!issp() && !iscp()) {
        return;
    }
    level.battlechatter.eventstrings["pric"]["left"] = [0:"m_posn_theyreflankingleft", 1:"m_posn_leftside", 2:"m_posn_left", 3:"m_posn_checkleft"];
    level.battlechatter.eventstrings["pric"]["right"] = [0:"m_posn_rightside", 1:"m_posn_theyreflankingright", 2:"m_posn_right", 3:"m_posn_checkright"];
    level.battlechatter.eventstrings["pric"]["order_attack"] = [0:"m_ator_engage", 1:"m_ator_weaponsfree", 2:"m_ator_dustem", 3:"m_ator_weaponshot", 4:"m_ator_openfire"];
    level.battlechatter.eventstrings["pric"]["using_smoke"] = [0:"m_atac_throwingsmoke", 1:"m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["pric"]["using_flash"] = [0:"m_atac_flashout", 1:"m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["pric"]["using_grenade"] = [0:"m_atac_fragout", 1:"m_atac_grenadeout"];
    level.battlechatter.eventstrings["pric"]["using_molotov"] = [0:"m_atac_throwingmolotov", 1:"m_atac_molotovout"];
    level.battlechatter.eventstrings["pric"]["reloading"] = [0:"m_tcac_reloading", 1:"m_tcac_changingmags"];
    level.battlechatter.eventstrings["pric"]["moving"] = [0:"m_tcac_moving"];
    level.battlechatter.eventstrings["pric"]["enemy_using_flash"] = [0:"m_eata_flashincoming"];
    level.battlechatter.eventstrings["pric"]["enemy_using_grenade"] = [0:"m_eata_grenade", 1:"m_eata_grenademove", 2:"m_eata_incoming"];
    level.battlechatter.eventstrings["pric"]["enemy_using_molotov"] = [0:"m_eata_molotov", 1:"m_eata_molotovgetback"];
    level.battlechatter.eventstrings["pric"]["enemy_using_rpg"] = [0:"m_eata_rpg", 1:"m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["pric"]["enemy_attacking"] = [0:"m_eata_takingeffectivefire", 1:"m_eata_contact", 2:"m_eata_imtakingfire"];
    level.battlechatter.eventstrings["pric"]["enemy_soldier"] = [0:"m_enmy_xrayspotted", 1:"m_enmy_xrayhere"];
    level.battlechatter.eventstrings["pric"]["enemy_soldiers"] = [0:"m_enmy_multiplexrays", 1:"m_enmy_visualontargets", 2:"m_enmy_multipletargets"];
    level.battlechatter.eventstrings["pric"]["aquired_target"] = [0:"m_aqen_gotavisual", 1:"m_aqen_gotavisualonhim", 2:"m_aqen_iseehim", 3:"m_aqen_iseethebastard"];
    level.battlechatter.eventstrings["pric"]["neg_target"] = [0:"m_aqen_novisual", 1:"m_aqen_idontseehim", 2:"m_aqen_novisualonhim"];
    level.battlechatter.eventstrings["pric"]["enemy_exposed"] = [0:"m_exco_onesintheopen", 1:"m_exco_onesintheopen_01", 2:"m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["pric"]["youre_exposed"] = [0:"m_exco_findcover"];
    level.battlechatter.eventstrings["pric"]["target_exposed"] = [0:"m_exco_hesintheopen", 1:"m_exco_theyreintheopen", 2:"m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["pric"]["target_covered"] = [0:"m_exco_hesbehindcover", 1:"m_exco_hesgotcover", 2:"m_exco_hestakingcover"];
    level.battlechatter.eventstrings["pric"]["killfirm_bigrig"] = [0:"m_firm_xraydown"];
    level.battlechatter.eventstrings["pric"]["killfirm_enemy"] = [0:"m_firm_droppedem", 1:"m_firm_shooterdown"];
    level.battlechatter.eventstrings["pric"]["killfirm_target"] = [0:"m_firm_slottedthatone"];
    level.battlechatter.eventstrings["pric"]["killfirm_truck"] = [0:"m_firm_truckdestroyed", 1:"m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["pric"]["killfirm_helo"] = [0:"m_firm_helodestroyed", 1:"m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["pric"]["praise"] = [0:"m_pras_nicelyfuckindone", 1:"m_pras_fuckinbrilliant", 2:"m_pras_thatllfuckindoit"];
    level.battlechatter.eventstrings["pric"]["low_ammo"] = [0:"m_stat_ammosrunninglow", 1:"m_stat_imlowonammo"];
    level.battlechatter.eventstrings["pric"]["wounded"] = [0:"m_stat_imhit"];
    level.battlechatter.eventstrings["pric"]["enemy_sniper"] = [0:"m_enws_takingsniperfire", 1:"m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["pric"]["checkfire"] = [0:"m_chck_checkyourbloodyfire", 1:"m_chck_watchyourfire", 2:"m_chck_paingruntbloodyhelly", 3:"m_chck_paingrunthowdamoppet"];
    level.battlechatter.eventstrings["grav"]["left"] = [0:"m_posn_leftside", 1:"m_posn_left", 2:"m_posn_checkleft", 3:"m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["grav"]["right"] = [0:"m_posn_rightside", 1:"m_posn_theyreflankingright", 2:"m_posn_right", 3:"m_posn_checkright"];
    level.battlechatter.eventstrings["grav"]["order_attack"] = [0:"m_ator_engage", 1:"m_ator_weaponsfree", 2:"m_ator_shootem", 3:"m_ator_weaponshot", 4:"m_ator_openfire"];
    level.battlechatter.eventstrings["grav"]["using_smoke"] = [0:"m_atac_throwingsmoke", 1:"m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["grav"]["using_flash"] = [0:"m_atac_flashout", 1:"m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["grav"]["using_grenade"] = [0:"m_atac_fragout", 1:"m_atac_grenadeout"];
    level.battlechatter.eventstrings["grav"]["using_molotov"] = [0:"m_atac_throwingmolotov", 1:"m_atac_molotovout"];
    level.battlechatter.eventstrings["grav"]["reloading"] = [0:"m_tcac_reloading", 1:"m_tcac_changingmags"];
    level.battlechatter.eventstrings["grav"]["moving"] = [0:"m_tcac_moving"];
    level.battlechatter.eventstrings["grav"]["enemy_using_flash"] = [0:"m_eata_flashincoming"];
    level.battlechatter.eventstrings["grav"]["enemy_using_grenade"] = [0:"m_eata_grenade", 1:"m_eata_grenademove", 2:"m_eata_incoming"];
    level.battlechatter.eventstrings["grav"]["enemy_using_molotov"] = [0:"m_eata_molotov", 1:"m_eata_molotovgetback"];
    level.battlechatter.eventstrings["grav"]["enemy_using_rpg"] = [0:"m_eata_rpg", 1:"m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["grav"]["enemy_attacking"] = [0:"m_eata_takingeffectivefire", 1:"m_eata_contact", 2:"m_eata_imtakingfire"];
    level.battlechatter.eventstrings["grav"]["enemy_soldier"] = [0:"m_enmy_threatspotted", 1:"m_enmy_enemy"];
    level.battlechatter.eventstrings["grav"]["enemy_soldiers"] = [0:"m_enmy_enemies", 1:"m_enmy_visualontargets", 2:"m_enmy_multipletargets"];
    level.battlechatter.eventstrings["grav"]["aquired_target"] = [0:"m_aqen_gotavisual", 1:"m_aqen_gotavisualonhim", 2:"m_aqen_iseehim", 3:"m_aqen_iseethebastard"];
    level.battlechatter.eventstrings["grav"]["neg_target"] = [0:"m_aqen_novisual", 1:"m_aqen_idontseehim", 2:"m_aqen_novisualonhim"];
    level.battlechatter.eventstrings["grav"]["enemy_exposed"] = [0:"m_exco_onesintheopen", 1:"m_exco_onesintheopen_01", 2:"m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["grav"]["youre_exposed"] = [0:"m_exco_findcover"];
    level.battlechatter.eventstrings["grav"]["target_exposed"] = [0:"m_exco_hesintheopen", 1:"m_exco_theyreintheopen", 2:"m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["grav"]["target_covered"] = [0:"m_exco_hesbehindcover", 1:"m_exco_hesgotcover", 2:"m_exco_hestakingcover"];
    level.battlechatter.eventstrings["grav"]["killfirm_bigrig"] = [0:"m_firm_enemydown"];
    level.battlechatter.eventstrings["grav"]["killfirm_enemy"] = [0:"m_firm_droppedone", 1:"m_firm_targetdown"];
    level.battlechatter.eventstrings["grav"]["killfirm_target"] = [0:"m_firm_gotthatsumbitch"];
    level.battlechatter.eventstrings["grav"]["killfirm_truck"] = [0:"m_firm_truckdestroyed", 1:"m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["grav"]["killfirm_helo"] = [0:"m_firm_tookouttheirhelo", 1:"m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["grav"]["praise"] = [0:"m_pras_thatswhatimtalkinabo", 1:"m_pras_hellyeah", 2:"m_pras_nicefuckinwork"];
    level.battlechatter.eventstrings["grav"]["low_ammo"] = [0:"m_stat_imrunninglow", 1:"m_stat_ammosgettinglow"];
    level.battlechatter.eventstrings["grav"]["wounded"] = [0:"m_stat_imhit"];
    level.battlechatter.eventstrings["grav"]["enemy_sniper"] = [0:"m_enws_takingsniperfire", 1:"m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["grav"]["checkfire"] = [0:"m_chck_watchwhereyoureshoot", 1:"m_chck_checkfire", 2:"m_chck_dontshootatmedumbass", 3:"m_chck_checkyourdamnfire"];
    level.battlechatter.eventstrings["gazz"]["left"] = [0:"m_posn_leftside", 1:"m_posn_left", 2:"m_posn_checkleft", 3:"m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["gazz"]["right"] = [0:"m_posn_rightside", 1:"m_posn_theyreflankingright", 2:"m_posn_right", 3:"m_posn_checkright"];
    level.battlechatter.eventstrings["gazz"]["order_attack"] = [0:"m_ator_engage", 1:"m_ator_weaponsfree", 2:"m_ator_dustem", 3:"m_ator_weaponshot", 4:"m_ator_openfire"];
    level.battlechatter.eventstrings["gazz"]["using_smoke"] = [0:"m_atac_throwingsmoke", 1:"m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["gazz"]["using_flash"] = [0:"m_atac_flashout", 1:"m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["gazz"]["using_grenade"] = [0:"m_atac_fragout", 1:"m_atac_grenadeout"];
    level.battlechatter.eventstrings["gazz"]["using_molotov"] = [0:"m_atac_throwingmolotov", 1:"m_atac_molotovout"];
    level.battlechatter.eventstrings["gazz"]["reloading"] = [0:"m_tcac_reloading", 1:"m_tcac_changingmags"];
    level.battlechatter.eventstrings["gazz"]["moving"] = [0:"m_tcac_moving"];
    level.battlechatter.eventstrings["gazz"]["enemy_using_flash"] = [0:"m_eata_flashincoming"];
    level.battlechatter.eventstrings["gazz"]["enemy_using_grenade"] = [0:"m_eata_grenade", 1:"m_eata_grenademove", 2:"m_eata_incoming"];
    level.battlechatter.eventstrings["gazz"]["enemy_using_molotov"] = [0:"m_eata_molotov", 1:"m_eata_molotovgetback"];
    level.battlechatter.eventstrings["gazz"]["enemy_using_rpg"] = [0:"m_eata_rpg", 1:"m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["gazz"]["enemy_attacking"] = [0:"m_eata_takingeffectivefire", 1:"m_eata_contact", 2:"m_eata_imtakingfire"];
    level.battlechatter.eventstrings["gazz"]["enemy_soldier"] = [0:"m_enmy_xrayspotted", 1:"m_enmy_xrayhere"];
    level.battlechatter.eventstrings["gazz"]["enemy_soldiers"] = [0:"m_enmy_multiplexrays", 1:"m_enmy_visualontargets", 2:"m_enmy_multipletargets"];
    level.battlechatter.eventstrings["gazz"]["aquired_target"] = [0:"m_aqen_gotavisual", 1:"m_aqen_gotavisualonhim", 2:"m_aqen_iseehim", 3:"m_aqen_iseethebastard"];
    level.battlechatter.eventstrings["gazz"]["neg_target"] = [0:"m_aqen_novisual", 1:"m_aqen_idontseehim", 2:"m_aqen_novisualonhim"];
    level.battlechatter.eventstrings["gazz"]["enemy_exposed"] = [0:"m_exco_onesintheopen", 1:"m_exco_onesintheopen_01", 2:"m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["gazz"]["youre_exposed"] = [0:"m_exco_findcover"];
    level.battlechatter.eventstrings["gazz"]["target_exposed"] = [0:"m_exco_hesintheopen", 1:"m_exco_theyreintheopen", 2:"m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["gazz"]["target_covered"] = [0:"m_exco_hesbehindcover", 1:"m_exco_hesgotcover", 2:"m_exco_hestakingcover"];
    level.battlechatter.eventstrings["gazz"]["killfirm_bigrig"] = [0:"m_firm_xraydown"];
    level.battlechatter.eventstrings["gazz"]["killfirm_enemy"] = [0:"m_firm_droppedem", 1:"m_firm_droppedanxray"];
    level.battlechatter.eventstrings["gazz"]["killfirm_target"] = [0:"m_firm_brassedemup"];
    level.battlechatter.eventstrings["gazz"]["killfirm_truck"] = [0:"m_firm_truckdestroyed", 1:"m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["gazz"]["killfirm_helo"] = [0:"m_firm_helodestroyed", 1:"m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["gazz"]["praise"] = [0:"m_pras_solidmate", 1:"m_pras_niceone", 2:"m_pras_fuckinright"];
    level.battlechatter.eventstrings["gazz"]["low_ammo"] = [0:"m_stat_ammosrunninglow", 1:"m_stat_imlowonammo"];
    level.battlechatter.eventstrings["gazz"]["wounded"] = [0:"m_stat_imhit"];
    level.battlechatter.eventstrings["gazz"]["enemy_sniper"] = [0:"m_enws_takingsniperfire", 1:"m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["gazz"]["checkfire"] = [0:"m_chck_checkyourbloodyfire", 1:"m_chck_watchyourfire", 2:"m_chck_paingruntbloodyhellw", 3:"m_chck_paingruntcheckfirech"];
    level.battlechatter.eventstrings["alej"]["using_molotov"] = [0:"m_atac_throwingmolotov", 1:"m_atac_molotovout"];
    level.battlechatter.eventstrings["alej"]["left"] = [0:"m_posn_leftside", 1:"m_posn_left", 2:"m_posn_checkleft", 3:"m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["alej"]["right"] = [0:"m_posn_rightside", 1:"m_posn_theyreflankingright", 2:"m_posn_right", 3:"m_posn_checkright"];
    level.battlechatter.eventstrings["alej"]["order_attack"] = [0:"m_ator_engage", 1:"m_ator_shootem", 2:"m_ator_dropem", 3:"m_ator_openup", 4:"m_ator_openfire"];
    level.battlechatter.eventstrings["alej"]["using_smoke"] = [0:"m_atac_throwingsmoke", 1:"m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["alej"]["using_flash"] = [0:"m_atac_flashout", 1:"m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["alej"]["using_grenade"] = [0:"m_atac_fragout", 1:"m_atac_grenadeout"];
    level.battlechatter.eventstrings["alej"]["reloading"] = [0:"m_tcac_reloading", 1:"m_tcac_changingmags"];
    level.battlechatter.eventstrings["alej"]["moving"] = [0:"m_tcac_moving"];
    level.battlechatter.eventstrings["alej"]["enemy_using_flash"] = [0:"m_eata_flashincoming"];
    level.battlechatter.eventstrings["alej"]["enemy_using_grenade"] = [0:"m_eata_grenade", 1:"m_eata_grenademove", 2:"m_eata_incoming"];
    level.battlechatter.eventstrings["alej"]["enemy_using_molotov"] = [0:"m_eata_molotov", 1:"m_eata_molotovgetback"];
    level.battlechatter.eventstrings["alej"]["enemy_using_rpg"] = [0:"m_eata_rpg", 1:"m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["alej"]["enemy_attacking"] = [0:"m_eata_takingeffectivefire", 1:"m_eata_contact", 2:"m_eata_imtakingfire"];
    level.battlechatter.eventstrings["alej"]["enemy_soldier"] = [0:"m_enmy_targetspotted", 1:"m_enmy_enemy"];
    level.battlechatter.eventstrings["alej"]["enemy_soldiers"] = [0:"m_enmy_multipletargets", 1:"m_enmy_visualontargets", 2:"m_enmy_enemies"];
    level.battlechatter.eventstrings["alej"]["aquired_target"] = [0:"m_aqen_gotavisual", 1:"m_aqen_gotavisualonhim", 2:"m_aqen_iseehim", 3:"m_aqen_goteyeson"];
    level.battlechatter.eventstrings["alej"]["neg_target"] = [0:"m_aqen_novisual", 1:"m_aqen_idontseehim", 2:"m_aqen_cantfindhim"];
    level.battlechatter.eventstrings["alej"]["enemy_exposed"] = [0:"m_exco_onesintheopen", 1:"m_exco_onesintheopen_01", 2:"m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["alej"]["youre_exposed"] = [0:"m_exco_findcover"];
    level.battlechatter.eventstrings["alej"]["target_exposed"] = [0:"m_exco_hesintheopen", 1:"m_exco_theyreintheopen", 2:"m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["alej"]["target_covered"] = [0:"m_exco_hesbehindcover", 1:"m_exco_hesgotcover", 2:"m_exco_hestakingcover"];
    level.battlechatter.eventstrings["alej"]["killfirm_bigrig"] = [0:"m_firm_targetdown"];
    level.battlechatter.eventstrings["alej"]["killfirm_enemy"] = [0:"m_firm_droppedem", 1:"m_firm_enemydown"];
    level.battlechatter.eventstrings["alej"]["killfirm_target"] = [0:"m_firm_igotem"];
    level.battlechatter.eventstrings["alej"]["killfirm_truck"] = [0:"m_firm_theirtrucksdown", 1:"m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["alej"]["killfirm_helo"] = [0:"m_firm_helodestroyed", 1:"m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["alej"]["praise"] = [0:"m_pras_goodworkhermano", 1:"m_pras_ahuevo", 2:"m_pras_niceone"];
    level.battlechatter.eventstrings["alej"]["low_ammo"] = [0:"m_stat_ammosrunninglow", 1:"m_stat_imlowonammo"];
    level.battlechatter.eventstrings["alej"]["wounded"] = [0:"m_stat_imhit"];
    level.battlechatter.eventstrings["alej"]["enemy_sniper"] = [0:"m_enws_takingsniperfire", 1:"m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["alej"]["checkfire"] = [0:"m_chck_checkfirecheckfire", 1:"m_chck_heywatchyourfire", 2:"m_chck_paingruntshoottheene", 3:"m_chck_paingruntcheckyourfi"];
    level.battlechatter.eventstrings["rodo"]["enemy_attacking"] = [0:"m_eata_imtakingfire", 1:"m_eata_takingeffectivefire", 2:"m_eata_contact"];
    level.battlechatter.eventstrings["rodo"]["left"] = [0:"m_posn_leftside", 1:"m_posn_left", 2:"m_posn_checkleft", 3:"m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["rodo"]["right"] = [0:"m_posn_rightside", 1:"m_posn_theyreflankingright", 2:"m_posn_right", 3:"m_posn_checkright"];
    level.battlechatter.eventstrings["rodo"]["order_attack"] = [0:"m_ator_engage", 1:"m_ator_shootem", 2:"m_ator_dropem", 3:"m_ator_openup", 4:"m_ator_openfire"];
    level.battlechatter.eventstrings["rodo"]["using_smoke"] = [0:"m_atac_throwingsmoke", 1:"m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["rodo"]["using_flash"] = [0:"m_atac_flashout", 1:"m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["rodo"]["using_grenade"] = [0:"m_atac_fragout", 1:"m_atac_grenadeout"];
    level.battlechatter.eventstrings["rodo"]["using_molotov"] = [0:"m_atac_throwingmolotov", 1:"m_atac_molotovout"];
    level.battlechatter.eventstrings["rodo"]["reloading"] = [0:"m_tcac_reloading", 1:"m_tcac_changingmags"];
    level.battlechatter.eventstrings["rodo"]["moving"] = [0:"m_tcac_moving"];
    level.battlechatter.eventstrings["rodo"]["enemy_using_flash"] = [0:"m_eata_flashincoming"];
    level.battlechatter.eventstrings["rodo"]["enemy_using_grenade"] = [0:"m_eata_grenade", 1:"m_eata_grenademove", 2:"m_eata_incoming"];
    level.battlechatter.eventstrings["rodo"]["enemy_using_molotov"] = [0:"m_eata_molotov", 1:"m_eata_molotovgetback"];
    level.battlechatter.eventstrings["rodo"]["enemy_using_rpg"] = [0:"m_eata_rpg", 1:"m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["rodo"]["enemy_soldier"] = [0:"m_enmy_targetspotted", 1:"m_enmy_enemy"];
    level.battlechatter.eventstrings["rodo"]["enemy_soldiers"] = [0:"m_enmy_multipletargets", 1:"m_enmy_visualontargets", 2:"m_enmy_enemies"];
    level.battlechatter.eventstrings["rodo"]["aquired_target"] = [0:"m_aqen_gotavisual", 1:"m_aqen_gotavisualonhim", 2:"m_aqen_iseehim", 3:"m_aqen_goteyeson"];
    level.battlechatter.eventstrings["rodo"]["neg_target"] = [0:"m_aqen_novisual", 1:"m_aqen_idontseehim", 2:"m_aqen_cantfindhim"];
    level.battlechatter.eventstrings["rodo"]["enemy_exposed"] = [0:"m_exco_onesintheopen", 1:"m_exco_onesintheopen_01", 2:"m_exco_gotoneintheopen"];
    level.battlechatter.eventstrings["rodo"]["youre_exposed"] = [0:"m_exco_findcover"];
    level.battlechatter.eventstrings["rodo"]["target_exposed"] = [0:"m_exco_hesintheopen", 1:"m_exco_theyreintheopen", 2:"m_exco_hevemovingfromcover"];
    level.battlechatter.eventstrings["rodo"]["target_covered"] = [0:"m_exco_hesbehindcover", 1:"m_exco_hesgotcover", 2:"m_exco_hestakingcover"];
    level.battlechatter.eventstrings["rodo"]["killfirm_bigrig"] = [0:"m_firm_targetdown"];
    level.battlechatter.eventstrings["rodo"]["killfirm_enemy"] = [0:"m_firm_droppedem", 1:"m_firm_enemydown"];
    level.battlechatter.eventstrings["rodo"]["killfirm_target"] = [0:"m_firm_igotem"];
    level.battlechatter.eventstrings["rodo"]["killfirm_truck"] = [0:"m_firm_theirtrucksdown", 1:"m_firm_enemytruckdown"];
    level.battlechatter.eventstrings["rodo"]["killfirm_helo"] = [0:"m_firm_helodestroyed", 1:"m_firm_enemyhelodestroyed"];
    level.battlechatter.eventstrings["rodo"]["praise"] = [0:"m_pras_goodworkhermano", 1:"m_pras_ahuevo", 2:"m_pras_niceone"];
    level.battlechatter.eventstrings["rodo"]["low_ammo"] = [0:"m_stat_ammosrunninglow", 1:"m_stat_imlowonammo"];
    level.battlechatter.eventstrings["rodo"]["wounded"] = [0:"m_stat_imhit"];
    level.battlechatter.eventstrings["rodo"]["enemy_sniper"] = [0:"m_enws_takingsniperfire", 1:"m_enws_paineffortsniperstay"];
    level.battlechatter.eventstrings["rodo"]["checkfire"] = [0:"m_chck_checkfirecheckfire", 1:"m_chck_heywatchyourfire", 2:"m_chck_paingruntshoottheene", 3:"m_chck_paingruntcheckyourfi"];
    level.battlechatter.eventstrings["ghos"]["low_ammo"] = [0:"m_stat_ineedmags"];
    level.battlechatter.eventstrings["ghos"]["left"] = [0:"m_posn_watchleft", 1:"m_posn_theyreflankingleft"];
    level.battlechatter.eventstrings["ghos"]["right"] = [0:"m_posn_watchright", 1:"m_posn_theyreflankingright", 2:"m_posn_checkright"];
    level.battlechatter.eventstrings["ghos"]["order_attack"] = [0:"m_ator_engage", 1:"m_ator_cutemdown", 2:"m_ator_pickemoff"];
    level.battlechatter.eventstrings["ghos"]["using_smoke"] = [0:"m_atac_throwingsmoke", 1:"m_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["ghos"]["using_flash"] = [0:"m_atac_flashout", 1:"m_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["ghos"]["using_grenade"] = [0:"m_atac_fragout", 1:"m_atac_grenadeout"];
    level.battlechatter.eventstrings["ghos"]["using_molotov"] = [0:"m_atac_throwingmolotov", 1:"m_atac_molotovout"];
    level.battlechatter.eventstrings["ghos"]["reloading"] = [0:"m_tcac_reloading", 1:"m_tcac_changingmags"];
    level.battlechatter.eventstrings["ghos"]["moving"] = [0:"m_tcac_moving"];
    level.battlechatter.eventstrings["ghos"]["enemy_using_flash"] = [0:"m_eata_flashincoming"];
    level.battlechatter.eventstrings["ghos"]["enemy_using_grenade"] = [0:"m_eata_grenade", 1:"m_eata_gettocover", 2:"m_eata_incoming"];
    level.battlechatter.eventstrings["ghos"]["enemy_using_molotov"] = [0:"m_eata_molotov", 1:"m_eata_molotovgetback"];
    level.battlechatter.eventstrings["ghos"]["enemy_using_rpg"] = [0:"m_eata_rpg", 1:"m_eata_rpgtakecover"];
    level.battlechatter.eventstrings["ghos"]["enemy_attacking"] = [0:"m_eata_takingeffectivefire", 1:"m_eata_contact", 2:"m_eata_takingfire"];
    level.battlechatter.eventstrings["ghos"]["enemy_soldier"] = [0:"m_enmy_targetspotted", 1:"m_enmy_enemyhere"];
    level.battlechatter.eventstrings["ghos"]["enemy_soldiers"] = [0:"m_enmy_multipleenemyhere", 1:"m_enmy_visualontheenemy", 2:"m_enmy_multipletargetsright"];
    level.battlechatter.eventstrings["ghos"]["aquired_target"] = [0:"m_aqen_iseehim"];
    level.battlechatter.eventstrings["ghos"]["youre_exposed"] = [0:"m_exco_takecover"];
    level.battlechatter.eventstrings["ghos"]["target_covered"] = [0:"m_exco_hesbehindcover"];
    level.battlechatter.eventstrings["ghos"]["killfirm_bigrig"] = [0:"m_firm_xraydown"];
    level.battlechatter.eventstrings["ghos"]["killfirm_enemy"] = [0:"m_firm_sortedthatone", 1:"m_firm_dustedem"];
    level.battlechatter.eventstrings["ghos"]["killfirm_target"] = [0:"m_firm_slottedem"];
    level.battlechatter.eventstrings["ghos"]["killfirm_truck"] = [0:"m_firm_enemytruckdestroyed", 1:"m_firm_enemytruckisdown"];
    level.battlechatter.eventstrings["ghos"]["killfirm_helo"] = [0:"m_firm_gottheirhelo", 1:"m_firm_enemyheloisdown"];
    level.battlechatter.eventstrings["ghos"]["praise"] = [0:"m_pras_nicelydone", 1:"m_pras_fuckinacemate", 2:"m_pras_thatwassoundmate"];
    level.battlechatter.eventstrings["ghos"]["wounded"] = [0:"m_stat_painefforttookaround"];
    level.battlechatter.eventstrings["ghos"]["enemy_sniper"] = [0:"m_enws_snipersonme", 1:"m_enws_paineffortsniper"];
    level.battlechatter.eventstrings["ghos"]["checkfire"] = [0:"m_chck_paineffortcheckyerbl", 1:"m_chck_paineffortdontshootm", 2:"m_chck_paineffortcheckyourf", 3:"m_chck_paineffortwatchyourb"];
    level.battlechatter.eventstrings["fara"]["low_ammo"] = [0:"c_stat_ineedmags", 1:"c_stat_imlowonammo", 2:"c_stat_lastmag"];
    level.battlechatter.eventstrings["fara"]["using_smoke"] = [0:"c_atac_throwingsmoke", 1:"c_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["fara"]["using_flash"] = [0:"c_atac_flashout", 1:"c_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["fara"]["using_grenade"] = [0:"c_atac_throwinggrenade", 1:"c_atac_grenadeout"];
    level.battlechatter.eventstrings["fara"]["using_molotov"] = [0:"c_atac_throwingmolotov", 1:"c_atac_molotovout"];
    level.battlechatter.eventstrings["fara"]["reloading"] = [0:"c_tcac_reloading", 1:"c_tcac_loading"];
    level.battlechatter.eventstrings["fara"]["moving"] = [0:"c_tcac_moving"];
    level.battlechatter.eventstrings["fara"]["enemy_using_flash"] = [0:"c_eata_flashincoming"];
    level.battlechatter.eventstrings["fara"]["enemy_using_grenade"] = [0:"c_eata_grenade", 1:"c_eata_grenademove", 2:"c_eata_incoming"];
    level.battlechatter.eventstrings["fara"]["enemy_using_molotov"] = [0:"c_eata_molotov", 1:"c_eata_molotovgetback"];
    level.battlechatter.eventstrings["fara"]["enemy_using_rpg"] = [0:"c_eata_rpg", 1:"c_eata_rpgtakecover"];
    level.battlechatter.eventstrings["fara"]["enemy_attacking"] = [0:"c_eata_takingeffectivefire", 1:"c_eata_contact", 2:"c_eata_imtakingfire"];
    level.battlechatter.eventstrings["fara"]["enemy_soldier"] = [0:"c_enmy_enemyspotted", 1:"c_enmy_enemyfighterhere"];
    level.battlechatter.eventstrings["fara"]["enemy_soldiers"] = [0:"c_enmy_hostilesspotted", 1:"c_enmy_visualontargets", 2:"c_enmy_multipletargets"];
    level.battlechatter.eventstrings["fara"]["aquired_target"] = [0:"c_aqen_enemyvisual", 1:"c_aqen_visualontheenemy", 2:"c_aqen_heythreatspotted"];
    level.battlechatter.eventstrings["fara"]["youre_exposed"] = [0:"c_exco_takecover"];
    level.battlechatter.eventstrings["fara"]["killfirm_bigrig"] = [0:"c_firm_targetdown"];
    level.battlechatter.eventstrings["fara"]["killfirm_enemy"] = [0:"c_firm_enemyisdown", 1:"c_firm_onedead"];
    level.battlechatter.eventstrings["fara"]["killfirm_target"] = [0:"c_firm_theyredownmove"];
    level.battlechatter.eventstrings["fara"]["killfirm_truck"] = [0:"c_firm_truckdestroyed", 1:"c_firm_enemytruckdestroyed"];
    level.battlechatter.eventstrings["fara"]["killfirm_helo"] = [0:"c_firm_helodestroyed", 1:"c_firm_gottheirhelo"];
    level.battlechatter.eventstrings["fara"]["praise"] = [0:"c_pras_youfightlikeus", 1:"c_pras_welldone", 2:"c_pras_niceone"];
    level.battlechatter.eventstrings["fara"]["wounded"] = [0:"c_stat_imhit"];
    level.battlechatter.eventstrings["fara"]["enemy_sniper"] = [0:"c_enws_takingsniperfire", 1:"c_enws_snipergotme"];
    level.battlechatter.eventstrings["fara"]["checkfire"] = [0:"c_chck_imonyourside", 1:"c_chck_dontshootme", 2:"c_chck_checkfire", 3:"c_chck_watchyourfire"];
    level.battlechatter.eventstrings["soap"]["low_ammo"] = [0:"c_stat_imredonammo", 1:"c_stat_lastmag", 2:"c_stat_ineedmags"];
    level.battlechatter.eventstrings["soap"]["using_smoke"] = [0:"c_atac_throwingsmoke", 1:"c_atac_tossingsmokegrenade"];
    level.battlechatter.eventstrings["soap"]["using_flash"] = [0:"c_atac_flashout", 1:"c_atac_throwingflashgrenade"];
    level.battlechatter.eventstrings["soap"]["using_grenade"] = [0:"c_atac_fragout", 1:"c_atac_tossinggrenade"];
    level.battlechatter.eventstrings["soap"]["using_molotov"] = [0:"c_atac_throwingmolotov", 1:"c_atac_molotovout"];
    level.battlechatter.eventstrings["soap"]["reloading"] = [0:"c_tcac_reloading", 1:"c_tcac_imreloading"];
    level.battlechatter.eventstrings["soap"]["moving"] = [0:"c_tcac_moving"];
    level.battlechatter.eventstrings["soap"]["enemy_using_flash"] = [0:"c_eata_flashincoming"];
    level.battlechatter.eventstrings["soap"]["enemy_using_grenade"] = [0:"c_eata_grenade_01", 1:"c_eata_incoming", 2:"c_eata_grenade"];
    level.battlechatter.eventstrings["soap"]["enemy_using_molotov"] = [0:"c_eata_molotov", 1:"c_eata_molotovgetback"];
    level.battlechatter.eventstrings["soap"]["enemy_using_rpg"] = [0:"c_eata_rpg", 1:"c_eata_rpgtakecover"];
    level.battlechatter.eventstrings["soap"]["enemy_attacking"] = [0:"c_eata_takingeffectivefire", 1:"c_eata_contact", 2:"c_eata_imtakingfire"];
    level.battlechatter.eventstrings["soap"]["enemy_soldier"] = [0:"c_enmy_enemyinthearea", 1:"c_enmy_enemyinthearea_01"];
    level.battlechatter.eventstrings["soap"]["enemy_soldiers"] = [0:"c_enmy_multiplemoversspotte", 1:"c_enmy_threatssighted", 2:"c_enmy_targetssighted"];
    level.battlechatter.eventstrings["soap"]["aquired_target"] = [0:"c_aqen_enemyfighterhere", 1:"c_aqen_enemyhere", 2:"c_aqen_gotonesightedhere", 3:"c_aqen_enemyvisual"];
    level.battlechatter.eventstrings["soap"]["youre_exposed"] = [0:"c_exco_takecover"];
    level.battlechatter.eventstrings["soap"]["killfirm_bigrig"] = [0:"c_firm_targetdown"];
    level.battlechatter.eventstrings["soap"]["killfirm_enemy"] = [0:"c_firm_droppedem", 1:"c_firm_enemydown"];
    level.battlechatter.eventstrings["soap"]["killfirm_target"] = [0:"c_firm_targetdismissed"];
    level.battlechatter.eventstrings["soap"]["killfirm_truck"] = [0:"c_firm_enemytruckneutralize", 1:"c_firm_enemytruckdown"];
    level.battlechatter.eventstrings["soap"]["killfirm_helo"] = [0:"c_firm_heloisdown", 1:"c_firm_gunshipdestroyed"];
    level.battlechatter.eventstrings["soap"]["praise"] = [0:"c_pras_brilliant", 1:"c_pras_gieitlaldy", 2:"c_pras_thatwaspurebarrymate"];
    level.battlechatter.eventstrings["soap"]["wounded"] = [0:"c_stat_imhit"];
    level.battlechatter.eventstrings["soap"]["enemy_sniper"] = [0:"c_enws_tookasniperround", 1:"c_enws_snipergetdown"];
    level.battlechatter.eventstrings["soap"]["checkfire"] = [0:"c_chck_checkyerbloodyfire", 1:"c_chck_dontshootmeyadaftbas", 2:"c_chck_watchyerfire", 3:"c_chck_shootthemnotme"];
}

