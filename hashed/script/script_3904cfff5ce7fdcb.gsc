// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\engine\math.gsc;

#namespace gulag;

// Namespace gulag/namespace_2913f85acadc353f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116
// Size: 0xa7
function function_88039a31ef9e74dd() {
    var_bfb5641b1c288973 = isdefined(self.gulagloser) && !self.gulagloser;
    if (var_bfb5641b1c288973) {
        return;
    }
    var_b1dca28c075e9c3a = self.ignoreme;
    var_f5d1460ce90bfa57 = self.ignoreall;
    var_c31923566c85f07 = self botgetdifficulty();
    if (var_c31923566c85f07 != "recruit") {
        self botsetdifficulty("recruit");
    } else {
        var_c31923566c85f07 = undefined;
    }
    function_c1a20b04ac6141bf();
    self.ignoreme = var_b1dca28c075e9c3a;
    self.ignoreall = var_f5d1460ce90bfa57;
    if (isdefined(var_c31923566c85f07)) {
        self botsetdifficulty(var_c31923566c85f07);
    }
}

// Namespace gulag/namespace_2913f85acadc353f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4
// Size: 0x2d
function function_c1a20b04ac6141bf() {
    self endon("death_or_disconnect");
    self endon("gulag_end");
    level endon("game_ended");
    function_5643932de03d949d();
    function_7b827ec625eac6f5();
    function_35c340e0c5d514f();
}

// Namespace gulag/namespace_2913f85acadc353f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8
// Size: 0x4a
function function_5643932de03d949d() {
    function_2c2b5b435027f895(undefined);
    self.ignoreme = 1;
    self.ignoreall = 1;
    self botclearscriptgoal();
    while (!istrue(self.jailed) && !istrue(self.gulagarena)) {
        wait(1);
    }
}

// Namespace gulag/namespace_2913f85acadc353f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249
// Size: 0x113
function function_7b827ec625eac6f5() {
    function_142b713a2846f9ac("Gulag 2F");
    while (istrue(self.jailed)) {
        self.ignoreall = 0;
        var_da842ad27513575b = randomint(100);
        if (var_da842ad27513575b < 20) {
            self botpressbutton("jump");
            wait(1);
        } else if (var_da842ad27513575b < 50) {
            self botclearscriptgoal();
            sec = randomintrange(1, 3);
            wait(sec);
        } else {
            self botclearscriptgoal();
            arena = self.arena;
            idx = randomint(arena.jailspawns.size);
            pointonnavmesh = arena.jailspawns[idx].origin;
            dest = function_207ba502560fa1d2(pointonnavmesh);
            function_9e400058ef021b03(dest, randomintrange(50, 400));
            waittill_any_ents_or_timeout_return(5, self, "goal", self, "bad_path", self, "initPlayerArena");
        }
    }
}

// Namespace gulag/namespace_2913f85acadc353f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x363
// Size: 0x10e
function function_35c340e0c5d514f() {
    while (1) {
        wait(0.2);
        if (!isdefined(self.var_600419d0dbb63af7)) {
            break;
        }
    }
    self.ignoreme = 0;
    self.ignoreall = 0;
    self botclearscriptgoal();
    function_142b713a2846f9ac("Gulag 1F");
    var_d1d6c77a1c1b483f = undefined;
    target = undefined;
    var_7a336bd948b61bd9 = 20;
    while (!isdefined(target) && istrue(self.gulagarena)) {
        if (!isdefined(var_d1d6c77a1c1b483f) || distance(self.origin, var_d1d6c77a1c1b483f) <= var_7a336bd948b61bd9 || !self bothasscriptgoal()) {
            var_d1d6c77a1c1b483f = function_80d441566c90edc6();
            if (isdefined(var_d1d6c77a1c1b483f)) {
                function_9e400058ef021b03(var_d1d6c77a1c1b483f, var_7a336bd948b61bd9);
            }
        }
        target = function_564a1e72e185fedc();
        if (isdefined(target)) {
            break;
        }
        wait(0.2);
    }
    if (isdefined(target)) {
        self botclearscriptgoal();
        self getenemyinfo(target);
        self botsetscriptenemy(target);
        while (istrue(self.gulagarena)) {
            wait(0.5);
        }
        self botclearscriptenemy();
    }
}

// Namespace gulag/namespace_2913f85acadc353f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x478
// Size: 0xa7
function function_564a1e72e185fedc() {
    var_caa829fe86bc833b = 392;
    foreach (player in self.arena.arenaplayers) {
        if (player != self) {
            if (function_3569a4bec8b9af17(player) || self botcanseeentity(player, 1) || distance(self.origin, player.origin) < var_caa829fe86bc833b) {
                return player;
            }
        }
    }
    return undefined;
}

// Namespace gulag/namespace_2913f85acadc353f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x527
// Size: 0xe7
function function_80d441566c90edc6() {
    var_7bb392e395bdb0d5 = undefined;
    foreach (player in self.arena.arenaplayers) {
        if (player != self) {
            var_7bb392e395bdb0d5 = player.origin;
            break;
        }
    }
    if (!isdefined(var_7bb392e395bdb0d5)) {
        var_7bb392e395bdb0d5 = self.origin;
    }
    var_ee72848a8bf3667a = 392;
    for (i = 0; i < 10; i++) {
        destination = namespace_41f4dfb71dd08362::function_5e0e534f768708a3(var_ee72848a8bf3667a, var_7bb392e395bdb0d5);
        if (abs(destination[2] - self.origin[2]) < 50) {
            return destination;
        }
    }
    return undefined;
}

