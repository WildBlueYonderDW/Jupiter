// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_9b79b9aed8c23433;

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x221
// Size: 0xb1
function function_af629bfd2cc31d67() {
    if (isdefined(level.var_9c6bcabc08e74a5e)) {
        return;
    }
    level.var_9c6bcabc08e74a5e = 1;
    level.var_b38bd8b30b329ecd = spawnstruct();
    level.var_b38bd8b30b329ecd.partition = function_21a6a1c613b50a28([], 4000);
    level.var_b38bd8b30b329ecd.var_7838030d3c23488e = getdvarint(@"hash_ac8dcf3f0fa3df5b", 1000);
    registersharedfunc("equip_aethercounter", "used", &function_88108e9a7fefa45c);
    registersharedfunc("equip_aethercounter", "onGive", &function_2ee478f031f97735);
    registersharedfunc("equip_aethercounter", "onTake", &function_3bf23e1e0eccb4a7);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d9
// Size: 0x53
function function_2ee478f031f97735(equipmentref, var_cbb2b3d05e48bd27) {
    if (equipmentref != "equip_aethercounter") {
        return;
    }
    function_af629bfd2cc31d67();
    self notifyonplayercommand("pullout_gc", "+smoke");
    self notify("aethercounter_take");
    thread aethercounter_watchForDevicePullout();
    function_b725c6b75eac64a(-1);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x333
// Size: 0x44
function function_3bf23e1e0eccb4a7(equipmentref, var_cbb2b3d05e48bd27) {
    if (equipmentref != "equip_aethercounter") {
        return;
    }
    self notifyonplayercommandremove("pullout_gc", "+smoke");
    self notify("aethercounter_take");
    function_b725c6b75eac64a(-1);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37e
// Size: 0x28
function function_88108e9a7fefa45c(grenade) {
    waitframe();
    if (isdefined(grenade)) {
        grenade delete();
    }
    self notify("aethercounter_putaway");
    function_b914dca03eb66c0d();
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ad
// Size: 0x18a
function aethercounter_watchForDevicePullout() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("aethercounter_watchForDevicePullout");
    self endon("aethercounter_watchForDevicePullout");
    var_c05958d616ddf1c5 = spawnstruct();
    childthread function_f7c4dd82fc32c7b9(var_c05958d616ddf1c5);
    childthread function_9df43daca6fc5bc2(var_c05958d616ddf1c5);
    while (1) {
        death = istrue(var_c05958d616ddf1c5.death);
        take = istrue(var_c05958d616ddf1c5.take);
        var_4b47429f8d0d3ee5 = istrue(var_c05958d616ddf1c5.var_4b47429f8d0d3ee5);
        if (death || take) {
            self notify("aethercounter_watchRaceEnd");
            return;
        }
        if (istrue(self.inlaststand)) {
            waitframe();
            continue;
        }
        if (!isdefined(self.var_b38bd8b30b329ecd)) {
            self.var_b38bd8b30b329ecd = spawnstruct();
        }
        outofrange = 1;
        self.var_b38bd8b30b329ecd.var_e91c9347e638750d = function_c621b72b61c253ef();
        if (isdefined(self.var_b38bd8b30b329ecd.var_e91c9347e638750d)) {
            var_1e331291fa3bd60 = function_2588ffec6fe5bd6d(self.var_b38bd8b30b329ecd.var_e91c9347e638750d);
            if (function_2d56da6c95356759(self, var_1e331291fa3bd60, self.var_b38bd8b30b329ecd.var_e91c9347e638750d.var_64051444a5c64bad)) {
                outofrange = 0;
                function_8031a35aa804e254(var_1e331291fa3bd60);
            } else {
                outofrange = function_92d0e5b2f76e0fe5();
            }
        } else {
            outofrange = function_92d0e5b2f76e0fe5();
        }
        if (istrue(outofrange)) {
            function_b725c6b75eac64a(-1);
        }
        waitframe();
    }
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53e
// Size: 0x91
function function_92d0e5b2f76e0fe5() {
    if (issharedfuncdefined("radiation", "radiation_isInit") && issharedfuncdefined("radiation", "radiation_signedDistanceFromRadiationCircle")) {
        if ([[ namespace_3c37cb17ade254d::getsharedfunc("radiation", "radiation_isInit") ]]()) {
            var_7541c0ea78d6cdaf = [[ namespace_3c37cb17ade254d::getsharedfunc("radiation", "radiation_signedDistanceFromRadiationCircle") ]](self.origin);
            if (var_7541c0ea78d6cdaf < level.var_b38bd8b30b329ecd.var_7838030d3c23488e) {
                function_8031a35aa804e254(99999999999);
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d7
// Size: 0x149
function function_8031a35aa804e254(dist) {
    if (getweaponbasename(self getheldoffhand()) == "aether_counter_mp") {
        self.var_b38bd8b30b329ecd.var_4b47429f8d0d3ee5 = 1;
        self.var_b38bd8b30b329ecd.var_f458338f4188859e = _aethercounter_calculateaetherCounterPulseRate(dist, self.var_b38bd8b30b329ecd.var_e91c9347e638750d);
        if (!isdefined(self.var_b38bd8b30b329ecd.var_7d4af218f4963c47)) {
            self.var_b38bd8b30b329ecd.var_7d4af218f4963c47 = 0;
        }
        function_b725c6b75eac64a(clamp(1.4 - self.var_b38bd8b30b329ecd.var_f458338f4188859e, 0, 1.4));
        if (self.var_b38bd8b30b329ecd.var_7d4af218f4963c47 >= self.var_b38bd8b30b329ecd.var_f458338f4188859e) {
            function_8f4759d455d12f06();
            self.var_b38bd8b30b329ecd.var_7d4af218f4963c47 = 0;
        }
        self.var_b38bd8b30b329ecd.var_7d4af218f4963c47 = self.var_b38bd8b30b329ecd.var_7d4af218f4963c47 + level.framedurationseconds;
    } else {
        function_b725c6b75eac64a(-0.25);
    }
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x727
// Size: 0x1b
function function_5a5133a5c98f4851() {
    if (getweaponbasename(self getheldoffhand()) == "aether_counter_mp") {
        return 1;
    }
    return 0;
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74a
// Size: 0x31
function function_f7c4dd82fc32c7b9(var_c05958d616ddf1c5) {
    self endon("aethercounter_watchRaceEnd");
    self waittill("death");
    var_c05958d616ddf1c5.death = 1;
    self notify("aethercounter_watchRaceStart");
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x782
// Size: 0x31
function function_9df43daca6fc5bc2(var_c05958d616ddf1c5) {
    self endon("aethercounter_watchRaceEnd");
    self waittill("aethercounter_take");
    var_c05958d616ddf1c5.take = 1;
    self notify("aethercounter_watchRaceStart");
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ba
// Size: 0x5b
function function_5aab43e8311b7e7f(var_c05958d616ddf1c5) {
    self endon("aethercounter_watchRaceEnd");
    weapon = self waittill("pullout_gc");
    while (1) {
        if (getweaponbasename(self getheldoffhand()) == "aether_counter_mp") {
            break;
        }
    }
    var_c05958d616ddf1c5.var_4b47429f8d0d3ee5 = 1;
    self notify("aethercounter_watchRaceStart");
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81c
// Size: 0x48
function function_824860a3ff9ea883(var_c05958d616ddf1c5) {
    self endon("aethercounter_watchRaceEnd");
    while (1) {
        if (getweaponbasename(self getheldoffhand()) == "aether_counter_mp") {
            break;
        }
    }
    var_c05958d616ddf1c5.var_69b82c8e2d0cf148 = 1;
    self notify("aethercounter_watchRaceEnd");
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x86b
// Size: 0x43
function function_b914dca03eb66c0d() {
    self notify("aethercounter_putaway");
    if (isdefined(self.var_b38bd8b30b329ecd)) {
        self.var_b38bd8b30b329ecd.var_4b47429f8d0d3ee5 = undefined;
        self.var_b38bd8b30b329ecd = undefined;
        function_e9db195fe373a520();
        function_7812e187185aef80();
    }
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b5
// Size: 0x25
function function_1cfcd2b63bc91c2d() {
    return isdefined(self.var_b38bd8b30b329ecd) && istrue(self.var_b38bd8b30b329ecd.var_4b47429f8d0d3ee5);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e2
// Size: 0x10
function function_7812e187185aef80() {
    self setclientomnvar("ui_geigercounter_meter", 0);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8f9
// Size: 0x19
function function_90f4a7cf8aae35c5(data) {
    self setclientomnvar("ui_geigercounter_meter", data);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x919
// Size: 0xf
function function_8f4759d455d12f06() {
    self playlocalsound("iw9_geiger_counter_tick");
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92f
// Size: 0xf
function function_e9db195fe373a520() {
    self stoplocalsound("iw9_geiger_counter_tick");
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x945
// Size: 0x36
function function_b725c6b75eac64a(var_17b73aa1820974ee) {
    if (isdefined(var_17b73aa1820974ee)) {
        function_90f4a7cf8aae35c5(var_17b73aa1820974ee);
    } else {
        function_90f4a7cf8aae35c5(self.var_b38bd8b30b329ecd.var_f458338f4188859e);
    }
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x982
// Size: 0x27
function function_81e4d8ae8de025ab(object) {
    level.var_b38bd8b30b329ecd.partition function_24bbefb4beda630d(object);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b0
// Size: 0x27
function function_2e0a6a72e3e7388d(object) {
    level.var_b38bd8b30b329ecd.partition function_9cd3f5f067afea37(object);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9de
// Size: 0x25
function function_c621b72b61c253ef() {
    return level.var_b38bd8b30b329ecd.partition function_60dbe20f8385f1b0(self.origin);
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0b
// Size: 0x3d
function function_2588ffec6fe5bd6d(var_476ba0cad41d3b92) {
    var_5d1a77c029c6a066 = var_476ba0cad41d3b92.origin;
    var_1e331291fa3bd60 = distancesquared(var_5d1a77c029c6a066, self.origin);
    return var_1e331291fa3bd60;
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa50
// Size: 0x36
function function_2d56da6c95356759(player, var_1e331291fa3bd60, var_98a5e37618751295) {
    detectionradius = function_53c4c53197386572(var_98a5e37618751295, 4000);
    return var_1e331291fa3bd60 < detectionradius * detectionradius;
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa8e
// Size: 0x2b4
function _aethercounter_calculateaetherCounterPulseRate(var_1e331291fa3bd60, object) {
    self notify("_aethercounter_calculateaetherCounterPulseRate");
    self endon("_aethercounter_calculateaetherCounterPulseRate");
    self endon("disconnect");
    var_9068cb3a62d2ccd4 = 0.1;
    minwait = lookupsoundlength("iw9_aether_counter_tick") / 1000;
    maxwait = 1.4;
    mindist = 0;
    maxdist = function_53c4c53197386572(object.var_64051444a5c64bad, 4000);
    dist = sqrt(var_1e331291fa3bd60);
    waittime = minwait;
    var_ed5f1e37b41969e0 = minwait;
    var_406567975ead0d9a = minwait;
    var_488d4c5202017acd = 0;
    var_e1a6796d6725e569 = clamp(-1 * (dist - mindist) / (maxdist - mindist) + 1, 0, 1);
    var_96ce362a2e74a8e2 = 0;
    if (issharedfuncdefined("radiation", "radiation_isInit") && issharedfuncdefined("radiation", "radiation_signedDistanceFromRadiationCircle")) {
        if ([[ namespace_3c37cb17ade254d::getsharedfunc("radiation", "radiation_isInit") ]]()) {
            var_7541c0ea78d6cdaf = [[ namespace_3c37cb17ade254d::getsharedfunc("radiation", "radiation_signedDistanceFromRadiationCircle") ]](self.origin);
            in_radiation = var_7541c0ea78d6cdaf <= 0;
            if (in_radiation) {
                var_96ce362a2e74a8e2 = 1;
            } else {
                var_96ce362a2e74a8e2 = clamp(-1 * var_7541c0ea78d6cdaf / level.var_b38bd8b30b329ecd.var_7838030d3c23488e + 1, 0, 1);
            }
        }
    }
    var_63783fa82077e962 = 0;
    if (isdefined(object)) {
        player_forward = anglestoforward(self getplayerangles());
        var_4712089f9a28931d = vectornormalize(object.origin - self.origin);
        var_fce87949c9b65851 = vectordot(player_forward, var_4712089f9a28931d);
        var_63783fa82077e962 = clamp(20 * var_e1a6796d6725e569, 0, 1) * (var_fce87949c9b65851 + 1) / 2;
    }
    var_488d4c5202017acd = clamp(var_e1a6796d6725e569 * 0.8 + var_63783fa82077e962 * 0.2 + var_96ce362a2e74a8e2 * 1, 0, 1);
    if (isdefined(object) && isdefined(object.var_71a737239e0ee274)) {
        var_488d4c5202017acd = var_488d4c5202017acd * object.var_71a737239e0ee274;
    }
    waittime = (-1 * var_488d4c5202017acd + 1) * maxwait;
    return waittime;
}

// Namespace namespace_9b79b9aed8c23433/namespace_4a644dfa913c019
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd4a
// Size: 0x3b
function function_f2aa833e16733c5e() {
    if (function_1cfcd2b63bc91c2d()) {
        return (clamp(1.4 - self.var_b38bd8b30b329ecd.var_f458338f4188859e, 0, 1.4) / 1.4 * 10);
    }
    return 0;
}

