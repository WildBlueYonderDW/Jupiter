#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using script_2669878cf5a1b6bc;
#using script_429c2a03090c1ea1;
#using script_5762ac2f22202ba2;
#using script_77be8cd2b6610d5;
#using script_16ea1b94f0f381b3;
#using scripts\mp\mp_agent_damage.gsc;
#using script_6c6a46b757ce4c71;
#using script_73926eaf280b0b75;
#using script_554830d27078277d;
#using script_58682e6578ce0515;
#using script_6bffae1b97f70547;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\ob.gsc;
#using scripts\mp\vehicles\damage.gsc;

#namespace ob_damage;

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a
// Size: 0x99
function function_d3124a8270438a63() {
    level.modifyplayerdamage = &function_d4aa7cafd713196e;
    level.var_9b695d81b2f8bc58 = getdvarint(@"hash_f6c436971939cdb2", 200);
    level callback::add("on_zombie_ai_spawned", &function_6078f3e8c682a36);
    level callback::add("on_agent_spawned", &function_edf4c2f3f7732c67);
    level callback::add("on_zombie_ai_killed", &on_zombie_ai_killed);
    level callback::add("on_ai_killed", &function_e5ea18b76842725f);
    callback::function_e7fddda1f0b46b5e("zombie") callback::add("on_zombie_ai_damaged", &on_zombie_ai_damaged);
    /#
        level thread function_b904029d0acf2fd1();
    #/
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0xed
function function_d4aa7cafd713196e(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1) {
    if (isscriptedagent(eattacker) && eattacker.unittype == "soldier") {
        idamage = function_cf5321434f9b38c1(idamage, smeansofdeath, objweapon);
    }
    if (isdefined(einflictor)) {
        if (isdefined(einflictor.sentrytype) && einflictor.sentrytype == "ai_sentry_turret") {
            var_d11b5d9fd186a28 = int(idamage * 0.5);
        } else {
            var_d11b5d9fd186a28 = idamage;
        }
        return var_d11b5d9fd186a28;
    }
    if (isdefined(eattacker) && isdefined(eattacker.var_c70842e4e81f2852)) {
        return 0;
    }
    return idamage;
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x531
// Size: 0x47
function function_a1a83a29e4afe4f1() {
    assertex(isdefined(level.vehicles), "init_damage_callback_data() called before level.vehicles was initialized.");
    setdvarifuninitialized(@"hash_9cf7e7a1964e81cc", 0.65);
    level.vehicles.damagecallback = &function_73cfe327bdf9d28f;
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x580
// Size: 0xf8
function private function_edf4c2f3f7732c67(params) {
    agent = params.agent;
    if (agent.unittype != "soldier") {
        return;
    }
    agent.var_970170ffd4b081ac = &soldier_damage;
    var_473ec1e332bfd4a2 = ["molotov", "flashbang", "tear_gas", "thermobaric"];
    agent.var_2e2e7605fb14820a = [];
    foreach (exclusion in var_473ec1e332bfd4a2) {
        agent.var_2e2e7605fb14820a[exclusion] = 1;
    }
    agent.var_21a8839dd03e31cd = [];
    agent callback::add("on_soldier_ai_damaged", &on_soldier_ai_damaged);
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x680
// Size: 0x19
function private function_6078f3e8c682a36(params) {
    self.var_970170ffd4b081ac = &function_d88acf085f34a24f;
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a1
// Size: 0x764
function function_d88acf085f34a24f(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (!getdvarint(@"hash_721d365f6275dc03", 0)) {
        time = gettime();
        isshotgun = isdefined(sweapon) && isdefined(sweapon.classname) && sweapon.classname == "spread" && !sweapon.isalternate;
        if (!isshotgun && isdefined(self.var_1dd7e0b72616a4e3) && isdefined(eattacker) && isdefined(self.var_656f66bef07b9ddf) && self.var_1dd7e0b72616a4e3 == time && self.var_656f66bef07b9ddf == eattacker) {
            self.var_c7bdf3bff391f1dd++;
            if (self.var_c7bdf3bff391f1dd > getdvarint(@"hash_3ce8e17eda588850", 3)) {
                assertmsg("<dev string:x1c>");
                return 0;
            }
        } else {
            self.var_1dd7e0b72616a4e3 = time;
            self.var_656f66bef07b9ddf = eattacker;
            self.var_c7bdf3bff391f1dd = 1;
        }
    }
    dmg_struct = function_34e78cbd2dfff6df(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
    if (isdefined(self.var_d37b75616f7c2ee)) {
        dmg_struct.num_hits = self.var_d37b75616f7c2ee.num_hits;
    } else {
        dmg_struct.num_hits = 0;
    }
    dmg_struct.num_hits++;
    dmg_struct.var_2bd7283211fa61e7 = function_6a3d1a2884883a23(dmg_struct);
    assert(isdefined(dmg_struct.idamage));
    var_bfbe28d9bcd4f274 = function_6a0b029f221e0ffe(dmg_struct) == 0;
    if (function_b8fd1823ea584538(eattacker, objweapon, smeansofdeath) || var_bfbe28d9bcd4f274) {
        if (isplayer(eattacker) && self.team != eattacker.team) {
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", 0);
        }
        return 0;
    }
    dmg_struct.idamage = function_b5af5dd435f7f00a(dmg_struct);
    dmg_struct.idamage = function_73d296636c5ca3c6(dmg_struct);
    dmg_struct.idamage = function_942afcb4f4e24091(dmg_struct);
    dmg_struct.idamage = function_89cc24cfc33e2693(dmg_struct);
    dmg_struct.idamage = function_ba2823ac0204930c(dmg_struct);
    dmg_struct.idamage = function_f9c444fcf6bb992b(dmg_struct);
    dmg_struct.idamage = function_bc7da5341862e4e0(dmg_struct);
    assert(isdefined(dmg_struct.idamage) && dmg_struct.idamage > 0 && int(dmg_struct.idamage) > 0);
    dmg_struct.idamage = function_4948d7eacb9f12be(dmg_struct);
    if (isdefined(dmg_struct.eattacker) && isplayer(dmg_struct.eattacker.owner)) {
        dmg_struct.eattacker = dmg_struct.eattacker.owner;
    }
    if (isplayer(dmg_struct.eattacker)) {
        namespace_dc2e59577d3a271f::function_352659ff5187d66d(dmg_struct);
        dmg_struct.var_941802a0997e0c42 = self.var_941802a0997e0c42;
    }
    if (isexplosivedamagemod(smeansofdeath)) {
        if (issharedfuncdefined("thermobaric_grenade", "thermobaric_additional_explosive_damage")) {
            dmg_struct.idamage += [[ getsharedfunc("thermobaric_grenade", "thermobaric_additional_explosive_damage") ]](self, eattacker, dmg_struct.idamage);
        }
    }
    zombie_damage::function_6b8e5b333b2b3e43(dmg_struct);
    thread namespace_28253c2ed4569abd::function_5c8a92a87ae9751b(dmg_struct.eattacker, dmg_struct.var_feef4b237a6beb07, dmg_struct.metabonename, "hitarmorlight");
    zombie_damage::function_63e1cb89f73d0ad8(dmg_struct);
    zombie_damage::function_71a411d4b5466318(dmg_struct);
    zombie_damage::function_10a52a9d2dcaf262(dmg_struct);
    if (istrue(self.killondamage) && (!isdefined(self.aicategory) || self.aicategory != "boss")) {
        dmg_struct.idamage = self.health;
    }
    if (isdefined(eattacker) && (isplayer(eattacker) || isplayer(eattacker.owner))) {
        eplayer = eattacker;
        var_cb5826a84ea1330c = undefined;
        elementfeedback = undefined;
        if (isplayer(eattacker.owner)) {
            eplayer = eattacker.owner;
        }
        eplayer.pers["participation"] = 1;
        if (isarray(self.var_691b16f55274b1c5) && isdefined(dmg_struct.var_2bd7283211fa61e7)) {
            var_cb5826a84ea1330c = self.var_691b16f55274b1c5[dmg_struct.var_2bd7283211fa61e7];
        }
        if (mp_agent_damage::function_73075c88c97d2d50() && mp_agent_damage::function_87c3b43d00319847()) {
            mp_agent_damage::function_c54b2cc2e762c201(eplayer, self, shitloc, smeansofdeath, objweapon, int(dmg_struct.idamage), vpoint, 0, dmg_struct.var_2bd7283211fa61e7, dmg_struct.var_14edc6d1db3695bc, dmg_struct.var_feef4b237a6beb07);
        } else if (istrue(var_cb5826a84ea1330c) && (!isdefined(shitloc) || shitloc != "shield")) {
            elementfeedback = level.var_294d0b1503a8ccb9[dmg_struct.var_2bd7283211fa61e7];
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback(elementfeedback, dmg_struct.idamage >= self.health, dmg_struct.var_14edc6d1db3695bc);
        }
        if (isplayer(eattacker) && dmg_struct.idamage > 0 && (!isdefined(shitloc) || shitloc != "shield") && !isdefined(elementfeedback)) {
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", dmg_struct.idamage >= self.health, dmg_struct.var_14edc6d1db3695bc);
        }
    }
    self.var_d37b75616f7c2ee = dmg_struct;
    callback::callback("on_zombie_ai_damaged", dmg_struct);
    if (isdefined(eattacker) && (isdefined(eattacker.var_69b049cf4b18c73b) || isdefined(eattacker.zombiedamagemultiplier))) {
        n_multiplier = 1;
        if (isdefined(eattacker.var_69b049cf4b18c73b)) {
            n_multiplier = 200;
        } else if (isdefined(eattacker.zombiedamagemultiplier)) {
            n_multiplier = eattacker.zombiedamagemultiplier;
        }
        if (isdefined(dmg_struct) && isdefined(dmg_struct.idamage)) {
            dmg_struct.idamage *= n_multiplier;
        }
    }
    idamagenew = int(dmg_struct.idamage);
    if (!isdefined(idamagenew) || idamagenew < 0) {
        assert(0);
        idamagenew = 0;
    }
    return idamagenew;
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe0e
// Size: 0x85
function private on_zombie_ai_damaged(dmg_struct) {
    if (isplayer(dmg_struct.eattacker) && isdefined(self.var_21a8839dd03e31cd)) {
        self.var_21a8839dd03e31cd = function_6d6af8144a5131f1(self.var_21a8839dd03e31cd, dmg_struct.eattacker);
    }
    thread namespace_28253c2ed4569abd::function_45500125495e46a6(dmg_struct.eattacker, dmg_struct.var_feef4b237a6beb07, dmg_struct.metabonename, "hitarmorlightbreak");
    function_344933dc7e648343(dmg_struct);
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9b
// Size: 0x2ad
function function_344933dc7e648343(dmg_struct) {
    if (isdefined(dmg_struct.smeansofdeath) && dmg_struct.smeansofdeath == "MOD_CRUSH") {
        attackent = undefined;
        if (isdefined(dmg_struct.eattacker) && dmg_struct.eattacker scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            attackent = dmg_struct.eattacker;
        } else if (isdefined(dmg_struct.einflictor) && dmg_struct.einflictor scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            attackent = dmg_struct.einflictor;
        } else {
            return;
        }
        if (istrue(attackent.var_85ccbd4bc4b4b792) || istrue(attackent.var_aa4804cc1bc59e93)) {
            return;
        }
        attackent.var_7fff3293eab0f7b8 = 1;
        println("<dev string:x56>" + attackent.maxhealth);
        if (isdefined(attackent.maxhealth) && attackent.maxhealth > 0) {
            maximpact = attackent.maxhealth / 100 * 80;
            if (isdefined(self.var_d50c0574bc1995cc)) {
                if (time_has_passed(self.var_d50c0574bc1995cc, 1)) {
                    if (self.recentimpactdamage > maximpact) {
                        return;
                    } else {
                        self.var_d50c0574bc1995cc = gettime();
                        self.recentimpactdamage = 0;
                    }
                }
            } else {
                self.var_d50c0574bc1995cc = gettime();
                self.recentimpactdamage = 0;
            }
        }
        if (isdefined(dmg_struct.idamage)) {
            if (attackent vehicle_getspeed() < 5) {
                return;
            }
            if (dmg_struct.idamage < 15) {
                return;
            }
            var_c40c7a14462edbe6 = 41.1111;
            regiondifficulty = "difficulty_easy";
            if (isfunction(level.var_8241e0d86017df29)) {
                regiondifficulty = [[ level.var_8241e0d86017df29 ]](attackent.origin);
            }
            switch (regiondifficulty) {
            case #"hash_af83e47edfa8900a": 
                var_c40c7a14462edbe6 *= 2;
                break;
            case #"hash_5343b465e56ec9a4": 
                var_c40c7a14462edbe6 *= 5;
                break;
            case #"hash_651f76c0ad6741ec": 
                var_c40c7a14462edbe6 *= 10;
                break;
            }
            if (!is_equal(self.aicategory, "normal")) {
                var_c40c7a14462edbe6 *= 5;
            }
            var_c40c7a14462edbe6 = floor(var_c40c7a14462edbe6);
            if (isdefined(self.recentimpactdamage)) {
                self.recentimpactdamage += var_c40c7a14462edbe6;
            } else {
                self.recentimpactdamage = var_c40c7a14462edbe6;
            }
            attackent thread function_743e37eebd6ba8e2(var_c40c7a14462edbe6);
        }
    }
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1150
// Size: 0xb9
function function_743e37eebd6ba8e2(n_damage) {
    self endon("death");
    playsoundatpos(self.origin, "evt_zm_core_zombie_objective_impact");
    occupants = scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289(self, 0);
    if (isdefined(occupants)) {
        foreach (occupant in occupants) {
            if (isplayer(occupant)) {
                occupant playrumbleonpositionforclient("artillery_rumble_heavy", self.origin);
            }
        }
    }
    scripts\common\vehicle::vehicle_damage(n_damage);
    wait 0.1;
    self.var_7fff3293eab0f7b8 = undefined;
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1211
// Size: 0x49
function private function_3c80d46239ce0a0e(dmg_struct, shitloc, var_29a8ba8c9dd43fd2) {
    if (shitloc == "head" || shitloc == "neck") {
        dmg_struct.var_14edc6d1db3695bc = 1;
    }
    return dmg_struct.idamage;
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1263
// Size: 0x531
function soldier_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    if (istrue(self.var_f327ed481efe4857)) {
        return 0;
    }
    dmg_struct = spawnstruct();
    dmg_struct.einflictor = einflictor;
    dmg_struct.eattacker = eattacker;
    dmg_struct.idamage = idamage;
    dmg_struct.idflags = idflags;
    dmg_struct.smeansofdeath = smeansofdeath;
    dmg_struct.sweapon = sweapon;
    dmg_struct.vpoint = vpoint;
    dmg_struct.vdir = vdir;
    dmg_struct.shitloc = shitloc;
    dmg_struct.timeoffset = timeoffset;
    dmg_struct.modelindex = modelindex;
    dmg_struct.partname = partname;
    dmg_struct.objweapon = objweapon;
    dmg_struct.var_14edc6d1db3695bc = 0;
    dmg_struct.var_feef4b237a6beb07 = 0;
    if (isdefined(self.var_d37b75616f7c2ee)) {
        dmg_struct.num_hits = self.var_d37b75616f7c2ee.num_hits;
    } else {
        dmg_struct.num_hits = 0;
    }
    dmg_struct.num_hits++;
    var_29a8ba8c9dd43fd2 = 0;
    if (issharedfuncdefined("zombie", "get_pap_level") && isplayer(dmg_struct.eattacker)) {
        var_29a8ba8c9dd43fd2 = dmg_struct.eattacker function_f3bb4f4911a1beb2("zombie", "get_pap_level", dmg_struct.objweapon);
    }
    dmg_struct.idamage = function_6a0b029f221e0ffe(dmg_struct);
    if (var_29a8ba8c9dd43fd2 >= 1) {
        dmg_struct.idamage /= 2;
    }
    if (dmg_struct.smeansofdeath == "MOD_PROJECTILE" && isdefined(eattacker) && isdefined(eattacker.var_4d7c50ad1d6ba348)) {
        dmg_struct.idamage *= eattacker.var_4d7c50ad1d6ba348;
    }
    dmg_struct.idamage = function_3c80d46239ce0a0e(dmg_struct, shitloc, var_29a8ba8c9dd43fd2);
    if (isplayer(eattacker) && issharedfuncdefined("player", "onHumanGunPowerupDamage")) {
        adjusted_damage = eattacker [[ getsharedfunc("player", "onHumanGunPowerupDamage") ]](dmg_struct);
        if (adjusted_damage != -1) {
            dmg_struct.idamage = adjusted_damage;
        }
    }
    final_damage = dmg_struct.idamage;
    if (isarray(level.var_8c2b0fd37157f872)) {
        foreach (func in level.var_8c2b0fd37157f872) {
            new_damage = self [[ func ]](dmg_struct);
            if (new_damage != -1) {
                final_damage = new_damage;
            }
        }
        dmg_struct.idamage = final_damage;
    }
    if (isdefined(eattacker) && (isplayer(eattacker) || isplayer(eattacker.owner)) && !is_equal(eattacker.team, self.team)) {
        eplayer = eattacker;
        var_2bd7283211fa61e7 = get_element(sweapon);
        if (isplayer(eattacker.owner)) {
            eplayer = eattacker.owner;
        }
        eplayer.pers["participation"] = 1;
        if (mp_agent_damage::function_9db5f6f105cde5da()) {
            mp_agent_damage::function_c54b2cc2e762c201(eplayer, self, shitloc, smeansofdeath, sweapon, int(final_damage), vpoint, 0, var_2bd7283211fa61e7, dmg_struct.var_14edc6d1db3695bc, 0);
        }
        if (isplayer(eattacker) && final_damage > 0 && (!isdefined(shitloc) || shitloc != "shield")) {
            eattacker namespace_e072c8407b2a861c::updatedamagefeedback("standard", final_damage >= self.health);
        }
    }
    self.var_d37b75616f7c2ee = dmg_struct;
    callback::callback("on_soldier_ai_damaged", dmg_struct);
    if (isdefined(eattacker) && isdefined(eattacker.var_69b049cf4b18c73b)) {
        n_multiplier = 180;
        if (isdefined(final_damage)) {
            final_damage *= n_multiplier;
        }
    }
    if (istrue(self.bhasriotshieldattached) && shitloc == "shield") {
        if (isagent(eattacker) && eattacker.unittype == "zombie") {
            self.forcehitlocation = "none";
            final_damage *= 0.5;
        }
    }
    return int(final_damage);
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x179d
// Size: 0x169
function private on_soldier_ai_damaged(dmg_struct) {
    if (isplayer(dmg_struct.eattacker) && isdefined(self.var_21a8839dd03e31cd)) {
        self.var_21a8839dd03e31cd = function_6d6af8144a5131f1(self.var_21a8839dd03e31cd, dmg_struct.eattacker);
    }
    if (isdefined(dmg_struct.einflictor) && dmg_struct.einflictor scripts\cp_mp\vehicles\vehicle::isvehicle() && !isdefined(dmg_struct.einflictor.var_1cb92917037d8996) && isdefined(dmg_struct.smeansofdeath) && dmg_struct.smeansofdeath == "MOD_CRUSH" && !isdefined(dmg_struct.einflictor.var_7fff3293eab0f7b8)) {
        vehicle = dmg_struct.einflictor;
        vehicle.var_7fff3293eab0f7b8 = 1;
        vehicle playrumbleonentity("artillery_rumble_heavy");
        if (isdefined(dmg_struct.idamage) && isdefined(self)) {
            n_damage = int(dmg_struct.idamage * 0.1);
            if (isdefined(level.var_9b695d81b2f8bc58) && level.var_9b695d81b2f8bc58 >= 0) {
                n_damage = min(level.var_9b695d81b2f8bc58, n_damage);
            }
            vehicle thread function_743e37eebd6ba8e2(n_damage);
        }
    }
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x190e
// Size: 0x82
function private on_zombie_ai_killed(params) {
    playerattacker = params.eattacker;
    if (isdefined(playerattacker) && !isplayer(playerattacker) && isplayer(playerattacker.owner)) {
        playerattacker = playerattacker.owner;
    }
    if (isplayer(playerattacker)) {
        playerattacker thread mp_agent_damage::updaterecentagentkills(self, params.einflictor, params.objweapon);
        function_56869e118720ca3b(playerattacker);
    }
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1998
// Size: 0x6d
function function_56869e118720ca3b(killer) {
    if (isdefined(killer) && killer scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        killer = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(killer);
    }
    if (isdefined(killer) && isplayer(killer)) {
        if (!isdefined(killer.agentkills)) {
            killer.agentkills = 1;
            return;
        }
        killer.agentkills += 1;
    }
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a0d
// Size: 0x12
function private function_e5ea18b76842725f(params) {
    scripts\cp_mp\utility\game_utility::removefromcharactersarray();
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a27
// Size: 0x175
function function_73cfe327bdf9d28f(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname, eventid) {
    if (isplayer(attacker)) {
        if (issharedfuncdefined("zombie", "get_pap_level")) {
            var_29a8ba8c9dd43fd2 = attacker function_f3bb4f4911a1beb2("zombie", "get_pap_level", objweapon);
            if (var_29a8ba8c9dd43fd2 > 0) {
                damage *= getdvarfloat(@"hash_9cf7e7a1964e81cc", 0.65);
            }
        }
        if (isdefined(self.team) && self.team != "neutral" && isenemyteam(self.team, attacker.team)) {
            var_366b0ecc2f28aead = getcompleteweaponname(objweapon);
            if (issubstr(var_366b0ecc2f28aead, "jup_jp22_la_dromeo")) {
                occupants = scripts\cp_mp\vehicles\vehicle_occupancy::function_efa75aa7f0a1289(self, 0);
                if (isdefined(occupants) && occupants.size > 0) {
                    scripts\mp\gametypes\ob::function_8c5062f666b9bf73(10, attacker);
                }
            }
        }
    }
    scripts\mp\vehicles\damage::callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, attachtagname, partname, eventid);
}

// Namespace ob_damage / namespace_99e3b18d3c0c359a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ba4
// Size: 0x87
function private function_6a0b029f221e0ffe(dmg_struct) {
    if (dmg_struct.smeansofdeath == "MOD_CRUSH") {
        if (time_has_passed(isdefined(self.var_64c4f7086b0c04f4) ? self.var_64c4f7086b0c04f4 : 0, getdvarfloat(@"hash_52fc7da1ba4e9d11", 1))) {
            self.var_64c4f7086b0c04f4 = gettime();
            return dmg_struct.idamage;
        }
        self.var_64c4f7086b0c04f4 = gettime();
        return 0;
    }
    return dmg_struct.idamage;
}

/#

    // Namespace ob_damage / namespace_99e3b18d3c0c359a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c34
    // Size: 0x56
    function function_50dd3eeeda443cb0() {
        if (getdvarint(@"hash_8a8ff6ed00ccc7a", 0)) {
            setdvar(@"hash_8a8ff6ed00ccc7a", 0);
        } else {
            setdvar(@"hash_8a8ff6ed00ccc7a", 1);
        }
        iprintlnbold("<dev string:x6d>" + getdvarint(@"hash_8a8ff6ed00ccc7a", 0));
    }

    // Namespace ob_damage / namespace_99e3b18d3c0c359a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c92
    // Size: 0x92
    function function_3bfa04dc5265d2be() {
        var_c856dd94cacef4a8 = "<dev string:x89>";
        if (getdvarint(@"hash_1661f35e34f544eb", 0)) {
            setdvar(@"hash_1661f35e34f544eb", 0);
        } else {
            setdvar(@"hash_1661f35e34f544eb", 1);
            if (!getdvarint(@"hash_8a8ff6ed00ccc7a", 0)) {
                setdvar(@"hash_8a8ff6ed00ccc7a", 1);
                var_c856dd94cacef4a8 = "<dev string:x8a>";
            }
        }
        iprintlnbold(var_c856dd94cacef4a8 + "<dev string:xbc>" + getdvarint(@"hash_1661f35e34f544eb", 0));
    }

    // Namespace ob_damage / namespace_99e3b18d3c0c359a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d2c
    // Size: 0x92
    function function_60344a654f5feab9() {
        var_c856dd94cacef4a8 = "<dev string:x89>";
        if (getdvarint(@"hash_5e1b3bfc576b756", 0)) {
            setdvar(@"hash_5e1b3bfc576b756", 0);
        } else {
            setdvar(@"hash_5e1b3bfc576b756", 1);
            if (!getdvarint(@"hash_8a8ff6ed00ccc7a", 0)) {
                setdvar(@"hash_8a8ff6ed00ccc7a", 1);
                var_c856dd94cacef4a8 = "<dev string:x8a>";
            }
        }
        iprintlnbold(var_c856dd94cacef4a8 + "<dev string:xbc>" + getdvarint(@"hash_1661f35e34f544eb", 0));
    }

    // Namespace ob_damage / namespace_99e3b18d3c0c359a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1dc6
    // Size: 0x5d
    function function_b904029d0acf2fd1() {
        function_6e7290c8ee4f558b("<dev string:xde>");
        function_a9a864379a098ad6("<dev string:xe9>", "<dev string:x108>", &function_50dd3eeeda443cb0, 0);
        function_a9a864379a098ad6("<dev string:x127>", "<dev string:x14a>", &function_3bfa04dc5265d2be, 0);
        function_a9a864379a098ad6("<dev string:x166>", "<dev string:x188>", &function_60344a654f5feab9, 0);
        function_fe953f000498048f();
    }

#/
