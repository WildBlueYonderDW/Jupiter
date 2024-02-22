// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_9e85c6b7b4fb5ff9;

// Namespace namespace_9e85c6b7b4fb5ff9/namespace_421fb1e92658d94c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b
// Size: 0x2e1
function function_c31b39e6bb1bcd42() {
    self endon("death");
    self.var_8784c427b1af24a6 = [];
    self.entstouching = [];
    var_a92d51fdc6322f7e = !self vehicle_isphysveh() || self vehicle_isonground();
    while (1) {
        var_94f44a9bf5737c52 = [];
        foreach (player in utility::playersnear(self.origin, 550)) {
            if (isdefined(player) && player _isalive() && isdefined(player.guid) && !player function_793f941d7dff15ed() && isdefined(player getmovingplatformparent()) && player getmovingplatformparent() == self) {
                var_94f44a9bf5737c52[player.guid] = 1;
                if (!isdefined(self.var_8784c427b1af24a6[player.guid])) {
                    self.var_8784c427b1af24a6[player.guid] = player;
                    function_153a6accf001dff6(player);
                }
                isininterior = function_3d25af3a88ad31c3(player);
                if (!istrue(player.var_54a215ef59a7a0c3) && isininterior) {
                    function_3ffe455e5ea6d0f5(player);
                } else if (istrue(player.var_54a215ef59a7a0c3) && !isininterior) {
                    function_b2cc563ed7324a8d(player);
                }
                player.var_54a215ef59a7a0c3 = isininterior;
            }
        }
        foreach (guid, player in self.var_8784c427b1af24a6) {
            if (!istrue(var_94f44a9bf5737c52[guid])) {
                self.var_8784c427b1af24a6[guid] = undefined;
                function_71adb8f84c3df6bb(player);
                if (istrue(player.var_54a215ef59a7a0c3)) {
                    function_b2cc563ed7324a8d(player);
                }
                if (isdefined(player)) {
                    player.var_54a215ef59a7a0c3 = undefined;
                }
            }
        }
        onground = function_3a5fc0673be748ae();
        if (onground != var_a92d51fdc6322f7e) {
            if (!onground) {
                foreach (player in self.var_8784c427b1af24a6) {
                    player vehicle_occupancy_startmovefeedbackforplayer();
                }
            } else {
                foreach (player in self.var_8784c427b1af24a6) {
                    player vehicle_occupancy_stopmovefeedbackforplayer();
                }
            }
        }
        var_a92d51fdc6322f7e = onground;
        wait(0.25);
    }
}

// Namespace namespace_9e85c6b7b4fb5ff9/namespace_421fb1e92658d94c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x423
// Size: 0x14
function private function_3a5fc0673be748ae() {
    return !self vehicle_isphysveh() || self vehicle_isonground();
}

// Namespace namespace_9e85c6b7b4fb5ff9/namespace_421fb1e92658d94c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f
// Size: 0x121
function function_153a6accf001dff6(player) {
    if (!function_3a5fc0673be748ae()) {
        player vehicle_occupancy_startmovefeedbackforplayer();
    }
    if (isdefined(self.onstartriding)) {
        self [[ self.onstartriding ]](player);
    }
    if (!istrue(self.var_9bd69326cfeb9fe9)) {
        namespace_84cff6185e39aa66::function_d2d9c09551d91164(self, player);
    }
    if (!isdefined(level.var_b531611b8d662db7)) {
        level.var_b531611b8d662db7 = getdvarint(@"hash_dee18061c0d4dfe", ter_op(namespace_36f464722d326bbe::isbrstylegametype(), 0, 1)) == 1;
    }
    if (!level.var_b531611b8d662db7) {
        return;
    }
    vehicleteam = vehicle_occupancy_getteamfriendlyto(self);
    if (isdefined(vehicleteam) && isdefined(player.team) && vehicleteam != "neutral" && vehicleteam != player.team && issharedfuncdefined("game", "onEnterOOBTrigger")) {
        player.var_1f34845fdd0a6631 = 1;
        self [[ getsharedfunc("game", "onEnterOOBTrigger") ]](self, player);
    } else {
        player.var_1f34845fdd0a6631 = undefined;
    }
    vehicle_spawn_stopwatchingabandoned();
}

// Namespace namespace_9e85c6b7b4fb5ff9/namespace_421fb1e92658d94c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x567
// Size: 0xae
function function_71adb8f84c3df6bb(player) {
    if (isdefined(player)) {
        player vehicle_occupancy_stopmovefeedbackforplayer();
        if (!isdefined(player.vehicle)) {
            namespace_84cff6185e39aa66::function_5211953231a09ed5(self, player);
        }
        if (isdefined(self.onendriding)) {
            self [[ self.onendriding ]](player);
        }
        if (istrue(player.var_1f34845fdd0a6631) && isdefined(player.oob) && player.oob > 0 && issharedfuncdefined("game", "onExitOOBTrigger")) {
            self [[ getsharedfunc("game", "onExitOOBTrigger") ]](self, player);
        }
    }
    thread vehicle_spawn_watchabandoned();
}

// Namespace namespace_9e85c6b7b4fb5ff9/namespace_421fb1e92658d94c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61c
// Size: 0x2a
function function_3ffe455e5ea6d0f5(player) {
    player setclienttriggeraudiozonepartial("iw9_palfa_interior", "reverb", "weapon_reflection");
    player notify("entered_vehicle_interior");
}

// Namespace namespace_9e85c6b7b4fb5ff9/namespace_421fb1e92658d94c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64d
// Size: 0x25
function function_b2cc563ed7324a8d(player) {
    if (isdefined(player)) {
        player clearclienttriggeraudiozone(0.5);
        player notify("exited_vehicle_interior");
    }
}

// Namespace namespace_9e85c6b7b4fb5ff9/namespace_421fb1e92658d94c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x679
// Size: 0x53
function function_3d25af3a88ad31c3(player) {
    if (!isdefined(self) || !isalive(self) || !isdefined(self.origin) || !isdefined(player) || !isdefined(player.origin)) {
        return 0;
    }
    return function_773691f1a617f7d9(player.origin);
}

// Namespace namespace_9e85c6b7b4fb5ff9/namespace_421fb1e92658d94c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d4
// Size: 0xf5
function function_773691f1a617f7d9(origin) {
    forward = anglestoforward(self.angles);
    up = anglestoup(self.angles);
    var_a011729d000a28d2 = origin - self.origin;
    transform = coordtransformtranspose(origin, self.origin, self.angles);
    forwarddist = transform[0];
    var_b383c5f0357008ae = transform[1];
    var_74da97ebca1ba2e7 = transform[2];
    var_9aa67bdf5007e363 = forwarddist > -225 && forwarddist < 225;
    var_91678d915537fe2d = var_b383c5f0357008ae > -60 && var_b383c5f0357008ae < 60;
    var_cbb36d65c8c53644 = var_74da97ebca1ba2e7 > -235 && var_74da97ebca1ba2e7 < -115;
    return var_9aa67bdf5007e363 && var_91678d915537fe2d && var_cbb36d65c8c53644;
}

