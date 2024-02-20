// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;

#namespace namespace_c99fa20598aa51f9;

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249
// Size: 0x94
function function_58bf160252f94e21() {
    if (isdefined(level.var_216a5e72460de468)) {
        return;
    }
    level.var_216a5e72460de468 = 1;
    level.var_bcb3e1f6f7cd3cb7 = spawnstruct();
    level.var_bcb3e1f6f7cd3cb7.partition = function_21a6a1c613b50a28([], 4000);
    level.var_bcb3e1f6f7cd3cb7.var_7838030d3c23488e = getdvarint(@"hash_e4a881a4b29b1041", 1000);
    level.var_bcb3e1f6f7cd3cb7.var_20ffb6b1b8a910c2 = getdvarint(@"hash_37124040df88eccb", 4000);
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e4
// Size: 0x8e
function function_60cba38635fd35cb(equipmentref, var_cbb2b3d05e48bd27, variantid) {
    if (equipmentref != "equip_geigercounter" && equipmentref != "equip_rfid") {
        return;
    }
    function_58bf160252f94e21();
    var_14edd9c1de4aaf82 = ter_op(equipmentref == "equip_rfid", 1, 0);
    self setclientomnvar("ui_geigercounter_type", var_14edd9c1de4aaf82);
    self notifyonplayercommand("pullout_gc", "+smoke");
    self notify("geigercounter_take");
    thread geigercounter_watchForDevicePullout();
    function_c8b79f6694c62ee8(-1);
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379
// Size: 0x4f
function function_bdd02627bcafe359(equipmentref, var_cbb2b3d05e48bd27) {
    if (equipmentref != "equip_geigercounter" && equipmentref != "equip_rfid") {
        return;
    }
    self notifyonplayercommandremove("pullout_gc", "+smoke");
    self notify("geigercounter_take");
    function_c8b79f6694c62ee8(-1);
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cf
// Size: 0x28
function function_3d5c1674387c936e(grenade) {
    waitframe();
    if (isdefined(grenade)) {
        grenade delete();
    }
    self notify("geigercounter_putaway");
    function_ce0fef2f2c7f1717();
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe
// Size: 0x16d
function geigercounter_watchForDevicePullout() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("geigercounter_watchForDevicePullout");
    self endon("geigercounter_watchForDevicePullout");
    var_c05958d616ddf1c5 = spawnstruct();
    childthread function_9b3c029182bf2647(var_c05958d616ddf1c5);
    childthread function_f668eed31b686b60(var_c05958d616ddf1c5);
    while (1) {
        death = istrue(var_c05958d616ddf1c5.death);
        take = istrue(var_c05958d616ddf1c5.take);
        var_4b47429f8d0d3ee5 = istrue(var_c05958d616ddf1c5.var_4b47429f8d0d3ee5);
        if (death || take) {
            self notify("geigercounter_watchRaceEnd");
            return;
        }
        if (istrue(self.inlaststand)) {
            waitframe();
            continue;
        }
        if (!isdefined(self.var_bcb3e1f6f7cd3cb7)) {
            self.var_bcb3e1f6f7cd3cb7 = spawnstruct();
        }
        outofrange = 1;
        self.var_bcb3e1f6f7cd3cb7.var_e91c9347e638750d = function_eff6d6db587f143d();
        if (isdefined(self.var_bcb3e1f6f7cd3cb7.var_e91c9347e638750d)) {
            var_1e331291fa3bd60 = function_296cad0fb60ab083(self.var_bcb3e1f6f7cd3cb7.var_e91c9347e638750d);
            if (function_4385c3a2905eef3b(self, var_1e331291fa3bd60)) {
                outofrange = 0;
                function_bcbff1c1b64843b6(var_1e331291fa3bd60);
            } else {
                outofrange = function_f6ae22a0ef39407b();
            }
        } else {
            outofrange = function_f6ae22a0ef39407b();
        }
        if (istrue(outofrange)) {
            function_c8b79f6694c62ee8(-1);
        }
        waitframe();
    }
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x572
// Size: 0x91
function function_f6ae22a0ef39407b() {
    if (issharedfuncdefined("radiation", "radiation_isInit") && issharedfuncdefined("radiation", "radiation_signedDistanceFromRadiationCircle")) {
        if ([[ namespace_3c37cb17ade254d::getsharedfunc("radiation", "radiation_isInit") ]]()) {
            var_7541c0ea78d6cdaf = [[ namespace_3c37cb17ade254d::getsharedfunc("radiation", "radiation_signedDistanceFromRadiationCircle") ]](self.origin);
            if (var_7541c0ea78d6cdaf < level.var_bcb3e1f6f7cd3cb7.var_7838030d3c23488e) {
                function_bcbff1c1b64843b6(99999999999);
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b
// Size: 0x24a
function function_bcbff1c1b64843b6(dist) {
    if (getweaponbasename(self getheldoffhand()) == "geiger_counter_mp") {
        self.var_bcb3e1f6f7cd3cb7.var_4b47429f8d0d3ee5 = 1;
        self.var_bcb3e1f6f7cd3cb7.var_5b02e3a063eb58b1 = gettime();
        self.var_bcb3e1f6f7cd3cb7.var_f458338f4188859e = _geigercounter_calculateGeigerCounterPulseRate(dist, self.var_bcb3e1f6f7cd3cb7.var_e91c9347e638750d);
        if (!isdefined(self.var_bcb3e1f6f7cd3cb7.var_7d4af218f4963c47)) {
            self.var_bcb3e1f6f7cd3cb7.var_7d4af218f4963c47 = 0;
        }
        if (isdefined(self.var_bcb3e1f6f7cd3cb7.var_e91c9347e638750d)) {
            object = self.var_bcb3e1f6f7cd3cb7.var_e91c9347e638750d;
            if (isdefined(object.var_9d4873a013fb19ab) && isdefined(self.team) && !array_contains(object.var_f967e4de0363ea83, self.team)) {
                minvalue = object.var_44c91f16317bb5c2;
                if (!isdefined(minvalue) || isdefined(minvalue) && minvalue <= 1.4 - self.var_bcb3e1f6f7cd3cb7.var_f458338f4188859e) {
                    namespace_aad14af462a74d08::function_8359cadd253f9604(self, object.var_9d4873a013fb19ab, 1);
                    object.var_f967e4de0363ea83[object.var_f967e4de0363ea83.size] = self.team;
                }
            }
        }
        function_c8b79f6694c62ee8(clamp(1.4 - self.var_bcb3e1f6f7cd3cb7.var_f458338f4188859e, 0, 1.4));
        if (self.var_bcb3e1f6f7cd3cb7.var_7d4af218f4963c47 >= self.var_bcb3e1f6f7cd3cb7.var_f458338f4188859e) {
            function_18ad59d3abd30f4();
            self.var_bcb3e1f6f7cd3cb7.var_7d4af218f4963c47 = 0;
        }
        self.var_bcb3e1f6f7cd3cb7.var_7d4af218f4963c47 = self.var_bcb3e1f6f7cd3cb7.var_7d4af218f4963c47 + level.framedurationseconds;
    } else {
        function_c8b79f6694c62ee8(-0.25);
    }
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85c
// Size: 0x1b
function function_a9d03825299dd6bf() {
    if (getweaponbasename(self getheldoffhand()) == "geiger_counter_mp") {
        return 1;
    }
    return 0;
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87f
// Size: 0x31
function function_9b3c029182bf2647(var_c05958d616ddf1c5) {
    self endon("geigercounter_watchRaceEnd");
    self waittill("death");
    var_c05958d616ddf1c5.death = 1;
    self notify("geigercounter_watchRaceStart");
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b7
// Size: 0x31
function function_f668eed31b686b60(var_c05958d616ddf1c5) {
    self endon("geigercounter_watchRaceEnd");
    self waittill("geigercounter_take");
    var_c05958d616ddf1c5.take = 1;
    self notify("geigercounter_watchRaceStart");
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ef
// Size: 0x5b
function function_841d127cb52727a9(var_c05958d616ddf1c5) {
    self endon("geigercounter_watchRaceEnd");
    weapon = self waittill("pullout_gc");
    while (1) {
        if (getweaponbasename(self getheldoffhand()) == "geiger_counter_mp") {
            break;
        }
    }
    var_c05958d616ddf1c5.var_4b47429f8d0d3ee5 = 1;
    self notify("geigercounter_watchRaceStart");
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x951
// Size: 0x48
function function_b33a67426542b0c5(var_c05958d616ddf1c5) {
    self endon("geigercounter_watchRaceEnd");
    while (1) {
        if (getweaponbasename(self getheldoffhand()) == "geiger_counter_mp") {
            break;
        }
    }
    var_c05958d616ddf1c5.var_69b82c8e2d0cf148 = 1;
    self notify("geigercounter_watchRaceEnd");
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a0
// Size: 0x43
function function_ce0fef2f2c7f1717() {
    self notify("geigercounter_putaway");
    if (isdefined(self.var_bcb3e1f6f7cd3cb7)) {
        self.var_bcb3e1f6f7cd3cb7.var_4b47429f8d0d3ee5 = undefined;
        self.var_bcb3e1f6f7cd3cb7 = undefined;
        function_5600972de1b79706();
        function_c5211deb59bc819a();
    }
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ea
// Size: 0x25
function function_27b913c5a2199f7f() {
    return isdefined(self.var_bcb3e1f6f7cd3cb7) && istrue(self.var_bcb3e1f6f7cd3cb7.var_4b47429f8d0d3ee5);
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa17
// Size: 0x10
function function_c5211deb59bc819a() {
    self setclientomnvar("ui_geigercounter_meter", 0);
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2e
// Size: 0x19
function function_7842c49c4d21bd5b(data) {
    self setclientomnvar("ui_geigercounter_meter", data);
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4e
// Size: 0x3b
function function_18ad59d3abd30f4() {
    var_506ef0d96798eae = self getclientomnvar("ui_geigercounter_type");
    if (var_506ef0d96798eae == 1) {
        self playlocalsound("rfid_tick");
    } else {
        self playlocalsound("iw9_geiger_counter_tick");
    }
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa90
// Size: 0x3b
function function_5600972de1b79706() {
    var_506ef0d96798eae = self getclientomnvar("ui_geigercounter_type");
    if (var_506ef0d96798eae == 1) {
        self stoplocalsound("rfid_tick");
    } else {
        self stoplocalsound("iw9_geiger_counter_tick");
    }
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad2
// Size: 0x36
function function_c8b79f6694c62ee8(var_17b73aa1820974ee) {
    if (isdefined(var_17b73aa1820974ee)) {
        function_7842c49c4d21bd5b(var_17b73aa1820974ee);
    } else {
        function_7842c49c4d21bd5b(self.var_bcb3e1f6f7cd3cb7.var_f458338f4188859e);
    }
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0f
// Size: 0x27
function function_f0d61e14dfde9ccd(object) {
    level.var_bcb3e1f6f7cd3cb7.partition function_24bbefb4beda630d(object);
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3d
// Size: 0x27
function function_a67007b5af86ff0b(object) {
    level.var_bcb3e1f6f7cd3cb7.partition function_9cd3f5f067afea37(object);
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6b
// Size: 0x7f
function function_38c53210a5291d71(object) {
    if (!isdefined(object) || isstruct(object)) {
        return 0;
    }
    var_9ec65174dfc8fb4a = isent(object) && object isscriptable() || !isent(object) && object function_73cc0f04c4c5001d();
    return var_9ec65174dfc8fb4a && object function_73cc0f04c4c5001d() && object getscriptablehaspart("brloot_valuable_fuelrods") && object getscriptablepartstate("brloot_valuable_fuelrods", 1) == "hidden";
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf2
// Size: 0x71
function function_eff6d6db587f143d() {
    object = level.var_bcb3e1f6f7cd3cb7.partition function_60dbe20f8385f1b0(self.origin);
    while (function_38c53210a5291d71(object)) {
        function_a67007b5af86ff0b(object);
        object = level.var_bcb3e1f6f7cd3cb7.partition function_60dbe20f8385f1b0(self.origin);
        if (!isdefined(object)) {
            return undefined;
        }
    }
    return object;
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6b
// Size: 0x3d
function function_296cad0fb60ab083(var_476ba0cad41d3b92) {
    var_5d1a77c029c6a066 = var_476ba0cad41d3b92.origin;
    var_1e331291fa3bd60 = distancesquared(var_5d1a77c029c6a066, self.origin);
    return var_1e331291fa3bd60;
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb0
// Size: 0x3d
function function_4385c3a2905eef3b(player, var_1e331291fa3bd60) {
    return var_1e331291fa3bd60 < level.var_bcb3e1f6f7cd3cb7.var_20ffb6b1b8a910c2 * level.var_bcb3e1f6f7cd3cb7.var_20ffb6b1b8a910c2;
}

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf5
// Size: 0x2e5
function _geigercounter_calculateGeigerCounterPulseRate(var_1e331291fa3bd60, object) {
    self notify("_geigercounter_calculateGeigerCounterPulseRate");
    self endon("_geigercounter_calculateGeigerCounterPulseRate");
    self endon("disconnect");
    var_506ef0d96798eae = self getclientomnvar("ui_geigercounter_type");
    var_9068cb3a62d2ccd4 = 0.1;
    var_e3125b80ae68f4b1 = ter_op(var_506ef0d96798eae == 0, "iw9_geiger_counter_tick", "rfid_tick");
    minwait = lookupsoundlength(var_e3125b80ae68f4b1) / 1000;
    maxwait = 1.4;
    mindist = 0;
    maxdist = level.var_bcb3e1f6f7cd3cb7.var_20ffb6b1b8a910c2;
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
                var_96ce362a2e74a8e2 = clamp(-1 * var_7541c0ea78d6cdaf / level.var_bcb3e1f6f7cd3cb7.var_7838030d3c23488e + 1, 0, 1);
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

// Namespace namespace_c99fa20598aa51f9/namespace_96abc792b7f61807
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe2
// Size: 0x3b
function function_a8a342d8f1a62582() {
    if (function_27b913c5a2199f7f()) {
        return (clamp(1.4 - self.var_bcb3e1f6f7cd3cb7.var_f458338f4188859e, 0, 1.4) / 1.4 * 10);
    }
    return 0;
}

