// mwiii decomp prototype
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_4b87f2871b6b025c;

#namespace heartbeat;

// Namespace heartbeat/namespace_a81abcc503139256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a
// Size: 0x2f
function function_94461e6fd9196c6a(var_230b60ef0852dcb8) {
    level.heartbeat = spawnstruct();
    level.heartbeat.var_230b60ef0852dcb8 = var_230b60ef0852dcb8;
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x250
// Size: 0x2e
function function_a9c6f7587066ce13() {
    self.heartbeat = spawnstruct();
    self.heartbeat.pulsetime = 0;
    thread heartBeatTimer();
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x285
// Size: 0x77
function function_6c37d427b68ff9c7() {
    return [0:[0:"mvmt_heartbeat_plr_superfast", 1:1.3], 1:[0:"mvmt_heartbeat_plr_fast", 1:1.721], 2:[0:"mvmt_heartbeat_plr_med", 1:1.973], 3:[0:"mvmt_heartbeat_plr_slow", 1:2.321], 4:[0:"mvmt_heartbeat_plr_superslow", 1:2.86]];
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x304
// Size: 0x77
function function_fa062c79f577073c() {
    return [0:[0:"mvmt_swim_heartbeat_plr_superfast", 1:1.3], 1:[0:"mvmt_swim_heartbeat_plr_fast", 1:1.721], 2:[0:"mvmt_swim_heartbeat_plr_med", 1:1.973], 3:[0:"mvmt_swim_heartbeat_plr_slow", 1:2.321], 4:[0:"mvmt_swim_heartbeat_plr_superslow", 1:2.86]];
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x383
// Size: 0xc4
function heartBeatTimer() {
    self notify("heartBeatTimer");
    self endon("heartBeatTimer");
    self endon("death_or_disconnect");
    while (1) {
        time = gettime();
        var_be61059bb932ddd5 = function_8c8ff6fc7b5b3d67();
        if (isdefined(var_be61059bb932ddd5)) {
            var_80b36d51e63183a3 = var_be61059bb932ddd5[0];
            childthread function_7c867ea17d64a37c(var_80b36d51e63183a3);
            var_b50e35d9c370899b = 2;
            var_134842f971b65ef6 = var_be61059bb932ddd5[1] * 1000 * 0.5;
            while (var_b50e35d9c370899b > 0) {
                var_cfc5be6822858733 = time;
                while (time < var_cfc5be6822858733 + var_134842f971b65ef6) {
                    function_70dd1e8302bb7a82(time, var_cfc5be6822858733, var_134842f971b65ef6);
                    waitframe();
                    time = gettime();
                }
                var_b50e35d9c370899b--;
            }
        } else {
            self waittill("startHeartbeatPulse");
        }
    }
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e
// Size: 0x58
function function_70dd1e8302bb7a82(time, var_cfc5be6822858733, var_134842f971b65ef6) {
    var_22fd1081463a401f = (time - var_cfc5be6822858733) / var_134842f971b65ef6;
    var_22fd1081463a401f = math::function_4118613456c64c5e(var_22fd1081463a401f, 0.65);
    self.heartbeat.pulsetime = 1 - math::normalized_parabola(var_22fd1081463a401f);
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ad
// Size: 0x4f
function function_8b94dcc60025c0de(var_134842f971b65ef6) {
    if (function_ea8199f09c110522() || !function_afb9ed6354e03dfa() || !function_7b09a3e02e70b0d2()) {
        return;
    }
    pulseduration = var_134842f971b65ef6 / 1000;
    wait(pulseduration * 0.1);
    childthread function_b7c36a804415225b("heartbeatSuperLight");
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x503
// Size: 0xe
function function_afb9ed6354e03dfa() {
    return !isdefined(self.usingremote);
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x519
// Size: 0x30
function function_b7c36a804415225b(heartbeat) {
    self setscriptablepartstate("heartbeat", heartbeat);
    wait(0.05);
    self setscriptablepartstate("heartbeat", "neutral");
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x550
// Size: 0x26
function function_8c8ff6fc7b5b3d67() {
    if (function_7b09a3e02e70b0d2()) {
        return function_1078275b178db870();
    } else if (isplayerunderwater()) {
        return function_14f4cbd1901f7812();
    }
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57d
// Size: 0xae
function function_1078275b178db870() {
    if (!isdefined(self.currentregendelay) && !istrue(self.healing)) {
        return undefined;
    }
    var_b10ff79982c0153b = function_6c37d427b68ff9c7();
    if (isdefined(self.currentregendelay) && self.currentregendelay > 4.5) {
        return var_b10ff79982c0153b[0];
    } else if (isdefined(self.currentregendelay) && self.currentregendelay > 2.8) {
        return var_b10ff79982c0153b[1];
    } else if (isdefined(self.currentregendelay) && self.currentregendelay > 0.7) {
        return var_b10ff79982c0153b[2];
    } else {
        return var_b10ff79982c0153b[3];
    }
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632
// Size: 0x112
function function_14f4cbd1901f7812() {
    if (!function_3776bacc92b445d3()) {
        return undefined;
    }
    var_fe17e9129d4b4bfa = 2;
    var_6b54ed3d32416e64 = 0;
    time = 0;
    var_511925e2c9007ae6 = 0;
    if (function_bab53c4f3c6062b9()) {
        return [0:"mvmt_swim_heartbeat_plr_ultrafast", 1:0.65];
    }
    var_b10ff79982c0153b = function_fa062c79f577073c();
    if (function_ea8199f09c110522()) {
        var_b10ff79982c0153b = [0:var_b10ff79982c0153b[0], 1:var_b10ff79982c0153b[1]];
        remainingtime = function_b1b34805f6f1b18f();
    } else {
        var_b10ff79982c0153b = [0:var_b10ff79982c0153b[2], 1:var_b10ff79982c0153b[3], 2:var_b10ff79982c0153b[4]];
        remainingtime = function_b1b34805f6f1b18f() - [[ level.swim.var_575e6f276810675e ]]();
    }
    while (1) {
        if (var_511925e2c9007ae6 < var_fe17e9129d4b4bfa) {
            time = time + var_b10ff79982c0153b[var_6b54ed3d32416e64][1];
            var_511925e2c9007ae6++;
            if (time > remainingtime) {
                break;
            }
        } else {
            var_6b54ed3d32416e64++;
            var_511925e2c9007ae6 = 0;
            if (var_6b54ed3d32416e64 >= var_b10ff79982c0153b.size - 1) {
                break;
            }
        }
    }
    return var_b10ff79982c0153b[var_6b54ed3d32416e64];
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74c
// Size: 0x18
function function_2fb10e0f50e2d6c1() {
    var_b10ff79982c0153b = function_6c37d427b68ff9c7();
    return var_b10ff79982c0153b[5];
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76c
// Size: 0x1a
function function_7b09a3e02e70b0d2() {
    return isdefined(self.deathsdoor) && self.deathsdoor;
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78e
// Size: 0x1a
function function_b8c77229d67126bf() {
    return isdefined(self.focus) && self.focus;
}

// Namespace heartbeat/namespace_a81abcc503139256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b0
// Size: 0x2e
function function_7c867ea17d64a37c(var_23eeaa8c13b1cb24) {
    if (!function_c2be12529b0f0ad2()) {
        return;
    }
    self [[ level.heartbeat.var_230b60ef0852dcb8 ]](var_23eeaa8c13b1cb24);
}

